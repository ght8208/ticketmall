<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'c_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/admin/style.css">
  	<style type="text/css">
  	.bt{
  	height:20px;
  	width:50px;
  	background-image:url(/wenq/images/admin/add/buttonbg.png);
  	font-size:14px; 
  	font-weight:bold; 
  	color:#fff;
  	cursor:pointer; 
  	}
  	</style>
  </head>
   <body>

	<div class="place">
    <span>λ�ã�</span>
    <ul class="placeul">
    <li><a href="#">��ҳ</a></li>
    <li><a href="#">����������Ϣ</a></li>
    </ul>
    </div>
    
    <div class="formbody">
    
    <div class="formtitle"><span>������Ϣ</span></div>
    <form action="Addxinwen" method="post"  name="form1" enctype="multipart/form-data">
		<table border="1" class="tablelist">

			<tr>
				<td height="40">���ű�ţ�</td>
				<td><input name="xid" type="text">
				</td>
			</tr>

			<tr>
				<td height="40">���ű��⣺</td>
				<td><input name="biaoti" type="text">
				</td>
			</tr>

			<tr>
				<td height="40">����ʱ�䣺</td>
				<td><input name="xdate" type="text">
				</td>
			</tr>
			<td height="40">���Ž��ܣ�</td>
			<td><textarea name="xintro" cols=40 rows=4></textarea>
			</td>
			</tr>
			<tr>
				<td height="40">���ű�ǩ��</td>
				<td><input name="xtag" type="text">
				</td>
			</tr>
			<tr>
				<td>����ͼƬ��</td>
				<td><input name="ximage" type="file">
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center"><input type="submit"
					name="Submit" class="bt" value="����"> <input type="reset"
					name="Submit2" class="bt" value="����"></td>
			</tr>
		</table>
	</form><br>
  </body>
</html>