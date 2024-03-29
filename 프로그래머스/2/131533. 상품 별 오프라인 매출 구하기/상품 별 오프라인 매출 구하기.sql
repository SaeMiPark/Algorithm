-- 코드를 입력하세요
WITH A AS(
SELECT OFF.PRODUCT_ID, SUM(OFF.SALES_AMOUNT)*P.PRICE AS SALES
  FROM PRODUCT AS P
  INNER JOIN OFFLINE_SALE AS OFF ON P.PRODUCT_ID=OFF.PRODUCT_ID
 GROUP BY OFF.PRODUCT_ID)
 
 SELECT PP.PRODUCT_CODE, AA.SALES
   FROM PRODUCT AS PP
   INNER JOIN A AS AA ON PP.PRODUCT_ID=AA.PRODUCT_ID
   ORDER BY AA.SALES DESC, PP.PRODUCT_CODE;
  
 