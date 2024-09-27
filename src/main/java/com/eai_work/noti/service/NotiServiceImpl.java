package com.eai_work.noti.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eai_work.noti.dao.NotiDAO;

@SuppressWarnings("unchecked")
@Service
public class NotiServiceImpl implements NotiService {

    @Autowired
    private NotiDAO notiDao;

    @Override
    public List<Map<String, Object>> getNotiList(Map<String, Object> reqMap) {
        return notiDao.getNotiList(reqMap);
    }

    @Override
    public int saveNotiItem(Map<String, Object> reqMap) {
        return notiDao.saveNotiItem(reqMap);
    }
    
}
