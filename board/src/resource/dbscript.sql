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