<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="bean.DB" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/admin/style.css">
	<script language="JavaScript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>
  </head>
  
  <body>
  <div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">用户信息</a></li>
    <li><a href="#">基本内容</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
        
        
        <ul class="toolbar1">
        <li><span><img src="/wenq/images/admin/showmd/t05.png" /></span>设置</li>
        </ul>
    
    </div>
    
    
    <%
    if(session.getAttribute("username")!=null)
    {
    	DB db = new DB();
    	String sql ="select * from visitors";
    	ResultSet rs = db.executeQuery(sql);
    	int i =1;
    %>
   <table border="2" class="tablelist">
   <thead>
    <tr>
    <th >序号<i class="sort"><img src="/wenq/images/admin/tab/px.gif" /></i></th>
    <th >用户名</th>
    <th >性别</th>
    <th >邮件</th>
    <th >出生日期</th>
    <th >籍贯</th>
    <!-- <th >操作</th> -->
    </tr>
    </thead>
    <tbody>
    <%
    	while(rs.next())
    	{
    		String modifyurl = "modifyUser.jsp?id="+rs.getInt(1);
    		String deleteurl = "deleteUser.jsp?id="+rs.getInt(1);
    %>
  
    <tr>
    <td><%=i%></td>
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getString(3)%></td>
    <td><%=rs.getString(5)%></td>
    <td><%=rs.getString(7)%></td>
    <td><%=rs.getString(9)%></td>
    <%-- <td>
    	<a href="<%=modifyurl%>">修改</a>
    	<a href="<%=deleteurl%>">删除</a>
    </td> --%>
   
 <%
    		i++;
    		 
 
    	}
    	%>
    	 </tr>
    	</tbody>
    </table>
    <% 
    	if(session.getAttribute("msg")!=null){
    		out.println(session.getAttribute("msg"));
    		session.setAttribute("msg",null);
    		
    	}
    }
%>   
<%
	if(session.getAttribute("username")==null)
	{
%>
  		用户未登录
  		<a href="index.jsp">请重新输入</a>
<%
	}
%>



</div>
	<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

  </body>
</html>
