package com.xtu.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletRegistration;

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

    /**
     * set multipart uploads file
     * @param registration
     */
    @Override
    protected void customizeRegistration(ServletRegistration.Dynamic registration) {
        //设置上传文件的临时目录为/tmp/uploads
        registration.setMultipartConfig(
                new MultipartConfigElement("D:/Pictures/", 2097152, 4194304, 0));
    }


    /**
     * set filter
     * @return
     */
//    @Override
//    protected Filter[] getServletFilters(){
//        return new Filter[]{new MyFilter()};
//    }

}
