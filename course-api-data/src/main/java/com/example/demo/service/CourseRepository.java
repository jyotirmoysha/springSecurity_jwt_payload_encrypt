package com.example.demo.service;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.pojo.Course;

//Need to mention on generics for which entity crud operation needs to be ther
public interface CourseRepository extends CrudRepository<Course, String> {

	// All default methods CRUD implemented by Spring. For any specific method
	// we need to write here and implement on the class.
	// getAllCourse
	// getCourse(String id)
	// updateCourse(Topic t)
	// deleteCourse(String id)
	
	//method forced by naming convention to Spring to find all courses for a specific topic.
	//where name is a member variable of course class
	public List<Course> findByName(String id);
	//find by description, no implementation required. Description is a member variable on course
	// so spring automatically understands that what is the implementation. 
	public List<Course> findByDescription(String desc);
	
	//Similarly, we find by topic-> id
	public List<Course> findByTopicId(String topicId);
}
