/*
# sequence
1. oracle 서버에서 식별자 만들기 위한 유일한 객체
2. 기본 키를 자동으로 numbering 처리
3. 여러 테이블에서 공유 가능
4. 기본형식
	CREATE SEQUENCE 시퀀스명
		INCREMENT BY N (>> 증가 범위)
		START WITH N (>> 초기 번호)
		MAXVALUE N | NOMAXVALUE (>> 최대 데이터)
		MINVALUE N | NOMINVALUE (>> 최소 데이터)
		CYCLE | NOCYCLE (>> 최대/최소에 이를 때 반복 여부)
		CACHE | NOCACHE (>> 속도 향상을 위한 캐시메모리 사용 여부)
5. 활용 함수
	1) 시퀀스명.currval: 현재 시퀀스 번호
	2) 시퀀스명.nextval: numbering으로 다음 시퀀스 번호 호출
 */
SELECT max(empno) FROM emp21;
CREATE SEQUENCE emp21_seq
	INCREMENT BY 1
	START WITH 7935
	MINVALUE 1000
	MAXVALUE 9999
	CYCLE;
SELECT emp21_seq.nextval FROM dual;
SELECT emp21_seq.currval FROM dual;
INSERT INTO emp21(empno, ename) VALUES (emp21_seq.nextval, '홍길동');
SELECT * FROM emp21 ORDER BY empno DESC;

/*
 student 테이블 번호 이름 국어 영어 수학
 stud_seq로 1부터 시작해 30번까지 입력되게 sequence를 만들어 입력
 */
CREATE TABLE student(
	NO NUMBER,
	name varchar(50),
	kor NUMBER,
	eng NUMBER,
	math number
);
SELECT * FROM STUDENT;
CREATE SEQUENCE stud_seq
	INCREMENT BY 1
	START WITH 1
	MINVALUE 1
	MAXVALUE 30;
INSERT INTO student VALUES (stud_seq.nextval, '홍길동', 80,80,80);
SELECT * FROM STUDENT;

-- 사번 코드 체계(입사년월4자리)(부서코드2자리)(sequence5자리)
CREATE SEQUENCE com_seq
	START WITH 10000
	INCREMENT BY 1
	MINVALUE 10000
	MAXVALUE 99999
	CYCLE;
SELECT to_char(sysdate,'YYMM')||'QA'||com_seq.nextval empno FROM dual;

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
		start with절은 생성 직후 시작값 변경 불가
 */
SELECT STUD_SEQ.nextval FROM dual;
ALTER SEQUENCE stud_seq
	MAXVALUE 99999;
	INCREMENT BY 5;
-- START WITH 15; -- start with는 변경 불가
-- minvalue | maxvalue: 현재값을 기준으로 너무 적거나 많은 변경은 불가능
-- 변경에 대한 한계로 인해 시퀀스 삭제가 필요
/*
# sequence 삭제
1. 기본 구분
	drop sequence 시뭔스명;
		cf) 오라클 관련 객체들은 "drop 객체유형 객체명;" 으로 삭제
 */
SELECT emp21_seq.nextval FROM dual;
DROP SEQUENCE emp21_seq;
SELECT max(empno) FROM emp21;
CREATE SEQUENCE emp21_seq
	START WITH 7954
	MINVALUE 1000
	MAXVALUE 9999
	CYCLE;










