<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>银行卡信息</title>
		<%@ include  file="/WEB-INF/page/public/globalcss.jsp"%>
		<%@ include  file="/WEB-INF/page/public/globaljs.jsp"%>
	</head>
	<body>
		<table id="dg"></table>
		<div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addDlg()">新增</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editDlg()">编辑</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="del()">删除</a>
    </div>
    
    <div id="dlg" class="easyui-dialog" style="width:800px"
            closed="true" buttons="#dlg-buttons">
        <form id="fm" method="post" novalidate style="margin:0;padding:20px 50px">
            <div style="margin-bottom:20px;font-size:14px;border-bottom:1px solid #ccc">银行卡信息</div>
            <input id="objId" name="objId"  type="hidden">
            
            <#list table.baseColumns as column>
     <#if (column.isString())>
            <div style="margin-bottom:10px">
                <input id="${column.javaProperty}" name="${column.javaProperty}" class="easyui-TextBox" label="${column.remarks}" required="true" style="width:100%;">
            </div>
     </#if>
     <#if (column.isIntegerNumber())>
            <div style="margin-bottom:10px">
                 <input id="${column.javaProperty}" name="${column.javaProperty}" class="easyui-numberbox" label="${column.remarks}" required="true" style="width:100%;">
            </div>
     </#if>
    </#list>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveDlg()" style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">关闭</a>
    </div>
    
    
	</body>
	<!-- 定义变量 -->
<#assign myf="$">
	<script>
		var URL = "${myf}{pageContext.request.contextPath}";
	</script>
	<script type="text/javascript" src="${myf}{pageContext.request.contextPath}/res/js/bank/${table.className?substring(1)?lower_case}/${table.className?substring(1)?lower_case}.js"></script>
</html>