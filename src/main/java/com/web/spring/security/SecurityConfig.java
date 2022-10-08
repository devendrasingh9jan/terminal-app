package com.web.spring.security;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.JdbcUserDetailsManager;

import com.web.spring.model.UserRegistration;
@Configuration
@EnableWebSecurity
@Order(1000)
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	@Autowired
	DataSource dataSource;
		
	@Override
	protected void configure(HttpSecurity http) throws Exception{
		http.authorizeRequests().antMatchers("/forgetPassword").permitAll()
		.antMatchers("/","/public/**", "/resources/**","/resources/public/**")
        .permitAll()
		.antMatchers("/register").permitAll()
		.antMatchers("/changePassword").permitAll()
		.antMatchers("/changed").permitAll()
		.antMatchers("/welcome/**").permitAll()
		.antMatchers("/showTerminals*").access("hasAnyRole('ROLE_USER','ROLE_ADMIN')")
		.antMatchers("/admin*").hasRole("ADMIN")
		.antMatchers("/logs*").hasRole("ADMIN")
		.anyRequest().authenticated().and().formLogin().loginPage("/login").permitAll().
		defaultSuccessUrl("/welcome").failureUrl("/loginError").usernameParameter("username").
		passwordParameter("password").and().logout().logoutUrl("/performlogout").
		logoutSuccessUrl("/afterlogout").invalidateHttpSession(true).deleteCookies("JSESSIONID").permitAll()
		.and().csrf().disable();
		}
	
	@Bean
	public JdbcUserDetailsManager jdbcUserDetailsManger ()	{
		JdbcUserDetailsManager jdbcUserDetailsManager=new JdbcUserDetailsManager();
		jdbcUserDetailsManager.setDataSource(dataSource);
		//  jdbcUserDetailsManager.setEnableAuthorities(false);
		return jdbcUserDetailsManager;
	}
	
    @Bean
	public PasswordEncoder passwordEncoder()
	{
		return new BCryptPasswordEncoder();
	}
	
 // Used in case of  PasswordEncoder
    @Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception{
	auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(passwordEncoder());
	}
	}
