<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="bean.DB" %>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'deletestudent.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="styleg.css" >
  </head>
  
  <body>
   <%
   DB db=new DB();
String sql="delete from ordertable where orderid="+request.getParameter("orderid") ;
boolean i=db.executeUpdate(sql);
if(i){
	/* 
	sql="delete from tc where cid="+request.getParameter("cid") ;
	db.executeUpdate(sql);
	sql="delete from sc where cid="+request.getParameter("cid") ;
	db.executeUpdate(sql);
	sql="delete from shoucang where cid="+request.getParameter("cid") ;
	db.executeUpdate(sql);
	//级联删除 
	*/
	session.setAttribute("deletedingdan", "删除成功！");
}else{
	session.setAttribute("deletedingdan", "删除失败！");
}

if(session.getAttribute("deletedingdan")!=null)
    {
    
    //out.println(session.getAttribute("deletedingdan"));
    session.setAttribute("deletedingdan",null);
    
    String content="5;url=/wenq/jsp/admin/dingdan/mdMyOrder.jsp";
    response.setHeader("refresh",content);
    out.println("倒数5秒跳转管理界面");
    //response.sendRedirect("index.jsp");
    }


%>
  </body>
</html>
