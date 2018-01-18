/**
 * 
 */
package com.haven.backsys;

import org.junit.Test;

/**
 * @Description:TODO
 * @Company  郑州兴唐IT教育
 * @author 王滔
 * @email 675475017@qq.com
 * @date：2017年10月13日下午2:12:03
 */
public class StrTest {

	@Test
	public void testSTr(){
		String str = "test__XT__test__XT__wg";
		System.out.println("--------->" + str.split("__XT__").length);
	}
}
