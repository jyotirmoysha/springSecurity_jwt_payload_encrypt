package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.pojo.Course;
import com.example.demo.pojo.Topics;

@Service
public class CourseService {

	@Autowired
	private CourseRepository courseRepository;

	/*
	 * private List<Topics> topics = new ArrayList(Arrays.asList(new Topics("1",
	 * "Spring", "Spring Framework Desc"), new Topics("2", "Java", "Java Desc"),
	 * new Topics("3", "Rest", "Rest Framework Description")));
	 */
	/**
	 * return all topics
	 * 
	 * @return
	 */
	public List<Course> getAllCourses(String topicId) {
		// return Course;
		// Will fetch all data from derby DB and return.
		List<Course> courses = new ArrayList<Course>();
		courseRepository.findByTopicId(topicId).forEach(courses::add);
		return courses;
	}

	/**
	 * return a specific topic object
	 * 
	 * @param id
	 * @return
	 */
	public Course getCourse(String id) {
		return courseRepository.findOne(id);
	}

	public void addCourse(Course course) {
		courseRepository.save(course);
	}

	public void updateCourse(Course course) {
		courseRepository.save(course);
	}

	public void delete(String id) {
		courseRepository.delete(id);
	}
}
