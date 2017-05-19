<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<script src="http://cdn.bootcss.com/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript" src="js/mootools.js"></script>
<script type="text/javascript" src="js/site.js"></script>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Single Post</title>
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
                                <a href="/niit/listArticle.do?q=q&Name=${log.username}">返回博客</a>
                            </li> 
                          <c:if test="${user==log.username}">
     					  <li><a href="/niit/profile.do?q=q&Name=${log.username}">关于我</a></li>
							<li><a href="showFollow.do">我的关注</a></li>
					      <li><a href="showFollower.do">我的粉丝</a></li>
                            </c:if>                       
                        </ul>
                    </div>
                </nav>        

            </div>
        </div>

        <div class="widewrapper subheader">
            <div class="container">
                <div class="clean-breadcrumb">
                    <a>博文内容</a>
                </div>

              

            </div>
        </div>
    </header>

    <div class="widewrapper main">
        <div class="container">
            <div class="row">
                <div class="col-md-11 blog-main">
                        <!--<header>
                           
                            <div class="lead-image">
                                <img src="img/single-post.jpg" alt="" class="img-responsive">
                                
                            </div>
                        </header>-->
                        <div class="body">
                            <h1 style="font-size:30px">${log.title}</h1>
                            <div class="meta">
                                <span class="data"><i class="fa fa-user"></i> <a href="/niit/listArticle.do?q=q&Name=${log.username}">${log.username} </a></span><i class="fa fa-calendar"></i><span class="data">${log.date }</span>
                                <c:if test="${user!=null&&user==log.username }">
                                <span class="separator">
                                        -
                                </span>
                                <a href="editLog.do?logID=${log.ID}&ifDelete=false" style="color:blue">Edit</a> 
                                </c:if>
                                <c:if test="${user!=null&&user==log.username||user=='admin'}">
                                <span class="separator">
                                        -
                                </span>
                                <a href="editLog.do?logID=${log.ID}&ifDelete=true" style="color:red">Delete</a> 
                                </c:if>
                            </div>
                            <div style=" block;word-break: break-all;word-wrap: break-word; height:800px;overflow-x:hidden;overflow-y:auto" class="body" >
                            <p>${log.content}</p>
                           </div>
                           <div class="buttons clearfix">
                                <button type="submit" onclick="forclick(${log.ID},${log.fornum})" id="for" style="color:red" class="btn btn-xlarge btn-clean-one col-md-offset-5">顶</button>
                                <span id="fornum">${log.fornum}</span>
                                <button type="submit" onclick="conclick(${log.ID},${log.connum})" id="con" class="btn btn-xlarge btn-clean-one col-md-offset-1">踩</button>
                           		<span id="connum">${log.connum}</span>
                           </div>
                           <script type="text/javascript">
								function forclick(logID,logFor){
									$("#con").css('display', 'none');
									$("#connum").css('display', 'none');
								jQuery.ajax({  
								            url : '/niit/servlet/Fornum',  
								            contentType : "application/json",
								            type: 'GET', 
								            dataType : "text",  
								            data : {
								            	"logID":logID
								            },
								            success : function(data) {
								            	 var NulogFor = parseInt(logFor) + 1;
								            	 $("#fornum").html(NulogFor); 
								            }
								            
								})
								}
								function conclick(logID,logCon){
									$("#for").css('visibility', 'hidden');
									$("#fornum").css('visibility', 'hidden');
									jQuery.ajax({  
									            url : '/niit/servlet/Connum',  
									            contentType : "application/json",
									            type: 'GET', 
									            dataType : "text",  
									            data : {"logID":"${log.ID}"},
									            success : function(data) {
									            	var NulogCon = parseInt(logCon) + 1;
									            	 $("#connum").html(NulogCon);  
									            }
									})
									}
								</script>
                    <aside class="comments" id="comments">
                        <hr>

                        <h2><i class="fa fa-comments"></i>评论</h2>
						<c:forEach items="${remarklist}" var="remark">
                        <article class="comment">
                            <header class="clearfix">
                                <img src="img/user.jpg" alt="A Smart Guy" class="avatar">
                                <div class="meta">
                                    <h3><a href="/niit/listArticle.do?q=q&Name=${remark.remarkName}">${remark.remarkName}</a></h3>
                                    <span class="date">
                                        ${remark.remarkTime}
                                    </span>
                                    <span class="separator">
                                        -
                                    </span>
                                    
                                    <a href="ShowSingleLog.do?logID=${log.ID}&replyID=${remark.remarkID}#create-comment" class="reply-link">Reply</a>                
                                	
                                	
                                	<c:if test="${user!=null&&user==log.username||user=='admin'}">
                                	<span class="separator">
                                        -
                                    </span>
                                    <a href="${pageContext.request.contextPath}/servlet/DeleteRemark?logID=${log.ID}&remarkID=${remark.remarkID}" style="color:red">Delete</a>  
                                    </c:if>
                                
                                
                                </div>
                            </header>
                             <div class="body">
                               ${remark.remarkDetail }
                            </div>
                        </article>
                    <c:forEach items="${replylist}" var="reply">
                        <c:if test="${remark.remarkID==reply.remarkID}">
                        <article class="comment reply">
                            <header class="clearfix">
                                <img src="img/user.jpg" alt="A Smart Guy" class="avatar">
                                <div class="meta">
                                    <h3><a href="/niit/listArticle.do?q=q&Name=${reply.replyName}">${reply.replyName}</a></h3>
                                    <span class="date">
                                        ${reply.replyTime}
                                    </span>
                                    <span class="separator">
                                        
                                    </span>
                                    Reply
                                    <span class="separator">
                                        -
                                    </span>
                                    <a href="/niit/listArticle.do?q=q&Name=${remark.remarkName}">${remark.remarkName}</a>            
                                    <c:if test="${user!=null&&user==log.username||user=='admin' }">
                                    <span class="separator">
                                        -
                                    </span>
                                    <a href="${pageContext.request.contextPath}/servlet/DeleteReply?logID=${log.ID}&replyID=${reply.replyID}" style="color:red">Delete</a>          
                                	</c:if>
                               
                               
                                </div>
                            </header>
                             <div class="body">
                             	${reply.replyDetail}
                             </div>
                        </article>
                        </c:if>
					</c:forEach>
				</c:forEach>
						
                              
                    </aside>

                    <aside class="create-comment" id="create-comment">
                        <hr>    

                        <h2><i class="fa fa-pencil"></i> 写评论</h2>

                        <form id="message" action="${pageContext.request.contextPath}/servlet/Reply?logID=${log.ID}&replyID=${param.replyID}" method="post" accept-charset="utf-8">
                            <textarea  rows="10" name="detail" placeholder="Your Message" class="form-control input-lg"></textarea>
                            <div class="buttons clearfix">
                                <button type="submit" class="btn btn-xlarge btn-clean-one">提交</button>
                            </div>
                        </form>
                    </aside>
                </div>
                
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

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/modernizr.js"></script>

</body>
</html>