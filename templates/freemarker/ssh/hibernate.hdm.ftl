<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE hibernate-mapping PUBLIC "-//Hibernate/Hibernate Mapping DTD 3.0//EN"
"http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd">

<hibernate-mapping>
    <class name="com.czr.frame.beans.${table.className?substring(1)}" table="${table.tableName}">
        <comment>${table.tableAlias}</comment>
        <id name="objId" type="java.lang.Long">
            <column name="OBJ_ID" precision="16" scale="0" />
            <generator class="sequence">
                <param name="sequence">SEQ_OBJ_ID</param>
            </generator>
        </id>
<#list table.baseColumns as column>
      <#if (column.isDate())>
         <property name="${column.javaProperty}" type="java.util.Date">
            <column name="${column.columnName}" length="${Column.size}">
                <comment>${column.remarks}</comment>
            </column>
        </property>
     </#if>
     <#if (column.isString())>
         <property name="${column.javaProperty}" type="java.lang.String">
            <column name="${column.columnName}" length="${Column.size}">
                <comment>${column.remarks}</comment>
            </column>
        </property>
     </#if>
     <#if (column.isIntegerNumber())>
         <property name="${column.javaProperty}" type="java.util.Long">
            <column name="${column.columnName}" length="${Column.size}">
                <comment>${column.remarks}</comment>
            </column>
        </property>
     </#if>
</#list>
    </class>
</hibernate-mapping>
