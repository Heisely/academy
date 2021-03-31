create table calendar(
	id number primary key,
	groupId number,
	title varchar2(50),
	writer varchar2(50),
	content varchar2(1000),
	start1 date,
	end1 date,
	allDay number(1),
	textColor varchar2(50),
	backgroundColor varchar2(50),
	borderColor	varchar2(50)
);
INSERT INTO calendar VALUES (cal_seq.nextval, '', '일정등록3', '오길동', '내용',
					 to_date('2021/04/03','YYYY/MM/DD'),to_date('2021/04/04','YYYY/MM/DD'),1,
					 'yellow','green','green');
INSERT INTO calendar VALUES (cal_seq.nextval, '', '일정등록4', '오길동', '내용',
					 sysdate,sysdate,1,
					 'yellow','green','green');
INSERT INTO calendar VALUES (cal_seq.nextval, '', '4월 시작', '마길동', '내용',
					 to_date('2021/04/01','YYYY/MM/DD'),to_date('2021/04/01','YYYY/MM/DD'),1,
					 'pink','orange','orange');
create sequence cal_seq
	start with 1
	increment by 1
	minvalue 1
	maxvalue 9999999;
create sequence cal_gp_seq
	start with 10000
	increment by 1
	minvalue 1
	maxvalue 99999;

-- 2021-04-12T20:00:00
SELECT id, title, 
	   to_char(start1, 'YYYY-MM-DD"T"HH24:MI:SS') start1,
	   to_char(end1, 'YYYY-MM-DD"T"HH24:MI:SS') end1,
	   allDay,
	   textColor,
	   BACKGROUNDCOLOR,
	   BORDERCOLOR
FROM CALENDAR;











