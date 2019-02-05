package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.pojo.Course;
import com.example.demo.pojo.Topics;
import com.example.demo.service.CourseService;

@RestController
public class CourseController {
	@Autowired
	CourseService courseService;

	// Get all courses for a specific topic using service and DB
	@RequestMapping("/topics/{id}/courses")
	public List<Course> getAllCourses(@PathVariable("id") String id) {
		return courseService.getAllCourses(id);

	}

	// Access specific course, since course id for a topic is primary so course
	// id is enough.
	@RequestMapping("/topics/{topicId}/courses/{id}")
	public Course getCourse(@PathVariable String id) {
		return courseService.getCourse(id);
	}

	// A post request to add, by setting body a json object value, with set
	// header
	// content type as json.
	@RequestMapping(method = RequestMethod.POST, value = "/topics/{topicId}/courses")
	public void addCourse(@RequestBody Course course, @PathVariable String topicId) {
		course.setTopic(new Topics(topicId, "", ""));
		courseService.addCourse(course);
		;
	}

	// A post request to update, by setting body a json object value, with set
	// header (On Postmanplugin)
	// content type as json.
	@RequestMapping(method = RequestMethod.PUT, value = "/topics/{topicId}/courses/{id}")
	public void updateCourse(@RequestBody Course course, @PathVariable String topicId) {
		course.setTopic(new Topics(topicId, "", ""));
		courseService.updateCourse(course);
	}

	// delete specific course
	@RequestMapping(method = RequestMethod.DELETE, value = "/topics/{topicId}/courses/{id}")
	public void deleteCourse(@PathVariable String id) {
		courseService.delete(id);
	}

}
