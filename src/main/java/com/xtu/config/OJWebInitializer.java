package com.xtu.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

/**
 * Created by Ilovezilian on 2017/4/12.
 */

/**
 * config DispatcherServlet
 */
public class OJWebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
    /**
     * set RootConfig
     * @return
     */
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class<?>[]{RootConfig.class};
    }

    /**
     * set ServletConfig
     * @return
     */
    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class<?>[]{WebConfig.class};
    }

    /**
     * set ServletMap
     * @return
     */
    @Override
    protected String[] getServletMappings() {
        return new String[] {"/"};
    }
}
