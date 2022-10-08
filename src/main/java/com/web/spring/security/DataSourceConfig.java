package com.web.spring.security;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
@Configuration
public class DataSourceConfig {
@Bean(name="dataSource")
public DriverManagerDataSource dataSource(){
		DriverManagerDataSource dsource= new DriverManagerDataSource();
		dsource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		//for local
		dsource.setUrl("jdbc:mysql://localhost/terminal?useSSL=false");
		dsource.setUsername("root");
		dsource.setPassword("root");
		//for server local/aws
		//dsource.setUrl("jdbc:mysql://localhost:3306/terminal");
		//dsource.setUsername("devendra");	
		//dsource.setPassword("info@123!");
		return dsource;
	}
}
