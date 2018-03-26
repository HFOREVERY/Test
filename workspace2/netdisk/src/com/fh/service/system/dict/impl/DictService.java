package com.fh.service.system.dict.impl;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.fh.dao.DaoSupport;
import com.fh.entity.Page;
import com.fh.entity.system.Dict;
import com.fh.util.PageData;
import com.fh.service.system.dict.DictManager;

/** 
 * 说明： dict
 * 创建人：FH Q313596790
 * 创建时间：2017-11-28
 * @version
 */
@Service("dictService")
public class DictService implements DictManager{

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**新增
	 * @param pd
	 * @throws Exception
	 */
	public void save(PageData pd)throws Exception{
		dao.save("DictMapper.save", pd);
	}
	
	/**删除
	 * @param pd
	 * @throws Exception
	 */
	public void delete(PageData pd)throws Exception{
		dao.delete("DictMapper.delete", pd);
	}
	
	/**修改
	 * @param pd
	 * @throws Exception
	 */
	public void edit(PageData pd)throws Exception{
		dao.update("DictMapper.edit", pd);
	}
	
	/**列表
	 * @param page
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> list(Page page)throws Exception{
		return (List<PageData>)dao.findForList("DictMapper.datalistPage", page);
	}
	
	/**列表(全部)
	 * @param pd
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<PageData> listAll(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("DictMapper.listAll", pd);
	}
	
	/**通过id获取数据
	 * @param pd
	 * @throws Exception
	 */
	public PageData findById(PageData pd)throws Exception{
		return (PageData)dao.findForObject("DictMapper.findById", pd);
	}
	
	/**批量删除
	 * @param ArrayDATA_IDS
	 * @throws Exception
	 */
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("DictMapper.deleteAll", ArrayDATA_IDS);
	}
	
	public List<PageData> listAllDictById(String dictId, String tableName, String columnKey, String columnValue, String whereClause)throws Exception{
		
		if(whereClause == null)
			whereClause = "and 1=1";
		HashMap hashMap = new HashMap();
		hashMap.put("dictId", dictId);
		hashMap.put("tableName", tableName);
		hashMap.put("columnKey", columnKey);
		hashMap.put("columnValue", columnValue);
		hashMap.put("whereClause", whereClause);

		dao.delete("DictMapper.prepareDict", hashMap);
		PageData page = new PageData();
		page.put("DICT_ID", dictId);
		return (List<PageData>)dao.findForList("DictMapper.findById", page);
	}
	
}

