package com.it.wanted.jikgun.model;

import java.util.List;

import com.it.wanted.jikmu.model.JikmuVO;

public interface JikgunService {

	List<JikgunVO> selectAllJikgun();
	String selectBasicJikgunCode();
	List<JikmuVO> selectJikmuByJikgunCode(String basicCode);

}
