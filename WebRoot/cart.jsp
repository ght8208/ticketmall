<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="bean.DB" %>
<%@ page import="bean.Tools" %>
<%@page import="java.sql.*"%>
<%
    request.setCharacterEncoding("gbk");
    response.setCharacterEncoding("gbk");
    
    
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <base href="<%=basePath%>">
    <title>My JSP 'cart.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/main/bootstrap.css" rel="stylesheet" />
    <link href="css/main/style.css" rel="stylesheet" />
    
	<script src="js/jquery-1.11.1.js"></script>
    <script src="js/zhuye/bootstrap.js"></script>
    <script type="text/javascript">
        $('#vcode_img').click(function  () {
            $(this).attr('src',  $(this).data('src')+'?'+ Math.random());
        });
    </script>
  <script type="text/javascript">
	function init(){
		alert("${info}");
	}

/*     <c:if test="${!empty info}">
	window.onload = init;
	</c:if>  */

	</script>

  </head>
  
  <body>
  
  <div id="sitebar">
        <div class="container">
            <div class="row h30 lh30 f12">
            	<!-- 左侧登陆开始 -->
                <div class="col-lg-6">
                    <a href="javascript:;" class="bootmark" rel="nofollow"><i class="icon-main icon-collect mt8 mr5"></i>收藏网站</a>
                    <span class="bar-link">
						<%if(session.getAttribute("username")!=null) {
							if(session.getAttribute("username").equals("admin"))
							{%>
							<a href="/wenq/jsp/admin/admain.jsp"><img src="./images/user.png" class="userimg"></a>
							<%}
							else
							{%>
							<a href="/wenq/jsp/visitors/ownfunction.jsp"><img src="./images/user.png" class="userimg"></a>
							<%}
						}
						%>
					</span>
                    <span class="bar-link">
                        <%if(session.getAttribute("username")==null) {%>
                        	<span>您好，欢迎您光临就是旅游网！请</span>
							<a href="jsp/loginregist/MyJsp.jsp" >登录</a>
							<span>|</span>
							<a href="jsp/loginregist/regist-1.jsp">注册</a>
							<%}
							else if(session.getAttribute("username").equals("admin")){
								out.print("<a href='/wenq/jsp/admin/admain.jsp'>");
								out.print("欢迎管理员，");
								out.print(session.getAttribute("username"));
								out.print("</a>");
								out.print("<a href='jsp/loginregist/logout.jsp'>");
								out.print("退出");
								out.print("</a>");
							}
							else{
								out.print("<a href='/wenq/jsp/visitors/ownfunction.jsp'>");
								out.print(session.getAttribute("username"));
								out.print("</a>");
								out.print("<a href='jsp/loginregist/logout.jsp'>");
								out.print(",退出");
								out.print("</a>");
								}
							 %>
                    </span>
                </div>
                <!-- 左侧登陆结束 -->
                
                <!-- 右侧服务栏开始 -->
                <div class="col-lg-6">
                    <ul class="pull-right bar-link">
                        <li><a href="/member/order.aspx">我的订单</a> | </li>
                        <li><a href="http://wpa.qq.com/msgrd?v=3&amp;uin=27102514&amp;site=qq&amp;menu=yes">客服服务</a> | </li>
                        <li><a href="sitemap.aspx">网站导航</a> |&nbsp;&nbsp;&nbsp;&nbsp;</li>
                        <li class="tel-num"><i class="icon-main icon-tel mt8 mr5"></i>8888-111-666</li>
                    </ul>
                </div>
                <!-- 右侧服务栏结束-->
            </div>
        </div>
    </div>
    <!-- sitebar -->
    
    <!-- header开始 -->
    <div id="header">
        <div class="container">
            <div class="row search">
            	<!-- 左侧栏logo区开始-->
                <div class="col-lg-4">
                    <h1 class="logo"><a href="/">
                        <img src="/wenq/images/logo.png" alt="旅游" class="log"/></a><img src="#" alt="让每个人都满意！" />
                    </h1>
                </div>
                <!-- 左侧栏logo区结束-->
                
                <!-- 中间栏搜索区开始-->
                <div class="col-lg-5">
                    <form action="search.aspx" method="get">
                        <label for="txt_search" class="hidden">搜索门票 分类/品牌/商品</label>
                        <input id="txt_search" type="text" name="q" accesskey="s" autocomplete="off" autofocus="true" x-webkit-speech="" x-webkit-grammar="builtin:translate" class="s-combobox-input" role="combobox" aria-haspopup="true" title="请输入搜索文字" aria-label="请输入搜索文字">
                        <button id="btn_search" type="submit">搜索</button>
                    </form>
                </div>
                <!-- 中间栏搜索区结束-->
                
                <!-- 右侧栏购物区开始-->
                <div class="col-lg-3">
                    <div id="my_account" class="btn-group mt30 ml50 ">
                        <button type="button" class="btn btn-radius-none btn-default dropdown-toggle f12" data-toggle="dropdown">我的账户 <span class="caret"></span></button>
                        <!--登录之前-->
                        <!--  -->
                        <!--登录之后-->
                        
                        	<%
                        	if(session.getAttribute("username")!=null)
                        	{ 
                        	%>
                        	<ul class="dropdown-menu p10 f12" style="width: 240px;" role="menu">
                        		<li>
                                <div class="box-title fb"><span class="pull-right"><a href="/member/" class="blue-font">回到首页</a></span><%=session.getAttribute("username").toString() %></div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="box-title">最新订单状态：<span><a href="/member/order.aspx">查看所有订单</a></span></div>
                            </li>
                            <li class="divider"></li>
                            <li><a href="/member/order.aspx?status=0">待处理订单<i class="gray-font">(0)</i></a></li>
                            <li><a href="/member/order.aspx?status=1">待处理订单<i class="gray-font">(1)</i></a></li>
                            <li><a href="/member/order.aspx?status=2">待处理订单<i class="gray-font">(2)</i></a></li>
                            <li><a href="/member/order.aspx?status=3">待处理订单<i class="gray-font">(3)</i></a></li>
                            </ul>
                        	<%
                        	}
                        	else
                        	{ 
                        	%>

							<ul class="dropdown-menu p10 f12" role="menu">
								<li><a href="/wenq/jsp/loginregist/MyJsp.jsp"
									class="btn btn-warning btn-block">立即登录</a>新客户？<a
									class="blue-font" href="/wenq/jsp/loginregist/regist-1.jsp">免费注册</a>
								</li>
								<li class="divider"></li>
								<li><a href="/member/">我的账户</a>
								</li>
								<li><a href="/member/order.aspx">我的订单</a>
								</li>
								<li><a href="#">评论已购商品</a>
								</li>
								<li><a href="#">为我推荐</a>
								</li>
							</ul>
							<%
								}
							%>
                            
                        
                    </div>
                    <div id="mini_cart" class="btn-group mt30 ml15">
                        <a href="/wenq/jsp/zhuye/menpiao/cart.jsp" class="btn btn-radius-none btn-default dropdown-toggle f12" data-toggle="dropdown">
                            <i class="icon-main icon-cart ilb"></i>去购物车结算 <span class="caret"></span>
                        </a>
                        <!--购物车为空-->
                        <!--<ul class="dropdown-box" role="menu">
                            <li><i class="icon-main icon-mini-cart ilb"></i>购物车中还没有商品，赶紧选购吧！</li>
                        </ul>-->
                        <!--购物车有商品-->
                        <ul class="dropdown-box" role="menu">
                            <li>
                                <div class="box-title fb p10">最新加入的商品</div>
                                <div class="box-content ">
                                    <ul class="box-list">
                                        <li>
                                            <div class="pull-left product-info">
                                                <img class="pull-left" alt="" src="" />
                                                <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                                            </div>
                                            <div class="pull-right price-info">
                                                <b class="red-font">￥779.00</b>×1<br>
                                                <span class="blue-font pull-right"><a href="">删除</a></span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="pull-left product-info">
                                                <img class="pull-left" alt="" src="" />
                                                <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                                            </div>
                                            <div class="pull-right price-info ">
                                                <b class="red-font">￥779.00</b>×1<br>
                                                <span class="blue-font pull-right"><a href="">删除</a></span>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="pull-left product-info">
                                                <img class="pull-left" alt="" src="" />
                                                <div class="summary"><a href="">【五折】自然素材 蜜桃芒果味果冻 255g 台湾地区进口</a></div>
                                            </div>
                                            <div class="pull-right price-info">
                                                <b class="red-font">￥779.00</b>×1<br>
                                                <span class="blue-font pull-right"><a href="">删除</a></span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="box-settlement tr">
                                    共 <b class="red-font">3</b> 件商品&nbsp;&nbsp;共计<b class="red-font f16">￥ 2008.00</b>
                                    <a href="/wenq/jsp/zhuye/menpiao/cart.jsp" class="btn btn-danger">去购物车结算</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            	<!-- 右侧栏购物区结束-->
            	
            </div>
            <div class="navbar navbar-red" role="navigation">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- dropdown open 和 dropdown hover-toggle -->
                    <div id="menu" class=" dropdown hover-toggle">
                        <a class="navbar-brand dropdown-toggle" href="#">全部功能分类 <b class="caret"></b></a>
                        <!--data-toggle="dropdown"-->
                        <div class="clearfix"></div>
                        <ul id="categories" class="dropdown-menu">
                            <li>
                            	<%
							    	DB db = new DB();
							    	
							    %>
							    <% String hr1= "/wenq/list.jsp?tehuiyou=1";%>
                                <a href="<%=hr1%>"><i class="icon-main icon-0"></i>特惠游</a>
                                <ul class="sub-item">
                                    <li><%
									    	String sql ="select distinct thname from tehuiyou";
									    	ResultSet rs = db.executeQuery(sql);
									    	int i =1;
									    %> 
									    <a href="#">特惠游名称</a>
										<ul class="sub-item">
											<%
										    	while(rs.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?thname="+rs.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
											<li><a href="<%=modifyurl%>"><%=rs.getString(1)%></a>
											</li>
										<%
    		                                   i++;
    		                                  }
                                         %>
    	
    	
										</ul></li>
                                    <li>
                                    	<%
									    	String sql1 ="select distinct thplace from tehuiyou";
									    	ResultSet rs1 = db.executeQuery(sql1);
									    	
									    %>
                                        <a href="#">特惠游位置</a>
                                        <ul class="sub-item">
                                        	<%
										    	while(rs1.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?thplace="+rs1.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs1.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql2 ="select distinct thpingfen from tehuiyou";
									    	ResultSet rs2 = db.executeQuery(sql2);
									    	
									    %>
                                        <a href="#">特惠游评分</a>
                                        <ul class="sub-item">
                                        	<%
										    	while(rs2.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?thpingfen="+rs2.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs2.getString(1)%>.0</a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql3 ="select distinct thprice from tehuiyou";
									    	ResultSet rs3 = db.executeQuery(sql3);
									    	
									    %>
                                        <a href="#">特惠游价格</a>
                                        <ul class="sub-item">
                                            <%
										    	while(rs3.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?thprice="+rs3.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>">￥<%=rs3.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql4 ="select distinct thjifendh from tehuiyou";
									    	ResultSet rs4 = db.executeQuery(sql4);
									    	
									    %>
                                        <a href="#">特惠游抵扣</a>
                                        <ul class="sub-item">
                                            <%
										    	while(rs4.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?thjifendh="+rs4.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs4.getString(1)%>分</a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    
                                </ul>
                            </li>
                            <li>
                            	
								<% String hr2= "/wenq/list.jsp?menpiao=1";%>
                                <a href="<%=hr2%>"><i class="icon-main icon-1"></i>门票</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql5 ="select distinct name from goods";
									    	ResultSet rs5 = db.executeQuery(sql5);
									    	
									    %>
                                        <a href="#">门票名称</a>
                                        <ul class="sub-item">
                                            <%
										    	while(rs5.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?name="+rs5.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs5.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql6 ="select distinct price from goods";
									    	ResultSet rs6 = db.executeQuery(sql6);
									    	
									    %>
                                        <a href="#">门票价格</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs6.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?price="+rs6.getFloat(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>">￥<%=rs6.getFloat(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    
                                    
                                </ul>
                            </li>
                            <li>
                            	<% String hr3= "/wenq/list.jsp?jiudian=1";%>
                                <a href="<%=hr3%>"><i class="icon-main icon-2"></i>酒店</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql7 ="select distinct jname from jiudian";
									    	ResultSet rs7 = db.executeQuery(sql7);
									    	
									    %>
                                        <a href="#">酒店名称</a>
                                        <ul class="sub-item">
                                            <%
										    	while(rs7.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?jname="+rs7.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs7.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql8="select distinct jplace from jiudian";
									    	ResultSet rs8= db.executeQuery(sql8);
									    	
									    %>
                                        <a href="#">酒店位置</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs8.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?jplace="+rs8.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs8.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql9="select distinct jpingfen from jiudian";
									    	ResultSet rs9= db.executeQuery(sql9);
									    	
									    %>
                                        <a href="#">酒店评分</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs9.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?jpingfen="+rs9.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs9.getString(1)%>.0</a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql10="select distinct jprice from jiudian";
									    	ResultSet rs10= db.executeQuery(sql10);
									    	
									    %>
                                        <a href="#">酒店价格</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs10.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?jprice="+rs10.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>">￥<%=rs10.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql11="select distinct jkm from jiudian";
									    	ResultSet rs11= db.executeQuery(sql11);
									    	
									    %>
                                        <a href="#">酒店距离</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs11.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?jkm="+rs11.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs11.getString(1)%>km</a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    
                                </ul>
                            </li>
                            <li>
                            	<% String hr4= "/wenq/list.jsp?place=1";%>
                                <a href="<%=hr4%>"><i class="icon-main icon-8"></i>景点</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql12="select distinct vname from place";
									    	ResultSet rs12= db.executeQuery(sql12);
									    	
									    %>
                                        <a href="#">景点名称</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs12.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?vname="+rs12.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs12.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql13="select distinct vplace from place";
									    	ResultSet rs13= db.executeQuery(sql13);
									    	
									    %>
                                        <a href="#">景区位置</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs13.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?vplace="+rs13.getString(1);
										    		
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs13.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql14="select distinct vfamous from place";
									    	ResultSet rs14= db.executeQuery(sql14);
									    	
									    %>
                                        <a href="#">景区人气</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs14.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?vfamous="+rs14.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs14.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    
                                    
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="icon-main icon-5"></i>新闻</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql15="select distinct xdate from xinwen";
									    	ResultSet rs15= db.executeQuery(sql15);
									    	
									    %>
                                        <a href="#">新闻日期</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs15.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?xdate="+rs15.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs15.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql16="select distinct xtag from xinwen";
									    	ResultSet rs16= db.executeQuery(sql16);
									    	
									    %>
                                        <a href="#">新闻标签</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs16.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?xtag="+rs16.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs16.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="icon-main icon-4"></i>订单</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql17="select distinct paymode from ordertable";
									    	ResultSet rs17= db.executeQuery(sql17);
									    	
									    %>
                                        <a href="#">支付方式</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs17.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?paymode="+rs17.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs17.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            
                            <li>
                                <a href="#"><i class="icon-main icon-7"></i>论坛板块</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql18="select distinct ltbkname from ltbankuai";
									    	ResultSet rs18= db.executeQuery(sql18);
									    	
									    %>
                                        <a href="#">板块名称</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs18.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?ltbkname="+rs18.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs18.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="icon-main icon-3"></i>论坛帖子</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql19="select distinct lttzname from lttiezi";
									    	ResultSet rs19= db.executeQuery(sql19);
									    	
									    %>
                                        <a href="#">帖子名称</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs19.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?lttzname="+rs19.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs19.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                    <li>
                                    	<%
									    	String sql20="select distinct lttzjing from lttiezi";
									    	ResultSet rs20= db.executeQuery(sql20);
									    	
									    %>
                                        <a href="#">帖子精品</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs20.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?lttzjing="+rs20.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs20.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="icon-main icon-10"></i>论坛留言</a>
                                <ul class="sub-item">
                                    <li>
                                    	<%
									    	String sql21="select distinct ltlyname from ltliuyan";
									    	ResultSet rs21= db.executeQuery(sql21);
									    	
									    %>
                                        <a href="#">留言名称</a>
                                        <ul class="sub-item">
                                           <%
										    	while(rs21.next())
										    	{
										    		String modifyurl = "/wenq/list.jsp?ltlyname="+rs21.getString(1);
										    		/* String deleteurl = "deleteUser.jsp?thid="+rs.getInt(1); */
										    %>
                                            <li><a href="<%=modifyurl%>"><%=rs21.getString(1)%></a></li>
                                            <%
    		                                   
    		                                  }
                                         %>
                                        </ul>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <a href="#"><i class="icon-main icon-9"></i>关于我们</a>
                                <ul class="sub-item">
                                    <li><a href="#">帮助</a></li>
                                    <li><a href="#">关于</a></li>
                                    <li><a href="#">设置</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav f14">
                        <li ><a href="/wenq/main.jsp">首页</a></li>
                        <% String hr5= "/wenq/list.jsp?tehuiyou=1";%><li class="active"><a href="<%=hr5%>" >特惠游</a></li>
                        <% String hr6= "/wenq/list.jsp?place=1";%><li><a href="<%=hr6%>">景区</a></li>
                        <% String hr7= "/wenq/list.jsp?menpiao=1";%><li><a href="<%=hr7%>">门票</a></li>
                        <li><a href="#">地图</a></li>
                        <li><a href="#">优惠券</a></li>
                        <!--<li class="dropdown"> <a href="#">Dropdown </a> </li>-->
                    </ul>
                    <!--<ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="./">Default</a></li>
                        <li><a href="../navbar-static-top/">Static top</a></li>
                        <li><a href="../navbar-fixed-top/">Fixed top</a></li>
                    </ul>-->
                </div>
                <!--/.nav-collapse -->
            </div>
        </div>
    </div>
    <!--/#header-->
  
<%--   <c:if test="${!empty info}">
	window.onload = init;
  </c:if> --%>
  
  <c:if test="${!empty cart}">
  <p></p>
  <p></p>
	       <h1 align="center">购物车的信息</h1>
	       
	    <hr>
	    
	  <p></p>
	  <!-- 购物车开始 -->
	  <div class="row">
	  <!-- 框架开始 -->
	  <div class="col-lg-12">
	  <div class="cart-title f16 tit-family pl10 mt10">我的购物车</div>
	  <!-- 表格开始 -->
	  <div class="cart-content">
	  <table border="0" width="100%">
	  	<tbody>
	  	
	  	<tr>
	  	<td width="5%" class="tr-title">
             <form>
                <div class="checkbox">
                 <label>
                 <input type="checkbox" />全选</label>
                 </div>
             </form>
         </td>
	  	
	  	<td width="12%" class="tr-title">物品编号</td>
	  	<td width="45%" class="tr-title">物品名称</td>
	  	<td width="12%" class="tr-title">物品价格</td>
	  	<td width="12%" class="tr-title">数量</td>
	  	<td width="14%" class="tr-title">操作</td>
	  	</tr>
	  	
	  	
	  	<c:forEach items="${cart}" var="item">
	  	<form action="ProcessCart" >
	  	<input type="hidden" name="cid" value="${item.goods.id }" />
		  <tr>
		  	  <td width="5%" class="tr-title">
		             <form>
		                <div class="checkbox">
		                 <label>
		                 <input type="checkbox" />全选</label>
		                 </div>
		             </form>
              </td>
			  <td class="tr-list">${item.goods.id}</td>
			  <td class="tr-list">${item.goods.name}</td>
			  <td class="tr-list"><b class="orange-font">￥${item.goods.price}</b></td>
			  <td class="tr-list">
			  <span class="ui-spinner">
			  <input name="quantity" type="text" value="${item.quantity}" size="5" /></td>
			  <a class="ui-spinner-button ui-spinner-up" tabindex="-1"><span class="ui-icon">▲</span></a>
              <a class="ui-spinner-button ui-spinner-down" tabindex="-1"><span class="ui-icon">▼</span></a>
			  </span>
			  <td>
<!-- 			<input type="submit" name="action" value="修改" /> -->
			  <input type="submit" name="action" class="tr-list bule-font" value="删除" />
			  </td>	 
		  </tr>	 
		 </form> 
	  	</c:forEach> 
	  	</tbody> 
	  </table>
	  </div>
	  <!-- 表格结束 -->
	  </div>
	  <!-- 框架结束 -->
	  </div>
	  <!-- 购物车结束 -->
	  <!-- 按钮开始 -->
	  <div class="pull-right">
	  		<a href="GetAllGoodsServlet">
          <button type="button" class="btn btn-addcart btn-lg mr20">继续购物</button>
           </a>
           <a href="buyinfo.jsp">
           <button type="button" class="btn btn-danger btn-lg mr20">去结算</button>
           </a>
           <a href="clearCart.jsp">
           <button type="button" class="btn btn-danger btn-lg mr20">清空购物车</button>
      		</a>
      </div>
	  <!-- 按钮结束 -->
	  </div>
	  
	  
  </c:if>
  
  
  <c:if test="${empty cart}">
  	<div class="row">
  	<div class="col-lg-12">
                <div class="cart-title f16 tit-family pl10 mt10">我的购物车</div>
                <div class="cart-content p30">
                    <div class="pull-left empty-img"><img alt="" src="/wenq/images/zhuye/advertise/empty-cart.jpg" /></div>
                    <div class="pull-right empty-text tit-family">
                        您的购物车中还没有商品，您现在可以<br />
                        <b class="f14">马上去 <i><a href="GetAllGoodsServlet">您尚未选购任何产品，请点击此处选购</a></i>， 或者查查 <i><a href="">我的订单</a></i></b>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
  	
  	
  	
  	</div>
  
  </c:if>



<div class="row mt20">
            <div class="col-lg-12">
                <ul class="listbar-5">
                    <li><i class="icon-main icon-intr-1 ilb ml31"></i>
                        <p class="tc gray-font">
                            正品保证<br>
                            假1赔10
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-2 ilb ml31"></i>
                        <p class="tc gray-font">
                            质优价廉<br>
                            买贵就赔
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-3 ilb ml31"></i>
                        <p class="tc gray-font">
                            7天保障<br>
                            无理由退换
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-4 ilb ml31"></i>
                        <p class="tc gray-font">
                            满100元<br>
                            免运费
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-5 ilb ml31"></i>
                        <p class="tc gray-font">
                            100优惠宝<br>
                            =1元
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-6 ilb ml31"></i>
                        <p class="tc gray-font">
                            24小时<br>
                            闪电发货
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-7 ilb ml31"></i>
                        <p class="tc gray-font">
                            7x24小时<br>
                            在线客服
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-8 ilb ml31"></i>
                        <p class="tc gray-font">
                            支持多种<br>
                            支付方式
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-9 ilb ml31"></i>
                        <p class="tc gray-font">
                            开箱验货<br>
                            放心付款
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-10 ilb ml31"></i>
                        <p class="tc gray-font">
                            晒单奖励<br>
                            评论奖励
                        </p>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row mt10">
            <div class="col-lg-12 help-center">
                <ul class="help-list">
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-1 pull-left"></i>关于我们</li>
                            <li class="ontext"><a href="#">关于传智</a></li>
                            <li class="ontext"><a href="#">联系我们</a></li>
                            <li class="ontext"><a href="#">加入我们</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-2 pull-left"></i>购物指南</li>
                            <li class="ontext"><a href="#">购物流程</a></li>
                            <li class="ontext"><a href="#">服务协议</a></li>
                            <li class="ontext"><a href="#">优惠券说明</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-3 pull-left"></i>支付方式</li>
                            <li class="ontext"><a href="#">银联支付</a></li>
                            <li class="ontext"><a href="#">快钱支付</a></li>
                            <li class="ontext"><a href="#">支付宝支付</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-4 pull-left"></i>配送方式</li>
                            <li class="ontext"><a href="#">运费说明</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-5 pull-left"></i>售后服务</li>
                            <li class="ontext"><a href="#">退换货政策</a></li>
                            <li class="ontext"><a href="#">退换货流程</a></li>
                            <li class="ontext"><a href="#">退换货申请</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-6 pull-left"></i>帮助信息</li>
                            <li class="ontext"><a href="#">常见问题</a></li>
                            <li class="ontext"><a href="#">投诉建议</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <footer>
        <div class="container">
            <p class="tc lh200">
                <a href="#">关于我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">网络联盟</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">商家入驻</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">网络招聘</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">广告服务</a>&nbsp;&nbsp;|
                <br />
                互联网出版许可证编号新出网证 <a href="http://www.miibeian.gov.cn/" target="_blank" rel="external nofollow">你妹的备案</a> <br>
                京公网安备88888888888888号
            </p>
        </div>
    </footer>




  </body>
</html>

