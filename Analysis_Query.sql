-- ==============================================
-- School Enrollment Data Analysis Queries
-- ==============================================

-- 1. Total count of schools and total student enrollment
SELECT 
    COUNT(DISTINCT School_Name) AS Total_Schools,
    SUM(Total_Enrollment) AS District_Total_Students,
    ROUND(AVG(Total_Enrollment), 0) AS Avg_Students_Per_School
FROM school_enrollment;

-- 2. Block-wise total schools and student enrollment
SELECT 
    Block,
    COUNT(DISTINCT School_Name) AS Total_Schools,
    SUM(Total_Enrollment) AS Total_Students
FROM school_enrollment
GROUP BY Block
ORDER BY Total_Students DESC;

-- 3. Cluster-wise enrollment breakdown
SELECT 
    Cluster,
    Block,
    COUNT(School_Name) AS Total_Schools,
    SUM(Total_Enrollment) AS Total_Students
FROM school_enrollment
GROUP BY Cluster, Block
ORDER BY Total_Students DESC;

-- 4. Overall distribution of students across different classes
SELECT 
    SUM(Class_1) AS Total_Class_1,
    SUM(Class_9) AS Total_Class_9,
    SUM(Class_10) AS Total_Class_10,
    SUM(Class_11) AS Total_Class_11,
    SUM(Total_Enrollment) AS Overall_Enrollment
FROM school_enrollment;

-- 5. Primary vs Secondary/Higher Secondary enrollment by Block
SELECT 
    Block,
    SUM(Class_1) AS Primary_Enrollment,
    SUM(Class_9 + Class_10 + Class_11) AS Higher_Classes_Enrollment
FROM school_enrollment
GROUP BY Block
ORDER BY Higher_Classes_Enrollment DESC;

-- 6. Top 10 schools with the highest student enrollment
SELECT TOP 10
    School_Name,
    Block,
    Cluster,
    Total_Enrollment
FROM school_enrollment
ORDER BY Total_Enrollment DESC;

-- 7. Schools with low enrollment (less than 50 students)
SELECT 
    School_Name,
    Block,
    Cluster,
    Total_Enrollment
FROM school_enrollment
WHERE Total_Enrollment < 50
ORDER BY Total_Enrollment ASC;