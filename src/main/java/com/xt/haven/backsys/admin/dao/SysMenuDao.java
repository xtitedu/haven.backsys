/**
 * 
 */
package com.xt.haven.backsys.admin.dao;

import java.util.LinkedList;
import java.util.List;

import com.xt.haven.backsys.admin.entity.SysMenu;

/**
 * @Description:系统菜单数据库操作对象
 * @Company  郑州兴唐IT教育
 * @author 王滔
 * @email 675475017@qq.com
 * @date：2017年10月13日下午3:54:41
 */
public class SysMenuDao {

	public List<SysMenu> getAllSysMenu(){
		
		List<SysMenu> menuList = new LinkedList<SysMenu>();
		String sql = "select * from SYS_MENU where PARENT_ID = '0' and STATUS = 1 order by MENU_ORDER";
		
		return null;
	}
	
}
