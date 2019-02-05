package com.example.demo.service;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.pojo.Topics;

//Need to mention on generics for which entity crud operation needs to be ther
public interface TopicRepository extends CrudRepository<Topics, String> {

	//All default methods CRUD implemented by Spring. For any specific method we need to write here and 
	//implement on the class.
	//getAllTopic
	//getTopic(String id)
	//updateTopic(Topic t)
	//deleteTopic(String id)
	
}
