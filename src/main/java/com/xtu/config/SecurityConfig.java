package com.xtu.config;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
//@Configuration
//@EnableWebSecurity
//@EnableWebMvcSecurity
//public class SecurityConfig extends WebSecurityConfigurerAdapter {
//    @Autowired
//    BasicDataSource basicDataSource;
//
//    @Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception{
//        auth.inMemoryAuthentication().withUser("user").password("password").roles("USER")
//                .and().withUser("dmin").password("password").roles("USER", "ADMIN");
//        // the same as above
//        auth.inMemoryAuthentication().withUser("user").password("password").authorities("ROLE_USER")
//                .and().withUser("dmin").password("password").authorities("ROLE_USER", "ROLE_ADMIN");
//
//        auth.jdbcAuthentication().dataSource(basicDataSource);
//    }
//
//}
