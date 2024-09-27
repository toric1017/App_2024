package com.eai_work.common.config;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;

public class WebsocketSessionConfig extends Configurator {

    public static final String HTTP_SESSION = "HTTP_SESSION";    
    @Override
    public void modifyHandshake(ServerEndpointConfig config, HandshakeRequest request, HandshakeResponse response) {
        HttpSession session = (HttpSession) request.getHttpSession();
        config.getUserProperties().put(HTTP_SESSION, session);
    }
    
}
