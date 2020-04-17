## 一个简单的ssm框架整合案例

主要是实现了普通的增删改查功能，还实现了一些其他的功能，比如前端，ajax，后端三重校验，由于比较小，我就大致说一下流程。自己租了服务器，效果可以直接访问 http://59.110.45.0:8080/ssm-crud/ ，但不知道什么时候不再续费了，所以参考的时候可能没用。



### 一.开发环境

IDEA开发工具，Maven项目管理工具，Mysql5.0，Tomcat8.5

Spring，SpringMVC，Mybatis框架。

### 二.开发流程

#### 1.pom.xml	

​	先写pom.xml文件，可以导入一些必须要用的依赖，以便在写配置文件时，可以有提示。

#### 2.web.xml 

​	web.xml 文件主要配置其他配置文件的路径，过滤器等。

#### 3.dispatcherServlet-servlet.xml

​	把SpringMVC的配置文件先配好，里面的内容比较少。

#### 4.applicationContext.xml

​	spring的配置文件，主要配置和业务逻辑有关的	说明:配置数据源时所需的属性值可以另外写到属性文件中，可以新建一个dbconfig.properties,看个人需要。

##### 5.mybatis.xml

​	mybatis.xml文件的一些配置，设置命名规则，引入插件（用的时候再引入)

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE configuration
  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
  "http://mybatis.org/dtd/mybatis-3-config.dtd">

<configuration>
	<!--开启驼峰命名规则  -->
	<settings>
		<setting name="mapUnderscoreToCamelCase" value="true"></setting>
	</settings>
	<!--别名的设置  -->
	<typeAliases>
		<package name="com.zuoluwo.crud.bean" />
	</typeAliases>

	<!--引入插件  -->
	<plugins>
		<!-- com.github.pagehelper为PageHelper类所在包名 -->
		<plugin interceptor="com.github.pagehelper.PageInterceptor">
			<!-- 请求页面的合理化，即使请求一个不存在的页面，也不会出现意外的页码 -->
			<property name="reasonable" value="true"/>

		</plugin>
	</plugins>
	
</configuration>

```



#### 6.数据库设计

​	数据库设计尽可能详尽，因为我用的是mybatis的逆向工程来生成pojo，dao

#### 7.逆向工程generator的配置文件

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE generatorConfiguration
        PUBLIC "-//mybatis.org//DTD MyBatis Generator Configuration 1.0//EN"
        "http://mybatis.org/dtd/mybatis-generator-config_1_0.dtd">

<generatorConfiguration>
   <properties resource="classpath:dbconfig.properties"/>
    <context id="my" targetRuntime="MyBatis3">
    	<!-- 注释生成器，true 没有注释， false 有注释 -->
        <commentGenerator>
           
            <property name="suppressAllComments" value="true"/>
        </commentGenerator>
		<!-- 配置数据库连接信息 -->
        <jdbcConnection driverClass="${jdbc.driverClass}"
                        connectionURL="${jdbc.jdbcUrl}"
                        userId="${jdbc.user}"
                        password="${jdbc.password}"/>

		<!-- 指定JavaBean生成的位置 -->
        <javaModelGenerator targetPackage="com.zuoluwo.crud.bean"
                            targetProject=".\src\main\java">
            <property name="enableSubPackages" value="true"/>
            <property name="trimStrings" value="true"/>
        </javaModelGenerator>
		
		<!-- 指定sql映射文件的生成的位置 -->
        <sqlMapGenerator targetPackage="mapper"
                         targetProject=".\src\main\resources">
            <property name="enableSubPackages" value="true"/>
        </sqlMapGenerator>

		<!-- 指定dao接口生成的位置 -->
        <javaClientGenerator targetPackage="com.zuoluwo.crud.dao"
                             targetProject=".\src\main\java"
                             type="XMLMAPPER">
            <property name="enableSubPackages" value="true"/>
        </javaClientGenerator>

        <!--<table tableName="T_FEE_AGTBILL" domainObjectName="FeeAgentBill"
               enableCountByExample="false" enableUpdateByExample="false"
               enableDeleteByExample="false" enableSelectByExample="false"
               selectByExampleQueryId="false"/>-->
		<!-- 指定每个表的生成策略 -->
        <table tableName="tbl_emp" domainObjectName="Employee"></table>
        <table tableName="tbl_dept" domainObjectName="Department"></table>

    </context>
</generatorConfiguration>
```

#### 8.编写使generator生效的方法

可以随便在一个包里面写，里面的内容大体上是固定的，根据自己的情况，修改路径

```java
package com.zuoluwo.crud.test;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;

public class MbdTest {
	public static void main(String args[]) throws IOException, XMLParserException, InvalidConfigurationException, SQLException, InterruptedException{
		  List<String> warnings = new ArrayList<String>();
	      boolean overwrite = true;
	      File configFile = new File("mbg.xml");	//唯一修改的地方，mbg.xml 就是generator 所必选的配置文件，一般吧这个mbg.xml文件写在pom.xml同一路径下
	      ConfigurationParser cp = new ConfigurationParser(warnings);
	      Configuration config = cp.parseConfiguration(configFile);
	      // 解决IDEA下运行，多个模块路径冲突问题
	    
	     
	      DefaultShellCallback callback = new DefaultShellCallback(overwrite);
	      MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
	      myBatisGenerator.generate(null);

	}
}

```

#### 9.其他

后面的操作基本上代码里面都有，根据自己的需求修改生成的mapper.xml文件，pojo，和dao，自动生成的文件不会帮你把关联的其他表作为属性。所以根据自己的需求更改这些文件。

#### 10.一些注意的地方:

1.使用逆向工程时，如果测试阶段插入中文数据到数据库，中文乱码，在原有的数据库URL加上

?useUnicode=true&amp;characterEncoding=utf8

 注意:utf8不要写成其他格式。

#### 11.基本上就这些，但如果细扣，也有很多值得注意的地方。











