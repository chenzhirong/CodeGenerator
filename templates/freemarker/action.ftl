package ${basePackage}.action;

import hc.core.mybatis.mz.page.Page;
import hc.core.util.OptResult;
import hc.core.util.UIPageUtil;
import hc.zb.domain.${table.className};
import hc.zb.domain.${table.className}Example;
import hc.zb.service.${table.className}Service;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

 /**  
 * @Title:  ${table.remarks}
 * @Description:${table.remarks}
 * @author: chenzhirong  
 * @date:${.now}
 * @version V1.0
 */ 
@Controller
@RequestMapping("/zb/${table.className}")
public class ${table.className}Action {

	private static Logger log = LoggerFactory.getLogger(${table.className}Action.class);
	
	@Autowired
	private ${table.className}Service service;
	
	@RequestMapping("/index")
	public String index(){
		return "/zb/${table.className}/${table.className}";
	}
	
	@RequestMapping("/get")
	@ResponseBody
	public ${table.className} get(HttpServletRequest request, Long objid){
		return service.selectByPrimaryKey(objid);
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request, String q){
		UIPageUtil ui = UIPageUtil.getUI(request);
		Page page = ui.createPage(request);
		${table.className}Example example = new ${table.className}Example();
		example.setPage(page);
		List< ${table.className}> list = service.queryPageByExample(example );
		return ui.getData(list, page);
	}
	
	@RequestMapping("/allList")
	@ResponseBody
	public List< ${table.className}> allList(HttpServletRequest request){
		${table.className}Example example = new ${table.className}Example();
		UIPageUtil ui = UIPageUtil.getUI(request);
		Page page = ui.createPage(request);
		page.setShowCount(12);
		example.setPage(page);
		List< ${table.className}> list = service.queryPageByExample(example );
		return list;
	}
	
	@RequestMapping("/all")
	@ResponseBody
	public Map<String, Object> all(HttpServletRequest request, String q){
		UIPageUtil ui = UIPageUtil.getUI(request);
		Page page = ui.createPage(request);
		${table.className}Example example = new ${table.className}Example();
		example.setPage(page);
		List< ${table.className}> list = service.selectByExample(example );
		return ui.getData(list, page);
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public OptResult add(${table.className} record, HttpServletRequest request){
		OptResult result = new OptResult();
		try {
			service.insertSelective(record);
			result.setSuccess();
		} catch (Exception e) {
			result.setMsg(e.getMessage());
			log.error(e.getMessage(),e);
		}
		return result  ;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public OptResult update(${table.className} record, HttpServletRequest request){
		OptResult result = new OptResult();
		try {
			service.updateByPrimaryKeySelective(record);
			result.setSuccess();
		} catch (Exception e) {
			result.setMsg(e.getMessage());
			log.error(e.getMessage(),e);
		}
		return result  ;
	}
	
	@RequestMapping(value = "/del", method = RequestMethod.POST)
	@ResponseBody
	public OptResult del(Long objid) {
		OptResult result = new OptResult();
		try {
			service.deleteByPrimaryKey(id);
			result.setSuccess();
		} catch (Exception e) {
			result.setMsg(e.getMessage());
			log.error(e.getMessage(), e);
		}
		return result;
	}
	
	

}
