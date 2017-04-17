package com.xtu.config;

import org.springframework.web.WebApplicationInitializer;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

/**
 * Created by Ilovezilian on 2017/4/17.
 */
public class MyServletInitializer implements WebApplicationInitializer {
    @Override
    public void onStartup(ServletContext servletContext)
            throws ServletException {
//        Registration.Dynamic myServlet =
//                servletContext.addServlet("myServlet", MyServlet.class);
//        myServlet.addMapping("/custom/**");
    }
}
