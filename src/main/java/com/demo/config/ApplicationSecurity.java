package com.demo.config;

//import org.springframework.boot.autoconfigure.security.oauth2.client.EnableOAuth2Sso;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
//@EnableOAuth2Sso
public class ApplicationSecurity extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable();
		http.antMatcher("/**").authorizeRequests()
				.antMatchers("/", "/customer", "/product", "/webjars/**", "/error**", "/registration", "/customerList/",
						"/customerList/index", "/company/save", "/company/alllogin", "/company/add_employee",
						"/company/saveEmployee", "/company/employeePagination/{pageNo}/{propertyPerPage}")
				.permitAll();
	}

}
