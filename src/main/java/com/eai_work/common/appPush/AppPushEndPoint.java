package com.eai_work.common.appPush;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.logging.Logger;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;

import com.eai_work.common.config.WebsocketSessionConfig;

@Component
@ServerEndpoint(value = "/websocket", configurator = WebsocketSessionConfig.class)
public class AppPushEndPoint extends HttpServlet{
    
    private static final Logger logger = Logger.getLogger(AppPushEndPoint.class.getName());
    private static Set<Map<String, Object>> openSessions = Collections.synchronizedSet(new HashSet<>());

    @OnOpen
    public void onOpen(Session session, EndpointConfig config) {
        Map<String, Object> sessionMap = new HashMap<>();
        sessionMap.put("websocketSession", session);
        sessionMap.put("httpSession", (HttpSession) config.getUserProperties().get(WebsocketSessionConfig.HTTP_SESSION));
        openSessions.add(sessionMap);
        // logger.info("Connected ...");
    }

    @OnMessage
    public void onMessage(String message) {
        // logger.info("Message from the client: " + message);
    }

    @OnClose
    public void onClose(Session session) {
        for(Map<String, Object> sessionMap : openSessions) {
            if(session == (Session) sessionMap.get("websocketSession")) {
                openSessions.remove(sessionMap);
                break;
            }
        }
        // logger.info("Connection closed");
    }

    @OnError
    public void onError(Throwable e) {
        logger.severe(e.getMessage());
    }

    public static Set<Map<String, Object>> getOpenSessions() {
        return openSessions;
    }

    public static void sendAll(String message) throws IOException {
        for(Map<String, Object> sessionMap : openSessions) {
            Session websocketSession = (Session) sessionMap.get("websocketSession");
            if((websocketSession).isOpen()) {
                websocketSession.getBasicRemote().sendText(message);
            }
        }
    }

    public static void send(HttpSession session, String message) throws IOException {
        for(Map<String, Object> sessionMap : openSessions) {
            Session websocketSession = (Session) sessionMap.get("websocketSession");
            if((websocketSession).isOpen() && session == (HttpSession) sessionMap.get("httpSession")) {
                websocketSession.getBasicRemote().sendText(message);
            }
        }
    }   
}
