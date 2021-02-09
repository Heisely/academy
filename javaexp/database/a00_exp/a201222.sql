--1. sql 명령문의 종류(ex DQL, DDL...)와 기능을 설명하고 주요 명령문의 예제 확인해서 정리하세요.
/*
 1) 질의어(DQL/Data Query Language): 데이터를 검색 
 	- select
 	ex) select * from 테이블
 2) 데이터 조작어(DML/Data Manipulation Language): 데이터를 입력/수정/삭제 
 	- insert, update, delete
 	ex) insert into 테이블(컬럼1,컬럼2) values(데이터1,데이터2,...);
 	ex)	update 테이블명
 			set 컬럼명 = 변경할 데이터, 컬럼명 = 변경할 데이터
 		where 조건문;
 	ex) delete
 		from 테이블명
 		where 조건문; 삭제는 row 단위로 하기 때문에 컬럼명을 지칭할 필요가 없음
 3) 데이터 정의어(DDL/Data Definition Language): DB객체 생성/변경/삭제/이름변경 
 	- creat, alter, drop, rename, truncate
 	ex) creat 객체의 생성
 	ex) alter 객체의 구조변경(ex-컬럼의 타입변경)
 	ex) drop 객체의 삭제
 	ex) rename 객체의 이름변경
 	ex) truncate 저장공간에서 삭제
 4) 트랜잭션 처리어(TCL/Transaction Control Language):
 	- DML 처리 후 session별(계정접속) 트랜잭션의 처리 완료 및 취소를 해주는 것(정상적인 종료/취소/임시저장점 설정)
 	- commit, rollback, savepoint
 	ex) commit: dml 처리 확정
 	ex) rollback: dml 처리 취소
 	ex) savepoint: 임의의 저장지점 설정
 5) 데이터 제어어(DCT/Data Controll Language): 데이터 객체에 대한 접근권한 부여/취소 
 	- grant, revoke
 	ex) grant: 권한 부여
 	ex) revoke: 권한의 부여 취소
 */
	CREATE TABLE member2(
		id varchar2(20),
		pw varchar2(12),
		civilnum char(13),
		point NUMBER, -- 기본 정수형 데이터
		auth varchar2(20)
	);
	INSERT INTO MEMBER2 values('himan','7777','9112122801618',1000,'관리자');
	SELECT * FROM MEMBER2;

--2. sal+comm으로 연산하는 경우 comm null인 경우, 문제가 발생한다. 어떤 문제이고 이것을 해결할려면 어떤 처리를 하는지 정리하세요.
/*
 +연산자는 숫자형 데이터간의 합을 계산하는 연산자이기 때문에 comm이 null인 경우 데이터가 존재하지 않다고 생각해서 문제가 발생한다.
 이를 해결하기 위해서 comm의 null 값을 0으로 바꿔주는 nvl함수를 이용하여 "sal+nvl(comm, 0)"으로 처리한다.
 
 ==> 데이터베이스에서 null인 데이터는 연산 처리 시 연산 결과가 null로 처리된다.
 	 null인 경우 숫자값을 default인 0으로 설정해주는 함수를 지정하는 경우와, 조건절에서 null을 배제하는 경우가 있다.
 	 
 	 nvl(컬럼명, null일 경우 처리할 데이터)
 	 위의 경우
 	 1) select sal + nvl(comm, 0) 총계
 	 2) select sal + comm
 	 	from emp
 	 	where comm is null;
 */

--3. 오라클에서 사용하는 주요 데이터 타입의 종류를 예시와 함께 기술하세요.
/*
 데이터베이스에서 각 컬럼에 대한 데이터 타입을 설정하여 적절한 데이터의 크기와 유형과 사용형태에 맞게 설정해준다.
 ==>creat table 테이블명(컬럼명1 데이터타입, 컬럼명2 데이터타입, ...);
	1) varchar2(최고크기):
		- 사용하는 최고크기를 설정하고 입력되는 데이터에 따라 가변적으로 데이터크기가 설정됨
		- 최대 4000바이트 - 메모리효율화를 이룰 수 있다.
	2) number, number(p,s):
		- 정수/실수 등 숫자형 데이터를 설정할 때 활용된다.
		- 정밀도(p)와 스케일(s)로 표현된다.
		- 전체크기, 소숫점 이하 크기로 쉽게 표현한다.
	3) date: 날짜/시간 형식을 저장하기 위한 데이터 타입
	4) char(고정크기):
		- 고정길이 문자 데이터 타입, 최대 2000바이트
		- 코드성 데이터. 즉, 학번/사번/주민번호 등과 같이 길이가 일정하여 변경될 일이 없는 경우 사용된다.
		- 가변형에 비해 입력속도가 빠르다.
	-----------------------------------------------------------------------------------
	5) nvarchar2(최고크기): 국가별 문자 집합에 따른 최고 크기의 문자를 설정하는 가변형 데이터처리
	6) rowid: 테이블 내 행의 고유 주소를 가지는 64진수 문자타입. 행당 6바이트 또는 10바이트
	7) blob: 대용량의 바이너리 데이터를 저장하기 위한 데이터타입, 최대 4GB
	8) clob: 대용량의 문자열 데이터를 저장하기 위한 데이터타입, 최대 4GB
	9) bfile: 대용량의 바이너리 데이터를 파일 형태로 저장하기 위한 데이터 타입, 4GB
	10) timestamp(n): 날짜형 데이터타입의 확장된 형태
					  n은 millisecond. 자릿수는 최대 9자리까지 표현 가능
	
	
	
	1) char(size): 고정 길이 문자 데이터 타입. 최대 2000바이트
 		- ex)
 			creat table personnel(
 				civilnum char(13)
 			);
 	2) varchar2(size): 가변 길이 문자 데이터 타입. 최대 4000바이트
 		- ex)
 			creat table personnel(
 				name varchar2(15)
 			);
 	3) number(p, s): 정밀도(p)와 스케일(s)로 표현되는 숫자 데이터 타입
 	4) date: 날짜/시간 형식을 저장하기 위한 데이터 타입
 	5) nvarchar2(size): 국가별 문자 집합에 따른 size크기의 문자/바이트 문자 데이터 타입
 	6) rowid: 테이블 내 행의 고유 주소를 가지는 64진수 문자타입. 행 당 6바이트 또는 10바이트
 	7) blob: 대용량의 바이너리 데이터를 저장하기 위한 데이터 타입. 최대 4GB
 	8) clob: 대용량의 텍스트 데이터를 저장하기 위한 데이터 타입. 최대 4GB
 9) bfile: 대용량의 바이너리 데이터를 파일 형태로 저장하기 위한 데이터 타입. 최대 4GB
 10) timestamp(n) date: 데이터 타입의 확장된 형태. n은 millis second 자릿수로 최대 9자리가지 표현 가능.
 */

--4. 문자열을 저장하는 데이터 중, 고정형과 가변형이 있다. 두 데이터 유형의 차이점을 기술하세요.
/*
 ==> 고정형 char은 데이터 입력 시, 크기가 작은 문자열을 입력하더라도 공백으로 해당 크기만큼 저장된다
 	 가변형 varchar2는 최대 크기 이하 데이터를 입력시, 해당 크기만큼 데이터가 저장된다.
 	
 고정형은 자릿수가 정해진 데이터로, 코드성 데이터(학번, 사번, 주민번호 등)을 처리할 때 편리하다.
 가변형은 일단 최대 크기를 설정하고 그보다 작은 데이터 할당 시 나머지를 날려버려서 효율적이다.
 사람마다 다른 크기의 데이터를 입력하는 경우(id, pw등)에는 가변형을 쓰는 것이 낫고,
 사람마다 같은 크기의 데이터를 입력하는 경우(주민번호, 핸드폰번호 등)에는 고정형을 쓰는 것이 적합하다.
 */

--5. 데이터 유형을 확인하고, 학생테이블(번호, 이름, 국어, 영어, 수학)을 만들고 데이터를 입력하세요.
	CREATE TABLE student(
		num char(8),
		name varchar2(20),
		kor NUMBER,
		eng NUMBER,
		math NUMBER
	);
	INSERT INTO student values('20202046','홍길동',80,90,100);
	INSERT INTO student values('20202037','김길동',60,50,65);
	INSERT INTO student values('20202028','신길동',100,100,95);
	SELECT * FROM student;

	CREATE TABLE student2(
		NO number,
		name varchar2(30),
		kor NUMBER,
		eng NUMBER,
		math NUMBER
	);
-- 테이블의 별칭.* : (전체컬럼)에서 새로운 컬럼을 추가할 때는 테이블 테이블의 별칭으로 설정
-- 컬럼을 통한 연산이나 함수를 통해서 처리될 수 있는 데이터는 테이블로 관리하지 않는다.
-- round(컬럼, 소숫점자리 수) : 해당 자리수 만큼 반올림 처리
	INSERT INTO student2 values(1,'홍길동',80,90,100);
	INSERT INTO student2 values(2,'김길동',60,50,65);
	INSERT INTO student2 values(3,'신길동',100,100,95);
	SELECT a.*, kor+eng+math 총계, round((kor+eng+math)/3,1) 평균 FROM student2 a;


--6. 스포츠 스타의 이름 소속사 올해 성적을 입력하는 테이블을 만들고 데이터를 입력하고 조회하세요.
	CREATE TABLE sportsstar(
		name varchar2(20),
		tname varchar2(20),
		grade NUMBER		-- 컬럼명을 입력하다가 대문자로 변경이 되는 경우 내장된 keyword이므로 변경요망
	);
	INSERT INTO sportsstar values('최형우','KIA',0.354);
	INSERT INTO sportsstar values('손아섭','롯데',0.352);
	INSERT INTO sportsstar values('로하스','KT',0.349);
	SELECT name 이름, tname 소속사, grade "올해 성적" FROM sportsstar;

--7. select에서 쓰이는 컬럼과 where 조건의 비교 연산자에 쓰이는 컬럼은 어떤 차이가 있는가?
/*
 ==> select 선택컬럼1, 선택컬럼2
 	 from 테이블
 	 where 조건컬럼1 = 데이터,
 	 and 조건컬럼2 = 데이터;
 
 	선택컬럼: 출력할 컬럼에 대한 선택을 처리한다.(열단위 선택)
 	조건컬럼: 출력할 row단위 filtering 처리(행단위 filtering 처리)
 	# 2차원의 데이터를 SELECT, WHERE에 의해서 행/열 단위로 선택 및 FILTERING을 해준다.
 
 
 select에서 쓰이는 컬럼은 전체 데이터에서 해당 컬럼의 데이터를 출력하는 것이고,
 where조건의 비교연산자에 스이는 컬럼은 해당 컬럼의 데이터 중 연산자 값에 해당하는 일부 데이터만 출력하는 것이다.
 */

--8. where 조건에 쓰이는 비교 연산자의 종류와 논리 연산자의 종류를 기술하세요.
/*
 WHERE 컬렴명1 = 데이터
 AND 컬럼명2 = 데이터
  
 비교연산자: =, !=(<>), !>, >, >=, !<, <, <=
 논리연산자: AND, OR, NOT
 기타 함수나 키워드: BETWEEN A AND B, IS NULL, IN, ...
 */

--9. between, in 구문의 기본형식을 선언하고, 기본 예제를 기술하세요.
/*
 BETWEEN:  WHERE 컬럼명 BETWEEN 데이터1 AND 데이터2
 IN: WHERE 컬럼명 IN (데이터1, 데이터2, 데이터3) 
 */
SELECT * FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;
SELECT * FROM EMP 
WHERE DEPTNO IN (10,20);
