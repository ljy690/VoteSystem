package com.jy.vote.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jy.vote.entity.VoteUser;
import com.jy.vote.util.SessionAttributeInfo;

public final class RequestUserFilterImpl implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		//判断当前用户是否登录
		HttpServletRequest request = (HttpServletRequest) arg0;
		HttpServletResponse response = (HttpServletResponse) arg1;
		VoteUser user=(VoteUser)request.getSession().getAttribute(SessionAttributeInfo.CurrUser);
		PrintWriter out = response.getWriter();
		System.out.println("没有过滤用户"+user);
		if(user==null||user.getVuUsername()== null){
			out.print("<script>"
					+ "$.messager.confirm('提示信息','登陆超时...',function(r){  "
					+ "	    if (r){  "
					+ "	       location.href='index.jsp'"  
					+ "	    }  "
					+ "	}); "
					+ "</script>");
			return;
		}
		arg2.doFilter(arg0, arg1);
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
