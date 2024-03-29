-- 코드를 입력하세요
SELECT MEMBER_NAME, REVIEW_TEXT, DATE_FORMAT(REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM MEMBER_PROFILE AS M
INNER JOIN REST_REVIEW  AS R ON M.MEMBER_ID=R.MEMBER_ID
WHERE R.MEMBER_ID IN(
    SELECT MEMBER_ID FROM(
        SELECT *, DENSE_RANK() OVER (ORDER BY CNT DESC) AS RNK FROM (
            SELECT *, COUNT(*) AS CNT
            FROM REST_REVIEW
            GROUP BY MEMBER_ID
            ORDER BY CNT DESC
        ) aa 
    ) bb 
    WHERE RNK=1
)
ORDER BY REVIEW_DATE, REVIEW_TEXT;