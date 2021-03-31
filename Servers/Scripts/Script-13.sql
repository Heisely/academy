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
INSERT INTO calendar VALUES (cal_seq.nextval, '', '일정등록시작', '홍길동', '내용',
					 to_date('2020/04/01','YYYY/MM/DD'),to_date('2020/04/02','YYYY/MM/DD'),1,
					 'yellow','navy','navy');
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