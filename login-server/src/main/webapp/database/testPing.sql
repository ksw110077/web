select * from users;

-- create schema 데이터베이스명;
-- create table
-- insert

--create schema loginServer;
--use loginServer;
--
--create table users(
--	code integer primary key auto_increment,
--	id varchar(30) not null,
--    pw varchar(30) not null,
--    regDate datetime not null default current_timestamp
--);
--
--insert users(id, pw) values('apple', '1234');
--insert users(id, pw) values('banana','1234');
--insert users(id, pw) values('melon','1234');

--create table board(
--	code integer primary key auto_increment,
--    title varchar(200),
--    content varchar(5000),
--    id varchar(20),
--    password varchar(20),
--    view integer default 0,
--    `like` integer default 0,
--    date datetime not null
--);

-- select * from board;

-- insert into board(title, content, id, password, date) values('1번','게시물','apple','1234',now());
-- insert into board(title, content, id, password, date) values('2번','게시물','banana','1111',now());
-- insert into board(title, content, id, password, date) values('3번','게시물','melon','0000',now());