# Monitoring

## Operational/Monitoring metrics for ProjectSO

| **Metric Name**                        | **Unit of Measurement**       | **Source  |**Purpose**                                                                        |
|----------------------------------------|-------------------------------|-----------|-----------------------------------------------------------------------------------|
| **Auth Requests Per Minute**           | Requests/Minute               | Kubernetes |Monitors the number of requests to "Auth API" to assess authentication system usage.          |
| **Requests to SF CRM Service**         | Requests/Minute               | Kubernetes |Tracks the number of requests sent to the "SF CRM" service to evaluate workload.               |
| **API Gateway Requests**               | Requests/Minute               | Kubernetes |Measures the overall number of API requests handled by the Ingress (API Gateway).              |
| **HTTP 5xx Errors**                    | Count                         | Ingress | Tracks the number of server errors to identify backend issues.                                 |
| **HTTP 4xx Errors**                    | Count                         | Ingress | the number of client errors (e.g., unauthorized, bad request) for debugging purposes.   |
| **CPU Load (Kubernetes Nodes)**        | Percentage (%)                | Kubernetes | Monitors CPU usage across Kubernetes nodes to ensure optimal performance.                      |
| **Memory Usage (Kubernetes Nodes)**    | Gigabytes (GB)                | Kubernetes | Tracks memory consumption on Kubernetes nodes to prevent resource exhaustion.                  |
| **Database Query Latency**             | Milliseconds (ms)             | DO | Measures the average time taken to execute database queries to monitor performance bottlenecks.|
| **Database Storage Utilization**       | Percentage (%)                | DO | Tracks the percentage of database storage used to plan capacity management.                    |
| **Cache Hit Ratio (CDN)**              | Percentage (%)                | DO | Monitors the percentage of successful cache hits by the CDN to evaluate its effectiveness.     |
| **Request Latency (API Gateway)**      | Milliseconds (ms)             | Kubernetes | Tracks the average response time for API Gateway requests to monitor latency.                  |
| **Total Incoming Traffic**             | Megabytes (MB)/Second         | DO Measures the rate of incoming network traffic to assess bandwidth usage.                       |
| **Delivery Assignment Rate**           | Assignments/Minute            | SF CRM | Tracks the number of delivery tasks assigned to couriers in real time.                         |
| **Failed Pod Restarts**                | Count                         | Kubernetes | Monitors the number of pod restarts in the Kubernetes cluster to identify service issues.      |


## Alerting model

| **Metric**                       | **Alert Threshold**                                   | **Alert Frequency** | **Mitigation Plan**                                                                             |
|----------------------------------|-------------------------------------------------------|---------------------|-------------------------------------------------------------------------------------------------|
| **Active User Sessions**         | Sudden drop to `0` or spike > 2x normal traffic.      | Every 1 minute      | Check application status, API Gateway health. Scale resources if spike exceeds capacity.       |
| **Auth Requests Per Minute**     | > 1000 requests/min                                   | Every 1 minute      | Scale up resources for "Auth API"  |
| **Requests to SF CRM Service**   | > 500 requests/min.                                   | Every 5 minutes     | Check for overloading of the CRM service. Implement rate limiting and scale up CRM pods.         |
| **CPU Load (Kubernetes Nodes)**  | > 80% utilization for 5 minutes.                      | Every 5 minutes     | Add nodes to the cluster or scale-up the server config (increase CPU).                     |
| **Memory Usage (Kubernetes)**    | > 85% of total memory capacity for 5 minutes.         | Every 5 minutes     | Scale up memory for Kubernetes nodes.          |
| **Database Query Latency**       | > 500 ms average for 5 minutes.                       | Every 1 minute      | Increase DB server resources. |
| **HTTP 5xx Errors**              | > 50 errors/min for any service.                      | Every 1 minute      | Restart faulty service.          |
