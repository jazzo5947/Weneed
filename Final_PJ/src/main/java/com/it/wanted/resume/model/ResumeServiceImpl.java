package com.it.wanted.resume.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.it.wanted.achievement.model.AchievementDAO;
import com.it.wanted.achievement.model.AchievementVO;
import com.it.wanted.addinformatiod.model.AddinformatiodDAO;
import com.it.wanted.addinformatiod.model.AddinformatiodVO;
import com.it.wanted.career.model.CareerDAO;
import com.it.wanted.career.model.CareerVO;
import com.it.wanted.common.SearchVO;
import com.it.wanted.education.model.EducationDAO;
import com.it.wanted.education.model.EducationVO;
import com.it.wanted.expertise.model.ExpertiseDAO;
import com.it.wanted.languages.model.LanguagesDAO;
import com.it.wanted.languages.model.LanguagesVO;
import com.it.wanted.languagestest.model.LanguagestestDAO;
import com.it.wanted.languagestest.model.LanguagestestVO;
import com.it.wanted.link.model.LinkDAO;
import com.it.wanted.link.model.LinkVO;
import com.it.wanted.matchup.model.MatchupMemDAO;
import com.it.wanted.matchup.model.MatchupMemVO;

@Service
public class ResumeServiceImpl implements ResumeService{
	@Autowired private ResumeDAO resumeDao;
	@Autowired private CareerDAO careerDao;
	@Autowired private AchievementDAO achievmentDao;
	@Autowired private EducationDAO educationDao;
	@Autowired private AddinformatiodDAO addinformatiodDao;
	@Autowired private LanguagesDAO languagesDao;
	@Autowired private LanguagestestDAO languagestestDao;
	@Autowired private LinkDAO linkDao;
	@Autowired private MatchupMemDAO matchupmemDao;
	@Autowired private ExpertiseDAO expertDao;
	
	private static final Logger logger= LoggerFactory.getLogger(ResumeServiceImpl.class);
	
	@Override
	public int insertResume(ResumeVO vo) {
		return resumeDao.insertResume(vo);
	}

	@Override
	public ResumeVO selectResume(int memNo) {
		return resumeDao.selectResume(memNo);
	}
	
	@Override
	@Transactional
	public int updateResume(ResumeAllVO resumeAllVo) {
		
		logger.info("이력서 등록resumeALlVo={}",resumeAllVo);
		ResumeVO rVo= resumeAllVo.getResumeVo();
		List<CareerVO>crrList=resumeAllVo.getCrrList();
		List<AchievementVO>achList=resumeAllVo.getAchList();
		List<EducationVO>eduList=resumeAllVo.getEduList();
		List<AddinformatiodVO>addList=resumeAllVo.getAddList();
		List<LanguagesVO>langList=resumeAllVo.getLangList();
		List<LanguagestestVO>testList=resumeAllVo.getTestList();
		List<LinkVO>linkList=resumeAllVo.getLinkList();
				
		int cnt=0;
		
		try {
			//이력서 등록
			cnt=resumeDao.updateResume(rVo);
			logger.info("이력서 등록rVo={}, cnt={}",rVo,cnt);
			
			//경력 List등록
			if(crrList!=null&& !crrList.isEmpty()) {
				for(int i=0;i<crrList.size();i++) {
					CareerVO crrVo=crrList.get(i);
					if(crrVo.getCareerNo()!=0) {
						cnt=careerDao.updateCareer(crrVo);
						logger.info("커리어 등록crrVo={}, cnt={}",crrVo,cnt);
					}
				}//for
				
				//성과List등록
				if(achList!=null&&!achList.isEmpty()) {
					for(int i=0;i<achList.size();i++) {
						AchievementVO achVo=achList.get(i);
						if(achVo.getAchNo()!=0) {
							cnt=achievmentDao.updateAch(achVo);
							logger.info("성과 등록achVo={}, cnt={}",achVo,cnt);
						}
					}//for
				}//if
			 }//바깥 if
			
			//교육
			if(eduList!=null&& !eduList.isEmpty()) {
				for (int i = 0; i < eduList.size(); i++) {
					EducationVO eduVo=eduList.get(i);
					if(eduVo.getEduNo()!=0) {
						cnt=educationDao.updateEdu(eduVo);
						logger.info("교육사항등록eduVo={}, cnt={}",eduVo,cnt);
					}
				}//for
			}//if
			
			//기타활동
			if(addList!=null&& !addList.isEmpty()) {
				for (int i = 0; i < addList.size(); i++) {
					AddinformatiodVO addVo=addList.get(i);
					if(addVo.getAddNo()!=0) {
						cnt=addinformatiodDao.updateAdd(addVo);
						logger.info("기타활동사항 등록 addVo={}, cnt={}",addVo,cnt);
					}
				}
			}
			
			//언어
			if(langList!=null&& !langList.isEmpty()) {
				for (int i = 0; i < langList.size(); i++) {
					LanguagesVO langVo = langList.get(i);
					
					if(langVo.getLangNo()!=0) {
						cnt=languagesDao.updateLang(langVo);
						logger.info("외국어사항 등록langVo={}, cnt={}",langVo,cnt);
					}
				}
				
				//어학
				if(testList!=null&& !testList.isEmpty()) {
					for (int i = 0; i < testList.size(); i++) {
						LanguagestestVO testVo = testList.get(i);
						if(testVo.getLangtestNo()!=0) {
							cnt=languagestestDao.updateLangtest(testVo);
							logger.info("어학시험 등록 testVo={}",testVo,cnt);
						}
					}//for
				}//if
				
			}//if언어
			
			//링크
			if(linkList!=null&& !linkList.isEmpty()) {
				for (int i = 0; i < linkList.size(); i++) {
					LinkVO linkVo = linkList.get(i);
					if(linkVo.getLinkNo()!=0) {
						cnt=linkDao.updateLink(linkVo);
						logger.info("기타활동사항 등록 linkVo={}, cnt={}",linkVo,cnt);
					}//if
				}//for
			}//if
				
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}
	

	/*
	@Override
	@Transactional
	public int updateResume(ResumeAllVO resumeAllVo) {
		
		logger.info("이력서 등록resumeALlVo={}",resumeAllVo);
		ResumeVO rVo= resumeAllVo.getResumeVo();
		List<CareerVO>crrList=resumeAllVo.getCrrList();
		List<AchievementVO>achList=resumeAllVo.getAchList();
		List<EducationVO>eduList=resumeAllVo.getEduList();
		List<AddinformatiodVO>addList=resumeAllVo.getAddList();
		List<LanguagesVO>langList=resumeAllVo.getLangList();
		List<LanguagestestVO>testList=resumeAllVo.getTestList();
		List<LinkVO>linkList=resumeAllVo.getLinkList();
				
		int cnt=0;
		
		try {
			//이력서 등록
			cnt=resumeDao.updateResume(rVo);
			logger.info("이력서 등록rVo={}, cnt={}",rVo,cnt);
			
			//경력 List등록
			if(crrList!=null&& !crrList.isEmpty()) {
				for(CareerVO crrVo:crrList) {
					cnt=careerDao.updateCareer(crrVo);
					logger.info("커리어 등록crrVo={}, cnt={}",crrVo,cnt);
				}
				//성과List등록
				if(achList!=null&&!achList.isEmpty()) {
					for(AchievementVO achVo:achList) {
						cnt=achievmentDao.updateAch(achVo);
						logger.info("성과 등록achVo={}, cnt={}",achVo,cnt);
					}//for
				}//if
			 }//바깥 if
			
			//교육
			if(eduList!=null&& !eduList.isEmpty()) {
				for(EducationVO eduVo:eduList) {
					cnt=educationDao.updateEdu(eduVo);
					logger.info("교육사항등록eduVo={}, cnt={}",eduVo,cnt);
				}
			}
			
			//기타활동
			if(addList!=null&& !addList.isEmpty()) {
				for(AddinformatiodVO addVo:addList) {
					cnt=addinformatiodDao.updateAdd(addVo);
					logger.info("기타활동사항 등록 addVo={}, cnt={}",addVo,cnt);
				}
			}
			
			//언어
			if(langList!=null&& !langList.isEmpty()) {
				for(LanguagesVO langVo:langList) {
					cnt=languagesDao.updateLang(langVo);
					logger.info("외국어사항 등록langVo={}, cnt={}",langVo,cnt);
				}
				//어학
				if(testList!=null&& !testList.isEmpty()) {
					for(LanguagestestVO testVo:testList) {
						cnt=languagestestDao.updateLangtest(testVo);
						logger.info("어학시험 등록 testVo={}",testVo,cnt);
					}
				}
				
			}
			
			//링크
			if(linkList!=null&& !linkList.isEmpty()) {
				for(LinkVO linkVo:linkList) {
					cnt=linkDao.updateLink(linkVo);
					logger.info("기타활동사항 등록 linkVo={}, cnt={}",linkVo,cnt);
				}
			}
				
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}
*/
	@Override
	public List<ResumeVO> selectResumeAll(int memNo) {
		return resumeDao.selectResumeAll(memNo);
	}

	@Override
	public int insertResumeFile(ResumeVO rVo) {
		return resumeDao.insertResumeFile(rVo);
	}

	@Transactional
	@Override
	public int deleteResume(ResumeVO rVo) {
		
		int cnt=0;
		try {
			int count=matchupmemDao.isMatchupMem(rVo.getMemNo());
			if(count>0) {//매치업회원이면
				MatchupMemVO matchupmemVo = matchupmemDao.selectMcuMem(rVo.getMemNo());
				//지우려는 이력서가 매치업이력서와 같으면
				if(matchupmemVo.getResumeNo()==rVo.getResumeNo()) {
					//1. 전문분야지우기
					cnt=expertDao.deleteExpertise(matchupmemVo.getExpertiseNo());
					//2.매치업 지우기
					cnt=matchupmemDao.deleteMatchupmembyResumeNo(rVo.getResumeNo());
				}
			}
			//4.
			cnt=resumeDao.deleteResume(rVo);
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt; 
	}

	@Override
	public ResumeVO selectResumeOne(ResumeVO rVo) {
		return resumeDao.selectResumeOne(rVo);
	}
	
	//이력서 상세조회!!
	@Override
	public ResumeAllVO selectResumeDetail(ResumeVO rVo) {
		
		int resumeNo=rVo.getResumeNo();
		ResumeAllVO resumeAllVo= new ResumeAllVO();
		
		//이력서 조회
		ResumeVO resumeVo=resumeDao.selectResumeOne(rVo);
		if(resumeVo !=null ) {
			resumeAllVo.setResumeVo(resumeVo);
			
			//경력조회	
			List<AchievementVO> achList=new ArrayList<AchievementVO>();
			List<CareerVO>crrList=careerDao.selectCareerbyResumeNo(resumeNo);
			if(crrList!=null) {
				resumeAllVo.setCrrList(crrList);
				
				//경력리스트에서 경력번호 꺼내서 포문돌려서 성과 리스트 받기 achList
				for(int i=0; i<crrList.size();i++) {
					int careerNo=crrList.get(i).getCareerNo();
					if(careerNo!=0) {
						List<AchievementVO> aList = achievmentDao.selectAchbyCareerNo(careerNo);
						for(int j=0;j<aList.size();j++) {
							AchievementVO achVo = aList.get(j);
							achList.add(achVo);
						}
					}
				}
				if(achList!=null) {
					resumeAllVo.setAchList(achList);
					logger.info("achList={}",achList);
				}

			}//if
			
			//언어  
			List<LanguagestestVO> testList =new ArrayList<LanguagestestVO>();
			
			List<LanguagesVO> langList = languagesDao.selectLangbyResumeNo(resumeNo);
			if(langList!=null) {
				resumeAllVo.setLangList(langList);
				logger.info("langList={}",langList);
				//어학점수

				for(int i=0; i<langList.size();i++) {
					int langNo=langList.get(i).getLangNo();
					if(langNo!=0) {
						List<LanguagestestVO> tList = languagestestDao.selectLangtestbyLangNo(langNo);
						for(int j=0;j<tList.size();j++) {
							LanguagestestVO testVo = tList.get(j);
							testList.add(testVo);
							
						}
					}
				}
				if(testList!=null) {
					resumeAllVo.setTestList(testList);
					logger.info("testList={}",testList);
				}
					
			}//if
			
			//학력사항
			List<EducationVO> eduList = educationDao.selectEdubyResumeNo(resumeNo);
			if(eduList!=null) {
				resumeAllVo.setEduList(eduList);
			}
			
			//기타활동사항
			List<AddinformatiodVO> addList = addinformatiodDao.selectAddByResumeNo(resumeNo);
			if(addList!=null) {
				resumeAllVo.setAddList(addList);
			}
			
			//링크
			List<LinkVO>linkList=linkDao.selectLinkbyResumeNo(resumeNo);
			if(langList!=null) {
				resumeAllVo.setLinkList(linkList);
			}
			
		}//바깥 이프
		logger.info("resumeAllVo={}",resumeAllVo);
		return resumeAllVo;
	}

	@Override
	public ResumeVO selectResumeOnebyResumeNo(int resumeNo) {
		return resumeDao.selectResumeOnebyResumeNo(resumeNo);
	}
	
	@Override
	public List<Map<String, Object>> selectResumeAllbyAdmin(SearchVO searchVo) {
		return resumeDao.selectResumeAllbyAdmin(searchVo);
	}
	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return resumeDao.selectTotalRecord(searchVo);
	}
	
	
	/* 현빈 */
	//매치업 기업서비스에서 이력서 모달팝업에 그려주기 위한 메소드
	@Override
	public ResumeAllVO selectResumeByResumeNo(int resumeNo) {
		ResumeAllVO resumeAllVo=new ResumeAllVO();
		
		//이력서 번호로 이력서 조회
		ResumeVO resumeVo=resumeDao.selectResumeByResumeNo(resumeNo);
		if(resumeVo != null ) {
			resumeAllVo.setResumeVo(resumeVo);
			
			//경력조회	
			List<AchievementVO> achList=new ArrayList<AchievementVO>();
			List<CareerVO>crrList=careerDao.selectCareerbyResumeNo(resumeNo);
			if(crrList!=null) {
				resumeAllVo.setCrrList(crrList);
				
				//경력리스트에서 경력번호 꺼내서 포문돌려서 성과 리스트 받기 achList
				for(int i=0; i<crrList.size();i++) {
					int careerNo=crrList.get(i).getCareerNo();
					if(careerNo!=0) {
						List<AchievementVO> aList = achievmentDao.selectAchbyCareerNo(careerNo);
						for(int j=0;j<aList.size();j++) {
							AchievementVO achVo = aList.get(j);
							achList.add(achVo);
						}
					}
				}
				if(achList!=null) {
					resumeAllVo.setAchList(achList);
					logger.info("achList={}",achList);
				}
				
			}//if
			
			//언어  
			List<LanguagestestVO> testList =new ArrayList<LanguagestestVO>();
			List<LanguagesVO> langList = languagesDao.selectLangbyResumeNo(resumeNo);
			if(langList!=null) {
				resumeAllVo.setLangList(langList);
				logger.info("langList={}",langList);
				//어학점수

				for(int i=0; i<langList.size();i++) {
					int langNo=langList.get(i).getLangNo();
					if(langNo!=0) {
						List<LanguagestestVO> tList = languagestestDao.selectLangtestbyLangNo(langNo);
						for(int j=0;j<tList.size();j++) {
							LanguagestestVO testVo = tList.get(j);
							testList.add(testVo);
						}
					}
				}
				if(testList!=null) {
					resumeAllVo.setTestList(testList);
					logger.info("testList={}",testList);
				}
					
			}//if
			
			//학력사항
			List<EducationVO> eduList = educationDao.selectEdubyResumeNo(resumeNo);
			if(eduList!=null) {
				resumeAllVo.setEduList(eduList);
			}
			
			//기타활동사항
			List<AddinformatiodVO> addList = addinformatiodDao.selectAddByResumeNo(resumeNo);
			if(addList!=null) {
				resumeAllVo.setAddList(addList);
			}
			
			//링크
			List<LinkVO>linkList=linkDao.selectLinkbyResumeNo(resumeNo);
			if(langList!=null) {
				resumeAllVo.setLinkList(linkList);
			}
			
		}//바깥 이프
		logger.info("resumeAllVo={}",resumeAllVo);
		return resumeAllVo;
	}




}
