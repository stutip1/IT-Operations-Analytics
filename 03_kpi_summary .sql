SELECT COUNT(*) AS Total_Incidents 
FROM incidents ; 

--Average resolution time 

SELECT ROUND (AVG (Resolution_Time_Hours) , 2 ) AS Aveg_Resolution_Time_Hours 
FROM incidents ; 

-- KPI 3: SLA Compliance Percentage
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN SLA_Breached_Flag = 'No' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS SLA_Compliance_Percentage
FROM incidents;

-- KPI 4: Total Access Requests
SELECT COUNT(*) AS Total_Access_Requests
FROM access_requests;

-- KPI 5: Average Approval Time
SELECT ROUND(AVG(Approval_Time_Hours), 2) AS Avg_Approval_Time_Hours
FROM access_requests
WHERE Approval_Time_Hours IS NOT NULL;

-- KPI 6: Expired Active Access Count
SELECT COUNT(*) AS  Expired_Active_Access_Count
FROM access_requests
WHERE "Access_Still  Active Flag" = 'Yes';

-- KPI 7: Access Review On-Time Completion Percentage
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN Completed_On_Time_Flag = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Review_On_Time_Percentage
FROM access_reviews;

-- KPI 8: Access Review Failure Percentage
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN Review_Result = 'Fail' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Review_Failure_Percentage
FROM access_reviews;

-- KPI 9: Total Audit Findings
SELECT COUNT(*) AS Total_Audit_Findings
FROM audit;

-- KPI 10: Open Audit Findings
SELECT COUNT(*) AS Open_Audit_Findings
FROM audit
WHERE Status = 'Open';

-- KPI 11: High Severity Audit Findings
SELECT COUNT(*) AS High_Severity_Findings
FROM audit
WHERE Severity = 'High';

-- KPI 12: Closed Audit Findings Percentage
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN Status = 'Closed' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Closed_Audit_Findings_Percentage
FROM audit;

-- Executive KPI Summary
SELECT
    (SELECT COUNT(*) FROM incidents) AS Total_Incidents,

    (SELECT ROUND(AVG(Resolution_Time_Hours), 2)
     FROM incidents) AS Avg_Resolution_Time_Hours,

    (SELECT ROUND(
        100.0 * SUM(CASE WHEN SLA_Breached_Flag = 'No' THEN 1 ELSE 0 END) / COUNT(*),
        2
     )
     FROM incidents) AS SLA_Compliance_Percentage,

    (SELECT COUNT(*)
     FROM access_requests) AS Total_Access_Requests,

    (SELECT ROUND(AVG(Approval_Time_Hours), 2)
     FROM access_requests
     WHERE Approval_Time_Hours IS NOT NULL) AS Avg_Approval_Time_Hours,

    (SELECT COUNT(*)
     FROM access_requests
     WHERE Access_Still_Active_Flag = 'Yes') AS Expired_Active_Access_Count,

    (SELECT ROUND(
        100.0 * SUM(CASE WHEN Completed_On_Time_Flag = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
     )
     FROM access_reviews) AS Review_On_Time_Percentage,

    (SELECT ROUND(
        100.0 * SUM(CASE WHEN Review_Result = 'Fail' THEN 1 ELSE 0 END) / COUNT(*),
        2
     )
     FROM access_reviews) AS Review_Failure_Percentage,

    (SELECT COUNT(*)
     FROM audit) AS Total_Audit_Findings,

    (SELECT COUNT(*)
     FROM audit
     WHERE Status = 'Open') AS Open_Audit_Findings,

    (SELECT COUNT(*)
     FROM audit
     WHERE Severity = 'High') AS High_Severity_Findings;





