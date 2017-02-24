package ${basePackage}.service;

import hc.zb.domain.${table.className};
import hc.zb.domain.${table.className}Example;
import java.util.List;

/**  
 * @Title:  ${table.remarks}
 * @Description:${table.remarks}
 * @author: chenzhirong  
 * @date:${.now}
 * @version V1.0
 */  
public interface ${table.className}Service {

    int deleteByExample(${table.className}Example example);

    int deleteByPrimaryKey(Long id);

    int insertSelective(${table.className} record);

    List< ${table.className}> queryPageByExample(${table.className}Example example);

    List< ${table.className}> selectByExample(${table.className}Example example);

    ${table.className} selectByPrimaryKey(Long id);

    int updateByExampleSelective(${table.className} record, ${table.className}Example example);

    int updateByPrimaryKeySelective(${table.className} record);
    
}
