# samplingsystem
采集管理系统

运行环境
jdk8+mysql+IntelliJ IDEA+maven

项目技术
spring+springboot+mybatis+layui+jquery

步骤
1.将项目导入到开发工具IDEA中
2.将数据库脚本语句粘贴至mysql工具中，并执行导入
3.noteblogv4\application-noteblogv4.properties配置文件，修改第29-33行，改为自己的数据库连接地址
4.run as启动noteblogv4\src\main\java\me\wuwenbin\noteblogv4\NoteBlogV4Application.java文件，运行springboot项目
5.浏览器访问地址http://localhost:8089 ，进入博客主页，进入会员中心->后台管理,账户admin  密码111111 ，即可进入博客后台管理


注:如遇到数据库脚本导入失败，请使用mysql5.7版本
项目需要maven支持，需提前配置好springboot项目所需环境方可运行
