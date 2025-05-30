package com.fsoft.security;

import java.util.Date;

import org.springframework.security.authentication.AuthenticationCredentialsNotFoundException;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import com.fsoft.config.Constant;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Component
public class JWTGenerator {
	
	public String generateToken(Authentication authentication) {
	    String username = authentication.getName();
	    Date currentDate = new Date();
	    Date expireDate = new Date(currentDate.getTime() + Constant.JWT_EXPIRATION);

	    String token = Jwts.builder()
	        .setSubject(username)
	        .setIssuedAt(new Date())
	        .setExpiration(expireDate)
	        .signWith(SignatureAlgorithm.HS512, Constant.JWT_SECRET)
	        .compact();

	    return token;
	}

	public String getUsernameFromJWT(String token) {
	    Claims claims = Jwts.parser()
	        .setSigningKey(Constant.JWT_SECRET)
	        .parseClaimsJws(token)
	        .getBody();

	    return claims.getSubject();
	}

	public boolean validateToken(String token) {
	    try {
	        Jwts.parser().setSigningKey(Constant.JWT_SECRET).parseClaimsJws(token);
	        return true;
	    } catch (Exception ex) {
	        throw new AuthenticationCredentialsNotFoundException("JWT was expired or incorrect");
	    }
	}

}
