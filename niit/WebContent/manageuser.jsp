<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<script src="http://cdn.bootcss.com/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript" src="js/mootools.js"></script>
<script type="text/javascript" src="js/site.js"></script>
    <meta charset="utf-8">
    <title>NIITStudentsBlog</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

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
    
</head>
<body>
    <header>
        <div class="widewrapper masthead">
            <div class="container">
                <a href="showIndex.do" id="logo">
                    <img src="img/niitlogo.png" alt="clean Blog" width="100">
                </a>
        
                <div id="mobile-nav-toggle" class="pull-right">
                    <a href="#" data-toggle="collapse" data-target=".clean-nav .navbar-collapse">
                        <i class="fa fa-bars"></i>
                    </a>
                </div>

                <nav class="pull-right clean-nav">
                    <div class="collapse navbar-collapse">
                        <ul class="nav nav-pills navbar-nav">
                          
                            <c:if test="${user!=null}">
                            <li>
                                <a href="/niit/listArticle.do?q=q&Name=${user}">我的博客</a>
                            </li>   
                            </c:if>
                            <c:if test="${user==null}">
                            <li>
                                <a href="login.jsp">登陆</a>
                            </li>  
                            </c:if>
                            <c:if test="${user!=null}">
                            <li>
                                <a href="quit.do">注销</a>
                            </li>  
                            </c:if>                     
                        </ul>
                    </div>
                </nav>        

            </div>
        </div>

        <div class="widewrapper subheader">
            <div class="container">
                <div class="clean-breadcrumb">
                    <a>全部关注</a>
                </div>
            </div>
        </div>
    </header>

    <div class="widewrapper main">
        <div class="container">
            <div class="row">
                <div class="col-md-8 blog-main">
                <div class="hotest">
                    <div class="row">
                    	<c:if test="${user=='admin' }">
                    	<c:forEach items="${usernamelist}" var="item">
                        <div class="col-md-2 col-sm-2">
                        	 <a href="/niit/listArticle.do?q=q&Name=${item}">
                             <img src="img/defaultpicture.jpg" alt="clean Blog" height="90" width="90" />
                             </a>
                             <span style=" width:120px; display:block;overflow: hidden;"><a href="/niit/listArticle.do?q=q&Name=${item}">${item}</a></span>
                        </div>
                        </c:forEach>
                        </c:if>
                    	<%-- <c:forEach items="${clicklist}" var="item">
                        <div class="col-md-6 col-sm-6">
                            <article class=" blog-teaser">
                                <header>
                                    <h3><a href="ShowSingleLog.do?logID=${item.ID}">${item.title}</a></h3>
                                    <span class="meta">发表时间：${item.date},<a href="/niit/listArticle.do?q=q&Name=${item.username}">作者： ${item.username }</a></span>
                                    <hr>
                                </header>
                            
                            </article>
                        </div>
                        </c:forEach> --%>
                    </div>
                    </div>
				</div>
                    <!--<div class="copyrights">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>-->
              <!--  <aside class="col-md-4 blog-aside">
                    
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
                
                    <!--<div class="aside-widget">
                        <header>
                            <h3>Related Post</h3>
                        </header>
                        <div class="body">
                            <ul class="clean-list">
                                <li><a href="">Blackor Responsive Theme</a></li>
                                <li><a href="">Portfolio Bootstrap Template</a></li>
                                <li><a href="">Clean Slider Template</a></li>
                                <li><a href="">Clean - Responsive HTML5 Template</a></li>
                                <li><a href="">Responsive Pricing Table</a></li>
                                <li><a href="">Yellow HTML5 Template</a></li>
                            </ul>
                        </div>
                    </div>

                </aside>--> 
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
                Copyright &copy 2017  <img src="img/niitlogo.png" alt="clean Blog"> <a href="https://github.com/BVenom/NIITStudentBlogSystem" target="_blank" title="NIITStudentBlogSystem">PPS Team</a> ，All Rights Reserved
        </div>
    </footer>
    
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/modernizr.js"></script>

</body>
</html>