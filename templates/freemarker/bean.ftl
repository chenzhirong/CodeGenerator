package ${basePackage}.domain;

<#if (table.hasDateColumn)>
import java.util.Date;
</#if>
<#if (table.hasBigDecimalColumn)>
import java.math.BigDecimal;
</#if>
import java.io.Serializable;
import java.lang.Long;
import hc.sys.domain.BaseBean;

 /**  
 * @Title:  ${table.remarks}
 * @Description:${table.remarks}
 * @author: chenzhirong  
 * @date:${.now}
 * @version V1.0
 */  
public class ${table.className} extends BaseBean implements Serializable {

<#list table.primaryKeys as key>
    /** ${key.columnName} - ${key.remarks} */
    private ${key.javaType} ${key.javaProperty};
</#list>

<#list table.baseColumns as column>

    /** ${column.columnName} - ${column.remarks} */
    <#if (!column.nullable)> //是否可空
        <#if (column.isString())>
    @NotEmpty
        <#else>
    @NotNull
        </#if>
    </#if>
private ${column.javaType} ${column.javaProperty};
</#list>

<#list table.primaryKeys as key>

    public ${key.javaType} ${key.getterMethodName}(){
        return this.${key.javaProperty};
    }
    public void ${key.setterMethodName}(${key.javaType} ${key.javaProperty}){
        this.${key.javaProperty} = ${key.javaProperty};
    }
</#list>
<#list table.baseColumns as column>

    public ${column.javaType} ${column.getterMethodName}(){
        return this.${column.javaProperty};
    }
    public void ${column.setterMethodName}(${column.javaType} ${column.javaProperty}){
        this.${column.javaProperty} = ${column.javaProperty};
    }
</#list>
}