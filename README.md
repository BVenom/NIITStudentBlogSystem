# NIITStudentBlogSystem
1	项目名称：<br/>
NIIT学生个人博客系统<br/>
2	项目成员：<br/>
PPS战队:童旭、王闯、张涛<br/>
3	项目开发环境（java Eclipse等）、项目开发技术（java Spring等）<br/>
Struts2+Spring+Hibernatede的整合<br/>
S2SH架构工作流程为：通过JSP页面实现交互界面，负责传递请求和接受相应；在表示层引入Struts2用户请求经由控制器Struts2中的Filterdispatcher处理后，用户数据会传递给Action然后由Action类通过业务层Spring的LoC容器访问持久层Hibernate的DAO，由DAO负责与底层数据库的交互，最后再将结果返回JSP页面进行显示。在S2SH 中Spring 处于核心地位。向上整合Struts2，向下整合Spring。Spring 充分利用Ioc容器的特性和功能，通过配置文件，将专注于控制业务逻辑组件和结果视图的Action、专注于业务逻辑实现的业务逻辑对象( Business Object，BO) 、专注于数据底层持久化操作的数据访问对象( DAO) 、底层数据库内存镜像的会话工厂( SessionFactory) 等组件统一在其管理之下，统一管理这些组件生命周期的各个阶段，并利用其依赖注入功能，实现可配置编码的耦合方式，实现Action与BO、BO 与DAO、DAO 与SessionFactory 的低耦合，使得系统具有良好的解耦性，从而保证利用S2SH开发的应用系统在重构时不会发生“牵一发而动全身”的效果，提高了系统的可扩展性、可维护性和可复用性。<br/>
4	项目功能分析<br/>
4.1.	系统概述<br/>
NIIT博客系统为学员打造一个笔记分享、学习心得、教学协作的分享平台。访客可以通过本系统进行阅读博文，评论博文，对博主留言，关注博主、发私信，点赞
与打赏等操作。博主可以同通过普通用户账号登陆本系统进行博文的发表、编辑、删除与浏览，博文的分类、归档，博文评论管理，留言管理，个人信息维护，对
其他博主关注等操作。管理员可以通过管理员账号登陆本系统进行用户管理，博文管理并推荐博文，自动实现敏感信息过滤等操作。<br/>
4.2.	功能列表<br/>
功能名称	                                 描述	                                                         参与者<br/>
阅读博文	                    访客可以进入其他博主博客内并阅读其博文	                                        访客<br/>
评论博文	                    访客可以在阅读的博文下方发表评论	                                             访客<br/>
对博主留言	                   访客可以在博客内留言区域留言	                                                  访客<br/>
关注博主、发私信	             访客可以关注感兴趣的博主来收到其更新，并能对指定博主发送私聊信息	                 访客<br/>
点赞与打赏	                   访客可以对使自己受益的博文点赞，也可通过扫描二维码等方式打赏博主	                 访客
博文发表、编辑、删除与浏览	    博主可以发表博文，编辑已经发表的博文，删除和浏览已经发表的博文	                   博主
博文分类、归档	               博主可以对已经发表的博文进行整理，将博文按照类型分类，重新归档	                  博主
博文评论管理	                博主可以对自己的博文下的评论进行查看、回复、删除等操作	                          博主
留言管理	                    博主可以对自己博客内的留言进行查看、回复、删除等操作	                           博主
个人信息维护	                博主可以对博客的个人信息进行修改、完善	                                         博主
对其他博主的关注	            博主可以关注其他博主，来收到其他博客的更新以及发送私信	                           博主
用户管理	                   管理员可以管理所有注册的博主，审核博主的身份信息等	                             管理员
博文管理并可以推荐博文	    管理员可以对所有博客的博文进行浏览和删除等操作，并对特定的高质量的博文进行大范围推送	 管理员
自动实现敏感信息过滤	        博客系统可以对一些含有敏感词汇的博文进行屏蔽，删除等处理操作	                    管理员
4.3.	非功能性需求
1)	系统可以为用户提供较快的响应速度，页面加载速度不应该超过10秒。
2)	系统无明显的安全漏洞，包括SQL注入和XSS跨站脚本注入
3)	系统应该兼容响应式布局
4)	系统应该具有较好的可扩展性和可维护性


5.项目代码注意事项(重要，影响运行)
application-servlet.xml必须同时包含于文件夹/niit/WebContent/WEB-INF/classes/和/niit/WebContent/WEB-INF/中，前者可能因为编译被清除，需要手动添加，而且文件夹/niit/WebContent/WEB-INF/classes/中的application-servlet.xml文件需删去一行代码<context:component-scan base-package="com.blog.*" > </context:component-scan>，后者不能删除这行
