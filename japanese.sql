USE JapaneseHiringSystem;
GO
select * from Japanese_hiring_intelligence_system

/* =====================================================
   PAGE 1 - EXECUTIVE OVERVIEW
===================================================== */

-- 1. Total Candidates
SELECT COUNT(*) AS Total_Candidates
FROM Japanese_Hiring_Intelligence_System;

-- 2. Candidates by Department
SELECT
    Department,
    COUNT(*) AS Total_Candidates
FROM Japanese_Hiring_Intelligence_System
GROUP BY Department
ORDER BY Total_Candidates DESC;

-- 3. Hiring Trend by Year
SELECT
    Hire_Year,
    COUNT(*) AS Total_Hires
FROM Japanese_Hiring_Intelligence_System
GROUP BY Hire_Year
ORDER BY Hire_Year;

-- 4. JLPT Level Distribution
SELECT
    JLPT_Level,
    COUNT(*) AS Total_Candidates
FROM Japanese_Hiring_Intelligence_System
GROUP BY JLPT_Level
ORDER BY Total_Candidates DESC;

-- 5. Interview Funnel
SELECT
    Interview_Status,
    COUNT(*) AS Total_Candidates
FROM Japanese_Hiring_Intelligence_System
GROUP BY Interview_Status
ORDER BY Total_Candidates DESC;


/* =====================================================
   PAGE 2 - JAPAN RECRUITMENT INTELLIGENCE
===================================================== */

-- 6. Preferred Japan City Distribution
SELECT
    Preferred_Japan_City,
    COUNT(*) AS Total_Candidates
FROM Japanese_Hiring_Intelligence_System
GROUP BY Preferred_Japan_City
ORDER BY Total_Candidates DESC;

-- 7. City Wise Hiring Score
SELECT
    Preferred_Japan_City,
    ROUND(AVG(CAST(Hiring_Score AS DECIMAL(10,2))),2) AS Avg_Hiring_Score
FROM Japanese_Hiring_Intelligence_System
GROUP BY Preferred_Japan_City
ORDER BY Avg_Hiring_Score DESC;

-- 8. Visa Status Distribution
SELECT
    Visa_Status,
    COUNT(*) AS Total_Candidates
FROM Japanese_Hiring_Intelligence_System
GROUP BY Visa_Status
ORDER BY Total_Candidates DESC;

-- 9. JLPT vs Visa Status
SELECT
    JLPT_Level,
    Visa_Status,
    COUNT(*) AS Total_Candidates
FROM Japanese_Hiring_Intelligence_System
GROUP BY JLPT_Level, Visa_Status
ORDER BY JLPT_Level;

-- 10. Japanese Communication Distribution
SELECT
    Japanese_Communication,
    COUNT(*) AS Total_Candidates
FROM Japanese_Hiring_Intelligence_System
GROUP BY Japanese_Communication
ORDER BY Total_Candidates DESC;

-- 11. Skill Category Distribution
SELECT
    Skill_Category,
    COUNT(*) AS Total_Candidates
FROM Japanese_Hiring_Intelligence_System
GROUP BY Skill_Category
ORDER BY Total_Candidates DESC;


/* =====================================================
   PAGE 3 - CANDIDATE & HIRING ANALYTICS
===================================================== */

-- 12. Average Salary by Experience Group
SELECT
    Experience_Group,
    AVG(CAST(Salary_INR AS BIGINT)) AS Avg_Salary
FROM Japanese_Hiring_Intelligence_System
GROUP BY Experience_Group
ORDER BY Avg_Salary DESC;

-- 13. Average Salary by Department
SELECT
    Department,
    AVG(CAST(Salary_INR AS BIGINT)) AS Avg_Salary
FROM Japanese_Hiring_Intelligence_System
GROUP BY Department
ORDER BY Avg_Salary DESC;

-- 14. Salary Band Distribution
SELECT
    salary_band,
    COUNT(*) AS Total_Candidates
FROM Japanese_Hiring_Intelligence_System
GROUP BY salary_band
ORDER BY Total_Candidates DESC;

-- 15. Average Hiring Score by Skill
SELECT
    Skill_Category,
    AVG(CAST(Hiring_Score AS DECIMAL(10,2))) AS Avg_Hiring_Score
FROM Japanese_Hiring_Intelligence_System
GROUP BY Skill_Category
ORDER BY Avg_Hiring_Score DESC;

-- 16. Visa Status vs Experience Group
SELECT
    Experience_Group,
    Visa_Status,
    COUNT(*) AS Total_Candidates
FROM Japanese_Hiring_Intelligence_System
GROUP BY Experience_Group, Visa_Status
ORDER BY Experience_Group;

-- 17. Performance Rating by Experience Group
SELECT
    Experience_Group,
    AVG(CAST(Performance_Rating AS DECIMAL(10,2))) AS Avg_Performance
FROM Japanese_Hiring_Intelligence_System
GROUP BY Experience_Group
ORDER BY Avg_Performance DESC;

-- 18. Department Wise Hiring Score
SELECT
    Department,
    AVG(CAST(Hiring_Score AS DECIMAL(10,2))) AS Avg_Hiring_Score
FROM Japanese_Hiring_Intelligence_System
GROUP BY Department
ORDER BY Avg_Hiring_Score DESC;