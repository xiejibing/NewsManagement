# NewsManagement
公司门户网站后台新闻管理系统（SSM, tomcat, Ueditor, Jquery, bootstrap) <br>
## 1.配置说明:<br>
* 数据库： Mysql 8.0.19  
* IDE: Idea2019
* 框架：SSM(spring springMVC Mybatis)
* 项目管理工具：Maven
* 本地运行需要需改动的配置说明：  
1.jdbclocal.properties,把里面改成自己的数据库信息  
     ```
     jdbc.driver = com.mysql.cj.jdbc.Driver    
     jdbc.url = jdbc:mysql://localhost:3306/db_baosi?serverTimezone=Asia/Shanghai&useUnicode=true&characterEncoding=utf8&useSSL=true
     jdbc.username = yourname  
     jdbc.password = yourpassword
     ```  
2. dao操作的相关信息也要根据自己的数据库进行相应的修改  
3.我是把项目部署再tomcat的根目录下的，所以如果不部署到根目录下会出现资源加载失败的问题  
4.创建数据库的sql语句在文件家的sql中  
5.登录账号：admin  密码：1234  
## 2. 运行效果  
本项目侧重于后端，所以前端没做，支持新闻的增删改查，预览（相当于前端的回显）
![主页](https://github.com/xiejibing/NewsManagement/blob/master/AjaxJson2/image/主页.JPG)















