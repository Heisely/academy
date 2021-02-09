/*
 # Database
 1. 데이터 베이스란 무엇인가?
 	- 데이터 베이스는 여러 사람이 공유하여 사용할 목적으로 체계화를 통해 관리하는 데이터의 집합이다.
 	  작성된 목록으로써 여러 응용 시스템들의 통합된 정보들을 저장하여 운영할 수 있는 공용 데이터들의 묶음이다.(위키백과)
 	  
 2. 웹프로그래밍에서 데이터베이스의 역할과 데이터베이스 식별
 	1) 고정되어 유지하는 데이터를 체계적으로 저장 및 관리하는 역할을 한다.
 		ex) 회원정보, 물품정보, 업무상 필요한 프로세스 정보 등
 		ex) 리스트 정보
 			http://browse.gmarket.co.kr/list?category=200001270
 			웹화면에 jsp로 요청 "category=200001270" 전달하며,
 			database에 해당 "category=200001270" 정보를 전달.
 		
 			select title, imgsrc, price
 			from product
 			where part="유아용품"
 			order 판매갯수 desc;
 		ex) 특정 상품에 대한 상세정보.
 			select *
 			from product
 			where goodscode=125749989;
 		ex) 로그인 클릭시
 			select*
 			from member
 			where id= ? and pw= ?;
 
 3. 데이터베이스 핵심 커리
 	01) SQL 기초
 	02) 데이터타입
 	03) 조건 검색 및 행의 정렬
 	04) SQL 함수
 	05) 그룹 함수
 	06) 조언
 	07) subquery
 	08) 데이터 조작어
 	09) 테이블관리
 	10) 데이터무결성
 	11) 인덱스 관리
 	12) 뷰
 	13) 권환 관리제어
 	14) 계층적 질의문
 	15) PL/SQL
 	# ) DB설계
 	
 # Database 개요
 1. DBMS(DataBase Management System): 연관성 있는 데이터들의 집합 + 이들의 데이터를 효율적으로 응용하기 위해 구성된 소프트웨어들의 집합
 	- 데이터와 응용프로그램의 중간에서 응용프로그램이 요구샇는 대로 데이터를 정의하고, 읽고 쓰고 갱신하는 등의 데이터를 조작하고 이들을 효율적으로 관리하는 프로그램들
 2. RDBMS(Relation DataBase Management Stysem)
 	1) 특징
 		- 수학적 개념과 원리에 기초한 DB: DB 안 객체들과의 관계를 관리 및 처리
 		- 데이터를 테이블의 형식으로 저장 ==> 1:1, 1:다, 다:다 관계의 테이블로 저장
 		- 비절차적(non procedural)언어인 sql 지원 ==> sql을 통한 join으로 데이터 관계내용을 가져올 수 있다.
 		- 시스템 카탈로그 지원(data dictionary) ==> 데이터 참조에 필요한 위치 정보 관리
 3. sql 언어란?
 	1) 관계형 데이터베이스를 조작하기 위한 표준언어
 	2) 관계 대수와 관계 해석의 수학적 이론을 기초로 개발
 	3) DB의 구조를 정의하거나 DB에 저장된 데이터를 검색하기 위한 목적
 4. sql 언어의 특징
 	1) 비절차적 언어
 		기존 프로그래밍 언어: 레코드 단위로 처리 조건에 따라 데이터에 대한 접근 경로가 달라짐
 		sql 언어: 조건을 만족하는 데이터를 집합단위로 한꺼번에 처리
 	2) 대화식으로 사용되거나 응용프로그램에 삽입하여 사용
 5. sql 명령문의 종류
 	1) 질의어(DQL/Data Query Language): 데이터를 검색 - select
 	2) 데이터 조작어(DML/Data Manipulation Language): 데이터를 입력/수정/삭제 - insert, update, delete
 		ex) insert 테이블(컬럼1,컬럼2) values(데이터1,데이터2,...);
 	3) 데이터 정의어(DDL/Data Definition Language): DB객체 생성/변경/삭제/이름변경 - creat, alter, drop, rename
 	4) 트랜잭션 처리어(TCL/Transaction Control Language): 트랜잭션의 정상적인 종료/취소/임시저장점 설정 - commit, rollback, savepoint
 	5) 데이터 제어어(DCT/Data Controll Language): 데이터 객체에 대한 접근권한 부여/취소 - grant, revoke 
 6. sql을 잘 활용하기 위한 tip
 	1) sql은 명령어가 아니라 하나의 프로그램
 	2) 데이터베이스에게 일을 시킬 수 있는 유일한 수단
 	3) 절차적 사고를 집합적 사고로 전환해야 함. ex) 테이블 하나 하나가 집합
 	4) 동일한 결과를 내는 처리 경로는 많으나 효율의 차이는 크다.
 	5) 응용력에 따른 개인차 발생
 	6) 사용상의 미묘한 차이가 엄청난 효율성의 차이를 가져온다.
 	7) 1000줄의 절차적 프로그램을 10여줄로 처리 가능
 	8) 1000초의 수행 속도를 약간의 변경으로 1초로도 향상 가능
 	9) 내부 처리 절차를 모르는 사람은 세월이 흘러도 제자라
 	10) 월이 이해를 바탕으로 정석을 익히고 응용력을 키우세요.
 */
