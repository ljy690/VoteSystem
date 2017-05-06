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

insert into VoteUser(vuId,vuUsername,vuSex,vuDate, vuPassword,vuEmail, vuStatus, vuVersion) 
values(seq_user.nextval,'xixi','male',sysdate,'6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2','1234566@qwe.com',2,0,sysdate);
--添加一个最后修改的时间
alter table VoteUser
add (vuUpTime date);

--激活操作
update  VoteUser set vuStatus=2 where vuUsername='12121212'

--修改密码
update  VoteUser set vuVersion='0' where vuUsername='xixi'

--对用户表进行操作
select * from VoteUser where vuUsername='12345678' and vuStatus=1;
--删除某个用户数据 
delete VoteUser where vuId=1000027
--修改邮箱
update  VoteUser set vuEmail='dfsdffsdfs@qq.com' where vuUsername='123456'
--
select * from VoteUser where vuUsername = '555555' and vuStatus!=3

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

--添加主题简介
alter table VoteSubject
add (vsIntroduction varchar2(1000));

--修改主题长度
alter table VoteSubject
modify(vsIntroduction varchar2(1000));

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

--添加选项简介
alter table VoteOption
add (voPic varchar2(100));
--修改选项长度
alter table VoteOption
modify(voIntro varchar2(1000));
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

-- 每个主题的有多少投票 ，每个主题有多少选项
select vs.*,
(select count(1) from VoteOption where vsId=vs.vsId) optionCount,
(select count(1) from VoteItem where vsId=vs.vsId) voteAllCount
from VoteSubject vs where vsStatus=1 order by vsBeginTime desc;


--获取当前的主题,多少选项 ，有多少人投票
select vs.*,vu.vuUsername,
(select count(1) from VoteOption where vsId=vs.vsId) optionCount,
(select count(distinct(vuId)) from VoteItem where vsId=vs.vsId) voteAllCount
from VoteSubject vs,VoteUser vu where vuId=vsvuId and vs.vsId=13

--结果分析
select vo.*,
(select count(1) from VoteItem where voId=vo.voId ) voteUserCount,
(select count(1) from VoteItem vi,VoteSubject vs where vi.vsId=48 and vi.vsId=vs.vsId) totalVote,
(select count(1) from VoteItem vi,voteuser vu where vi.vuId=vu.vuId and vi.vsId=vo.vsId and voId=vo.voId and vuSex='male') voteMaleSex,
(select count(1) from VoteItem vi,voteuser vu where vi.vuId=vu.vuId and vi.vsId=vo.vsId and voId=vo.voId and vuSex='female') voteFemaleSex
from VOTEOPTION vo
where vo.vsid = 1
order by voteUserCount desc,voorder asc

--结果分析根据男性排序
select nn.* from 
(
select rownum rn,a.* from
(select vo.vooption,
(select count(1) from VoteItem where voId=vo.voId ) voteUserCount,
(select count(1) from VoteItem vi,VoteSubject vs where vi.vsId=1 and vi.vsId=vs.vsId) totalVote,
(select count(1) from VoteItem vi,voteuser vu where vi.vuId=vu.vuId and vi.vsId=vo.vsId and voId=vo.voId and vuSex='male') voteMaleSex,
(select count(1) from VoteItem vi,voteuser vu where vi.vuId=vu.vuId and vi.vsId=vo.vsId and voId=vo.voId and vuSex='female') voteFemaleSex
from VOTEOPTION vo
where vo.vsid = 1
order by voteMaleSex desc,voteUserCount desc,voorder asc) a
where 5>=rownum ) nn
where rn>0

--结果分析根据女性排序
select nn.* from 
(
select rownum rn,a.* from
(select vo.vooption,
(select count(1) from VoteItem where voId=vo.voId ) voteUserCount,
(select count(1) from VoteItem vi,VoteSubject vs where vi.vsId=1 and vi.vsId=vs.vsId) totalVote,
(select count(1) from VoteItem vi,voteuser vu where vi.vuId=vu.vuId and vi.vsId=vo.vsId and voId=vo.voId and vuSex='male') voteMaleSex,
(select count(1) from VoteItem vi,voteuser vu where vi.vuId=vu.vuId and vi.vsId=vo.vsId and voId=vo.voId and vuSex='female') voteFemaleSex
from VOTEOPTION vo
where vo.vsid = 1
order by voteFemaleSex desc,voteUserCount desc,voorder asc) a
where 5>=rownum ) nn
where rn>0

--查询某个主题的信息，以及选项得票情况，总票数
select vo.*,
(select count(1) from VoteItem where voId=vo.voId ) voteUserCount,
(select count(1) from VoteItem vi,VoteSubject vs where vi.vsId=vs.vsId and vi.vsId=13) totalVote
from VOTEOPTION vo
where vo.vsid = 13
order by voOrder

--投票信息
select vo.voId,voOption,vsType
from VOTEOPTION vo, VoteSubject vs
where vs.vsid = 4 and vo.vsId=vs.vsId order by voOrder

--感觉身体被掏空
select vo.*,
(select count(1) from VoteItem where voId=vo.voId ) voteUserCount,
(select count(1) from VoteItem where vsId=vo.vsId) voteAllCount 
from VOTEOPTION vo 
where vo.vsid = 12 order by voOrder

select vo.*,
(select count(1) from VoteItem where voId=vo.voId ) voteUserCount
from VOTEOPTION vo 
where vo.vsid = 1 order by voOrder

--查询用户对应的主题信息
select viId,voId,vs.vsId from VoteItem vi,VoteUser vu ,VoteSubject vs
where vu.vuId=vi.vuId and vs.vsId=vi.vsId and vuUsername='admin' and vs.vsid=11 and vsStatus=1;

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
(select count(distinct(vuId)) from VoteItem where vsId=vs.vsId) voteAllCount
from VoteSubject vs where vsStatus!=3 order by vsBeginTime desc) a 
where 5>=rownum ) nn
where rn>0

--用户分页查询
select nn.*,
(select count(1) from VoteUser where vuVersion=0) total
from
(
select rownum rn,a.* from
(
select vu.*,
(select count(1) from VoteSubject vs where vsStatus!=3 and vu.vuId=vs.vsvuId) setVote,
(select count(distinct(vs.vsId)) from VoteItem vi,VoteSubject vs where vsStatus!=3 and vi.vsId=vs.vsId and vi.vuId=vu.vuId) joinVote
from VoteUser vu where vuVersion=0 order by vuUpTime desc) a 
where 5>=rownum ) nn
where rn>0

--搜索用户
select nn.*,
(select count(1) from VoteUser where vuVersion=0 and vuUsername like '%xixi%') total
from
(
select rownum rn,a.* from
(
select vu.*,
(select count(1) from VoteSubject vs where vsStatus!=3 and vu.vuId=vs.vsvuId) setVote,
(select count(distinct(vs.vsId)) from VoteItem vi,VoteSubject vs where vsStatus!=3 and vi.vsId=vs.vsId and vi.vuId=vu.vuId) joinVote
from VoteUser vu where vuVersion=0 and vuUsername like '%xixi%' order by vuUpTime desc) a 
where 5>=rownum ) nn
where rn>0


--查看我发布的投票  分页
select
(select count(1) from VoteSubject where vsvuId=1000028 and vsStatus=1) total, 
nn.* from
(
select rownum rn,a.* from
(
select vs.* ,
(select count(1) from VoteOption where vsId=vs.vsId) optionCount,
(select count(distinct(vuId)) from VoteItem where vsId=vs.vsId) voteAllCount
from VoteSubject vs where vsvuId=1000028 and vsStatus=1 order by vsBeginTime desc) a
where 5>=rownum ) nn
where rn>0

--关闭投票
update VoteSubject set vsStatus=2 where vsId=1

--查看我参与的投票  分页
select
(select count(distinct(vi.vsId)) from VoteItem vi,Votesubject vs where vi.vsId=vs.vsId and vuId=1000026 and vsStatus!=3) total, 
nn.* from
(
select rownum rn,a.* from
(
select vs.* ,votetime
(select count(1) from VoteOption where vsId=vs.vsId) optionCount,
(select count(distinct(vuId)) from VoteItem where vsId=vs.vsId) voteAllCount
from VoteSubject vs,voteitem vi where vs.vsid=vi.vsid and vs.vsId in
(select vsb.vsId from votesubject vsb,voteitem vit where vsb.vsId=vit.vsId and vuId=1000026 and vsStatus!=3) 
and vsStatus!=3 order by voteTime desc) a
where 5>=rownum ) nn
where rn>0

--搜索功能
select
(select count(1) from Votesubject vs,voteUser vu where vsvuId=vuId and vuUsername like '%ad%' and vuStatus=2 and vsStatus!=3) total, 
nn.* from
(
select rownum rn,a.* from
(
select vs.* ,
(select count(1) from VoteOption where vsId=vs.vsId) optionCount,
(select count(distinct(vuId)) from VoteItem where vsId=vs.vsId) voteAllCount
from VoteSubject vs where vsvuId in
(select vuId from voteUser where vuUsername like '%ad%' and vuStatus=2)
and vsStatus!=3 order by vsBeginTime desc) a
where 5>=rownum ) nn
where rn>0


--测试
		select
		(select count(1) from Votesubject,voteUser where vsvuId=vuId 
		and vsTitle like '%选出%'
		and vuStatus=2 and vsStatus!=3) total, 
		nn.* from
		(
		select rownum rn,a.* from
		(
		select vs.* ,
		(select count(1) from VoteOption where vsId=vs.vsId) optionCount,
		(select count(distinct(vuId)) from VoteItem where vsId=vs.vsId) voteAllCount
		from VoteSubject vs where vsStatus!=3  
		and vsTitle like '%选出%'
		order by vsBeginTime desc) a
		where 5*1>=rownum ) nn
		where rn>(1-1)*5

		
		
--查看细节
select voOption,voOrder,voIntro,voUrl,voPic from VoteOption where vsId=25 order by voOrder

--修改用户
update VoteUser set vuPassword='6f9b0a55df8ac28564cb9f63a10be8af6ab3f7c2' where vuId=1000028;
		

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


