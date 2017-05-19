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
    <title>About Me</title>
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
        <script src="js/vendor/google/html5-3.6-respond-1.1.0.min.js"></script>
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
                             <li>
                                <a href="/niit/listArticle.do?q=q&Name=${param.Name}">返回博客</a> 
                            </li>
                            <li>
                                <a href="showFollower.do">我的粉丝</a>
                            </li>
                             <li>
                                <a href="showFollow.do">我的关注</a>
                            </li> 
                            <li>
                                <a href="/niit/getMessageList.do?q=q&Name=${param.Name}">留言板</a>
                            </li>                          
                        </ul>
                    </div>
                </nav>        

            </div>
        </div>

        <div class="widewrapper subheader">
            <div class="container">
                <div class="clean-breadcrumb">
                    <a href="#">个人资料</a>
                </div>

            </div>
        </div>
    </header>
<c:if test="${user==param.Name}">
    <div class="widewrapper main">
        <div class="container">
           <hr>
            <form action="${pageContext.request.contextPath}/editprofile.jsp?q=q&Name=${user}" method="post" class="fh5co-form animate-box" data-animate-effect="fadeInRight">
						<div class="form-group">
						<label for="name">姓名 :</label>
						<input type="text" readOnly="true" value="${userpo.name}" id="name"></input>
						</div>
						<div class="form-group">
							<label for="sex">性别:</label>
							<input type="text" readOnly="true" value="${userpo.sex}" id="sex"/>
						</div>						
						<div class="form-group">
							<label for="birth" >生日 :</label>
							<input type="text" readOnly="true" value="${userpo.birthday}" id="birth"/>
						</div>
						<div class="form-group">
							<label for="email">邮箱 :</label>
							<input type="text" readOnly="true" value="${userpo.email}" id="email"/>
						</div>
						<div class="form-group">
							<label for="phone">手机号 :</label>
							<input type="text" readOnly="true" value="${userpo.phonenumber}" id="phone"/>
						</div>
						<div class="form-group">
							<label for="address">地址: </label>
							<input type="text" readOnly="true" value="${userpo.address}" id="address"/>
						</div>
						<div class="form-group">
							<input type="submit" value="修改" class="btn btn-primary"></input>
						</div>
		    </form>
        </div>

    </div>
</c:if>
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
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/modernizr.js"></script>

</body>
</html>