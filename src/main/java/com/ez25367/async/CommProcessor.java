package com.ez25367.async;

import org.springframework.scheduling.annotation.Scheduled;

import com.ez25367.controller.MainController;


public class CommProcessor {

	
	//1초주기로 OPC UA 커넥션이 null일경우 연결
	@Scheduled(fixedRate = 1000)
	public void handle() {
	
	}
}
