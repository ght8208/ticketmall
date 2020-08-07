package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.GoodsBean;
import bean.GoodsBean1;

public class GetAllGoodsServlet1 extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		//��һ������ȡ�û��ύ��ҳ����Ϣ
		int pageNo=1;
		String strPageNo=request.getParameter("pageNo");
		if(strPageNo!=null){
			pageNo=Integer.parseInt(strPageNo);
		}
		
		//�ڶ���������GoodsBean
		GoodsBean1 g=new GoodsBean1();
		ArrayList goodslist=new ArrayList();
		goodslist=g.getGoodsByPage(pageNo);
		int pageCount=g.getPageCount();
		
		request.setAttribute("goodslist",goodslist);
		request.setAttribute("pageNo",pageNo);
		request.setAttribute("pageCount",pageCount);	
				
		String forward="/jsp/admin/jingdian/showjingdian.jsp";
		RequestDispatcher rd=request.getRequestDispatcher(forward);
		rd.forward(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}