SELECT 
    cc.ID AS Contract_ID,
    cif.CIF_ID AS Customer_ID,
    cif.BRCODE AS Branch_Name,
    cc.CRE_DATE AS Disbursement_Date,
    cc.CRE_END_DATE AS Maturity_Date,
    cc.AMOUNT AS Credit_Amount,
    p.PURPOSE AS Credit_Purpose,
    DATEDIFF(MONTH, cc.CRE_DATE, cc.CRE_END_DATE) AS Term_Months,
    CASE 
        WHEN DATEDIFF(MONTH, cc.CRE_DATE, cc.CRE_END_DATE) < 12 THEN 'Short Term'
        WHEN DATEDIFF(MONTH, cc.CRE_DATE, cc.CRE_END_DATE) BETWEEN 12 AND 60 THEN 'Medium Term'
        ELSE 'Long Term'
    END AS Term_Type
FROM 
    Sheet2$ cc
JOIN 
    Sheet1$ cif ON cc.CIF_ID = cif.CIF_ID
JOIN 
    Sheet3$ p ON cc.PUR_ID = p.PUR_ID
WHERE 
    cc.STATUS = 'Active'; -- Lọc hợp đồng tín dụng đang hoạt động
