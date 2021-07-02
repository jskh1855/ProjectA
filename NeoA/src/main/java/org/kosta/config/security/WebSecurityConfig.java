package org.kosta.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}
	
	@Autowired
	private MemberAuthenticationProvider authenticationProvider;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) {
		auth.authenticationProvider(authenticationProvider);
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {		
		http.authorizeRequests() .antMatchers("/","/home", "/myweb/**", "/user/**", "/product/**") .permitAll().anyRequest().authenticated();
		http.formLogin().loginPage("/login") 
				.loginProcessingUrl("/login")
				.failureUrl("/login")
				.defaultSuccessUrl("/") 
				.usernameParameter("memberId").passwordParameter("password").and() 
				.formLogin().permitAll();
		http.logout().permitAll().logoutUrl("/logout")
				.logoutSuccessUrl("/").invalidateHttpSession(true).
				and().exceptionHandling().accessDeniedPage("/accessDeniedView").authenticationEntryPoint(new AjaxAuthenticationEntryPoint("/home"));
	}

}