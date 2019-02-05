package com.livespread.api.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.livespread.controller.QAMessageChecklistController;


@RestController
public class LSFileProcessingStatusController {
	
	
		@RequestMapping("/topics")
		public String getAllCourses() {
			return "Hello Jyotirmoy";
			

		}
	

}
