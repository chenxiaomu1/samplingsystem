package com.project.samplingsystem.config.interceptor;

import cn.hutool.core.codec.Base64;
import com.project.samplingsystem.dao.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import com.project.samplingsystem.config.application.NBContext;
import com.project.samplingsystem.model.constant.SampleSystemConstant;
import com.project.samplingsystem.model.entity.permission.NBSysUser;
import com.project.samplingsystem.util.CookieUtils;
import com.project.samplingsystem.util.NBUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 拦截器更多的是为了处理Session和Cookie的一些逻辑
 * created by Wuwenbin on 2018/1/23 at 13:36
 *
 * @author wuwenbin
 */
@Slf4j
public class SessionInterceptor extends HandlerInterceptorAdapter {

    private UserRepository userRepository = NBUtils.getBean(UserRepository.class);

    private NBContext blogContext;

    public SessionInterceptor(NBContext blogContext) {
        this.blogContext = blogContext;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Cookie cookie = CookieUtils.getCookie(request, SampleSystemConstant.Session.SESSION_ID_COOKIE);
        if (cookie != null) {
            String sessionId = cookie.getValue();
            NBSysUser sessionUser = blogContext.getSessionUser(sessionId);
            if (sessionUser == null) {
                Cookie rememberCookie = CookieUtils.getCookie(request, SampleSystemConstant.Session.REMEMBER_COOKIE_NAME);
                if (rememberCookie != null) {
                    String userString = rememberCookie.getValue();
                    try {
                        String username = userString.split(SampleSystemConstant.Session.COOKIE_SPLIT)[0];
                        String password = userString.split(SampleSystemConstant.Session.COOKIE_SPLIT)[1];
                        NBSysUser cookieUser = userRepository.findByUsernameAndPasswordAndEnableTrue(Base64.decodeStr(username), password);
                        if (cookieUser != null) {
                            blogContext.setSessionUser(request, response, cookieUser);
                            log.info("[已登录用户]");
                            return true;
                        }
                    } catch (Exception ignore) {
                    }
                }
                log.info("[未登录用户]");
                AdminInterceptor.handleAjaxRequest(request, response);
                return false;
            } else {
                log.info("[已登录用户]");
                return true;
            }
        } else {
            response.sendRedirect(SampleSystemConstant.Session.LOGIN_URL);
            return false;
        }
    }
}

