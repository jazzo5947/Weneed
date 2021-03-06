package com.it.wanted.main.search.model;

import java.util.List;
import java.util.Map;

import com.it.wanted.career.admin.model.ProgramVO;
import com.it.wanted.position.model.PosNewVO;

public interface MainSearchService {

	List<MainSearchVO> searchComInfo(String keyword);

	List<MainSearchVO> searchPosition(String keyword);

	List<MainSearchVO> getSearchKeyword(String keyword);

	List<MainSearchVO> selectNewRecruit();

	List<ProgramVO> selectMainCareerList();

	List<PosNewVO> selectMainNewPos();

}
