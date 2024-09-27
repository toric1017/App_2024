package com.eai_work.noti.service;

import java.util.List;
import java.util.Map;

public interface NotiService {
    public List<Map<String, Object>> getNotiList(Map<String, Object> reqMap);
    public int saveNotiItem(Map<String, Object> reqMap);
}
