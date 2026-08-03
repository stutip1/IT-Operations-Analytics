-- Question 1 : What incident categories occur most frequently ? 

SELECT 
	Category ,
	COUNT(*) AS 	Total_Incidents
FROM incidents
GROUP BY Category 
ORDER BY Total_Incidents DESC;

--Question 2:
-- Which platform generates the highest number of incidents?

SELECT 
    Platform,
    COUNT(*) AS Total_Incidents
FROM incidents
GROUP BY Platform
ORDER BY Total_Incidents DESC;

-- Business Question 3:
-- What is the average incident resolution time and SLA compliance rate?

SELECT
    ROUND(AVG(Resolution_Time_Hours), 2) AS Avg_Resolution_Time_Hours,
    ROUND(
        100.0 * SUM(CASE WHEN SLA_Breached_Flag = 'No' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS SLA_Compliance_Percentage
FROM incidents;

-- Business Question 4:
-- Which departments generate the highest incident volume?

SELECT 
    Department,
    COUNT(*) AS Total_Incidents
FROM incidents
GROUP BY Department
ORDER BY Total_Incidents DESC;

-- Business Question 5:
-- How long do access approvals take on average?

SELECT
    ROUND(AVG(Approval_Time_Hours), 2) AS Avg_Approval_Time_Hours
FROM access_requests
WHERE Approval_Time_Hours IS NOT NULL;

-- Business Question 6:
-- Which roles are most frequently requested?

SELECT
    Role_Requested,
    COUNT(*) AS Total_Requests
FROM access_requests
GROUP BY Role_Requested
ORDER BY Total_Requests DESC;

-- Business Question 7:
-- How many user accounts have expired access but remain active?

SELECT
    COUNT(*) AS Expired_Active_Access_Count
FROM access_requests
WHERE "Access_Still  Active Flag" =  'Yes' ;

-- Business Question 8:
-- Are access reviews being completed on time?

SELECT
    Completed_On_Time_Flag,
    COUNT(*) AS Total_Reviews
FROM access_reviews
GROUP BY Completed_On_Time_Flag;

-- Business Question 9:
-- What percentage of access reviews fail?

SELECT
    ROUND(
        100.0 * SUM(CASE WHEN Review_Result = 'Fail' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS Review_Failure_Percentage
FROM access_reviews;

-- Business Question 10:
-- What audit violations occur most frequently?

SELECT
    Violation_Type,
    COUNT(*) AS Total_Violations
FROM audit
GROUP BY Violation_Type
ORDER BY Total_Violations DESC;
