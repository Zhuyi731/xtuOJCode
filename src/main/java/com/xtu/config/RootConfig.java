package com.xtu.config;

import org.springframework.context.annotation.*;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

/**
 * Created by Ilovezilian on 2017/4/11.
 */
@Configuration
@Import({WebConfig.class, MysqlConfig.class, SecurityConfig.class})
//@Import({MysqlConfig.class, WebConfig.class})
@ComponentScan(basePackages = {"com.xtu.DB"},
//        @ComponentScan(basePackages = {"com.xtu.DB", "com.xtu.config"},
        excludeFilters = {
                @ComponentScan.Filter(type = FilterType.ANNOTATION, value = EnableWebMvc.class)
        })
//@ImportResource("classpath:com.xtu.config.xml");
@EnableAspectJAutoProxy
public class RootConfig {
}
