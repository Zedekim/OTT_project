
--ȸ������ ���̺�
create table ottmember(
  mem_id  varchar2(20) constraint ottmember_mem_id_pk primary key,
  mem_pass  varchar2(20) constraint ottmember_mem_pass_nn not null,
  mem_name  varchar2(20) constraint ottmember_mem_name_nn not null,
  mem_nick  varchar2(20) constraint ottmember_mem_id_nn_uq not null unique,
  mem_gender  varchar2(1) constraint ottmember_mem_gender_nn not null,
  mem_tel varchar2(20) constraint ottmember_mem_tel_nn not null,
  mem_hp1 varchar2(10) constraint ottmember_mem_hp1_nn not null,
  mem_hp2 varchar2(10) constraint ottmember_mem_hp2_nn not null,
  mem_hp3 varchar2(10) constraint ottmember_mem_hp3_nn not null,
  mem_email1 varchar2(20) constraint ottmember_mem_email1_nn not null,
  mem_email2 varchar2(20) constraint ottmember_mem_email2_nn not null,
  mem_question  varchar2(30) constraint ottmember_mem_question_nn not null,
  mem_answer varchar2(20) constraint ottmember_mem_answer_nn not null,
  mem_date  date  default sysdate,
  mem_block number(1) default 0 constraint ottmember_mem_block_nn not null,
  mem_drop_date date default null
);
insert into OTTMEMBER values('admin', '1234', '������', '������1','f', 'skt', '010', '9588', '0195', 'dodo0311', 'naver.com', 'question3', 'ȫ�浿', sysdate, 0, null);
select mem_nick from ottmember where mem_id='admin';
--����: mem_id varchar2(10) constraint mem_id_fk_ottcomment references ottmember(mem_id) �ܷ�Ű ���� �ִ¹�--

select * from OTTMEMBER;
--�Խ��� ���̺�--
create table ottboards(
board_num varchar2(20) constraint ottboards_board_num_pk primary key,
board_type number(2)constraint  ottboards_board_type_nn not null,
board_title varchar2(100)constraint ottboards_board_title_nn not null,
board_content varchar2(4000) constraint ottboards_board_conent_nn not null,
mem_id varchar2(10) references ottmember(mem_id),
board_date date constraint ottboards_board_date_nn not null,
board_update_id varchar2(20),
board_update_date date,
board_good number(3),
board_bad number(3),
board_hit number(10)
);
insert into ottboards values('b_'||sequ_ott_board.nextval,2,12,34,'admin',sysdate,null,null,0,0,0);
 select rownum rno, board_num ,board_title,mem_id,to_char(board_date,'yyyy-mm-dd'), board_good, board_bad, board_hit from (select board_num ,board_title,mem_id,board_date, board_good, board_bad, board_hit from ottboards
 where board_type=2) order by board_date desc;
select * from ottboards;

--�Խ��� ������ �߰�--
create sequence sequ_ott_board
start with 1
increment by 1;


--��� ���̺�--
create table ottcomment (
comm_num varchar2(10) constraint ottcomment_comm_num_pk primary key,
board_num varchar2(10) references ottboards(board_num),
comm_contents varchar2(4000) constraint ottcomment_comm_contents_nn not null,
mem_id varchar2(10) references ottmember(mem_id),
comm_date date constraint ottocomment_comm_date_nn not null,
comm_update_nickname varchar2(20),
comm_update_date date
);

/******mypage-comment-select******/
select c.comm_num, c.board_num, c.comm_contents, c.mem_id, to_char(c.comm_date, 'yyyy-mm-dd'), b.board_title, b.board_type from
  ottcomment c, ottboards b
  where c.board_num=b.board_num and c.mem_id='admin'
  order by c.comm_date desc;
  

--��� ������ �߰�--
create sequence sequ_ott_comment
start with 1
increment by 1;
insert into ottcomment values('c_'||sequ_ott_comment.nextval,'b_18','1234','admin',sysdate,null,null);
select* from ottcomment;


--���� ���̺�--
create table ottreviewboards(
rboard_num varchar2(10) constraint ottrev_rboard_num_pk primary key,
rboard_title varchar2(100) constraint ottrev_rboard_title_nn not null,
mem_id varchar2(10) references ottmember(mem_id),
rboard_date date constraint ottrev_rboard_date_nn not null,
rboard_Plat varchar2(10) constraint ottrev_rboard_Plat_nn not null,
rboard_pic number(2) constraint ottrev_rboard__pic_nn not null,
rboard_money number(2) constraint ottrev_rboard__money_nn not null,
rboard_quantity number(2) constraint ottrev_rboard__quantity_nn not null,
rboard_kinds number(2) constraint ottrev_rboard__kinds_nn not null,
rboard_div number(2) constraint ottrev_rboard__div_nn not null,
rboard_etc varchar2(300),
rboard_good number(3),
rboard_bad number(3),
rboard_hit number(10)
);

--���� ������ �߰�--
create sequence sequ_ott_review
start with 1
increment by 1;

select * from ottreviewboards;
select * from user_tables;

--�Ű����̺�--
create table ottwarning (
warn_num varchar2(20) constraint ottwarning_warn_num_pk primary key,
mem_id varchar2(10) references ottmember(mem_id),
warn_id varchar2(20),
warn_type varchar2(10) ,
comm_num varchar2(10) references ottcomment(comm_num),
board_num varchar2(10) references ottboards(board_num),
rboard_num varchar2(10) references ottreviewboards(rboard_num)
);
--�Ű� ������ �߰�--
create sequence sequ_ott_warning
start with 1
increment by 1;


--Ż�� ���̺�--
create table ottdropmember(
  drop_mem_id  varchar2(20) constraint ottdropmember_mem_id_pk primary key,
  drop_mem_pass  varchar2(20),
  drop_mem_name  varchar2(20),
  drop_mem_nick  varchar2(20),
  drop_mem_gender  varchar2(1),
  drop_mem_tel varchar2(20),
  drop_mem_hp1 varchar2(10),
  drop_mem_hp2 varchar2(10),
  drop_mem_hp3 varchar2(10),
  drop_mem_email1 varchar2(20),
  drop_mem_email2 varchar2(20),
  drop_mem_question  varchar2(30),
  drop_mem_answer varchar2(20),
  drop_mem_date  date,
  drop_mem_block number(1),
  drop_mem_drop_date date 
);
------------------------DAO Ŭ�������� ���� ����-----------------------------
--�����Խ��� list ǥ���ϴ� ����--
select rownum rno, board_title, mem_id, to_char(board_date,'yyyy-mm-dd')board_date, board_hit, board_good from 
(select board_title, mem_id, to_char(board_date,'yyyy-mm-dd')board_date, board_hit, board_good from ottboards order by board_date desc);