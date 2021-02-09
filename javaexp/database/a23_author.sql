/*
# 권한(privilage)
1. 권한이란?
	사용자가 데이터베이스 시스템을 관리하거나 객체를 이용할 수 있는 권리
2. 권한의 종류
	1) 시스템 권한
		- 시스템 차원의 자원 관리나 사용자 스키마 객체관리 등과 같은 데이터베이스 관리 작업을 할 수 있는 권한
		- 오라클에서는 테이블, 뷰, 롤백 세그먼트, 프로시저와 같은 객체를 생성, 삭제, 수정하는 작업과 관련된 140여종류의 시스템 권한을 지원
	2) 객체 권한
		- 테이블, 뷰, 시퀀스, 함수 등과 같은 객체를 조직할 수 있는 권한
		- 객체의 종류에 따라 서로 다른 유형의 객체 권한
		- 테이블의 칼럼별로 insert, update, references등과 같은 권한을 상세 부여
3. 계정 생성과 권한 설정
	1) 사용자 생성 권한이 있는 계정으로 접근
	2) 사용자 생성 script
		create user 사용자명 identified by 비밀번호;
		identified by user01;
	3) 접속 권한을 할당, 처리
		grant 권한명 to 계정명;
		create session : 접속을 가능하게 하는 권한
4) 비밀번호 변경
	alter user 계정명 identified by 변경할비밀번호;
*/

-- ex) 계정 생성 예제 oraclestudy/orcle로 계정을 생성하고 접근권한을 설정하고 다시 접근해보세요.
/*
SQL> create user oraclestudy identified by oracle;
SQL> grant create session to oraclestudy;
SQL> conn oraclestudy/oracle
 */

/*
-- 4) 비밀번호 변경 예제		
SQL> create user orauser01 identified by oracle;
SQL> grant create session to orauser01;
SQL> conn user01/oracle
SQL> conn system/1111
SQL> alter user orauser01 identified by 1111;
 */

-- ex) himan/7777 접근계정을 만들고 권한부여 비밀전호를 1111로 변경처리하세요.
/*
SQL> conn system/1111
SQL> create user himan identified by 7777;
SQL> grant create session to himan;
SQL> conn himan/7777;
SQL> conn system/1111;
SQL> alter user himan identified by 1111;
SQL> conn himan/1111;
 */

/*
# 시스템권한
1. 일반 사용자가 가질 수 있는 시스템 권한
	- 사용자가 생성한 객체를 관리, 내장 프로시저를 관리하는 권한을 말한다.
2. 시스템 권한의 종류
	- create session: 데이터베이스 서버에 접속할 수 있는 권한
	- create table: 사용자 스키마에서 테이블을 생성할 수 있는 권한
	- create sequence: 사용자 스키마에서 시퀀스를 생성할 수 있는 권한
	- create view: 사용자 스키마에서 뷰를 생성할 수 있는 권한
	- create procedure: 사용자 스키마에서 프로시저, 함수, 패키지를 생성할 수 있는 권한
3. 시스템 권한 부여
	- 시스템 권한은 특정 사용자나 모든 사용자에게 부여 가능
	- grant 명령문을 사용한다.
	- 권한부여 기본 형식
		grant 권한명 to 사용자 [public]: public은 모든 사용자에게 권한 부여
							[with admin option]: 권한의 재할당을 할 수 있게 해줌
	- resource는 위에 정의된 내용을 한 번에 할당할 수 있는 권한 처리
		ex) grant resource to 사용자;
4. 객체 권한
	- 객체 권한은 테이블, 뷰, 시퀀스, 함수 등과 같이 객체별로 사용할 수 있는 권한
	- 종류
		select, insert, update, delete, alter, execute, index, references
	- 대상 객체별로 특정 권한 부여
		grant 객체권한 on 객체 to 계정명

-- ex) higirl/8888 계정을 생성하고, 시스템 권한 부여 / 객체권한 부여하여 테이블을 생성하고 데이터를 입력 및 조회하기		
SQL> conn system/1111
SQL> create user higirl identified by 8888;
SQL> grant resource, create session, create table to higirl;
SQL> conn higirl/8888;
SQL> create table tmp(name varchar2(10));
SQL> insert into tmp values('홍길동');
SQL> select * from tmp;

5. 권한의 철회
	1) 기본 형식
		revoke 권한명
		on 객체(테이블, sequence 등 사용 객체)
		from 계정명;

SQL> conn scott/tiger;
SQL> create table temp(col1 varchar2(10));
SQL> insert into temp values('himan');
-- scott 계정에서 temp테이블에 대한 select/insert 권한을 oraclestudy에 할당
SQL> grant select on temp to oraclestudy;
SQL> grant insert on temp to oraclestudy;
-- 관리자 계정으로 oraclestudy에 기본적인 자원에 대한 권한 할당
SQL> conn system/1111
SQL> grant resource, create session, create table to oraclestudy;
-- oraclestudy/oracle로 로그인
SQL> conn oraclestudy/oracle;
SQL> select * from scott.temp;
SQL> insert into scott.temp values ('마길동');

ex)
-- scott계정으로 접근해서 id,pass,name으로 member3 테이블을 생성하고
SQL> conn scott/tiger;
SQL> create table member3(id varchar2(20), pass varchar2(30), name varchar2(50));
-- 데이터를 등록 후
SQL> insert into member3 values ('hong777','gildong888','홍길동');
-- member3테이블에 대한 조회와 입력 권한을 himan 계정에 부여
SQL> grant select on member3 to himan;
SQL> grant insert on member3 to himan;
-- himan으로 접속한 후, scott 계정의 member3테이블의 조회와 등록처리 확인
SQL> conn himan/1111;
SQL> select * from scott.member3;
SQL> insert into scott.member3 values ('ma123','ddong809','마길동');

-- 권한 삭제
SQL> conn oraclestudy/oracle
SQL> select * from scott.temp;
SQL> conn scott/tiger;
SQL> revoke select, insert on temp from oraclestudy;
SQL> conn oraclestudy/oracle;
SQL> select * from scott.temp; -- 실패

-- ex)
-- scott계정에서 himan에 준 select, insert권한을 회수하고
SQL> conn scott/tiger;
SQL> revoke select, insert on member3 from himan;
-- himan으로 접속해서 확인하세요.
SQL> conn himan/1111;
SQL> select * from scott.member3; -- 실패
 */