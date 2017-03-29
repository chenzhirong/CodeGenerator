<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xsi:schemaLocation="http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans.xsd">
        
	
	<!--dao -->
	<bean id="${table.className?substring(1)?uncap_first}Dao" class="com.czr.frame.dao.Impl.${table.className?substring(1)}DaoImpl">
	    <property name="sessionFactory" ref="sessionFactory" />
	</bean>
	<!--service -->
	<bean id="${table.className?substring(1)?uncap_first}Service" class="com.czr.frame.service.Impl.${table.className?substring(1)}ServiceImpl">
	      <property name="${table.className?substring(1)?uncap_first}Dao" ref="${table.className?substring(1)?uncap_first}Dao" />
	</bean>
	<!-- action -->
	<bean id="${table.className?substring(1)?uncap_first}Action" class="com.czr.frame.action.${table.className?substring(1)}Action">
	      <property name="${table.className?substring(1)?uncap_first}Service" ref="${table.className?substring(1)?uncap_first}Service" />
	</bean>

</beans>