$(function(){
	$('#dg').datagrid({
		url: URL+'/${table.className?substring(1)?lower_case}/query${table.className?substring(1)}.action',
		rownumbers : true,
		pagination : true,
		autoRowHeight : true,
		singleSelect : true,
		pageSize : 20,
		pageList : [ 20, 30, 40, 50],
		fitColumns:true,
		fit:true,
		sortable:true,
		sortOrder:'asc',
		sortName:'createtime',
		toolbar:'#toolbar',
		columns:[[
		    {field:'objId',title:'objId',width:140,align:'center',hidden:true},
			<#list table.baseColumns as column>
		    {field:'${column.javaProperty}',title:'${column.remarks}',width:140,align:'center'}<#if column_has_next>,</#if>
			</#list>
		]]
	});
	
})


    var url ="";
	function addDlg(){
        $('#dlg').dialog('open').dialog('center').dialog('setTitle','${table.remarks}');
        $('#fm').form('clear');
        url = URL+'/${table.className?substring(1)?lower_case}/add${table.className?substring(1)}.action';
    }
    
    function editDlg(){
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $('#dlg').dialog('open').dialog('center').dialog('setTitle','${table.remarks}');
            $('#fm').form('load',row);
            url = URL+'/${table.className?substring(1)?lower_case}/edit${table.className?substring(1)}.action';
        }
    }
	
	//保存
    function saveDlg(){
    <#list table.baseColumns as column>
     <#if (column.isString())>
          var ${column.javaProperty} = $('#${column.javaProperty}').combobox('getValue');
     </#if>
     <#if (column.isIntegerNumber())>
     var ${column.javaProperty} = $("#${column.javaProperty}").numberbox('getValue');
     </#if>
    </#list>
	    var param = {
	    <#list table.baseColumns as column>
	        'param.${column.javaProperty}':${column.javaProperty}<#if column_has_next>,</#if>
        </#list>
	    };
    	
    	$.axse(url,param,function(result){
            if(result.msgCode==0){
            	$.messager.show({
                    title: 'Error',
                    msg: result.errorMsg
                });
            }
            else{
            	$('#dlg').dialog('close');
                $('#dg').datagrid('reload'); 
            }
        },
        function(){
            layer.msg('网络错误，请联系管理员');
        });
    }
    
    function del(){
        var row = $('#dg').datagrid('getSelected');
        if (row){
            $.messager.confirm('Confirm','确认删除?',function(r){
                if (r){
                    $.post(URL+'/${table.className?substring(1)?lower_case}/del${table.className?substring(1)}.action',{'param.objId':row.objId},function(result){
                        if (result.msgCode==1){
                            $('#dg').datagrid('reload');
                        } else {
                            $.messager.show({
                                title: 'Error',
                                msg: result.errorMsg
                            });
                        }
                    },'json');
                }
            });
        }
    }
