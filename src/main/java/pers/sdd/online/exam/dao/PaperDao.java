package pers.sdd.online.exam.dao;

import java.util.List;

import pers.sdd.online.exam.bean.PaperBean;

public interface PaperDao {

	Integer insertPaper(PaperBean paper);

	List<PaperBean> queryPaperList();

	List<PaperBean> queryPaperListByParamer(String majorName, Integer courseName);

	void deletePaperById(Integer paperId);

	void updateIncrementId();

	Integer queryCourseTotal();

	void alterAutoIncrementId(Integer startId);

	PaperBean queryPaperById(Integer paperId);

}
