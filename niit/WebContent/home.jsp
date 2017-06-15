<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.blog.DAO.LogDao"%>   
<%@ page import="com.blog.PO.LogPo"%>
<%@ page import="com.blog.DAO.FollowDao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<script src="http://cdn.bootcss.com/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript" src="js/mootools.js"></script>
<script type="text/javascript" src="js/site.js"></script>
<meta charset="gb2312">
<title>Home</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<!--<link href="css/index.css" rel="stylesheet">
<link href="css/base.css" rel="stylesheet">-->
<!-- Bootstrap styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
   
    <!-- Font-Awesome -->
    <link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">

    <!-- Google Webfonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600|PT+Serif:400,400italic' rel='stylesheet' type='text/css'>

    <!-- Styles -->
    <link rel="stylesheet" href="css/style.css" id="theme-styles">

    <!--[if lt IE 9]>      
        <script src="js/respond.js"></script>
    <![endif]-->
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>

<body>
	<%
	String username=(String)session.getAttribute("user");
	String ownername="";
	if(request.getParameter("Name")!=null)
	ownername=request.getParameter("Name").split("\\.")[0];
	String logtype=request.getParameter("logtype");
	%>
<header>
  <div class="widewrapper masthead">
    <div class="container">
     <a href="showIndex.do">
        <img src="img/niitlogo.png" width="100">
     </a>
     <!--<div id="mobile-nav-toggle" class="pull-right">
                    <a href="#" data-toggle="collapse" data-target=".clean-nav .navbar-collapse">
                        <i class="fa fa-bars"></i>
                    </a>
                </div>-->
    <c:if test="${user==param.Name&&user!=null&&user!='admin'}">
    <div style='color:black ;font-size: 25px'>
    	Welcome,   ${user}
    </div>
    </c:if>
    <c:if test="${param.Name!=null&&user!=param.Name}">
    <div style='color:black ;font-size: 25px'>
    	<%=ownername%>的博客
    </div>
    </c:if>
    <c:if test="${user=='admin'&&param.Name==user}">
    <div style='color:red ;font-size: 35px'>
    	管理员页面
    </div>
    </c:if>
  <nav class="pull-right clean-nav">
     <div class="collapse navbar-collapse">
     <ul class="nav nav-pills navbar-nav">
      <li><a href="showIndex.do">首页</a></li>
      <c:if test="${user!='admin'}">
      <c:if test="${user==param.Name&&user!=null}">
      <li><a href="/niit/profile.do?q=q&Name=${param.Name}">关于我</a></li>
      <li><a href="addArticle.jsp">写博客</a></li>
      <li><a href="showFollow.do">我的关注</a></li>
      <li><a href="showFollower.do">我的粉丝</a></li>
      </c:if>
      <c:if test="${param.Name!=null}">
      <c:if test="${user!=null&&user!=param.Name}">
	  <li><a href="/niit/listArticle.do?q=q&Name=${user}">我的博客</a></li>  
      </c:if>
      <li><a href="/niit/getMessageList.do?q=q&Name=${param.Name}">留言板</a></li>
      </c:if>
      	<%
		FollowDao followDao=new FollowDao();
		Boolean ifFollow=followDao.IfFollow(username,ownername);
		//out.println(ifFollow);
		//out.println(username+"分开"+ownername);
		if(ifFollow==true)out.println("<li><a href=''>已关注</a></li>");
		else if(ifFollow==false&&username!=null&&!username.equals(ownername)&&ownername!="")out.println("<li><a href='follow.do?q=q&Name="+ownername+"'>关注TA</a></li>");
		%>
		</c:if>
		<c:if test="${user=='admin'&&param.Name=='admin'}">
		<li><a href="/niit/listArticle.do?q=q&Name=${user}">管理博文</a></li>  
		<li><a href="manageUser.do">管理用户</a></li>
		<li><a href="SQLrequest.jsp">数据库操作</a></li>   
		</c:if>
		<c:if test="${user=='admin'&&param.Name!='admin'}">
		<li><a href="/niit/listArticle.do?q=q&Name=${user}">返回管理员首页</a></li> 
		<c:if test="${param.Name!=null }" >
		<li><a href="/niit/servlet/DeleteUser?Name=${param.Name}">删除该用户</a></li>  
		<li><a href="/niit/getMessageList.do?q=q&Name=${param.Name}">留言板</a></li>
		</c:if>
		</c:if>
      </ul>
      </div>
   </nav>
   </div>
  </div>
  <div class="widewrapper subheader">
            <div class="container">
                <div class="clean-breadcrumb">
                    <a><%if(logtype==null)out.println("全部文章");else out.println(logtype); %></a>
                </div>
            </div>
        </div>
</header>
<div class="widewrapper main">
        <div class="container">
            <div class="row">
   <div style=" height:1000px; width:200 px; overflow-x:hidden;overflow-y:auto" class="col-md-8 blog-main" >
    <c:forEach items="${list}" var="item">
    	<c:if test="${param.logtype==null}">
    		<h3>${item.title}</h3>
    		<ul>
    			<div style="width:600 px;height: 140px;overflow:hidden">${item.content}</div>
    			<a href="ShowSingleLog.do?logID=${item.ID}">阅读全文>></a>
    		</ul>
    		<p class='dateview'><span>${item.date}</span><a href="/niit/listArticle.do?q=q&Name=${item.username}"><span> 作者：${item.username}</span></a><span> 分类：${item.type}</span></p>
    	</c:if>
    	<c:if test="${param.logtype!=null && param.logtype eq item.type}">
    		<h3>${item.title}</h3>
    		<ul>
    			<div style="width:600 px;height: 140px;overflow:hidden">${item.content}</div>
    			<a href="ShowSingleLog.do?logID=${item.ID}">阅读全文>></a>
    		</ul>
    		<p class='dateview'><span>${item.date}</span><span> 作者：${item.username}</span><span> 分类：${item.type}</span></p>
    	</c:if>
    </c:forEach>
          
      <%/*
		LogDao logDao=new LogDao();
		ArrayList<LogPo> list = logDao.GetLogbyUser(ownername);
		//ArrayList<LogPo> list = logDao.GetLogbyUser(ownername);
		Iterator it1 = list.iterator();
		while(it1.hasNext()){
		LogPo log=(LogPo)it1.next();
		if(logtype!=null&&log.getType().equals((String)logtype))
		out.println("<h3>"+log.getTitle()+"</h3><ul><p>"+log.getContent()+"</p><a href='ShowSingleLog.do?logID="+log.getID()+"'>阅读全文>></a></ul><p class='dateview'><span>"+log.getDate()+"</span><span> 作者："+log.getUsername()+"</span><span> 分类："+log.getType()+"</span></p>");
		else if(logtype==null)
		out.println("<h3>"+log.getTitle()+"</h3><ul><p>"+log.getContent()+"</p><a>阅读全文>></a></ul><p class='dateview'><span>"+log.getDate()+"</span><span> 作者："+log.getUsername()+"</span><span> 分类："+log.getType()+"</span></p>");
		}*/
	%>
  </div>                                                             
   <aside class="col-md-4 blog-aside">
            <div class="aside-widget">
                        <header>
                            <h3>天气</h3>
                        </header>
                       <iframe width="250" scrolling="no" height="60" frameborder="0" allowtransparency="true" src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=1"></iframe>
              </div>
    <!--<div class="news">
    <h3>
      <p>最新<span>文章</span></p>
    </h3>
    <ul class="rank">
      <li><a href="/" title="Column 三栏布局 个人网站模板" target="_blank">Column 三栏布局 个人网站模板</a></li>
      <li><a href="/" title="with love for you 个人网站模板" target="_blank">with love for you 个人网站模板</a></li>
      <li><a href="/" title="免费收录网站搜索引擎登录口大全" target="_blank">免费收录网站搜索引擎登录口大全</a></li>
      <li><a href="/" title="做网站到底需要什么?" target="_blank">做网站到底需要什么?</a></li>
      <li><a href="/" title="企业做网站具体流程步骤" target="_blank">企业做网站具体流程步骤</a></li>
      <li><a href="/" title="建站流程篇――教你如何快速学会做网站" target="_blank">建站流程篇――教你如何快速学会做网站</a></li>
      <li><a href="/" title="box-shadow 阴影右下脚折边效果" target="_blank">box-shadow 阴影右下脚折边效果</a></li>
      <li><a href="/" title="打雷时室内、户外应该需要注意什么" target="_blank">打雷时室内、户外应该需要注意什么</a></li>
    </ul>
    <h3 class="ph">
      <p>点击<span>排行</span></p>
    </h3>
    <ul class="paih">
      <li><a href="/" title="Column 三栏布局 个人网站模板" target="_blank">Column 三栏布局 个人网站模板</a></li>
      <li><a href="/" title="withlove for you 个人网站模板" target="_blank">with love for you 个人网站模板</a></li>
      <li><a href="/" title="免费收录网站搜索引擎登录口大全" target="_blank">免费收录网站搜索引擎登录口大全</a></li>
      <li><a href="/" title="做网站到底需要什么?" target="_blank">做网站到底需要什么?</a></li>
      <li><a href="/" title="企业做网站具体流程步骤" target="_blank">企业做网站具体流程步骤</a></li>
    </ul> 
    </div>-->  
                    <div class="aside-widget">
                        <header>
                            <h3>推荐博客</h3>
                        </header>
                        <div class="body">
                            <ul class="clean-list">
                            <c:forEach items="${userlist}" var="item">
                            	<li><a href="/niit/listArticle.do?q=q&Name=${item}">${item}的博客</a></li>
    						</c:forEach>
                            </ul>
                        </div>
                    </div>   
                    <c:if test="${param.Name!=null&&param.Name!='admin'}">       
                    <div class="aside-widget" >
                        <header>
                            <h3>标签</h3>
                        </header>
                        <div class="body clearfix" overflow-x:hidden;overflow-y:auto">
                        <ul class="tags">
                            <c:forEach items="${set}" var="item">
                            	<li><a href="/niit/listArticle.do?q=q&Name=${param.Name}&logtype=${item}">${item}</a></li>
    						</c:forEach>
		                 <%/*
							Iterator it2 = list.iterator();
							while(it2.hasNext()){
							LogPo log=(LogPo)it2.next();
							out.println("<li><a href='/niit/home.jsp?q=q&Name="+ownername+"&logtype="+log.getType()+"'>"+log.getType()+"</a></li>");
						}*/
						%>
                            <!--
                            	<ul class="tags">
                                <li><a href="#">HTML5</a></li>
                                <li><a href="#">CSS3</a></li>
                                <li><a href="#">COMPONENTS</a></li>
                                <li><a href="#">TEMPLATE</a></li>
                                <li><a href="#">PLUGIN</a></li>
                                <li><a href="#">BOOTSTRAP</a></li>
                                <li><a href="#">TUTORIAL</a></li>
                                <li><a href="#">UI/UX</a></li>                            
                            </ul>
                            -->
                            </ul>
                        </div>
                    </div>
                    </c:if>
    <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6574585" ></script> 
    <script type="text/javascript" id="bdshell_js"></script> 
    <script type="text/javascript">
           document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
    </script> 
</aside>
</div>
</div>
</div>
<footer>
  		<div class="widewrapper footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 footer-widget">
                      <h3> <em class="fa fa-user"></em>关于</h3>
                      <p>NIIT博客系统是一个为学员打造的笔记分享、学习心得、教学协作的分享平台。</p>
                       <p>交流、分享、协作在这里一站实现，激发你的热情与创造力。</p>
                    </div>

                    <div class="col-md-6 footer-widget">
                        <h3> <i class="fa fa-envelope"></i>联系</h3>

                        <p>欢迎广大学员提出意见与建议</p>
                        <p>所有的意见与建议,团队都会及时予以回复</p>
                         <div class="footer-widget-icon">
                            <a href="https://github.com/BVenom/NIITStudentBlogSystem" target="_blank" title="NIITStudentBlogSystem"></a></i>
                        </div>
                    </div>
                   
                </div>
            </div>
        </div>
        <div class="widewrapper copyright">
                Copyright &copy 2017 <img style="display: inline" src="img/niitlogo.png" alt="clean Blog"> <a href="https://github.com/BVenom/NIITStudentBlogSystem" target="_blank" title="NIITStudentBlogSystem">PPS Team</a> ，All Rights Reserved
        </div>
</footer>
<script src="js/silder.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.js"></script>
</body>
</html>
