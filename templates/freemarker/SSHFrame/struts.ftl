<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE struts PUBLIC
    "-//Apache Software Foundation//DTD Struts Configuration 2.0//EN"
    "http://struts.apache.org/dtds/struts-2.0.dtd">
<struts>

	<!-- 银行卡 -->
	<package name="${table.className?substring(1)?uncap_first}" extends="json-default" namespace="/${table.className?substring(1)?lower_case}">
	    
		<action name="${table.className?substring(1)?uncap_first}" class="${table.className?substring(1)?uncap_first}Action" method="${table.className?substring(1)?uncap_first}">
			<result name="ok">/WEB-INF/page/bank/${table.className?substring(1)?lower_case}/${table.className?substring(1)?lower_case}.jsp</result>
		</action>
		
		<!-- 查询 -->
		<action name="query${table.className?substring(1)}" class="${table.className?substring(1)?uncap_first}Action" method="query${table.className?substring(1)}">
			<result name="ok" type="json">
				<param name="root">json</param>
			</result>
		</action>
		
		<!-- 增加 -->
		<action name="add${table.className?substring(1)}" class="${table.className?substring(1)?uncap_first}Action" method="add${table.className?substring(1)}">
		    <result name="ok" type="json">
				<param name="root">msg</param>
			</result>
		</action>
		
		<!-- 修改 -->
		<action name="edit${table.className?substring(1)}" class="${table.className?substring(1)?uncap_first}Action" method="edit${table.className?substring(1)}">
		    <result name="ok" type="json">
				<param name="root">msg</param>
			</result>
		</action>
		
		<!-- 删除 -->
		<action name="del${table.className?substring(1)}" class="${table.className?substring(1)?uncap_first}Action" method="del${table.className?substring(1)}">
		    <result name="ok" type="json">
				<param name="root">msg</param>
			</result>
		</action>
	</package>

</struts>



