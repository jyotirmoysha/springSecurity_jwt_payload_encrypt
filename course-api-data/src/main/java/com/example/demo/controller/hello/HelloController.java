package com.example.demo.controller.hello;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

	// Default method for GET request, otherwise explicitly mention it
	// http://localhost:7071/hello
	@RequestMapping("/hello")
	public String sayHi() {
		return "Hi";

	}

	@RequestMapping("/helloWeb")
	public String sayHiOnWeb(Model model,
			@RequestParam(value = "name", required = false, defaultValue = "World") String name) {
		model.addAttribute("name", name);
		return "hello";

	}

}
