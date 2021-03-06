package com.it.wanted.matchup.model;

import java.util.List;
import java.util.Map;

import com.it.wanted.common.SearchVO;
import com.it.wanted.resume.model.ResumeAllVO;
import com.it.wanted.resume.model.ResumeVO;

public interface MatchupMemService {

	/* 자연 */
	public int isMatchupMem(int memNo);
	public int selectmcuResumeNo(int memNo);
	public int hasMcuResumeNo(int memNo);
	public int insertMcuMem(MatchupAllVO mmAllVo);
	public MatchupMemVO selectMcuMem(int memNo);
	public int insertMcuMem2(MatchupAllVO mAllVo);//이력서 등록 후 mcu에 업뎃
	public List<MatchupDetailAllVO> selectMatchupDetails(int mcumemNo);
	public List<Map<String, Object>> selectMcuExListView(int mcumemNo);
	public int updateMatchupResume(MatchupMemVO mcuVo);
	public int updateMatcupInfo2(MatchupAllVO mAllVo);
	public int updateMatcupInfo1(MatchupAllVO mAllVo);
	public MatchupDetailsViewVO selectMatchupDetailsView(int memNo); 
	public int updateMatchupRefName(MatchupMemVO mcuVo);
	public MatchupMemVO selectOnebymatchupMemNo(int mcumemNo);
	public int updateMatchupjobFlag(MatchupMemVO mcuVo);
	public List<Map<String, Object>> selectMatchupMemAllbyAdmin(SearchVO searchVo);
	public int totalRecordbyAdmin(SearchVO searchVo);
	public int matchupLikeCountbyMemNo(int memNo);
	
	/* 현빈 */
	List<MatchupMemVO> selectOpen();
	List<Map<String, Object>> selectTenMem(int firstRecord);
	int selectMcumemNo(int resumeNo);
	List<Map<String, Object>> selectSearchedMemList(MatchupMemSearchVO mcuMemSearchVo);
	public List<Map<String, Object>> selectZzimedList(MatchupMemSearchVO searchVo);
	public int isZzimed(int resumeNo, String comCode);
	public int selectMemNo(int resumeNo);
	public List<Map<String, Object>> selectDidntReadList(MatchupMemSearchVO searchVo);
	public List<Map<String, Object>> selectReadList(MatchupMemSearchVO searchVo);
	public List<Map<String, Object>> selectProposedList(MatchupMemSearchVO searchVo);
}
