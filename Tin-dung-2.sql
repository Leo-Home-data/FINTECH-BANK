SELECT 
    s1.CIF_ID AS Customer_ID,
    s1.BRCODE AS Branch_Name,
    COUNT(CASE WHEN s2.STATUS = 'Closed' THEN 1 END) AS Total_Closed_Contracts,
    COUNT(CASE WHEN s2.STATUS != 'Closed' THEN 1 END) AS Total_Open_Contracts
FROM 
    Sheet1$ s1
LEFT JOIN 
    Sheet2$ s2 ON s1.CIF_ID = s2.CIF_ID
GROUP BY 
    s1.CIF_ID, s1.BRCODE
ORDER BY 
    s1.CIF_ID;
