package t_controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adventour.g_getset;
import getset.guide_gs;
import t_mybatis.t_g_sel_con;

public class t_g_db_sel implements t_con_interface {
	
	static t_g_db_sel g_sel = new t_g_db_sel ();
	public static t_g_db_sel g_select() {
        return g_sel;
    }

	@Override
	public String t_interf(HttpServletRequest rq, HttpServletResponse rs) throws Exception {
		t_g_sel_con ts = t_g_sel_con.instance();
		List<guide_gs> list = ts.g_sel();
		rq.setAttribute("list", list);
		return null;
	}
	
	
}
