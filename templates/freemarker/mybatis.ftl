<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${basePackage}.dao.${table.className}Mapper" >
  <resultMap id="BaseResultMap" type="${basePackage}.domain.${table.className}" >
  
  <!-- 主键  -->
  <#list table.primaryKeys as key>
    <id column="${key.columnName}" property="${key.javaProperty}" jdbcType="DECIMAL" />
  </#list>

<!-- 字段 -->
<#list table.baseColumns as column>
<#if (column.isIntegerNumber())>
<result column="${column.columnName}" property="${column.javaProperty}" jdbcType="DECIMAL" />
</#if>
<#if (column.isDate())>
<result column="${column.columnName}" property="${column.javaProperty}" jdbcType="DATE" />
</#if>
<#if (column.isString())>
<result column="${column.columnName}" property="${column.javaProperty}" jdbcType="VARCHAR" />
</#if>
</#list>

<!-- 定义变量 -->
<#assign douhao="#">
  </resultMap>
  <sql id="Example_Where_Clause" >
    <where >
      <foreach collection="oredCriteria" item="criteria" separator="or" >
        <if test="criteria.valid" >
          <trim prefix="(" suffix=")" prefixOverrides="and" >
            <foreach collection="criteria.criteria" item="criterion" >
              <choose >
                <when test="criterion.noValue" >
                  and ${criterion.condition}
                </when>
                <when test="criterion.singleValue" >
                  and ${criterion.condition} ${douhao}{criterion.value}
                </when>
                <when test="criterion.betweenValue" >
                  and ${criterion.condition} ${douhao}{criterion.value} and ${douhao}{criterion.secondValue}
                </when>
                <when test="criterion.listValue" >
                  and ${criterion.condition}
                  <foreach collection="criterion.value" item="listItem" open="(" close=")" separator="," >
                    ${douhao}{listItem}
                  </foreach>
                </when>
              </choose>
            </foreach>
          </trim>
        </if>
      </foreach>
    </where>
  </sql>
  <sql id="Update_By_Example_Where_Clause" >
    <where >
      <foreach collection="example.oredCriteria" item="criteria" separator="or" >
        <if test="criteria.valid" >
          <trim prefix="(" suffix=")" prefixOverrides="and" >
            <foreach collection="criteria.criteria" item="criterion" >
              <choose >
                <when test="criterion.noValue" >
                  and ${criterion.condition}
                </when>
                <when test="criterion.singleValue" >
                  and ${criterion.condition} ${douhao}{criterion.value}
                </when>
                <when test="criterion.betweenValue" >
                  and ${criterion.condition} ${douhao}{criterion.value} and ${douhao}{criterion.secondValue}
                </when>
                <when test="criterion.listValue" >
                  and ${criterion.condition}
                  <foreach collection="criterion.value" item="listItem" open="(" close=")" separator="," >
                    ${douhao}{listItem}
                  </foreach>
                </when>
              </choose>
            </foreach>
          </trim>
        </if>
      </foreach>
    </where>
  </sql>
  <sql id="Base_Column_List" >
  <#list table.primaryKeys as key>
  ${key.columnName}<#if column_has_next>,</#if>
  </#list>
  ,
  <#list table.baseColumns as column>
    ${column.columnName}
    <#if column_has_next>,</#if>
  </#list>
  </sql>
  <select id="selectByExample" resultMap="BaseResultMap" parameterType="${basePackage}.domain.${table.className}Example" >
    select
    <if test="distinct" >
      distinct
    </if>
    <include refid="Base_Column_List" />
    from ${table.tableName}
    <if test="_parameter != null" >
      <include refid="Example_Where_Clause" />
    </if>
    <if test="orderByClause != null" >
      order by ${orderByClause}
    </if>
  </select>
  <select id="selectByPrimaryKey" resultMap="BaseResultMap" parameterType="java.lang.Long" >
    select 
    <include refid="Base_Column_List" />
    from ${table.tableName}
    where OBJID = ${douhao}{objid,jdbcType=DECIMAL}
  </select>
  <delete id="deleteByPrimaryKey" parameterType="java.lang.Long" >
    delete from ${table.tableName}
    where OBJID = ${douhao}{objid,jdbcType=DECIMAL}
  </delete>
  <delete id="deleteByExample" parameterType="${basePackage}.domain.${table.className}Example" >
    delete from ${table.tableName}
    <if test="_parameter != null" >
      <include refid="Example_Where_Clause" />
    </if>
  </delete>
  <insert id="insert" parameterType="${basePackage}.domain.${table.className}" >
    insert into ${table.tableName} 
    (
    <#list table.primaryKeys as key>
    ${key.javaProperty},
    </#list>
    <#list table.baseColumns as column>
      ${column.javaProperty}<#if column_has_next>,</#if>
   </#list>
    )
    values (${douhao}{objid,jdbcType=DECIMAL},
    <#list table.baseColumns as column>
      <#if (column.isDate())>
    ${douhao}{${column.javaProperty} ,jdbcType=DATE}<#if column_has_next>,</#if>
     </#if>
    <#if (column.isString())>
    ${douhao}{${column.javaProperty} ,jdbcType=VARCHAR}<#if column_has_next>,</#if>
    </#if>
    <#if (column.isIntegerNumber())>
     ${douhao}{${column.javaProperty} ,jdbcType=DECIMAL}<#if column_has_next>,</#if>
     </#if>
    </#list> 
  </insert>
  <insert id="insertSelective" parameterType="${basePackage}.domain.${table.className}" >
    insert into ${table.tableName}
    <trim prefix="(" suffix=")" suffixOverrides="," >
    OBJID,
    <#list table.baseColumns as column>
      <if test="${column.javaProperty} != null" >
        ${column.columnName},
      </if>
    </#list>
    </trim>
    
    <trim prefix="values (" suffix=")" suffixOverrides="," >
       CZR_SEQ.nextval,
      <#list table.baseColumns as column>
      <#if (column.isDate())>
         <if test="${column.javaProperty} != null" >
             ${douhao}{${column.javaProperty},jdbcType=DATE},
         </if>
      </#if>
      <#if (column.isString())>
         <if test="${column.javaProperty} != null" >
             ${douhao}{${column.javaProperty},jdbcType=VARCHAR},
         </if>
      </#if>
      <#if (column.isIntegerNumber())>
         <if test="${column.javaProperty} != null" >
             ${douhao}{${column.javaProperty},jdbcType=DECIMAL},
         </if>
      </#if>
     </#list>
    </trim>
    
  </insert>
  <select id="countByExample" parameterType="${basePackage}.domain.${table.className}Example" resultType="java.lang.Long" >
    select count(*) from ${table.tableName}
    <if test="_parameter != null" >
      <include refid="Example_Where_Clause" />
    </if>
  </select>
  <update id="updateByExampleSelective" parameterType="map" >
    update ${table.tableName}
    <set >
    
    <#list table.primaryKeys as key>
      <if test="record.${key.javaProperty} != null" >
        OBJID = ${douhao}{record.${key.javaProperty},jdbcType=DECIMAL},
      </if>
    </#list>
    
    <#list table.baseColumns as column>
      <#if (column.isDate())>
           <if test="record.columnname != null" >
              ${column.columnName} = ${douhao}{record.${column.javaProperty},jdbcType=DATE},
          </if>
     </#if>
     <#if (column.isString())>
          <if test="record.columnname != null" >
              ${column.columnName} = ${douhao}{record.${column.javaProperty},jdbcType=VARCHAR},
          </if>
     </#if>
     <#if (column.isIntegerNumber())>
          <if test="record.columnname != null" >
              ${column.columnName} = ${douhao}{record.${column.javaProperty},jdbcType=DECIMAL},
          </if>
     </#if>
    </#list>
    </set>
    <if test="_parameter != null" >
      <include refid="Update_By_Example_Where_Clause" />
    </if>
  </update>
  
  <!-- 更新 -->
  <update id="updateByExample" parameterType="map" >
    update ${table.tableName}
    set 
      <#list table.primaryKeys as key>
      <if test="record.${key.javaProperty} != null" >
        ${key.columnName} = ${douhao}{record.${key.javaProperty},jdbcType=DECIMAL},
      </if>
    </#list>
    
    <#list table.baseColumns as column>
      <#if (column.isDate())>
           <if test="record.columnname != null" >
           ${column.columnName} = ${douhao}{record.${column.javaProperty},jdbcType=DATE}<#if column_has_next>,</#if>
          </if>
     </#if>
     <#if (column.isString())>
          <if test="record.columnname != null" >
              ${column.columnName} = ${douhao}{record.${column.javaProperty},jdbcType=VARCHAR}<#if column_has_next>,</#if>
          </if>
     </#if>
     <#if (column.isIntegerNumber())>
          <if test="record.columnname != null" >
          <!-- andy -->
              ${column.columnName} = ${douhao}{record.${column.javaProperty},jdbcType=DECIMAL}<#if column_has_next>,</#if>
          </if>
     </#if>
    </#list>
    <if test="_parameter != null" >
      <include refid="Update_By_Example_Where_Clause" />
    </if>
  </update>
  
  <update id="updateByPrimaryKeySelective" parameterType="${basePackage}.domain.${table.className}" >
    update ${table.tableName}
    <set >
    <#list table.baseColumns as column>
      <#if (column.isDate())>
           <if test="${column.javaProperty} != null" >
               ${column.columnName} = ${douhao}{${column.javaProperty},jdbcType=DATE}<#if column_has_next>,</#if>
           </if>
     </#if>
     <#if (column.isString())>
          <if test="${column.javaProperty} != null" >
               ${column.columnName} = ${douhao}{${column.javaProperty},jdbcType=VARCHAR}<#if column_has_next>,</#if>
           </if>
     </#if>
     <#if (column.isIntegerNumber())>
          <if test="${column.javaProperty} != null" >
               ${column.columnName} = ${douhao}{${column.javaProperty},jdbcType=DECIMAL}<#if column_has_next>,</#if>
           </if>
     </#if>
    </#list>
    </set>
    where OBJID = ${douhao}{objid,jdbcType=DECIMAL}
  </update>
  
  
  <update id="updateByPrimaryKey" parameterType="${basePackage}.domain.${table.className}" >
    update ${table.tableName}
    set 
    <#list table.baseColumns as column>
      <#if (column.isDate())>
          ${column.columnName} = ${douhao}{${column.javaProperty},jdbcType=DATE},<#if column_has_next>,</#if>
     </#if>
     <#if (column.isString())>
          ${column.columnName} = ${douhao}{${column.javaProperty},jdbcType=VARCHAR},<#if column_has_next>,</#if>
     </#if>
     <#if (column.isIntegerNumber())>
          ${column.columnName} = ${douhao}{${column.javaProperty},jdbcType=DECIMAL},<#if column_has_next>,</#if>
     </#if>
    </#list>
    where OBJID = ${douhao}{objid,jdbcType=DECIMAL}
  </update>
  
  <select resultMap="BaseResultMap" parameterType="${basePackage}.domain.${table.className}Example" id="queryPageByExample" >
    select
    <if test="distinct" >
      distinct
    </if>
    <include refid="Base_Column_List" />
    from ${table.tableName}
    <if test="_parameter != null" >
      <include refid="Example_Where_Clause" />
    </if>
    <if test="orderByClause != null" >
      order by ${orderByClause}
    </if>
  </select>
</mapper>