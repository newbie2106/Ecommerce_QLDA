/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tth.components;

import com.nimbusds.jose.JOSEException;
import com.nimbusds.jose.JWSAlgorithm;
import com.nimbusds.jose.JWSHeader;
import com.nimbusds.jose.JWSSigner;
import com.nimbusds.jose.JWSVerifier;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jose.crypto.MACVerifier;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import java.text.ParseException;
import java.util.Date;
import org.springframework.stereotype.Component;

/**
 *
 * @author tongh
 */
@Component
public class JwtService {

    public static final String SECRET_KEY = "*$&(@*x&$(br!*&#(*!@&#(*!&@($%&sa";
    public static final byte[] SHARED_SECRET_KEY = SECRET_KEY.getBytes();
    public static final int EXPIRE_TIME = 86400000;

    public String generateTokenLogin(String username) {
        String token = null;
        try {
            JWSSigner signer = new MACSigner(SHARED_SECRET_KEY);

            JWTClaimsSet.Builder builder = new JWTClaimsSet.Builder();
            builder.claim("username", username);

            builder.expirationTime(new Date(System.currentTimeMillis() + EXPIRE_TIME));

            JWTClaimsSet claimsSet = builder.build();
            SignedJWT signedJWT = new SignedJWT(new JWSHeader(JWSAlgorithm.HS256), claimsSet);

            signedJWT.sign(signer);
            token = signedJWT.serialize();
        } catch (JOSEException e) {
            System.out.println(e.getMessage());
        }
        return token;
    }

//    private JWTClaimsSet getClaimsFromToken(String token) {
//        JWTClaimsSet claims = null;
//        try {
//            SignedJWT signedJWT = SignedJWT.parse(token);
//            JWSVerifier verifier = new MACVerifier(SHARED_SECRET_KEY);
//            if (signedJWT.verify(verifier)) {
//                claims = signedJWT.getJWTClaimsSet();
//            }
//        } catch (JOSEException | ParseException e) {
//            System.err.println(e.getMessage());
//        }
//        return claims;
//    }
    private JWTClaimsSet getClaimsFromToken(String token) {
        JWTClaimsSet claims = null;
        try {
            SignedJWT signedJWT = SignedJWT.parse(token);
            JWSVerifier verifier = new MACVerifier(SHARED_SECRET_KEY);
            if (signedJWT.verify(verifier)) {
                claims = signedJWT.getJWTClaimsSet();
            } else {
                System.err.println("Token verification failed");
            }
        } catch (JOSEException | ParseException e) {
            System.err.println("Error parsing token: " + e.getMessage());
        }

        if (claims == null) {
            System.err.println("Claims from token are null");
        }

        return claims;
    }

    private Date getExpirationDateFromToken(String token) {
        JWTClaimsSet claims = getClaimsFromToken(token);
        Date expiration = claims.getExpirationTime();
        return expiration;
    }

//    public String getUsernameFromToken(String token) {
//        String username = null;
//        try {
//            JWTClaimsSet claims = getClaimsFromToken(token);
//            username = claims.getStringClaim("username");
//        } catch (ParseException e) {
//            System.err.println(e.getMessage());
//        }
//        return username;
//    }
    public String getUsernameFromToken(String token) {
        String username = null;
        try {
            JWTClaimsSet claims = getClaimsFromToken(token);
            if (claims != null) {
                username = claims.getStringClaim("username");
            } else {
                System.err.println("Claims are null");
            }
        } catch (ParseException e) {
            System.err.println("Error parsing username from token: " + e.getMessage());
        }

        return username;
    }

    private Boolean isTokenExpired(String token) {
        Date expiration = getExpirationDateFromToken(token);
        return expiration.before(new Date());
    }

//    public Boolean validateTokenLogin(String token) {
//        if (token == null || token.trim().length() == 0) {
//            return false;
//        }
//        String username = getUsernameFromToken(token);
//
//        return !(username == null || username.isEmpty() || isTokenExpired(token));
//    }
    public Boolean validateTokenLogin(String token) {
        if (token == null || token.trim().length() == 0) {
            System.err.println("Token is null or empty");
            return false;
        }
        String username = getUsernameFromToken(token);
        if (username == null || username.isEmpty()) {
            System.err.println("Username from token is null or empty");
            return false;
        }

        return !isTokenExpired(token);
    }

}
