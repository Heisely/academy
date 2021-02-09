--[데이터베이스]
--[하] 1. seqence의 생성 기본 형식을 기술하세요.
/*
 	CREATE SEQUENCE 시퀀스명
		INCREMENT BY N (>> 증가 범위)
		START WITH N (>> 초기 번호)
		MAXVALUE N | NOMAXVALUE (>> 최대 데이터)
		MINVALUE N | NOMINVALUE (>> 최소 데이터)
		CYCLE | NOCYCLE (>> 최대/최소에 이를 때 반복 여부)
		CACHE | NOCACHE (>> 속도 향상을 위한 캐시메모리 사용 여부)
 */

--[하] 2. 게시판 테이블을 번호, 제목, 작성자, 내용, 조회수로 생성하고,
--        sequence로 번호를 만들어 입력 처리하게 하세요..
CREATE TABLE board(
	NO number,
	title varchar2(30),
	name varchar2(50),
	memo varchar2(200),
	views NUMBER
);
SELECT * from board;
CREATE SEQUENCE bd_seq
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	MAXVALUE 9999;
INSERT INTO board VALUES (bd_seq.nextval, '제목1','홍길동','안녕하세요!',33);
INSERT INTO board VALUES (bd_seq.nextval, '제목2','James','Hello!',33);
INSERT INTO board VALUES (bd_seq.nextval, '제목3','장첸','你好!',33);
INSERT INTO board VALUES (bd_seq.nextval, '제목4','사오리','こんにちは!',33);
SELECT * FROM board;

--[중] 3. student2테이블 학번, 이름, 학과 테이블이다.
--        학번을 올해연도(2)학과코드(CS)번호(4)로 해당 자리수로 설정할 때,
--        테이블과 sequence를 만들고 데이터를 입력 처리하세요
CREATE TABLE student2(
	snum char(8), -- 코드성으로 자리가 정해진 데이터는 char로 설정
	name varchar2(50),
	major varchar2(50)
);

CREATE SEQUENCE std2_seq
	START WITH 1111
	INCREMENT BY 33
	MINVALUE 1111
	MAXVALUE 9999
	CYCLE;

INSERT INTO student2 VALUES (to_char(sysdate,'YY')||'CS'||std2_seq.nextval, '마길동','컴퓨터통계학과');
SELECT * FROM student2;


--[하] 4. sequence의 변경/삭제 구문을 기술하고, 한계를 예제를 통해서 나타내세요.
/*
# sequence의 수정
1. 시퀀스의 속성을 다음과 같은 형식으로 수정할 수 있다.
	1) 기본 형식
		alter sequence 시퀀스명
		increment by n
		maxvalue n | nomaxvalue
		minvalue n | nominvalue
		cycle | nocycle
		cache | nocache
	2) 변경 처리
		증가치, 최소값, 최대값 정의를 수정가능
		>> 한계점1: start with절은 생성 직후 시작값 변경 불가
		>> 한계점2: minvalue|maxvalue: 현재값을 기준해서 너무 적거나 많은 변경은 불가능
				  ex) 12345678이 현재값인데 maxvalue를 3으로 설정처리하려는 것은 불가
		
# sequence 삭제
1. 기본 구분
	drop sequence 시퀀스명;
		cf) 오라큰 관련 객체들은 "drop 객체유형 객체명;" 으로 삭제

>> 한계를 예제를 통해 나타내라는게 무슨 말인지 모르겠습니다,,
 */

--[하] 5. 테이블의 생성 기본형식을 옵션과 함께 기술하세요.
/*
# 테이블 생성 기본 형식
	CREATE 옵션1 TABLE 옵션2.테이블명(
		컬럼명 데이터유형 옵션3 옵션4,
		컬럼명 데이터유형 옵션3 옵션4,
		...
		컬럼명 데이터유형 옵션3 옵션4
	);
	옵션1: global temporary - 임시테이블을 만들 때 사용. 해당 세션(클라이언트)에만 보임
	옵션2: 스키마(사용자계정) - 다른 계정에서 호출해서 사용
			ex) system 계정으로 접속해서 scott계정에서 사용할 테이블을 만들 때, 반드시 스키마를 선언해야 한다.
	옵션3: default 데이터 선언 - 데이터를 입력하지 않을 때 null값 대신에 들어가는 데이터를 선언할 수 있음
	옵션4: 제약조건 - primary key, not null 등 무결성 제약조건을 선언할 수 있음
 */

--[하] 6. 테이블 생성시, default 데이터의 입력의 제약사항에 대하여 기술하세요
/*
 default 값을 설정하는 데이터로
 >> 리터럴 값, 표현식, sql함수, sysdate, user를 사용할 수 있다.
 >> 특정 컬럼이나 의사컬럼(nextval, currval)은 사용할 수 없다.
 */

--[하] 7. 테이블의 구조 변경 형식을 지정하고,
--		 복사테이블 emp60만들고, 부서명, 부서위치를 추가 처리하세요
/*
 # 테이블 구조 변경 형식
 ALTER TABLE 테이블명
	ADD 컬럼명 데이터유형 [DEFAULT 디폴트데이터], [제약조건] >> []안의 내용은 옵션
 */
CREATE TABLE emp60
AS SELECT * FROM emp;
SELECT * FROM emp60;

ALTER TABLE emp60
ADD (deptname varchar2(50) DEFAULT '부서명', deptloc varchar(50) DEFAULT '부서위치');
SELECT * FROM emp60;

--[하] 8. 컬럼의 삭제 처리하는 형식을 기술하고, 위 emp60에서 부서위치를 삭제 처리하세요.
/*
 # 컬럼 삭제
 ALTER TABEL 테이블명 DROP COLUMN 컬럼명;
 */
ALTER TABLE emp60 DROP COLUMN deptloc;
SELECT * FROM emp60;