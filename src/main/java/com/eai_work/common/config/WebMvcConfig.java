package com.eai_work.common.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.eai_work.common.interceptor.SessionInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{

	@Bean
	public SessionInterceptor sessionInterceptor() {
		return new SessionInterceptor();
	}
	
	@Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(sessionInterceptor())
                .excludePathPatterns(
                		"/css/**", "/img/**", "/js/**", "/lib/**", "/index", "/logout",
                		"/api/common/**", "/api/login/**", "/api/**/*BatchJob"
                );
    }

}
