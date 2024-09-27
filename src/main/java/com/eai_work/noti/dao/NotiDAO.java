package com.eai_work.noti.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.eai_work.common.CommonDAO;

@Component
public class NotiDAO extends CommonDAO {
    public List<Map<String, Object>> getNotiList(Map<String, Object> reqMap) {
        return sqlSession.selectList("NotiMapper.getNotiList", reqMap);
    }   

    public int saveNotiItem(Map<String, Object> reqMap) {
        return sqlSession.update("NotiMapper.saveNotiItem", reqMap);
    }   
}
