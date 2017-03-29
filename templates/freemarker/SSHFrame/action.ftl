package ${basePackage}.action;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import com.czr.frame.beans.${table.className?substring(1)};
import com.czr.frame.service.${table.className?substring(1)}Service;
import com.czr.frame.util.dao.HqlDao;
import com.czr.web.common.ReturnMsg;

/**
 * 银行卡
 * @author: chenzhirong
 * @date: 2017年3月29日 上午10:32:36
 * @version: V1.0
 */
public class ${table.className?substring(1)}Action {

	private ${table.className?substring(1)} param;

	private Object json;
	
	private ${table.className?substring(1)}Service ${table.className?substring(1)?uncap_first}Service;
	
	public ${table.className?substring(1)}Service get${table.className?substring(1)}Service() {
		return ${table.className?substring(1)?uncap_first}Service;
	}

	public void set${table.className?substring(1)}Service(${table.className?substring(1)}Service ${table.className?substring(1)?uncap_first}Service) {
		this.${table.className?substring(1)?uncap_first}Service = ${table.className?substring(1)?uncap_first}Service;
	}

	public ${table.className?substring(1)} getParam() {
		return param;
	}

	public void setParam(${table.className?substring(1)} param) {
		this.param = param;
	}
	
	public Object getJson() {
		return json;
	}

	public void setJson(Object json) {
		this.json = json;
	}
	
    private ReturnMsg msg;
	
	public ReturnMsg getMsg() {
		return msg;
	}

	public void setMsg(ReturnMsg msg) {
		this.msg = msg;
	}
	
	/**
	 * 显示银行卡列表
	 * @return
	 */
	public String ${table.className?substring(1)?uncap_first}() {
		return "ok";
	}

	/**
	 * 查询银行卡List
	 * 
	 * @return
	 */
	public String query${table.className?substring(1)}() {
		List<${table.className?substring(1)}> list = ${table.className?substring(1)?uncap_first}Service.queryAllList();
		json = list;
		return "ok";
	}
	
	/**
	 * 增加银行卡
	 * @return
	 */
	public String add${table.className?substring(1)}() {
		Serializable s = ${table.className?substring(1)?uncap_first}Service.save(param);
		if(s != null){
			msg = new ReturnMsg("1", "成功");
		}else{
			msg = new ReturnMsg("0", "失败");
		}
		return "ok";
	}
	
	/**
	 * 修改银行卡
	 * @return
	 */
	public String edit${table.className?substring(1)}() {
		${table.className?substring(1)} ${table.className?substring(1)?uncap_first} = (${table.className?substring(1)})${table.className?substring(1)?uncap_first}Service.queryById(param.getObjId());
		${table.className?substring(1)?uncap_first}Service.update(${table.className?substring(1)?uncap_first});
		msg = new ReturnMsg("1", "成功");
		return "ok";
	}
	
	
	/**
	 * 删除银行卡
	 * @return
	 */
	public String del${table.className?substring(1)}(){
		${table.className?substring(1)?uncap_first}Service.delete(param);
		msg = new ReturnMsg("1", "成功");
		return "ok";
	}
	
}
