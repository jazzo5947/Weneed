package com.it.wanted.notice.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.wanted.notice.utility.KeywordVO;

@Repository
public class NoticeDAOMyBatis implements NoticeDAO{
	
	@Autowired SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.notice.";
	
	
	@Override
	public List<NoticeVO> select_dept1(int notice_dept1) {
		return sqlSession.selectList(namespace+"select_dept1", notice_dept1);
	}

	@Override
	public List<NoticeVO> select_dept2(int notice_dept2) {
		return sqlSession.selectList(namespace+"select_dept2", notice_dept2);
		
	}

	@Override
	public List<Map<String, Object>> selectMain1() {
		return sqlSession.selectList(namespace+"selectMain1");
	}
	
	@Override
	public List<Map<String, Object>> selectMain2() {
		return sqlSession.selectList(namespace+"selectMain2");
	}
	
	@Override
	public List<Map<String, Object>> selectMain3() {
		return sqlSession.selectList(namespace+"selectMain3");
	}

	@Override
	public Map<String, Object> selectDetail(int notice_no) {
		return sqlSession.selectOne(namespace+"selectDetail", notice_no);
	}

	@Override
	public List<Map<String, Object>> selectOther(int notice_dept2) {
		return sqlSession.selectList(namespace+"selectOther", notice_dept2);
	}

	@Override
	public List<Map<String, Object>> selectByDept2(int notice_dept2) {
		return sqlSession.selectList(namespace+"selectByDept2", notice_dept2);
	}

	@Override
	public List<NoticeVO> noticeSearch(KeywordVO searchVo) {
		return sqlSession.selectList(namespace+"noticeSearch", searchVo);
	}

	@Override
	public Map<String, Object> noticeSearchCnt(KeywordVO searchVo) {
		return sqlSession.selectOne(namespace+"noticeSearchCnt", searchVo);
	}

	@Override
	public int insertQna(QnaVO vo) {
		int cnt=sqlSession.insert(namespace+"insertQna", vo);
		return cnt;
	}


}
