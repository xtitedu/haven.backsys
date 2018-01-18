/**
 * 
 */
package com.xt.haven.backsys.admin.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.xt.haven.backsys.admin.service.SysUserService;
import com.xt.haven.backsys.common.entity.ResMsg;
import com.xt.haven.backsys.common.servlet.BaseServlet;
import com.xt.haven.backsys.common.util.Constance;

/**
 * @Description:系统后台登陆操作
 * @Company  郑州兴唐IT教育
 * @author 王滔
 * @email 675475017@qq.com
 * @date：2017年8月19日下午2:47:09
 */
@WebServlet("/sysUser.action")
public class SysUserServlet extends BaseServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7569256974725606230L;

	private SysUserService suService;
	
	public void doLogin(HttpServletRequest request, HttpServletResponse response) throws IOException{
		System.out.println("asdfjasdfjs-------------------------->");
		response.setContentType("text/html; charset=UTF-8");
		
		String[] keyData = request.getParameter("KEYDATA").split("__XT__");
		String userName = keyData[0];
		String passwd = keyData[1];
		ResMsg rm = new ResMsg();
		if(keyData[1].equals(request.getSession().getAttribute(Constance.VER_CODE))){
			rm.setCode("0");
			rm.setMsg("验证码错误！");
		}else{
			rm.setCode("1");
		}
		
//		SysUser su = suService.getSysUserInfoByUserName(userName);
		response.getWriter().print(new Gson().toJson(rm));
	}
	
}
