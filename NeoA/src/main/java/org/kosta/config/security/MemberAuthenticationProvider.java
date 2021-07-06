package org.kosta.config.security;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.model.service.MemberService;
import org.kosta.model.vo.Authority;
import org.kosta.model.vo.MemberVO;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class MemberAuthenticationProvider implements AuthenticationProvider{
	@Resource
	private MemberService memberService;

	@Resource
    private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {		
		System.out.println("AA");
		if(!supports(authentication.getClass())){
			return null;
		}

		String id = authentication.getName();
		System.out.println("BB");
		System.out.println(id);
		MemberVO member = memberService.findMemberById(id);
		System.out.println(member);
		if(member == null){
			throw new UsernameNotFoundException("아이디 혹은 비밀번호가 일치하지 않습니다.");
		}
		
		String password=(String)authentication.getCredentials();

        if (!passwordEncoder.matches(password, member.getPassword())) 
                throw new BadCredentialsException("아이디 혹은 비밀번호가 일치하지 않습니다.");
		
        List<Authority> list = memberService.selectAuthorityByUsername(id);
		
        if(list.size() == 0){
			throw new UsernameNotFoundException("아무 권한이 없는 사용자입니다.");
		}
		
		List<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();		
		
		for(Authority au : list){
			authorities.add(new SimpleGrantedAuthority(au.getAuthority()));
		}
				
		Authentication auth = new UsernamePasswordAuthenticationToken(member, password, authorities);
		
		System.out.println("로그인 OK~"+auth);
		
		return auth;		
	}

}
