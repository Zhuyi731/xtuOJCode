package com.xtu.config;

import com.xtu.constant.Constant;
import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

/**
 * Created by Ilovezilian on 2017/4/18.
 */
@Configuration
@EnableWebSecurity
//@EnableWebMvcSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    BasicDataSource basicDataSource;
//    @Autowired
//    DataSource basicDataSource;


    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.formLogin()
                .loginPage("/login")
                .and()
//                .rememberMe()
//                .tokenValiditySeconds(2419200)
//                .key("haha")
//                .and()
                .logout()
                .logoutSuccessUrl("/login")
                .and()
                .authorizeRequests()
                .antMatchers("/test/createTest").hasAnyAuthority("" + Constant.ADMIN, "" + Constant.TEACHER)
                .antMatchers("/test/**").hasAnyAuthority("" + Constant.ADMIN, "" + Constant.TEACHER, "" + Constant.STUDENT)
                .antMatchers("/admin/**").hasAuthority("" + Constant.ADMIN)
                .antMatchers("/teacher/**").hasAuthority("" + Constant.TEACHER)
                .antMatchers("/student/**").hasAuthority("" + Constant.STUDENT)
                .antMatchers("/info/**", "/info").authenticated()
                .anyRequest().permitAll()
//                .and() .requiresChannel() .antMatchers("/login", "/login/**").requiresSecure()
                .and()
                .headers().frameOptions().sameOrigin(); //setting X-Frame-Options from DENY to SAMEORIGIN
        // TODO: 2017/4/23 remove below
//                .and().csrf().disable();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.inMemoryAuthentication().withUser("user").password("password").roles("USER")
//                .and().withUser("dmin").password("password").roles("USER", "ADMIN");
//        // the same as above
//        auth.inMemoryAuthentication().withUser("user").password("password").authorities("ROLE_USER")
//                .and().withUser("dmin").password("password").authorities("ROLE_USER", "ROLE_ADMIN");

        auth.jdbcAuthentication().dataSource(basicDataSource)
                .usersByUsernameQuery(
                        "select `id`, `password`, `role_id`" +
                                " from users where `id` = ?")
                .authoritiesByUsernameQuery(
                        "select `id`, `role_id`" +
                                " from users where `id` = ?");
    }


}
