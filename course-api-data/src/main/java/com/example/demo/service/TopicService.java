package com.example.demo.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.pojo.Topics;

@Service
public class TopicService {

	@Autowired
	private TopicRepository topicsRepository;

	/*private List<Topics> topics = new ArrayList(Arrays.asList(new Topics("1", "Spring", "Spring Framework Desc"),
			new Topics("2", "Java", "Java Desc"), new Topics("3", "Rest", "Rest Framework Description")));
	 */
	/**
	 * return all topics
	 * 
	 * @return
	 */
	public List<Topics> getAllTopics() {
		// return topics;
		// Will fetch all data from derby DB and return.
		List<Topics> topics = new ArrayList<Topics>();
		topicsRepository.findAll().forEach(topics::add);
		return topics;
	}

	/**
	 * return a specific topic object
	 * 
	 * @param id
	 * @return
	 */
	public Topics getTopic(String id) {
		//return topics.stream().filter(t -> t.getId().equals(id)).findFirst().get();
		return topicsRepository.findOne(id);
	}

	public void addTopic(Topics topic) {
		// topics.add(topic);
		topicsRepository.save(topic);
	}

	public void updateTopic(Topics topic) {
		/*for (int i = 0; i < topics.size(); i++) {
			Topics t = topics.get(i);
			if (t.getId().equals(id)) {
				topics.set(i, topic);
			}
		}*/
		topicsRepository.save(topic);
	}

	public void delete(String id) {
		//topics.removeIf(t -> t.getId().equals(id));
		topicsRepository.delete(id);
	}
}
