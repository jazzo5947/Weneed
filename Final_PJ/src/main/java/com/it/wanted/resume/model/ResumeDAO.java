package com.it.wanted.resume.model;

import java.util.List;

public interface ResumeDAO {
	
	public int insertResume(ResumeVO vo);
	public ResumeVO selectResume(int memNo);
	public int updateResume(ResumeVO vo);
	public List<ResumeVO> selectResumeAll(int memNo);
	public int insertResumeFile(ResumeVO rVo);
	public int deleteResume(ResumeVO rVo);
	public ResumeVO selectResumeOne(ResumeVO rVo);
	public int insertMcuResume(ResumeVO rVo);
	public ResumeVO selectResumeOnebyResumeNo(int resumeNo);
	public int updateResumeIntroduce(ResumeVO rVo);
}
