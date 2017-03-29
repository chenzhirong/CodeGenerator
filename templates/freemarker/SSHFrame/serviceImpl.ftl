package ${basePackage}.service.Impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import ${basePackage}.beans.${table.className?substring(1)};
import ${basePackage}.dao.${table.className?substring(1)}Dao;
import ${basePackage}.service.${table.className?substring(1)}Service;

public class ${table.className?substring(1)}ServiceImpl implements ${table.className?substring(1)}Service {

	private ${table.className?substring(1)}Dao ${table.className?substring(1)?uncap_first}Dao;

	public ${table.className?substring(1)}Dao get${table.className?substring(1)}Dao() {
		return ${table.className?substring(1)?uncap_first}Dao;
	}

	public void set${table.className?substring(1)}Dao(${table.className?substring(1)}Dao ${table.className?substring(1)?uncap_first}Dao) {
		this.${table.className?substring(1)?uncap_first}Dao = ${table.className?substring(1)?uncap_first}Dao;
	}

	/**
	 * 查询List
	 */
	@Override
	public List<${table.className?substring(1)}> queryAllList() {
		List<${table.className?substring(1)}> list = ${table.className?substring(1)?uncap_first}Dao.queryAllList(${table.className?substring(1)}.class);
		return list;
	}
	
	/**
	 * 查询所有List对象
	 * @param hql HSQL语句
	 * @param param MAP条件
	 * @param entityClass 对象类型
	 * @return
	 */
	@Override
	public List<${table.className?substring(1)}> queryList(String hql, Map<String, ?> param) {
		List<${table.className?substring(1)}> list = ${table.className?substring(1)?uncap_first}Dao.queryList(hql, param, ${table.className?substring(1)}.class);
		return list;
	}
	
	/**
	 * 保存单个实体对象
	 * @param object 实体对象
	 * @return 返回Serializable
	 */
	@Override
	public Serializable save(Object entity){
		Serializable s = ${table.className?substring(1)?uncap_first}Dao.save(entity);
		return s;
	}
	/**
	 * 删除单个实体对象
	 * @param entity
	 */
	@Override
	public void delete(Object entity){
		${table.className?substring(1)?uncap_first}Dao.delete(entity);
	}
	
	/**
	 * 修改单个实体对象
	 * @param entity
	 */
	@Override
	public void update(Object entity){
		${table.className?substring(1)?uncap_first}Dao.update(entity);
	}
	
	/**
	 * 根据ID查询对象
	 * @param id
	 * @param entityClass
	 * @return
	 */
	@Override
	public ${table.className?substring(1)} queryById(Long id){
		${table.className?substring(1)} ${table.className?substring(1)?uncap_first} = ${table.className?substring(1)?uncap_first}Dao.queryById(id, ${table.className?substring(1)}.class);
		return ${table.className?substring(1)?uncap_first};
	}

}
