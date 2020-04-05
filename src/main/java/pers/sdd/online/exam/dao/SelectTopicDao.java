package pers.sdd.online.exam.dao;

import java.util.List;

import pers.sdd.online.exam.bean.SelectTopicBean;

public interface SelectTopicDao {

	void insertSelectTopic(SelectTopicBean topicBean);

	List<SelectTopicBean> queryTopicList(String majorName, Integer courseId);

	void deleteTopicById(Integer topicId);

	void updateIncrementId();

	Integer queryCourseTotal();

	void alterAutoIncrementId(Integer i);

	SelectTopicBean queryTopicById(Integer topicId);

}
