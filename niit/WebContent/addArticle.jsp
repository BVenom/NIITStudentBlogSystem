<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
<head>
<script src="http://cdn.bootcss.com/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript" src="js/mootools.js"></script>
<script type="text/javascript" src="js/site.js"></script>
<script type="text/javascript" charset="utf-8" src="/niit/editor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/niit/editor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="/niit/editor/lang/zh-cn/zh-cn.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Write Log</title>
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
<%if((String)session.getAttribute("authority")!="admin"){session.setAttribute("authority","visitor");} %>
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
    <% if((String)session.getAttribute("authority")=="admin")out.println("<div style='color:black"+";"+"font-size: 25px' "+">Welcome,"+(String)session.getAttribute("user")+"</div>"); %>
    <nav class="pull-right clean-nav">
     <div class="collapse navbar-collapse">
     <ul class="nav nav-pills navbar-nav">
      <li><a href="showIndex.do">首页</a></li>
      <li><a href="/niit/profile.do?q=q&Name=${user}">关于我</a></li>
      <li><a href="addArticle.jsp">写博客</a></li>
     <li><a href="showFollower.do">我的粉丝</a></li>
     <li><a href="showFollow.do">我的关注</a></li> 
      <li><a href="/niit/getMessageList.do?q=q&Name=${param.Name}">留言板</a></li>
      </ul>
      </div>
   </nav>
   </div>
  </div>
  <div class="widewrapper subheader">
            <div class="container">
                <div class="clean-breadcrumb">
                    <a href="#">写新博客</a>
                </div>
            </div>
        </div>
</header>
            <div class="widewrapper main">
        <div class="container">
            <div class="row">
            <form action="${pageContext.request.contextPath}/servlet/AddLog" method="post" id="Log" onsubmit="return toVaild()" class="fh5co-form animate-box" data-animate-effect="fadeInRight">
              <div class="col-md-9">
                <label>标题：</label>
                <input id="title" type="text" name="title" />
              </div>
              <div class="col-md-9">
                <label>分类：</label>
                <input id="type" type="text" name="type" />
              </div>
              <div class="col-md-9">
                <label>内容：</label>
                <div>
    				<script id="c" name="content" type="text/plain"></script>
                </div>
              </div>
              <div class="col-md-9">
                <input id="submit" name="提交" type="submit" class="button" value="提交" />
              </div>
             </form>
             <script>
             $(document).ready(function(){
            	var editID="${sessionScope.editlogID}";
            	if(editID!=null)
		    	{
            	var ue = UE.getEditor('c');
		    	var title="${log.title}";
		    	var content="${log.content}";
		    	var type="${log.type}";
		    	jQuery("#title").val(title);
		   		jQuery("#type").val(type);
		   		ue.ready(function() {
                    ue.setContent(content);
          		});
		    	}
		    });
            </script>
            <script language="javascript">
             function toVaild(){
                 var title = document.getElementById("title").value;
                 if(title==""){
                     alert("必须填写标题");
                     return false;
                }else{
                	return true;
                }
            }
     		</script>
     		<script>
            jQuery(function(){
		    	window.ue = UE.getEditor('c');
		    });

            </script>
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
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/modernizr.js"></script>

</body>
</html>