public class OrderLocationHandler {
    public static void setDefaultLocation(List<Order> orders) {
        Set<Id> storeIds = new Set<Id>();
        for (Order ord : orders) {
            if (ord.Store2__c != null && ord.Location__Latitude__s == null && ord.Location__Longitude__s == null) {
                storeIds.add(ord.Store2__c);
            }
        }

        if (storeIds.isEmpty()) return;

        Map<Id, Store__c> storeMap = new Map<Id, Store__c>(
            [SELECT Id, 
                    Location__City__s, Location__PostalCode__s, 
                    Location__Street__s, 
                    Location__Latitude__s, Location__Longitude__s 
             FROM Store__c 
             WHERE Id IN :storeIds]
        );

        system.debug('Test');

        for (Order ord : orders) {
            if (ord.Location__Latitude__s == null && ord.Location__Longitude__s == null) {
                Store__c store = storeMap.get(ord.Store2__c);
                if (store != null) {
                    ord.Location__Street__s     = store.Location__Street__s;
                    ord.Location__City__s       = store.Location__City__s;
                    ord.Location__PostalCode__s = store.Location__PostalCode__s;
                    ord.Location__Latitude__s   = store.Location__Latitude__s;
                    ord.Location__Longitude__s  = store.Location__Longitude__s;
                }
            }
        }
    }
}