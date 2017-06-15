/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.5.56 : Database - blogs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`blogs` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `blogs`;

/*Table structure for table `bloginfo` */

DROP TABLE IF EXISTS `bloginfo`;

CREATE TABLE `bloginfo` (
  `username` varchar(16) NOT NULL,
  `clickNum` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `bloginfo` */

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `logID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `logTitle` varchar(50) NOT NULL,
  `logDetail` varchar(4000) NOT NULL,
  `logClicknum` int(11) NOT NULL,
  `logType` varchar(100) DEFAULT NULL,
  `logFor` int(11) NOT NULL DEFAULT '0',
  `logCon` int(11) NOT NULL DEFAULT '0',
  `logTime` datetime NOT NULL,
  PRIMARY KEY (`logID`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `log` */

insert  into `log`(`logID`,`username`,`logTitle`,`logDetail`,`logClicknum`,`logType`,`logFor`,`logCon`,`logTime`) values (1,'wang','Micro框架与结构','<h2 id=\"关于-micro\">关于 Micro</h2><p>micro是一个微服务工具集。它被用来实现它的特性和接口，同时提供强大的可插拔的架构来保证基础组件可以被替换掉。</p><p>Micro 专注于解决构建微服务系统的基础需求。它采用了深思熟虑地富有预见性的方式来实现它的设计。</p><p>如果你想深入研究 Micro 工具集请点这里查看上一篇博客，或者如果你想学习微服务的基本概念请查看这里</p><p>在我们开始讨论 Micro 的架构之前，我们将快速的介绍一下 Micro 的特性.</p>',5,'Micro',0,0,'2017-05-18 19:04:22'),(2,'wang','真正从零开始，TensorFlow详细安装入门图文教程！ ','AI这个概念好像突然就火起来了，年初大比分战胜李世石的AlphaGo成功的吸引了大量的关注，但其实看看你的手机上的语音助手，相机上的人脸识别，今日头条上帮你自动筛选出来的新闻，还有各大音乐软件的歌曲“每日推荐”……形形色色的AI早已进入我们生活的方方面面。深刻的影响了着我们，可以说，这是一个AI的时代。',23,'Tensor flow',0,0,'2017-05-18 19:16:57'),(4,'wang','Tensorflow实践：CNN实现MNIST手写识别模型','<p>&nbsp;how can i do it?<br/></p><p>本文假设大家对CNN、softmax原理已经比较熟悉，着重点在于使用Tensorflow对CNN的简单实践上。所以不会对算法进行详细介绍，主要针对代码中所使用的一些函数定义与用法进行解释，并给出最终运行代码。如果对Tensorflow的一些基本操作不熟悉的话，推荐先看下极客学院的<a href=\"http://wiki.jikexueyuan.com/project/tensorflow-zh/tutorials/mnist_pros.html\">这篇文章</a>再回来看本文。</p>',3,'Tensor flow',0,0,'2017-05-18 19:21:20'),(5,'12321','TensorFlow','<p>TensorFlow是<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E8%B0%B7%E6%AD%8C\">谷歌</a>基于DistBelief进行研发的第二代<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E4%BA%BA%E5%B7%A5%E6%99%BA%E8%83%BD/9180\" data-lemmaid=\"9180\">人工智能</a><a target=\"_blank\" href=\"http://baike.baidu.com/item/%E5%AD%A6%E4%B9%A0%E7%B3%BB%E7%BB%9F\">学习系统</a>，其命名来源于本身的运行原理。Tensor（张量）意味着N维数组，Flow（流）意味着基于数据流图的计算，TensorFlow为张量从流图的一端流动到另一端计算过程。TensorFlow是将复杂的数据结构传输至人工智能神经网中进行分析和处理过程的系统。</p><p>TensorFlow可被用于<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E8%AF%AD%E9%9F%B3%E8%AF%86%E5%88%AB\">语音识别</a>或<a target=\"_blank\" href=\"http://baike.baidu.com/item/%E5%9B%BE%E5%83%8F%E8%AF%86%E5%88%AB\">图像识别</a>等多项机器深度学习领域，对2011年开发的深度学习基础架构DistBelief进行了各方面的改进，它可在小到一部智能手机、大到数千台数据中心服务器的各种设备上运行。TensorFlow将完全开源，任何人都可以用。</p><p><br/></p>',0,'Tensor flow',0,0,'2017-05-18 19:31:21'),(6,'12321','谷歌IO 2017大会汇总：512MB内存也能跑安','Android已经成为目前全球智能手机当中份额最高的系统，从低端机到高端机都可以看到Android的身影，而一年一度的GoogleI/O大会，能够让业界看到未来Google生态的发展方向，并指引相关行业硬件发展，不论是厂商还...',2,'Google I/O',0,0,'2017-05-18 19:33:29'),(7,'12321',' Servlet获取客户端的IP与MAC地址 ','public class CheckMACandIP extends HttpServlet {<br/>&nbsp;public CheckMACandIP() {<br/>&nbsp;&nbsp;super();<br/>&nbsp;}<br/>&nbsp;public void destroy() {<br/>&nbsp;&nbsp;super.destroy(); <br/>&nbsp;}<br/>&nbsp;public void doGet(HttpServletRequest request, HttpServletResponse response)<br/>&nbsp;&nbsp;&nbsp;throws ServletException, IOException {<br/>&nbsp;&nbsp;doPost(request,response);<br/>&nbsp;}<p>&nbsp;public void doPost(HttpServletRequest request, HttpServletResponse response)<br/>&nbsp;&nbsp;&nbsp;throws ServletException, IOException {<br/>&nbsp;&nbsp;String ip = getRemoteAddress(request);<br/>&nbsp;&nbsp;System.out.println(ip);<br/>&nbsp;&nbsp;System.out.println(getMACAddress(ip));<br/>&nbsp;}<br/>&nbsp;public void init() throws ServletException {<br/>&nbsp;}<br/>&nbsp;public String getRemoteAddress(HttpServletRequest request){&nbsp;&nbsp;&nbsp; <br/>&nbsp;&nbsp;&nbsp;&nbsp; String ip = request.getHeader(&quot;x-forwarded-for&quot;);&nbsp;&nbsp;&nbsp; <br/>&nbsp;&nbsp;&nbsp;&nbsp; if(ip == null || ip.length() == 0 || ip.equalsIgnoreCase(&quot;unknown&quot;)) ip = request.getHeader(&quot;Proxy-Client-IP&quot;);&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; if(ip == null || ip.length() == 0 || ip.equalsIgnoreCase(&quot;unknown&quot;)) ip = request.getHeader(&quot;WL-Proxy-Client-IP&quot;);&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; if(ip == null || ip.length() == 0 || ip.equalsIgnoreCase(&quot;unknown&quot;)) ip = request.getRemoteAddr();&nbsp;&nbsp;&nbsp;<br/>&nbsp;&nbsp;&nbsp;&nbsp; return ip;&nbsp;&nbsp;&nbsp; <br/>&nbsp;} <br/>&nbsp;&nbsp; public String getMACAddress(String ip){<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; String str = &quot;&quot;;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; String macAddress = &quot;&quot;;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try {<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Process p = Runtime.getRuntime().exec(&quot;nbtstat -A &quot; + ip);<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; InputStreamReader ir = new InputStreamReader(p.getInputStream());<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LineNumberReader input = new LineNumberReader(ir);<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (int i = 1; i &lt; 100; i++) {<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str = input.readLine();<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (str != null) {<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (str.indexOf(&quot;MAC Address&quot;) &gt; 1) {<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; macAddress = str.substring(str.indexOf(&quot;MAC Address&quot;) + 14, str.length());<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } catch (IOException e) {<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e.printStackTrace(System.out);<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return macAddress;<br/>&nbsp;&nbsp;&nbsp;&nbsp; }<br/>}</p>',1,'Servlet',1,0,'2017-05-18 19:34:44'),(8,'q','test1','<p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost:8080/niit/editor/dialogs/attachment/fileTypeImages/icon_jpg.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/niit/ueditor/jsp/upload/file/20170603/1496459969875006124.jpg\" title=\"timg.jpg\">timg.jpg</a></p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost:8080/niit/editor/dialogs/attachment/fileTypeImages/icon_txt.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/niit/ueditor/jsp/upload/file/20170603/1496461929185031189.txt\" title=\"test.txt\">test.txt</a></p><p><br/></p>',48,'test2',1,0,'2017-06-03 11:52:11'),(9,'q','Spring框架开发','<p style=\"line-height: 16px;\"><img src=\"/niit/ueditor/jsp/upload/image/20170603/1496462474537070590.gif\" title=\"1496462474537070590.gif\" alt=\"spring_framework.gif\"/></p><p style=\"line-height: 16px;\"><img style=\"vertical-align: middle; margin-right: 2px;\" src=\"http://localhost:8080/niit/editor/dialogs/attachment/fileTypeImages/icon_txt.gif\"/><a style=\"font-size:12px; color:#0066cc;\" href=\"/niit/ueditor/jsp/upload/file/20170603/1496462412050051646.java\" title=\"spring.java\">spring.java</a></p><p>Spring框架是一个轻量级的IoC和AOP开发框架。<br/></p><p>IoC：Inverse of contorl（控制反转）</p><p>AOP：Aspect-oriented programming（面向方面的编程）</p>',32,'Spring框架',0,0,'2017-06-03 12:01:20'),(11,'wangchuang','大家好','<p>大家好，我是王闯</p>',0,'新文章',0,0,'2017-05-19 15:39:47');

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `messageID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `fName` varchar(20) DEFAULT NULL,
  `messageTime` datetime DEFAULT NULL,
  `messageDetail` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`messageID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `message` */

insert  into `message`(`messageID`,`username`,`fName`,`messageTime`,`messageDetail`) values (19,'访客','q','2017-05-18 21:14:31','有没有Spring框架开发的经验，期待分享'),(20,'q','wang','2017-06-03 12:46:02','你好啊');

/*Table structure for table `messagereply` */

DROP TABLE IF EXISTS `messagereply`;

CREATE TABLE `messagereply` (
  `messageID` int(11) DEFAULT NULL,
  `replyID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `fName` varchar(20) DEFAULT NULL,
  `replyTime` datetime DEFAULT NULL,
  `replyDetail` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`replyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `messagereply` */

/*Table structure for table `relationship` */

DROP TABLE IF EXISTS `relationship`;

CREATE TABLE `relationship` (
  `follow` varchar(20) DEFAULT NULL,
  `follower` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `relationship` */

insert  into `relationship`(`follow`,`follower`) values ('12321','wang'),('q','wang'),('null','12321'),('12321','q'),('tong','q'),('wang','q');

/*Table structure for table `remark` */

DROP TABLE IF EXISTS `remark`;

CREATE TABLE `remark` (
  `remarkID` int(11) NOT NULL AUTO_INCREMENT,
  `remarkName` varchar(20) NOT NULL,
  `logID` int(11) NOT NULL,
  `remarkDetail` varchar(300) NOT NULL,
  `remarkTime` datetime NOT NULL,
  PRIMARY KEY (`remarkID`),
  KEY `logID` (`logID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `remark` */

insert  into `remark`(`remarkID`,`remarkName`,`logID`,`remarkDetail`,`remarkTime`) values (2,'wang',2,'我也很绝望，挺烦的','2017-05-18 19:08:32'),(3,'访客',8,'那session.getParameter()怎么用呢？','2017-05-18 20:02:08'),(4,'访客',9,'解释得有点简单','2017-05-18 21:13:23');

/*Table structure for table `reply` */

DROP TABLE IF EXISTS `reply`;

CREATE TABLE `reply` (
  `remarkID` int(11) NOT NULL,
  `replyDetail` varchar(200) NOT NULL,
  `replyID` int(11) NOT NULL AUTO_INCREMENT,
  `logID` int(11) NOT NULL,
  `replyName` varchar(20) NOT NULL,
  `replyTime` datetime NOT NULL,
  PRIMARY KEY (`replyID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `reply` */

insert  into `reply`(`remarkID`,`replyDetail`,`replyID`,`logID`,`replyName`,`replyTime`) values (2,'何解？',2,2,'wang','2017-05-18 19:09:07'),(3,'我也不知道',3,8,'访客','2017-05-18 20:02:24'),(4,'不过还可以',4,9,'访客','2017-05-18 21:13:36');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `username` varchar(16) NOT NULL,
  `password` varchar(16) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `phonenumber` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  `blogclicknum` int(11) DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`username`,`password`,`email`,`name`,`birthday`,`phonenumber`,`sex`,`address`,`blogclicknum`) values ('123','1','121@11',NULL,NULL,NULL,NULL,NULL,0),('admin','admin',NULL,NULL,NULL,NULL,NULL,NULL,0),('cw','1','1',NULL,NULL,NULL,NULL,NULL,0),('cxh','1','1',NULL,NULL,NULL,NULL,NULL,0),('kenny','1','1',NULL,NULL,NULL,NULL,NULL,0),('lebron','1','1',NULL,NULL,NULL,NULL,NULL,0),('lily','1','1',NULL,NULL,NULL,NULL,NULL,0),('mrwho','1','1',NULL,NULL,NULL,NULL,NULL,0),('q','w','','','0000-00-00','','','',83),('tong','1','1',NULL,NULL,NULL,NULL,NULL,0),('username','password','email',NULL,NULL,NULL,NULL,NULL,0),('username1','password','email',NULL,NULL,NULL,NULL,NULL,0),('username2','password','email',NULL,NULL,NULL,NULL,NULL,0),('username3','password','email',NULL,NULL,NULL,NULL,NULL,0),('wang','1','lebroant1984@qq.com','王','2017-05-20','1223','男','lasweijiasiduchang',32),('wangchuang','123456','123456789@123',NULL,NULL,NULL,NULL,NULL,0),('yj','1','1',NULL,NULL,NULL,NULL,NULL,0),('zt123','123','123@123.com',NULL,NULL,NULL,NULL,NULL,0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
