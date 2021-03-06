package com.it.wanted.matchupCom.model;

import java.util.List;
import java.util.Map;

import com.it.wanted.common.SearchVO;

public interface MatchupComService {

	int addZzim(MatchupZzimVO zzimVo);
	int isZzimed(MatchupZzimVO zzimVo);
	int delZzim(MatchupZzimVO zzimVo);
	Map<String, Object> hasMatchup(String comCode);
	MatchupComVO selectMatchupCom(String comCode);
  
  	/* 0212 자연 */
	public List<Map<String, Object>> selectSearchmatchupCombyComName(String comName);
	/* 0216 */
	public List<Map<String, Object>>selectMatchupComAllbyAdmin(SearchVO searchVo);
	public int selectTotalRordbyAdmin(SearchVO searchVo);
}
