<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<script src="http://cdn.bootcss.com/jquery/1.9.0/jquery.js"></script>
    <meta charset="utf-8">
    <title>留言板</title>
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
<style>
.box{
    /* width:50%; margin-top:10%; margin:auto; padding:28px;
    height:350px;  */
    display:none;            /* 默认对话框隐藏 */
}
.box.show{display:block;} 
.box .create-comment{ /* text-align:right; */ display:block;}
.box input{/* width:80%; */ margin-top:18px;}
</style>
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
					  	<li><a href="/niit/listArticle.do?q=q&Name=${param.Name}">返回博客</a></li>
					      <c:if test="${user!='admin'}">
					      <c:if test="${user==param.Name&&user!=null}">
					      <li><a href="/niit/profile.do?q=q&Name=${param.Name}">关于我</a></li>
					      <li><a href="addArticle.jsp">写博客</a></li>
					      <li><a href="showFollow.do">我的关注</a></li>
					      <li><a href="showFollower.do">我的粉丝</a></li>
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
                    <a ">留言板</a>
                </div>
                
            </div>
        </div>
    </header>
    <div class="widewrapper main">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 clean-superblock" id="contact">
                    <aside class="comments" id="messages">
                    
                    <c:forEach items="${msglist}" var="msg">
                        <article class="comment">
                            <header class="clearfix">
                                <img src="img/user.jpg" alt="A Smart Guy" class="avatar">
                                <div class="meta">
                                    <h3><a href="/niit/listArticle.do?q=q&Name=${msg.username}">${msg.username}</a></h3>
                                    <span class="date">
                                        ${msg.messageTime}
                                    </span>
                                    <span class="separator">
                                        -
                                    </span>
                                    
                                    <a href="/niit/getMessageList.do?q=q&Name=${msg.fName}&replyID=${msg.messageID}#create-comment" class="reply-link">Reply</a>                
                                
                                    <c:if test="${user!=null&&user==msg.fName}">
                                	<span class="separator">
                                        -
                                    </span>
                                    <a href="${pageContext.request.contextPath}/servlet/DeleteMsg?fName=${msg.fName}&msgID=${msg.messageID}" style="color:red">Delete</a>  
                                    </c:if>
                                
                                </div>
                            </header>
                             <div class="body">
                               ${msg.messageDetail}
                            </div>
                        </article>
                    <c:forEach items="${msgreplylist}" var="msgreply">
                        <c:if test="${msgreply.messageID==msg.messageID}">
                        <article class="comment reply">
                            <header class="clearfix">
                                <img src="img/user.jpg" alt="A Smart Guy" class="avatar">
                                <div class="meta">
                                    <h3><a href="/niit/listArticle.do?q=q&Name=${msgreply.userName}">${msgreply.userName}</a></h3>
                                    <span class="date">
                                        ${msgreply.messagereplyTime}
                                    </span>
                                    <span class="separator">
                                        
                                    </span>
                                    Reply
                                    <span class="separator">
                                        -
                                    </span>
                                    <a href="/niit/listArticle.do?q=q&Name=${msg.username}">${msg.username}</a>    
                                    
                                    <c:if test="${user!=null&&user==msg.fName}">
                                	<span class="separator">
                                        -
                                    </span>
                                    <a href="${pageContext.request.contextPath}/servlet/DeleteMsgReply?fName=${msg.fName}&msgReplyID=${msgreply.messagereplyID}" style="color:red">Delete</a>  
                                    </c:if>
                                              
                                </div>
                            </header>
                             <div class="body">
                             	${msgreply.messagereplyDetail}
                             </div>
                        </article>
                        </c:if>
					</c:forEach>
				</c:forEach>
                    
                    
                    
                      <%-- <c:forEach items="${list}" var="item">
                        <c:if test="${item.fName eq ''}">
                        <article class="comment">
                            <header class="clearfix">
                                <div class="meta">
                                    <h3><a href="#">${item.name}</a></h3>
                                    <br>
                                    <span class="date">
                                        ${item.dateTime}
                                    </span>
                                    <span>
                                    <input type="button" onClick="msgbox(1)" style="font-size:15" class="btn btn-xlarge btn-clean-one col-md-offset-10" value="回复"></input> 
                                    </span>
                               </div> 
                            </header>
                             <div class="body" style="overflow-x:hidden;overflow-y:auto;width:500px; height:100px;word-wrap: break-word; word-break: normal">
                              ${item.message}
                               </div>
                               <div>
                                 <input type="button" onClick="msgbox(1)" style="font-size:15; float:right; margin-top:15px" class="btn btn-xlarge btn-clean-one col-md-offset-4" value="回复"></input> 
                                </div>
                               
                               <div id="inputbox" class="box">
                                       <a class="create-comment" href='' onclick="msgbox(0); return false;">关闭</a>
                                       <aside class="create-comment" >
                                          <form action="${pageContext.request.contextPath}/servlet/sendMessage" method="get" accept-charset="utf-8">
                                                        <textarea rows="10" class="form-control input-lg" name="replymessage" placeholder="Your Message"></textarea>
                                                       
                                                <div class=class="buttons clearfix">
                                                       <input type="submit" class="btn btn-xlarge btn-clean-one col-md-6" value="Submit"/>
                                                </div>
                                          </form>
                                     </aside>
                               </div>  
                        </article>
                        </c:if>
                        <c:if test="${item.fName ne ''}">
                        <article class="comment">
                            <header class="clearfix">
                                   <div class="meta">
                                   <h3><a href="#">${item.name}</a>
                                                                              回复了
                                   <a href="#">${item.fName}</a></h3>
                                   </div>
                                   <div class="meta">
                                    <span class="date">
                                         ${item.dateTime}
                                    </span>
                                <span>
                                   <input type="button" onClick="msgbox(1)" style="font-size:15" class="btn btn-xlarge btn-clean-one col-md-offset-10" value="回复"></input>
                                </span>
                                </div>
                            </header>
                            <div class="body" style="overflow-x:hidden;overflow-y:auto ;width:500px; height:100px; word-wrap:break-word; word-break:normal">
                              ${item.message}
                              </div> 
                              <!-- <div>
                              <input type="button" onClick="msgbox(1)" style="font-size:15 ; float:right; margin-top:15px" class="btn btn-xlarge btn-clean-one col-md-offset-4" value="回复"></input>
                              </div> -->
                             <br>
                              <div id="inputbox" class="box">
                                       <a class="create-comment" href='' onclick="msgbox(0); return false;">关闭</a>
                                       <aside class="create-comment">
                                          <form action="${pageContext.request.contextPath}/servlet/sendMessage" method="get" accept-charset="utf-8">
                                                         <input type="text" class="form-control input-lg" name="name" placeholder="Your Name"/>
                                                        <input type="hidden" value=""class="form-control input-lg" name="repliedName" placeholder="Your Name"/>
                                                        <textarea rows="10" class="form-control input-lg" name="replymessage" placeholder="Your Message"></textarea>
                                                        
                                                <div class=class="buttons clearfix">
                                                       <input type="submit" class="btn btn-xlarge btn-clean-one col-md-6" value="Submit"/>
                                                </div>
                                          </form>
                                        </aside>
                              </div>       
                        </article>
                        </c:if>
                        </c:forEach>   --%>    
                    </aside>
                  <!--    <script>  
                       function msgbox(n){
                              document.getElementById('inputbox').style.display=n?'block':'none';     /* 点击按钮打开/关闭 对话框 */
                         }
                     </script> -->
                    <aside class="create-comment" id="create-comment">
                        <hr>    

                        <h2><i class="fa fa-pencil"></i> 写留言</h2>
                    
                    <form action="${pageContext.request.contextPath}/servlet/sendMessage?Name=${param.Name}&replyID=${param.replyID}" method="post" accept-charset="utf-8" class="contact-form">
                        <textarea rows="10" name="message" id="contact-body" placeholder="Your Message" class="form-control input-lg"></textarea>
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