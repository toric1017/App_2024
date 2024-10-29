package com.eai_work.eaiInterface.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.eai_work.common.util.JsonUtil;
import com.eai_work.common.util.StringUtil;
import com.eai_work.eaiInterface.dao.EaiInterfaceDAO;
import com.eai_work.eaiInterface.vo.MappingEV;
import com.eai_work.eaiInterface.vo.MappingVO;

@Service
public class EaiInterfaceServiceImpl implements EaiInterfaceService {
	

	@SuppressWarnings("unused")
	private final static Logger LOG = LoggerFactory.getLogger(EaiInterfaceServiceImpl.class);
	
	@Autowired
	private EaiInterfaceDAO eaiInterfaceDAO;

	public String updateMaster(HttpServletRequest request, MappingEV ev) throws Exception {
		
		eaiInterfaceDAO.updateMaster(ev);
		
		return null;
	}

	public String updateDetail(HttpServletRequest request, MappingEV ev) throws Exception {
		
		eaiInterfaceDAO.updateDetail(ev);
		
		return null;
	}

	public String deleteMaster(HttpServletRequest request, MappingEV ev) throws Exception {
		
		eaiInterfaceDAO.deleteMaster(ev);
		
		return null;
	}

	public HashMap<String, Object> selectMaster(int eai_seq) throws Exception{
		return eaiInterfaceDAO.selectMaster(eai_seq);
	}
	

}
