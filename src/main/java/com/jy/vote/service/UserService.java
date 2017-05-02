package com.jy.vote.service;

import com.jy.vote.entity.UsersList;
import com.jy.vote.entity.VoteUser;

public interface UserService {
	boolean register(VoteUser user);
	
	VoteUser login(VoteUser user);

	//检测账号是否存在
	boolean checkName(String username);

	//激活账号
	int changeStatus(String username);

	//检测邮箱是否被占用
	boolean checkEmail(String email);

	//检测邮箱是否已经激活
	boolean checkStatus(String username);

	VoteUser checkUserId(String username);

	int changeUserInfo(VoteUser user);
	
	//获取所有的用户
	UsersList getAllUsers(int pageSize, int pageNum);

	//删除用户
	int deleteUser(int vuId);

	//修改管理员密码
	int changeAdminPass(VoteUser user);
	//管理员激活账号
	int adminChangeStatus(int vuId);
	//管理员查看某人信息
	VoteUser getOneUser(int vuId);
	//管理员搜索用户信息
	UsersList getAdminSearchUsersListByPage(int pageSize, int pageNum,
			String searchWords);
}
