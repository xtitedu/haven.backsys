/**
 * 
 */
package com.xt.haven.backsys.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Description:TODO
 * @Company  郑州兴唐IT教育
 * @author 王滔
 * @email 675475017@qq.com
 * @date：2017年10月13日下午12:44:06
 */
@WebServlet("/indexPage")
public class IndexPageServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1520418790508134896L;

	/**
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("views/index.jsp").forward(request, response);
	}
}
