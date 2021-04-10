create table calendar(
		id number primary key,
		groupId number,
		title varchar2(50),
		writer varchar2(50),
		content varchar2(1000),
		start1 varchar2(50),
		end1 varchar2(50),
		allDay number(1), -- DB에서는 boolean형식이 없음. VO에서 boolean으로 설정해놓으면 0은 false, 1은 true로 입력이 됨
		textColor varchar2(50),
		backgroundColor varchar2(50),
		borderColor	varchar2(50)
	);

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
SELECT * FROM CALENDAR;

INSERT INTO calendar 
VALUES (cal_seq.nextval, '', '프로젝트 시작', '이철수', '내용',
		'2021-04-01T00:00:00.000Z', '2021-04-02T00:00:00.000Z',
		1, 'yellow', 'navy', 'orange');











