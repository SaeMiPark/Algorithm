SELECT a.FLAVOR
  FROM FIRST_HALF as a
inner join ICECREAM_INFO as b
 on a.FLAVOR=b.FLAVOR
 where 	INGREDIENT_TYPE='fruit_based' AND TOTAL_ORDER > 3000
 group by a.FLAVOR
 order by TOTAL_ORDER DESC;