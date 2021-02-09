SELECT * FROM dept 
WHERE dname LIKE '%'||'E'||'%'
AND loc LIKE '%'||'A'||'%';

SELECT job, count(*) 사원수, round(avg(sal)) avg
FROM EMP
GROUP BY job
HAVING ROUND(avg(sal))>=2000
ORDER BY job;