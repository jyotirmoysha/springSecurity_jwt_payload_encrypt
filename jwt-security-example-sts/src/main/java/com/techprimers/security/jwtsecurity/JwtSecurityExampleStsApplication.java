package com.techprimers.security.jwtsecurity;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class JwtSecurityExampleStsApplication {

	public static void main(String[] args) {
		System.out.println("Heloo");
		SpringApplication.run(JwtSecurityExampleStsApplication.class, args);
		System.out.println("Heloo started Spring security with JWT TOken");
	}

}

