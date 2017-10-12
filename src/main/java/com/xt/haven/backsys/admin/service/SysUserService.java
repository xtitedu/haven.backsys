/**
 * 
 */
package com.xt.haven.backsys.admin.service;

import com.xt.haven.backsys.admin.entity.SysUser;

/**
 * @Description:系统用户服务层代码
 * @Company  郑州兴唐IT教育
 * @author 王滔
 * @email 675475017@qq.com
 * @date：2017年8月24日上午10:50:07
 */
public interface SysUserService {

	public SysUser getSysUserInfoByUserName(String userName);
}
