package com.jy.vote.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;


/**
 * Filter 的方式，不仅仅可以防御 XSS 攻击，还可以防御 CSRF 攻击，SQL 注入等安全问题。
 */
public class XssFilter implements Filter {
	 FilterConfig filterConfig = null;  
	
	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		 this.filterConfig = null;
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		 chain.doFilter(new XssHttpServletRequestWrapper((HttpServletRequest) request), response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		 this.filterConfig = fConfig;
	}

}
