package ${basePackage}.domain;

<#if (table.hasDateColumn)>
import java.util.Date;
</#if>
<#if (table.hasBigDecimalColumn)>
import java.math.BigDecimal;
</#if>
import hc.core.mybatis.mz.page.Page;
import java.util.ArrayList;
import java.util.List;
import java.lang.Long;
import java.util.Iterator;

/**  
 * @Title:  ${table.remarks}
 * @Description:${table.remarks}
 * @author: chenzhirong  
 * @date:${.now}
 * @version V1.0
 */ 
public class ${table.className}Example {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    private Page page;

    public ${table.className}Example() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    public void setPage(Page page) {
        this.page=page;
    }

    public Page getPage() {
        return page;
    }

    /*
     * 生成 GeneratedCriteria
     * @author chenzhirong
     *
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }
        
        //日期
        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        /**
        *主键
        **/
        
        <#list table.primaryKeys as key>
        /** ${key.columnName} - ${key.remarks} */
        // private ${key.javaType} ${key.javaProperty};

        public Criteria and${column.javaProperty?cap_first}IsNull() {
            addCriterion("${key.columnName} is null");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}IsNotNull() {
            addCriterion("${key.columnName} is not null");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}EqualTo(Integer value) {
            addCriterion("${key.columnName} =", value, "${key.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}NotEqualTo(Integer value) {
            addCriterion("${key.columnName} <>", value, "${key.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}GreaterThan(Integer value) {
            addCriterion("${key.columnName} >", value, "${key.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}GreaterThanOrEqualTo(Integer value) {
            addCriterion("${key.columnName} >=", value, "${key.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}LessThan(Integer value) {
            addCriterion("${key.columnName} <", value, "${key.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}LessThanOrEqualTo(Integer value) {
            addCriterion("${key.columnName} <=", value, "${key.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}In(List<Integer> values) {
            addCriterion("${key.columnName} in", values, "${key.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}NotIn(List<Integer> values) {
            addCriterion("${key.columnName} not in", values, "${key.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}Between(Integer value1, Integer value2) {
            addCriterion("${key.columnName} between", value1, value2, "${key.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}NotBetween(Integer value1, Integer value2) {
            addCriterion("${key.columnName} not between", value1, value2, "${key.javaProperty}");
            return (Criteria) this;
        }
        
        </#list>
        
        
        /** column.columnName=${column.columnName} - ${column.remarks}  大写 */ 
        /** ${column.javaType} column.javaProperty=${column.javaProperty}; 小写 */
        
        <#list table.baseColumns as column>
        //String

        <#if (column.isString())>
            public Criteria and${column.javaProperty?cap_first}IsNull() {
            addCriterion("${column.columnName} is null");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}IsNotNull() {
            addCriterion("${column.columnName} is not null");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}EqualTo(String value) {
            addCriterion("${column.columnName} =", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}NotEqualTo(String value) {
            addCriterion("${column.columnName} <>", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}GreaterThan(String value) {
            addCriterion("${column.columnName} >", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}GreaterThanOrEqualTo(String value) {
            addCriterion("${column.columnName} >=", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}LessThan(String value) {
            addCriterion("${column.columnName} <", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}LessThanOrEqualTo(String value) {
            addCriterion("${column.columnName} <=", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}Like(String value) {
            addCriterion("${column.columnName} like", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}NotLike(String value) {
            addCriterion("${column.columnName} not like", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}In(List<String> values) {
            addCriterion("${column.columnName} in", values, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}NotIn(List<String> values) {
            addCriterion("${column.columnName} not in", values, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}Between(String value1, String value2) {
            addCriterion("${column.columnName} between", value1, value2, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}NotBetween(String value1, String value2) {
            addCriterion("${column.columnName} not between", value1, value2, "${column.javaProperty}");
            return (Criteria) this;
        }
        
        </#if>
        
        <#if (column.isDate())>
        //日期 date
        
        public Criteria and${column.javaProperty?cap_first}IsNull() {
            addCriterion("${column.columnName} is null");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}IsNotNull() {
            addCriterion("${column.columnName} is not null");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}EqualTo(Date value) {
            addCriterionForJDBCDate("${column.columnName} =", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}NotEqualTo(Date value) {
            addCriterionForJDBCDate("${column.columnName} <>", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}GreaterThan(Date value) {
            addCriterionForJDBCDate("${column.columnName} >", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}GreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("${column.columnName} >=", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}LessThan(Date value) {
            addCriterionForJDBCDate("${column.columnName} <", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}LessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("${column.columnName} <=", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}In(List<Date> values) {
            addCriterionForJDBCDate("${column.columnName} in", values, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}NotIn(List<Date> values) {
            addCriterionForJDBCDate("${column.columnName} not in", values, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}Between(Date value1, Date value2) {
            addCriterionForJDBCDate("${column.columnName} between", value1, value2, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}NotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("${column.columnName} not between", value1, value2, "${column.javaProperty}");
            return (Criteria) this;
        }
        </#if>
        
        //是否是整型，含Byte、Short、Integer、Long
        <#if (column.isIntegerNumber())>
        
        public Criteria and${column.javaProperty?cap_first}IsNull() {
            addCriterion("${column.columnName} is null");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}IsNotNull() {
            addCriterion("${column.columnName} is not null");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}EqualTo(Long value) {
            addCriterion("${column.columnName} =", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}NotEqualTo(Long value) {
            addCriterion("${column.columnName} <>", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}GreaterThan(Long value) {
            addCriterion("${column.columnName} >", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}GreaterThanOrEqualTo(Long value) {
            addCriterion("${column.columnName} >=", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}LessThan(Long value) {
            addCriterion("${column.columnName} <", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}LessThanOrEqualTo(Long value) {
            addCriterion("${column.columnName} <=", value, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}In(List<Long> values) {
            addCriterion("${column.columnName} in", values, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}NotIn(List<Long> values) {
            addCriterion("${column.columnName} not in", values, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}Between(Long value1, Long value2) {
            addCriterion("${column.columnName} between", value1, value2, "${column.javaProperty}");
            return (Criteria) this;
        }

        public Criteria and${column.javaProperty?cap_first}NotBetween(Long value1, Long value2) {
            addCriterion("${column.columnName} not between", value1, value2, "${column.javaProperty}");
            return (Criteria) this;
        }
        </#if>
       
       </#list>
    }
    
    /**
     * Criteria
     * @author chenzhirong
     *
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * Criteria
     * @author chenzhirong
     *
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}