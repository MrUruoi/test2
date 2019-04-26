package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(value = {"com.example.demo.persistence"})
public class Ex21Application {

	public static void main(String[] args) {
		SpringApplication.run(Ex21Application.class, args);
	}

}
