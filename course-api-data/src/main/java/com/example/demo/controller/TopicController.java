package com.example.demo.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.pojo.Topics;
import com.example.demo.service.TopicService;

@RestController
public class TopicController {
	@Autowired
	TopicService topicService;

	/*
	 * // http://localhost:7071/topics
	 * 
	 * @RequestMapping("/topics") public List<Topics> getAllTopics() { return
	 * Arrays.asList(new Topics("1", "Spring", "Spring Framework Desc"), new
	 * Topics("2", "Java", "Java Desc"), new Topics("3", "Rest",
	 * "Rest Framework Desc")
	 * 
	 * ); }
	 */

	// Using Service
	// http://localhost:7071/topics
	@RequestMapping("/topics")
	public List<Topics> getAllTopics() {
		return topicService.getAllTopics();

	}

	// Access specific topic
	// http://localhost:7071/topics/1
	@RequestMapping("/topics/{id}")
	// public Topics getTopic(@PathVariable("id") String id) {
	public Topics getTopic(@PathVariable String id) {
		return topicService.getTopic(id);
	}

	// http://localhost:7071/topics
	// A post request to add, by setting body a json object value, with set header
	// content type as json.
	@RequestMapping(method = RequestMethod.POST, value = "/topics")
	public void addTopic(@RequestBody Topics topic) {
		topicService.addTopic(topic);
	}

	// http://localhost:7071/topics/1
	// A post request to update, by setting body a json object value, with set header
	// content type as json.
	@RequestMapping(method = RequestMethod.PUT, value = "/topics")
	public void updateTopic(@RequestBody Topics topic) {
		topicService.updateTopic(topic);
	}
	
	// delete specific topic
		// http://localhost:7071/topics/1
		@RequestMapping(method = RequestMethod.DELETE,value="/topics/{id}")
		// public Topics getTopic(@PathVariable("id") String id) {
		public void deleteTopic(@PathVariable String id) {
			topicService.delete(id);
		}

}
