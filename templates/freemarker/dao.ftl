package ${basePackage}.dao;

import hc.zb.domain.${table.className};
import hc.zb.domain.${table.className}Example;
import java.util.List;
import org.apache.ibatis.annotations.Param;

 /**  
 * @Title:  ${table.tableName}
 * @Package ${basePackage}.dao  
 * @Description:${table.tableName}
 * @author: chenzhirong  
 * @date:${.now}
 * @version V1.0
 */ 
public interface ${table.className}Mapper {
    int countByExample(${table.className}Example example);

    int deleteByExample(${table.className}Example example);

    int insert(${table.className} record);
    
    ${table.className} selectByPrimaryKey(Long id);
    
    int deleteByPrimaryKey(Long id);

    int insertSelective(${table.className} record);

    List<${table.className}> selectByExampleWithBLOBs(${table.className}Example example);

    List<${table.className}> queryPageByExample(${table.className}Example example);

    List<${table.className}> selectByExample(${table.className}Example example);
    
    int updateByPrimaryKeySelective(${table.className} record);
    
    int updateByExample(${table.className} record);

    int updateByExampleSelective(@Param("record") ${table.className} record, @Param("example") ${table.className}Example example);

    int updateByExampleWithBLOBs(@Param("record") ${table.className} record, @Param("example") ${table.className}Example example);

    int updateByExample(@Param("record") ${table.className} record, @Param("example") ${table.className}Example example);
}