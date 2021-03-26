CREATE TABLE board(
	NO NUMBER PRIMARY KEY,
	refno NUMBER,
	subject varchar2(200),
	content varchar2(2000),
	writer varchar2(100),
	readcnt NUMBER,
	regdte DATE,
	uptdte DATE	
);
CREATE SEQUENCE board_seq
	START WITH 1
	MINVALUE 1
	INCREMENT BY 1
	MAXVALUE 9999999;

INSERT INTO board VALUES (BOARD_seq.nextval, 0, '첫 번째 글', '내용', '홍길동', 0, sysdate, sysdate);

SELECT * FROM board;

CREATE TABLE boardfile(
	NO NUMBER,
	fname varchar2(100),
	pathname varchar2(500),
	content varchar2(100),
	credte DATE
);
INSERT INTO boardfile VALUES (1,'ojdbc8.jar','','첫 번째 글', sysdate);
SELECT * FROM BOARDFILE;

CREATE TABLE fileexp(
   content varchar2(200),
   fname varchar2(100)
);
SELECT * FROM fileexp;
INSERT INTO fileexp values('과제1','a.hwp');

SELECT * FROM (SELECT ROWNUM rn, a.* FROM board a)
WHERE rn BETWEEN 11 AND 20;

-- 페이징 최종 SQL
SELECT * FROM (
		SELECT rownum rn, level, a.* FROM BOARD a
		start with refno = 0
		connect by prior no = refno
		order siblings by no DESC)
WHERE rn BETWEEN 6 AND 10;
