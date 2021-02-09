/*
 # instr(지정된문자열데이터|컬럼, '검색문자')
 1. 특정한 문자열을 검색해서 해당 문자열의 위치를 index로 반환해주는 처리를 하는 것을 말한다.
 	ex) 주로 대용량의 문자열 데이터를 검색해서 해당 문자의 위치를 찾아서 indexing(데이터 파일에 대한 인덱스 저장)하고
 		해당 문자의 위치를 찾아서 처리할 때 사용된다.
 */
SELECT instr('sql*plus','*') FROM dual;
SELECT * FROM emp;
-- ex) job컬럼에서 'A'문자가 나오는 위치를 검색해 위치 출력하기
SELECT instr(job, 'A') FROM emp;
/*
 # padding
 lpad(컬럼/데이터, 지정한크기, 덧붙일문자열): 왼쪽에 문자열 덧붙이기
 rpad(컬럼/데이터, 지정한크기, 덧붙일 문자열: 오른쪽에 문자열 덧붙이기
 지정할 크기를 설정하고 그보다 적은 데이터는 해당 문자열로 채워주는 처리
 */
SELECT lpad('sql',5,'*') "왼쪽에 * 5", rpad('sql',5,'*') "오른쪽에 * 5"
FROM dual;
-- ex) 사원 테이블에 ename은 전체 6으로, job은 8로 설정하여
--	   ename은 왼족에 #기호를, job은 오른쪽에 #기호를 추가하여 처리
SELECT lpad(ename,6,'#'), rpad(job,8,'#')
FROM emp;
/*
 # ltrim / rtrim: 왼쪽/오른쪽 지정 문자 삭제 처리
 */
SELECT ltrim('****sql****','*') s1,
	   rtrim('****sql****','*') s2
FROM dual;
-- job 뒤에 있는 MAN을 삭제 처리하여 출력하세요
SELECT rtrim(job,'MAN') FROM emp;