package com.it.wanted.applicants.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ApplicantsServiceImpl implements ApplicantsService{
	@Autowired
	private ApplicantsDAO applicantsDao;

	@Override
	public List<ApplicantsVO> selectAllPositions(String comCode) {
		return applicantsDao.selectAllPositions(comCode);
	}

	@Override
	public int selectTotalRecord(AppliPagingVO appliPagingVo) {
		return applicantsDao.selectTotalRecord(appliPagingVo);
	}

	@Override
	public ApplicantsVO selectByNo(int no) {
		return applicantsDao.selectByNo(no);
	}


	@Override
	public List<Map<String, Object>> selectApplicants(AppliPagingVO appliPagingVo) {
		return applicantsDao.selectApplicants(appliPagingVo);
	}

	@Override
	public int updateByNo(int no) {
		return applicantsDao.updateByNo(no);
	}



	@Override
	public int updateStatus(ApplicantsVO applicantsVo) {
		return applicantsDao.updateStatus(applicantsVo);
	}

	@Override
	public List<Map<String, Object>> selectAll() {
		return applicantsDao.selectAll();
	}

	@Override
	public int countBunmo(AppliPagingVO appliPagingVo) {
		return applicantsDao.countBunmo(appliPagingVo);
	}

	@Override
	public int countBunja(AppliPagingVO appliPagingVo) {
		return applicantsDao.countBunja(appliPagingVo);
	}


//	@Override
//	public int updatePeriod(ApplicantsVO appliVo) {
//		// TODO Auto-generated method stub
//		return applicantsDao.updatePeriod(appliVo);
//	}



}
