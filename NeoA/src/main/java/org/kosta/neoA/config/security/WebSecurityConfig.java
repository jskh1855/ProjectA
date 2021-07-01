package org.kosta.neoA.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//스프링 시큐리티 설정 클래스
@Configuration//자바 스타일의 설정을 로딩하기 위함
@EnableWebSecurity//현재 이 클래스가 스프링 시큐리티 설정이다
//@Secured, @PreAuthorize, @PostAuthorize 애노테이션을 사용하여 인증, 인가 처리를 하고 싶을때 사용하는 옵션
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)//시큐리티 어노테이션을 사용하기 위한 것
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	
	//MemberAuthenticationProvider : 인증 로직을 정의한 클래스
	//( id 일치여부, 암호화된 password 일치여부, id password 가 일치하지 않으면 exeption throws
	//	권한 체크해 exception throws, 인증 조건이 되면 Security 인증 객체로 할당)
	@Autowired
	private MemberAuthenticationProvider authenticationProvider;
	
	//비밀번호 암호화를 위한 bean 생성 -> MemberService 에서 비번 암호화르 루이해 사용
	//MemberAuthenticationProvider 에서 비번 일치여부를 위해 사용
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder;
	}
	
	/*
	 	인증(authentication)을 위한 설정은 아래의 메서드에서 처리한다 (로그인 기능과 로그인 여부에 따른 서비스 접근에 대한 설정 ) 
	 	인가(authorization)에 대한 설정은 각 컨트롤러 메서드에서 @Secured("ROLE_ADMIN") 와 같이 설정한다  
	 	( 인증받은 회원이 부여받은 권한에 의거해 접근할 수 있는 서비스에 대한 설정 ) 	 	
	 */
	@Override
	protected void configure(HttpSecurity http) throws Exception {		
		/*	
		 	인증 처리 : 로그인 여부에 따라 접근 가능한 서비스를 설정 
		 	/  , /home  : welcome file 		
		 	
		 	정적인 파일(css, javascript, image) 은 static 디렉토리 이하에 위치시킨다
		 	/myweb/** 이하 하위 디렉토리(css, images, js) 및 파일에 접근 허용
		
			/css/** 이하 하위 디렉토리 및 파일( css , javascript , image 등 ) 에 접근 허용
			/user/ 로그인 없어도 서비스할 url 
			위의 지정한 url 에는 permitAll() 로그인 인증없이 서비스 되고 
			그 외의 요청에는 anyRequest().authenticated()  로그인 인증된 사용자만 접근할 수 있다 
		 */
		http.authorizeRequests().antMatchers("/", "/home", "/myweb/**", "/user/**").permitAll().anyRequest().authenticated();
		
		// 인증(authentication): 로그인을 위한 설정
		http.formLogin().loginPage("/home") // 로그인 폼이 있는 url
				.loginProcessingUrl("/login")// login form 의 action 경로 
				.failureUrl("/login_fail") // 로그인 실패시 메세지 보여줄 url
				.defaultSuccessUrl("/home") // 로그인 성공 후 이동할 url
				.usernameParameter("id").passwordParameter("password").and()//로그인 폼에서 전달할 폼 입력양식의 name
				.formLogin().permitAll();
		// 로그아웃을 위한 설정
		http.logout().permitAll().logoutUrl("/logout")
				.logoutSuccessUrl("/home").invalidateHttpSession(true).
				and().exceptionHandling().accessDeniedPage("/accessDeniedView").authenticationEntryPoint(new AjaxAuthenticationEntryPoint("/home"));
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) {
		auth.authenticationProvider(authenticationProvider);
	}

}