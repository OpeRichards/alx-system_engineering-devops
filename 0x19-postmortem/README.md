#   0x19. Postmortem

**Introduction:**
Using one of the web stack debugging project issue or an outage personally experienced, write a postmortem.


**My first postmortem**

**Issue Summary**
- Duration
    - Start Time: August 29th, 2024 15:00 WAT
    - End Times: August 29th, 2024 15:30HRS WAT

- Impact
    - The user authentication service was down. 
    - Users experienced errors when trying to log in.
    - It affected approximately 40% of users who attempted to access their accounts during this period.

- Root Cause
The root cause of the issue was a database connection pool exhausion, caused by a misconfiguration in the connection limits which led to the service being unable to handle new login requests.

**Timeline**
 - Issue Detected: August 29th, 2024, 14:10 WAT

 - Detection Method:
    - Monitoring Alert: Automated alerts from the monitoring system indicted an increase in error rates and delegated service performance.

- Actions Taken:
    - System Investigated: The team first investigated the load balancer logs and application server logs, assuming the issue might be related to an overload or failure in the application code.
    - Assumptions: Initial assumptions included potential issues with the application code or configuration settings.

- Misleading Paths:
    - Investigation into recent changes and external dependence did not yield any relevant findings.
    - Assumed that apossible network issue was causing intermittent connection problems, which was ruled out after further investigation.

- Escalation:
    - Escalated to: Database team and infrastructure support for deeper analysis.

- Resolution:
    - The issue was resolved by increasing the connection pool limits and optimizing the database queries to reduce the load. The fix involved updating the database configuration and redeploying the service with new settings.

**Root Cause and Resolution**
- Root Cause:
    - The root cause was an incorrect configuration of the database connection pool limits. The maximum number of connections allowed was too low for the increased load, resulting in the exhaustion of available connections and failure to process new requests.

- Resolution:
    - The issue was fixed by updating the database connection pool configuration to allow a higher number of simultaneous connections. Additionally, database query optimizations were implemented to reduce the load on the connection pool.

**Corrective and Preventive Measures**
- Improvements/Fixes
    - Configuration Management: Implement better configuration management practices to ensure that connection pool settings are reviewed and tested before deployment.
    - Load Testing: Introduce more rigorous load testing procedures to identify potential bottlenecks in the connection pool configuration.

- Tasks To Address the Issue:
    1. Patch Database Configuration: Update the database configuration to increase the connection pool limits.
    2. Optimize Queries: Review and optimize database queries to improve efficiency and reduce connection usage.
    3. Improve Monitoring: Enhance monitoring to include alerts for connection pool usage and other critical performance metrics.
    4. Conduct Load Testing: Implement regular load testing to simulate peak usage and ensure the system can handle high loads.