-- content, fname
-- 내용[	], 파일명[][][]
-- 과제1 a.hwp
-- 과제1 b.hwp
-- 과제1 c.hwp
CREATE TABLE fileexp(
	content varchar2(200),
	fname varchar2(100)
);
SELECT * FROM fileexp;
INSERT INTO fileexp VALUES ('과제1','a.hwp');
