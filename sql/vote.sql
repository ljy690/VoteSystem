drop table VoteUser;
drop table VoteSubject;
drop table VoteOption;
drop table VoteItem;

delete VoteUser;
delete VoteSubject;
delete VoteOption;
delete VoteItem;

drop sequence seq_user;
drop sequence seq_vsubject;
drop sequence seq_voption;
drop sequence seq_vitem;

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
  vuStatus    NUMBER(6) not null,              --用户状态  1是未激活，2是已激活
  vuVersion   NUMBER(10) not null              --角色  0是普通角色，1是超级管理员
);
--添加管理员
insert into VoteUser(vuId,vuUsername,vuSex,vuDate, vuPassword,vuEmail, vuStatus, vuVersion) 
values(seq_user.nextval,'admin','male',sysdate,'6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2','1234566@qwe.com',2,1);

--对用户表进行操作
select * from VoteUser where vuUsername='12345678' and vuStatus=1;
--删除某个用户数据 
delete VoteUser where vuId=1000027


--投票主题
create table VoteSubject
(
  vsId    NUMBER(10) primary key,            --投票主题编号
  vsvuId  NUMBER(10) not null            --投票发起人
  	constraint FK_vsvuId references VoteUser(vuId),
  vsTitle VARCHAR2(200) not null,         --投票主题
  vsType  NUMBER(6) not null,              --投票类型:   单选  1    多选   2
  vsStatus NUMBER(1) NOT NULL,				--当前投票是否可见  可见 1   不可见  2    删除 3 即只有管理员可见
  vsBeginTime date not null					--投票发布的时间
);


--投票内容对应的选项表
create table VoteOption
(
  voId     NUMBER(10) primary key,  --编号
  voOption VARCHAR2(100) not null,--投票选项
  vsId     NUMBER(10) not null    --投票主题编号
  	constraint FK_vovsId references VoteSubject(vsId),
  voOrder  NUMBER(10) not null  --显示顺序
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
  	constraint FK_vivuId references VoteUser(vuId)
);

--查询
select * from VoteUser;
select * from VoteSubject;
select * from VoteOption;
select * from VoteItem;

-- 每个主题的有多少投票 ，每个主题有多少选项
select vs.*,
(select count(1) from VoteOption where vsId=vs.vsId) optionCount,
(select count(1) from VoteItem where vsId=vs.vsId) voteAllCount
from VoteSubject vs where vsStatus=1 order by vsBeginTime desc;


--获取当前的主题,多少投票 ，有多少选项
select vs.*,
(select count(1) from VoteOption where vsId=vs.vsId) optionCount,
(select count(1) from VoteItem where vsId=vs.vsId) voteAllCount
from VoteSubject vs where vs.vsId=4


--查询某个主题的信息，以及选项得票情况
select vo.*,
(select count(1) from VoteItem where voId=vo.voId ) voteUserCount
from VOTEOPTION vo
where vo.vsid = 1;

--投票信息
select vo.voId,voOption,vsType
from VOTEOPTION vo, VoteSubject vs
where vs.vsid = 4 and vo.vsId=vs.vsId order by voOrder

--感觉身体被掏空
select vo.*,
(select count(1) from VoteItem where voId=vo.voId ) voteUserCount,
(select count(1) from VoteItem where vsId=vo.vsId) voteAllCount 
from VOTEOPTION vo 
where vo.vsid = 1 order by voOrder

select vo.*,
(select count(1) from VoteItem where voId=vo.voId ) voteUserCount
from VOTEOPTION vo 
where vo.vsid = 1 order by voOrder

--查询用户对应的主题信息
select viId,voId,vsId from VoteItem vi,VoteUser vu 
where vu.vuId=vi.vuId and vuUsername='admin' and vsid=11;

--添加新主题
insert into VoteSubject (vsId, vsvuId,vsTitle, vsType,vsStatus,vsBeginTime)
values (seq_vsubject.nextval,1000010, '选出你心目中最好的下载工具', 2,1,sysdate);
select seq_vsubject.nextval vsId from dual;

--投票列表分页查询
select
(select count(1) from VoteSubject where vsStatus=1) total, 
nn.* from
(
select rownum rn,a.* from
(
select vs.*,
(select count(1) from VoteOption where vsId=vs.vsId) optionCount,
(select count(1) from VoteItem where vsId=vs.vsId) voteAllCount
from VoteSubject vs where vsStatus=1 order by vsBeginTime desc) a 
where 5>=rownum ) nn
where rn>0







--添加投票主题
insert into VoteSubject (vsId, vsvuId,vsTitle, vsType,vsStatus,vsBeginTime)
values (seq_vsubject.nextval,1000010, '选出你心目中最好的下载工具', 2,1,sysdate);

insert into VoteSubject (vsId, vsvuId,vsTitle, vsType,vsStatus,vsBeginTime)
values (seq_vsubject.nextval,1000010, '选出你心目中最好的输入法', 1, 1,sysdate);

insert into VoteSubject (vsId, vsvuId,vsTitle, vsType,vsStatus,vsBeginTime)
values (seq_vsubject.nextval, 1000010,'选出你心目中最好的网络聊天工具', 1, 1,sysdate);

insert into VoteSubject (vsId, vsvuId,vsTitle, vsType,vsStatus,vsBeginTime)
values (seq_vsubject.nextval,1000010, '你最想去的地方', 1, 1,sysdate);

insert into VoteSubject (vsId, vsvuId,vsTitle, vsType,vsStatus,vsBeginTime)
values (seq_vsubject.nextval,1000010, '选出你心目中最好的浏览器', 1, 1,sysdate);

insert into VoteSubject (vsId, vsvuId,vsTitle, vsType,vsStatus,vsBeginTime)
values (seq_vsubject.nextval, 1000010,'选出你心目中最好的杀毒软件', 1, 1,sysdate);

--添加主题中的选项
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '腾讯QQ', 3, 1);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, 'MSN', 3, 2);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '新浪UC', 3, 3);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '飞信', 3, 4);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, 'Skype', 3, 5);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '阿里旺旺', 3, 6);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '百度HI', 3, 7);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '迅雷', 1, 1);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '网际快车', 1, 2);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '电驴', 1, 3);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '比特精灵', 1, 4);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '超级旋风', 1, 5);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '微软IE浏览器', 5, 1);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '火狐（Firefox）浏览器', 5, 2);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '世界之窗浏览器', 5, 3);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '360浏览器', 5, 4);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '傲游浏览器', 5, 5);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '谷歌（Chrome）浏览器', 5, 6);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '搜狗拼音', 2, 1);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '搜狗五笔', 2, 2);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, 'QQ拼音', 2, 3);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, 'QQ五笔', 2, 4);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '谷歌拼音', 2, 5);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '紫光拼音', 2, 6);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '智能ABC', 2, 7);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '微软拼音', 2, 8);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '万能拼音', 2, 9);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '万能五笔', 2, 10);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '极品拼音', 2, 11);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '极品五笔', 2, 12);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '卡巴斯基', 6, 1);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '360杀毒', 6, 2);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, 'McAfee', 6, 3);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, 'AVG', 6, 4);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '诺顿杀毒', 6, 5);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '瑞星杀毒', 6, 6);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '金山毒霸', 6, 7);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '江民杀毒', 6, 8);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '微点防御', 6, 9);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '趋势杀毒', 6, 10);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '地狱', 4, 1);
insert into VoteOption (voId, voOption, vsId, voOrder)
values (seq_voption.nextval, '天堂', 4, 2);

--添加选择结果
insert into VoteItem (viId, voId, vsId,vuId)
values (seq_vitem.nextval, 10, 1,1000019);
insert into VoteItem (viId, voId, vsId,vuId)
values (seq_vitem.nextval, 25, 2, 1000019);
insert into VoteItem (viId, voId, vsId,vuId)
values (seq_vitem.nextval, 1, 3, 1000019);
insert into VoteItem (viId, voId, vsId,vuId)
values (seq_vitem.nextval, 41, 4, 1000019);
insert into VoteItem (viId, voId, vsId,vuId)
values (seq_vitem.nextval, 16, 5, 1000019);
insert into VoteItem (viId, voId, vsId,vuId)
values (seq_vitem.nextval, 35, 6, 1000019);

insert into VoteItem (viId, voId, vsId,vuId)
values (seq_vitem.nextval, 11, 1,1000026);
insert into VoteItem (viId, voId, vsId,vuId)
values (seq_vitem.nextval, 26, 2, 1000026);
insert into VoteItem (viId, voId, vsId,vuId)
values (seq_vitem.nextval, 2, 3, 1000026);
insert into VoteItem (viId, voId, vsId,vuId)
values (seq_vitem.nextval, 42, 4, 1000026);
insert into VoteItem (viId, voId, vsId,vuId)
values (seq_vitem.nextval, 15, 5, 1000026);
insert into VoteItem (viId, voId, vsId,vuId)
values (seq_vitem.nextval, 36, 6, 1000026);


