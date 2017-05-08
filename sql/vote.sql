drop table VoteUser;
drop table VoteSubject;
drop table VoteOption;
drop table VoteItem;

delete VoteItem;
delete VoteOption;
delete VoteSubject;
delete VoteUser;

drop sequence seq_user;
drop sequence seq_vitem;
drop sequence seq_voption;
drop sequence seq_vsubject;

--主题id自增
create sequence seq_user start with 1000010;
create sequence seq_vsubject start with 1;
create sequence seq_voption start with 1;
create sequence seq_vitem start with 1;
--用户表
create table VoteUser
(
  vuId   NUMBER(10) primary key,           --用户id
  vuUsername VARCHAR2(20) not null,           --用户名
  vuSex  VARCHAR2(6) not null,				  --性别
  vuDate date not null,                       --出生日期
  vuPassword  VARCHAR2(40) not null,           --用户密码
  vuEmail     VARCHAR2(40) not null,		   --激活邮箱
  vuStatus    NUMBER(6) not null,              --用户状态  1是未激活，2是已激活，3被删除
  vuVersion   NUMBER(10) not null,              --角色  0是普通角色，1是超级管理员
  vuUpTime	date                                --最后修改的时间
);
--添加管理员
insert into VoteUser(vuId,vuUsername,vuSex,vuDate, vuPassword,vuEmail, vuStatus, vuVersion) 
values(seq_user.nextval,'admin','male',sysdate,'6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2','1234566@qwe.com',2,1);


--投票主题
create table VoteSubject
(
  vsId    NUMBER(10) primary key,            --投票主题编号
  vsvuId  NUMBER(10) not null            --投票发起人
  	constraint FK_vsvuId references VoteUser(vuId),
  vsTitle VARCHAR2(200) not null,         --投票主题
  vsType  NUMBER(6) not null,              --投票类型:   单选  1    多选   2
  vsStatus NUMBER(1) NOT NULL,				--当前投票是否可见  可见 1   关闭 2    删除 3 即只有管理员可见
  vsBeginTime date not null,					--投票发布的时间
  vsIntroduction varchar2(1000)                  --主题的简介
);

--投票内容对应的选项表
create table VoteOption
(
  voId     NUMBER(10) primary key,  --编号
  voOption VARCHAR2(100) not null,--投票选项
  vsId     NUMBER(10) not null    --投票主题编号
  	constraint FK_vovsId references VoteSubject(vsId),
  voOrder  NUMBER(10) not null,  --显示顺序
  voIntro  varchar2(1000) ,       --选项的简介
  voUrl    varchar2(300),        --选项的连接
  voPic    varchar2(100)         --选项对应的图片
);

--用户投票取值表
create table VoteItem
(
  viId      NUMBER(10) primary key, --编号
  voId      NUMBER(10) not null --投票选项id
  	constraint FK_vivoId references VoteOption(voId),
  vsId      NUMBER(10) not null --投票主题编号id
  	constraint FK_vivsId references VoteSubject(vsId),
  vuId	    NUMBER(10) not null --用户id
  	constraint FK_vivuId references VoteUser(vuId),
  voteTime  date not null      --用户参与投票的时间
);

--查询
select * from VoteUser;
select * from VoteSubject;
select * from VoteOption;
select * from VoteItem;


