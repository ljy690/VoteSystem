package com.jy.vote.mapper;

import org.apache.ibatis.annotations.Param;

import com.jy.vote.entity.UsersList;
import com.jy.vote.entity.VoteUser;

public interface UserMapping {
	int insertUser(VoteUser user);

	VoteUser findUserByNP(VoteUser user);

	VoteUser checkName(String vuUsername);

	int changeStatus(String vuUsername);
	
	//检测邮箱是否被占用
	VoteUser checkEmail(String email);
	
	//检测是否激活邮箱
	VoteUser checkStatus(String username);

	int changeUserInfo(VoteUser user);

	//获取所有的用户
	UsersList getAllUsers(int pageSize, int pageNum);

	//删除用户
	int deleteUser(int vuId);

	int upAdminPwd(VoteUser user);

	int adminChangeStatus(int vuId);

	VoteUser getOneUser(int vuId);

	UsersList getAdminSearchUsersListByPage(int pageSize, int pageNum,
			@Param("searchWords")String searchWords);
}
