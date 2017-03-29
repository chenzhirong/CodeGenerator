package ${basePackage}.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import ${basePackage}.beans.${table.className?substring(1)};


public interface ${table.className?substring(1)}Service{
	
	/**
	 * 查询List
	 */
	public List<${table.className?substring(1)}> queryAllList();
	
	/**
	 * 查询所有List对象
	 * @param hql HSQL语句
	 * @param param MAP条件
	 * @param entityClass 对象类型
	 * @return
	 */
	public List<${table.className?substring(1)}> queryList(String hql, Map<String, ?> param);
	
	/**
	 * 保存单个实体对象
	 * @param object 实体对象
	 * @return 返回Serializable
	 */
	public Serializable save(Object entity);
	
	/**
	 * 删除单个实体对象
	 * @param entity
	 */
	public void delete(Object entity);
	
	/**
	 * 修改单个实体对象
	 * @param entity
	 */
	public void update(Object entity);
	
	/**
	 * 根据ID查询对象
	 * @param id
	 * @param entityClass
	 * @return
	 */
	public ${table.className?substring(1)} queryById(Long id);
	
}
