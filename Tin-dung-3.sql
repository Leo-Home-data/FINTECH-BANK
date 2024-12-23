SELECT 
    YEAR(s2.CRE_END_DATE) AS Year_Completed, -- Lấy năm tất toán
    SUM(s2.AMOUNT * (s2.INTEREST / 100) * DATEDIFF(DAY, s2.CRE_DATE, s2.CRE_END_DATE) / 365.0) AS Total_Interest
FROM 
    Sheet2$ s2
WHERE 
    s2.STATUS = 'Closed' -- Chỉ tính các khoản đã tất toán
GROUP BY 
    YEAR(s2.CRE_END_DATE)
ORDER BY 
    Year_Completed;
