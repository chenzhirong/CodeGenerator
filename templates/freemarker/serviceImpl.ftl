package ${basePackage}.service.impl;

import hc.sys.util.CodeGenUtil;
import java.util.List;
import hc.zb.dao.${table.className}Mapper;
import hc.zb.domain.${table.className};
import hc.zb.domain.${table.className}Example;
import hc.zb.service.${table.className}Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**  
 * @Title:  ${table.remarks}
 * @Description:${table.remarks}
 * @author: chenzhirong  
 * @date:${.now}
 * @version V1.0
 */ 
@Service
public class ${table.className}ServiceImpl implements ${table.className}Service {
	
	@Autowired
	private ${table.className}Mapper dao;

	@Autowired
	private CodeGenUtil gen;

	public long getId() {
		return Long.parseLong(gen.genNextId("zb_column"));
	}

    public int deleteByExample(${table.className}Example example){
    	return dao.deleteByExample(example);
    }

    public int deleteByPrimaryKey(Long id){
    	return dao.deleteByPrimaryKey(id);
    }

    public int insertSelective(${table.className} record){
    	return dao.insertSelective(record);
    }

    public List< ${table.className}> queryPageByExample(${table.className}Example example){
    	return dao.queryPageByExample(example);
    }

    public List< ${table.className}> selectByExample(${table.className}Example example){
    	return dao.selectByExample(example);
    }

    public ${table.className} selectByPrimaryKey(Long id){
    	return dao.selectByPrimaryKey(id);
    }

    public int updateByExampleSelective(${table.className} record, ${table.className}Example example){
    	return dao.updateByExampleSelective(record, example);
    }

    public int updateByPrimaryKeySelective(${table.className} record){
    	return dao.updateByPrimaryKeySelective(record);
    }
    
}
