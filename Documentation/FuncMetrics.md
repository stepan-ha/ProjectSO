# Functional metrics

| **Metric Name**                | **Unit of Measurement**   | **Purpose**                                                                                  |
|--------------------------------|---------------------------|----------------------------------------------------------------------------------------------|
| New Registered Users           | Count                     | Tracks the number of new users registering to monitor user growth.                           |
| Store Item Views               | Count                     | Measures how often store items are viewed to understand customer interest in products.       |
| Purchases Made                 | Count                     | Tracks the number of purchases to monitor sales performance.                                 |
| Total Revenue                  | Currency ($, €, etc.)     | Monitors total sales revenue generated by the store.                                         |
| Average Order Value (AOV)      | Currency ($, €, etc.)     | Evaluates the average revenue generated per order to assess customer spending habits.        |
| Items Added to Cart            | Count                     | Measures how many items are added to shopping carts to analyze user engagement.              |
| Cart Abandonment Rate          | Percentage (%)            | Tracks the percentage of carts abandoned before completing a purchase to identify drop-offs. |
| Delivery Success Rate          | Percentage (%)            | Monitors the success rate of package deliveries to improve courier performance.              |
| Average Delivery Time          | Time (minutes, hours)     | Measures the average time taken by couriers to deliver packages to customers.                |
| Customer Retention Rate        | Percentage (%)            | Monitors the percentage of returning customers to assess loyalty.                            |
| Customer Feedback Submitted    | Count                     | Tracks the number of feedback submissions to evaluate user satisfaction.                     |
| Courier Task Completion Rate   | Percentage (%)            | Tracks how often couriers complete assigned deliveries to measure reliability.               |
| Courier Idle Time              | Time (minutes, hours)     | Measures the average idle time for couriers to optimize delivery operations.                 |
| Delivery Distance Per Order    | Distance (miles, km)      | Tracks the average distance traveled by couriers per delivery to optimize routes.            |

# Funnel analytics

## **1. Customer Purchase Funnel**
This funnel tracks the steps a customer takes to complete a purchase in the web store.

| **Step**                     | **Related Metric**            | **Purpose**                                                                                |
|------------------------------|-------------------------------|--------------------------------------------------------------------------------------------|
| **View product**             | Store Item Views              | Tracks the user viewing the product page.                                                  |
| **Add Items to Cart**        | Item Added to Cart            | Measures how many users add products to their shopping carts.                              |
| **Begin Checkout Process**   | Cart Abandonment Rate         | Monitors users who start the checkout but might drop off at this stage.                    |
| **Complete Purchase**        | Purchases Made                | Tracks the number of successful transactions to measure the conversion rate.               |

This funnel identifies drop-offs during the shopping process and provides insights into improving customer conversion rates.

---

## **2. Courier Delivery Funnel**
This funnel tracks the steps a courier takes to complete a successful package delivery.

| **Step**                     | **Related Metric**             | **Purpose**                                                                                 |
|-------------------------------|---------------------------------|---------------------------------------------------------------------------------------------|
| **Receive Delivery Task**     | Courier Task Completion Rate   | Tracks how many delivery tasks are assigned to couriers.                                    |
| **Start Delivery**            | Courier Idle Time              | Measures delays in starting assigned delivery tasks.                                        |
| **Travel to Customer Location** | Delivery Distance Per Order   | Tracks the distance traveled by couriers to assess delivery route efficiency.               |
| **Complete Delivery**         | Delivery Success Rate          | Monitors the number of successfully delivered packages to evaluate overall courier performance. |

This funnel helps optimize courier operations and ensure timely deliveries by addressing inefficiencies in the process.
