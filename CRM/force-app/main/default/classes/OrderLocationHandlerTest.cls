@isTest
public class OrderLocationHandlerTest {

    static Store__c createStore(String name, Decimal lat, Decimal lon) {
        return new Store__c(
            Name = name,
            Location__Street__s = '456 Sample St',
            Location__City__s = 'Testville',
            Location__PostalCode__s = '12345',
            Location__Latitude__s = lat,
            Location__Longitude__s = lon
        );
    }

    static Order createOrder(Id storeId, Boolean withLocation) {
        
        Account acc =  new Account(Name = 'Test');
        insert acc;
        Order ord = new Order(
            Name = 'Test Order',
            Status = 'Draft',
            EffectiveDate = Date.today(),
            Store2__c = storeId,
            AccountId= acc.Id
        );

        if (withLocation) {
            ord.Location__Street__s = '789 Custom St';
            ord.Location__City__s = 'Custom City';
            ord.Location__PostalCode__s = '99999';
            ord.Location__Latitude__s = 12.34;
            ord.Location__Longitude__s = 56.78;
        }

        return ord;
    }

    @isTest
    static void testSetLocationFromStore() {
        Store__c store = createStore('Store A', 40.0, -70.0);
        insert store;

        Order ord = createOrder(store.Id, false);
        insert ord;

        ord = [SELECT Id, Store2__c, Location__Latitude__s, Location__Longitude__s FROM Order WHERE Id = :ord.Id];

        Test.startTest();
        OrderLocationHandler.setDefaultLocation(new List<Order>{ord});
        Test.stopTest();

        System.assertEquals(40.0, ord.Location__Latitude__s, 'Latitude should be copied from store');
        System.assertEquals(-70.0, ord.Location__Longitude__s, 'Longitude should be copied from store');
    }

    @isTest
    static void testNoStoreId() {
        Order ord = createOrder(null, false);
        insert ord;

        Test.startTest();
        OrderLocationHandler.setDefaultLocation(new List<Order>{ord});
        Test.stopTest();

        System.assertEquals(null, ord.Location__Latitude__s);
        System.assertEquals(null, ord.Location__Longitude__s);
    }

    @isTest
    static void testAlreadyHasLocation() {
        Store__c store = createStore('Store B', 11.11, 22.22);
        insert store;

        Order ord = createOrder(store.Id, true); // Already has location
        insert ord;

        Decimal originalLat = ord.Location__Latitude__s;
        Decimal originalLon = ord.Location__Longitude__s;

        Test.startTest();
        OrderLocationHandler.setDefaultLocation(new List<Order>{ord});
        Test.stopTest();

        System.assertEquals(originalLat, ord.Location__Latitude__s, 'Latitude should not be overridden');
        System.assertEquals(originalLon, ord.Location__Longitude__s, 'Longitude should not be overridden');
    }

    @isTest
    static void testMultipleOrdersMixedCases() {
        Store__c store1 = createStore('Store 1', 10.0, 20.0);
        Store__c store2 = createStore('Store 2', 30.0, 40.0);
        insert new List<Store__c>{store1, store2};

        Order o1 = createOrder(store1.Id, false); // should update
        Order o2 = createOrder(store2.Id, true);  // should not update
        Order o3 = createOrder(null, false);      // should not update
        insert new List<Order>{o1, o2, o3};

        List<Order> orders = [SELECT Id, Store2__c, Location__Latitude__s, Location__Longitude__s FROM Order];

        Test.startTest();
        OrderLocationHandler.setDefaultLocation(orders);
        Test.stopTest();

        for (Order o : orders) {
            if (o.Id == o1.Id) {
                System.assertEquals(10.0, o.Location__Latitude__s);
                System.assertEquals(20.0, o.Location__Longitude__s);
            } else if (o.Id == o2.Id) {
                System.assertEquals(12.34, o.Location__Latitude__s);
                System.assertEquals(56.78, o.Location__Longitude__s);
            } else if (o.Id == o3.Id) {
                System.assertEquals(null, o.Location__Latitude__s);
                System.assertEquals(null, o.Location__Longitude__s);
            }
        }
    }
    
    @isTest
static void testStoreWithNoLocationValues() {
    Store__c store = createStore('Store NullLoc', null, null);
    insert store;

    Order ord = createOrder(store.Id, false);
    insert ord;

    Test.startTest();
    OrderLocationHandler.setDefaultLocation(new List<Order>{ord});
    Test.stopTest();

    System.assertEquals(null, ord.Location__Latitude__s);
    System.assertEquals(null, ord.Location__Longitude__s);
}

@isTest
static void testStoreMissingInQuery() {
    // Order references a store that will NOT be inserted
    Store__c fakeStore = createStore('Missing Store', 0.0, 0.0);
    
    try{
        Order ord = createOrder('001XXXXXXXXXXXXAAA', false); // fake Id
        insert ord;
        System.assert(false);
    }
    catch(Exception e){
        System.assert(true);
    }
    

    
}

@isTest
static void testEmptyOrderList() {
    Test.startTest();
    OrderLocationHandler.setDefaultLocation(new List<Order>());
    Test.stopTest();

    System.assert(true, 'No exception thrown for empty input');
}

@isTest
static void testOrderWithPartialLocationOnlyLat() {
    Store__c store = createStore('Partial Loc Store', 50.0, 60.0);
    insert store;

    Order ord = createOrder(store.Id, false);
    ord.Location__Latitude__s = 22.33;
    ord.Location__Longitude__s = 00.00;
    insert ord;

    Test.startTest();
    OrderLocationHandler.setDefaultLocation(new List<Order>{ord});
    Test.stopTest();

    // Since both lat/lon must be null to update — no overwrite should happen
    System.assertEquals(22.33, ord.Location__Latitude__s);
    System.assertEquals(00.00, ord.Location__Longitude__s);
}

@isTest
static void testOrderWithPartialLocationOnlyLon() {
    Store__c store = createStore('Partial Loc Store 2', 70.0, 80.0);
    insert store;

    Order ord = createOrder(store.Id, false);
    ord.Location__Longitude__s = 45.45;
    ord.Location__Latitude__s = 00.00;
    insert ord;

    Test.startTest();
    OrderLocationHandler.setDefaultLocation(new List<Order>{ord});
    Test.stopTest();

    System.assertEquals(00.00, ord.Location__Latitude__s);
    System.assertEquals(45.45, ord.Location__Longitude__s);
}

@isTest
static void testStoreWithoutAddressFields() {
    Store__c store = new Store__c(Name = 'No Address Store');
    insert store;

    Order ord = createOrder(store.Id, false);
    insert ord;

    Test.startTest();
    OrderLocationHandler.setDefaultLocation(new List<Order>{ord});
    Test.stopTest();

    System.assertEquals(null, ord.Location__Street__s);
    System.assertEquals(null, ord.Location__Latitude__s);
}

@isTest
static void testNullValuesInOrderList() {
    Store__c store = createStore('Store Null Order', 10.0, 10.0);
    insert store;

    Order ord = createOrder(store.Id, false);
    insert ord;
	
    List<Order> orders = new List<Order>{null, ord};

    Test.startTest();
    try{
    OrderLocationHandler.setDefaultLocation(orders);
        System.assert(false);
    }
    catch(Exception e){
        System.assert(true);
    }
    Test.stopTest();
}

@isTest
static void testBulk20OrdersSameStore() {
    Store__c store = createStore('Bulk Store', 1.1, 2.2);
    insert store;

    List<Order> bulkOrders = new List<Order>();
    for (Integer i = 0; i < 20; i++) {
        bulkOrders.add(createOrder(store.Id, false));
    }
    insert bulkOrders;

    List<Order> freshOrders = [SELECT Id, Store2__c, Location__Latitude__s, Location__Longitude__s FROM Order WHERE Id IN :bulkOrders];

    Test.startTest();
    OrderLocationHandler.setDefaultLocation(freshOrders);
    Test.stopTest();

    for (Order o : freshOrders) {
        System.assertEquals(1.1, o.Location__Latitude__s);
        System.assertEquals(2.2, o.Location__Longitude__s);
    }
}

@isTest
static void testTriggerSimulationBeforeInsert() {
    Store__c store = createStore('Trigger Store', 12.1, 13.1);
    insert store;

    Order ord = createOrder(store.Id, false);

    Test.startTest();
    OrderLocationHandler.setDefaultLocation(new List<Order>{ord});
    Test.stopTest();

    System.assertEquals(12.1, ord.Location__Latitude__s);
    System.assertEquals(13.1, ord.Location__Longitude__s);
}

@isTest
static void testTriggerSimulationBeforeUpdate() {
    Store__c store = createStore('Trigger Upd Store', 33.3, 44.4);
    insert store;

    Order ord = createOrder(null, false);
    insert ord;

    // Later associate store and simulate update
    ord.Store2__c = store.Id;

    Test.startTest();
    OrderLocationHandler.setDefaultLocation(new List<Order>{ord});
    Test.stopTest();

    System.assertEquals(33.3, ord.Location__Latitude__s);
    System.assertEquals(44.4, ord.Location__Longitude__s);
}

@isTest
static void testErrorCoords() {
    Store__c store1 = createStore('SameCoord 1', 99.9, 88.8);
    Store__c store2 = createStore('SameCoord 2', 99.9, 88.8);
    try{
        insert new List<Store__c>{store1, store2};
        System.assert(false);
    }
    catch(Exception e){
        System.assert(true);
    }
}

}