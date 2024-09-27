package com.eai_work.common.job;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.ThreadContext;
import org.json.simple.JSONObject;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.eai_work.common.appPush.AppPushEndPoint;
import com.eai_work.common.util.SessionEnum;
import com.eai_work.noti.dao.NotiDAO;

public class EaiBatchJobScanner extends QuartzJobBean{

    @Autowired
    private NotiDAO notiDao;

    @SuppressWarnings("unchecked")
    @Override
    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
        Map<String, Object> reqMap = null;
        ThreadContext.put("log", "N");          // 배치 로그는 출력하지 않음

        try{
            reqMap = new HashMap<>();
            reqMap.put("notiYn", "N");
            List<Map<String, Object>> notiList = notiDao.getNotiList(reqMap);

            for(Map<String, Object> notiMap : notiList){
                // 푸시 엔드포인트에서 알림메시지 전송
                Set<Map<String, Object>> openSessions = AppPushEndPoint.getOpenSessions();
                for(Map<String, Object> sessionMap : openSessions){
                    // 푸시 엔드포인트에서의 사용자ID
                    HttpSession httpSession = (HttpSession) sessionMap.get("httpSession");
                    String userId = (String) httpSession.getAttribute(SessionEnum.SESSION_USER_ID.getSessionId());
                    String notiYn = (String) httpSession.getAttribute(SessionEnum.SESSION_NOTI_YN.getSessionId());

                    // 사용자ID가 일치하는 세션이 있고, 그 사용자의 notiYn 이 Y이면 알림메시지 전송
                    if(userId.equals(notiMap.get("user_id")) && "Y".equals(notiYn)){
                        
                        JSONObject jobData = new JSONObject(notiMap);
                        jobData.put("dataType", "noti");

                        AppPushEndPoint.send((HttpSession) sessionMap.get("httpSession"), jobData.toJSONString());

                        // 알림 메시지 전송완료 상태저장
                        reqMap.put("notiSeq", notiMap.get("noti_seq"));
                        reqMap.put("sessionUserId", "EaiBatchJobScanner");
                        reqMap.put("notiYn", "Y");
                        notiDao.saveNotiItem(reqMap);
                    }
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    
    }
}
