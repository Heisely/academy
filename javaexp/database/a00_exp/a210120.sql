--[데이터베이스]
--[하] 1. 데이터베이스의 권한의 종류와 권한 부여의 기본 형식을 기술하세요.
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
		
# 객체 권한
	- 객체 권한은 테이블, 뷰, 시퀀스, 함수 등과 같이 객체별로 사용할 수 있는 권한
	- 종류
		select, insert, update, delete, alter, execute, index, references
	- 대상 객체별로 특정 권한 부여
		grant 객체권한 on 객체 to 계정명

# 계정 생성과 권한 설정
	1) 사용자 생성 권한이 있는 계정으로 접근
	2) 사용자 생성 script
		create user 사용자명 identified by 비밀번호;
		identified by user01;
	3) 접속 권한을 할당, 처리
		grant 권한명 to 계정명;
		create session : 접속을 가능하게 하는 권한
 */

--[하] 2. goodman/9999 계정을 생성하고 테이블생성/활용 권한을 부여하고 테이블 생성하고 입력 처리하세요.
/*
SQL> conn system/1111;
SQL> create user goodman identified by 9999;
SQL> grant resource, create session, create table to goodman;
SQL> conn goodman/9999;
SQL> create table homework2 (name varchar2(50));
SQL> insert into homework2 values ('홍길동');
SQL> select * from homework2;
 */

--[하] 3. scott계정에서 emp10테이블에 대한 조회/등록/수정/삭제 권한을 goodman에 할당하세요.
/*
SQL> conn scott/tiger;
SQL> grant select, insert, update, delete on emp10 to goodman;
 */

--[하] 4. scott계정에서 emp10테이블에 대한 등록/수정/삭제 권한을 goodman에 발탈하세요.
/*
SQL> revoke insert, update, delete on emp10 from goodman;
 */