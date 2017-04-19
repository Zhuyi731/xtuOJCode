package com.xtu.config;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 * Created by Ilovezilian on 2017/4/11.
 */
@Configuration
public class MysqlConfig {
    //    DataSource dataSource = BlogDataSourceFactory.getBlogDataSource();
//    TransactionFactory transactionFactory = new JdbcTransactionFactory();
//    Environment environment = new Environment("development", transactionFactory, dataSource);
//    Configuration configuration = new Configuration(environment);
//configuration.addMapper(BlogMapper.class);
//    SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(configuration);

    /**
     * set dataSource
     * @return
     */
    @Bean
    public BasicDataSource basedataSource () {
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName("com.mysql.jdbc.Driver");
        ds.setUrl("jdbc:mysql://localhost:3306/exam2017");
        ds.setUsername("root");
        ds.setPassword("123456");
        ds.setInitialSize(5);
//        there isn't exists in dbcp
//        ds.setMaxActive(10);
//        the same as above
        ds.setMaxTotal(10);
        return ds;
    }

//    @Bean
//    public DataSource dataSource() {
//        DriverManagerDataSource ds = new DriverManagerDataSource();
//        ds.setDriverClassName("com.mysql.jdbc.Driver");
//        ds.setUrl("jdbc:mysql://localhost:3306/exam2017");
//        ds.setUsername("root");
//        ds.setPassword("nicai123456");
//        return ds;
//    }
//
//    /**
//     * set jdbcTemplate
//     * @param dataSource
//     * @return
//     */
//    @Bean
//    public JdbcTemplate jdbcTemplate(DataSource dataSource)
//    {
//        return new JdbcTemplate(dataSource);
//    }
    /**
     * set jdbcTemplate
     * @param dataSource
     * @return
     */
    @Bean
    public JdbcTemplate jdbcTemplate(BasicDataSource dataSource)
    {
        return new JdbcTemplate(dataSource);
    }
}
