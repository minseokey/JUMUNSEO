package com.jumunseo.debate;

import jakarta.annotation.PostConstruct;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

import java.util.TimeZone;

@SpringBootApplication
//@EnableScheduling 테스트 단계에서는 주석처리, 배포 단계에서는 주석 해제
public class DebateApplication {

	public static void main(String[] args) {
		SpringApplication.run(DebateApplication.class, args);
	}

	@PostConstruct
	public void init() {
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Seoul"));
		System.out.println("현재 시간대 : " + TimeZone.getDefault().getID());
	}

}
