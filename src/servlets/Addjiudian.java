package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DB;

import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;

public class Addjiudian extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Addjiudian() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

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

		HttpSession session =request.getSession();
		
		PreparedStatement pstmt=null;
		Connection conn=null;
		String ext="", url="upload/",info="",forward="";
		SmartUpload su=new SmartUpload();  //�����µ��ϴ�����
		long maxsize=2000*1024; //����ÿ���ϴ��ļ����Ϊ2000KB,2MB
		try{
		    su.initialize(this.getServletConfig(), request, response); //��ʼ��
		    su.setMaxFileSize(maxsize); //�����ϴ��ļ��Ĵ�С
		    su.setAllowedFilesList("jpg,JPG,gif,GIF"); //�趨�����ϴ��ĸ�ʽ
		    su.upload(); //�ϴ��ļ�
		    Request req=su.getRequest(); //����Request����
		    String jid=req.getParameter("jid");
		    String jname=req.getParameter("jname");
		    String jplace=req.getParameter("jplace");
		    String jpingfen=req.getParameter("jpingfen");
		    String jintro=req.getParameter("jintro");
		    String jprice=req.getParameter("jprice");
		    String jkm=req.getParameter("jkm");
		    //��ȡ�ϴ����ļ�����Ϊֻ�ϴ���һ���ļ������Կ�ֱ�ӻ�ȡ
		    com.jspsmart.upload.File myfile=su.getFiles().getFile(0);
		    if(!myfile.isMissing()){
			ext=myfile.getFileExt();  //ȡ����չ��
			Calendar cal=Calendar.getInstance();
			String filename=String.valueOf(cal.getTimeInMillis());
			String saveurl=request.getRealPath("/")+url;
			saveurl+=filename+"."+ext;  //saveurlΪ����ͼƬ�ľ���·��
			
			//���ô浽���ݿ��е�·��
			String jimage=url+filename+"."+ext;
			int cmark=0;
			String sql="insert into jiudian(jid,jname,jplace,jpingfen,jintro,jprice,jimage,jkm) values (?,?,?,?,?,?,?,?)";
			DB db=new DB();
			conn=db.createConn();
			conn.setAutoCommit(true);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,jid);
			pstmt.setString(2,jname);
			pstmt.setString(3,jplace);
			pstmt.setString(4,jpingfen);
			pstmt.setString(5,jintro);
			pstmt.setString(6,jprice);
			pstmt.setString(7,jimage);
			pstmt.setString(8,jkm);
			cmark=pstmt.executeUpdate();


			if(cmark==1){
				//���ļ����浽ָ��Ŀ¼��
				myfile.saveAs(saveurl,SmartUpload.SAVE_PHYSICAL); 
				info="���ӳɹ���";
				session.setAttribute("adminfo",info);
				forward="/jsp/admin/admain.jsp";
				System.out.println("���ӳɹ���");
			}else{
				info="����ʧ�ܣ�";
				session.setAttribute("adminfo",info);
				forward="/jsp/admin/jingdian/addview.jsp";
				System.out.println("����ʧ�ܣ�");
			}

			}else{
				info="��ѡ��Ҫ�ϴ����ļ���";
				session.setAttribute("adminfo",info);
				forward="/jsp/admin/jingdian/addview.jsp";
				System.out.println("��ѡ��Ҫ�ϴ����ļ���");
			}
		}
		    
		    catch(Exception e){
		    	e.printStackTrace();
		    	info="�����쳣��";
		    	session.setAttribute("adminfo",info);
		    	forward="/jsp/admin/jingdian/addview.jsp";
		    	System.out.println("�����쳣��");
		    }finally{
		    	try {pstmt.close();}catch(Exception e){}
		    	try {conn.close();}catch(Exception e){}
		    }
		    request.setAttribute("info",info);
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

		doGet(request,response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}