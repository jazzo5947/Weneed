<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jobSalary.css">
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#subCategory").change(function(){
	  		$.ajax({
				url:"<c:url value='/salaryChartData.do'/>",
				type:"GET",
				dataType:"json",
				data:{
					"jikgun_code": this.value,
					"jikmu_code":this.value
				},
				success:function(res){
					alert(res);
				},
				error:function(xhr, status, error){
					alert('error! : ' + error);
				}
			});
	});
	
});

</script>

<div class="salary-chart-box">
	<div class="container">
		<section class="salary-chart">
			<canvas id="salaryChart"></canvas>
		</section>
		<div class="salary-chart-desc">
			<button type="button" class="salary-chart-desc-btn">개발</button>
			<button type="button" class="salary-chart-desc-btn">CTO,Chief Technology Officer</button>
		</div>
		<aside>
			<h4 class="salary-chart-job">신입CTO,Chief Technology Officer 예상 연봉</h4>
			<h2 class="salary-chart-salary">
				3,230<sub>만원</sub>
			</h2>
		</aside>
		<div class="salary-select-box">
			<div class="salary-select-box-wrap">
				<div class="salary-select-each">
					<div class="salary-select-each-jobGroup">
						<div class="salary-select-eachGroup">
							<select name="category" style="border:none;width:100%; outline:none;">
								<option disable>직군</option>
								<option value="JG001">개발</option>
							</select>
						</div>
					</div>
					<div class="salary-select-each-job">
						<div class="salary-select-eachGroup">
							<select id="subCategory" name="subCategory" style="border:none;width:100%; outline:none;">
								<option disable>직무</option>
								<option value="JM001">서버 개발자</option>
								<option value="2">웹 개발자</option>
								<option value="3">프론트엔드 개발자</option>
								<option value="">안드로이드 개발자</option>
								<option value="">iOS 개발자</option>
								<option value="">데이터 엔지니어</option>
								<option value="">파이썬 개발자</option>
								<option value="">소프트웨어 엔지니어</option>
								<option value="">DevOps / 시스템 관리자 </option>
								<option value="">Node.js 개발자</option>
								<option value="">개발 매니저</option>
								<option value="">데이터 사이언티스트</option>
								<option value="">머신러닝 엔지니어</option>
								<option value="">시스템, 네트워크 관리자</option>
								<option value="">C, C++개발자</option>
								<option value="">빅데이터 엔지니어</option>
								<option value="">QA, 테스트 엔지니어</option>
								<option value="">PHP 개발자</option>
								<option value="">프로덕트 매니저</option>
								<option value="">웹퍼블리셔</option>
								<option value="">보안엔지니어</option>
								<option value="">.NET 개발자</option>
								<option value="">루비온레일즈 개발자</option>
								<option value="">임베디드 개발자</option>
								<option value="">CTO, Chief Technology Officer</option>
								<option value="">블록체인 플랫폼 엔지니어</option>
								<option value="">영상, 음성 엔지니어</option>
								<option value="">크로스플랫폼 앱 개발자</option>
								<option value="">BI 엔지니어</option>
								<option value="">그래픽스 엔지니어</option>
								<option value="">VR 엔지니어</option>
								<option value="">CIO, Chief Information Officer</option>
							</select>
						</div>
					</div>
					<div class="salary-select-each-career">
						<div class="salary-select-eachGroup">
							<select name="category" style="border:none;width:100%; outline:none;">
								<option disable>경력</option>
								<option value="">신입</option>
								<option value="">1년</option>
								<option value="">2년</option>
								<option value="">3년</option>
								<option value="">4년</option>
								<option value="">5년</option>
								<option value="">6년</option>
								<option value="">7년</option>
								<option value="">8년</option>
								<option value="">9년</option>
								<option value="">10년</option>
							</select>
						</div>
					</div>
					<div class="salary-select-each-salary">
						<input type="text" name="salary" placeholder="연봉" value="" style="border:none;width:100%;padding-left:15px;color:#b5b5b5;"><span>만원</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container">
	<div class="salary-relation-box">
		<h5 class="salary-chart-desc">
			* 이 데이터는 채용 정보에 포함된 직무 별 요구 경력(최저, 최대)과 연봉(최저, 최대)을 바탕으로 추정한 예상 연봉 데이터입니다.
		</h5>
		<div class="matchUp-start-box">
			<div class="matchUp-start-box-text1">이제 밤새워 채용사이트 보지 마세요.</div>
			<div class="matchUp-start-box-text2">원티드 매치업에 프로필을 등록하면, 기업의 인사담당자가 직접 면접을 제안합니다.</div>
			<div class="matchUp-start-box-logoBox">
				<ul class="logoBox">
					<li class="logoBox-li" style="background:url('${pageContext.request.contextPath}/resources/images/jobSalary/salary_company_001.jpg') center/cover no-repeat;"></li>
					<li class="logoBox-li" style="background:url('${pageContext.request.contextPath}/resources/images/jobSalary/salary_company_002.jpg') center/cover no-repeat;"></li>
					<li class="logoBox-li" style="background:url('${pageContext.request.contextPath}/resources/images/jobSalary/salary_company_003.jpg') center/cover no-repeat;"></li>
					<li class="logoBox-li" style="background:url('${pageContext.request.contextPath}/resources/images/jobSalary/salary_company_004.jpg') center/cover no-repeat;"></li>
					<li class="logoBox-li" style="background:url('${pageContext.request.contextPath}/resources/images/jobSalary/salary_company_005.jpg') center/cover no-repeat;"></li>
					<li class="logoBox-li" style="background:url('${pageContext.request.contextPath}/resources/images/jobSalary/salary_company_006.jpg') center/cover no-repeat;"></li>
					<li class="logoBox-li" style="background:url('${pageContext.request.contextPath}/resources/images/jobSalary/salary_company_007.jpg') center/cover no-repeat;"></li>
					<li class="logoBox-li" style="background:url('${pageContext.request.contextPath}/resources/images/jobSalary/salary_company_008.jpg') center/cover no-repeat;"></li>
					<li class="logoBox-li" style="background:url('${pageContext.request.contextPath}/resources/images/jobSalary/salary_company_009.jpg') center/cover no-repeat;"></li>
					<li class="logoBox-li" style="background:url('${pageContext.request.contextPath}/resources/images/jobSalary/salary_company_010.jpg') center/cover no-repeat;"></li>
					<li class="logoBox-li" style="background:url('${pageContext.request.contextPath}/resources/images/jobSalary/salary_company_011.jpg') center/cover no-repeat;"></li>
					<li class="logoBox-li" style="background:url('${pageContext.request.contextPath}/resources/images/jobSalary/salary_company_012.jpg') center/cover no-repeat;"></li>
					<li class="logoBox-li" style="background:url('${pageContext.request.contextPath}/resources/images/jobSalary/salary_company_013.jpg') center/cover no-repeat;"></li>
					<li class="logoBox-li" style="background:url('${pageContext.request.contextPath}/resources/images/jobSalary/salary_company_014.jpg') center/cover no-repeat;"></li>
					<li class="logoBox-li" style="background:url('${pageContext.request.contextPath}/resources/images/jobSalary/salary_company_015.jpg') center/cover no-repeat;"></li>
					<li class="logoBox-li" style="background:url('${pageContext.request.contextPath}/resources/images/jobSalary/salary_company_016.jpg') center/cover no-repeat;"></li>
				</ul>
				<div class="logoPlus">+4910</div>
			</div>
			<a href="#" class="matchUp-start-box-btn">시작하기</a>
		</div>
		<div class="salary-upgrade-position-title-box">
			<h2 class="salary-upgrade-position-title">연봉 업그레이드 포지션</h2>
			<a href="#" class="salary-upgrade-position-more">더보기</a>
		</div>
		<section class="salary-upgrade-position-con">
						<div class="row">
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0" style="padding-bottom:40px;">
									<img src="${pageContext.request.contextPath}/resources/images/jobSalary/salary_001.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">Machine Learning Engineer(Computer Vision)</h4>
									<p class="ge-job-card-company-name">플라스크</p>
									<div class="ge-job-card-company-location">서울
										<span class="ge-addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0" style="padding-bottom:40px;">
									<img src="${pageContext.request.contextPath}/resources/images/jobSalary/salary_002.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">개발 총괄책임자-CTO</h4>
									<p class="ge-job-card-company-name">유니크굿컴퍼니</p>
									<div class="ge-job-card-company-location">서울
										<span class="addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0" style="padding-bottom:40px;">
									<img src="${pageContext.request.contextPath}/resources/images/jobSalary/salary_003.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">FLYBIT(플라이빗) IT부문 총괄책임자 (CTO)</h4>
									<p class="ge-job-card-company-name">한국디지털거래소</p>
									<div class="ge-job-card-company-location">서울
										<span class="addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0" style="padding-bottom:40px;" >
									<img src="${pageContext.request.contextPath}/resources/images/jobSalary/salary_004.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">테크 리드</h4>
									<p class="ge-job-card-company-name">퍼블리(PUBLY)</p>
									<div class="ge-job-card-company-location">서울
										<span class="addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0" style="padding-bottom:40px;">
									<img src="${pageContext.request.contextPath}/resources/images/jobSalary/salary_005.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">VP of Engineering</h4>
									<p class="ge-job-card-company-name">퍼블리(PUBLY)</p>
									<div class="ge-job-card-company-location">서울
										<span class="ge-addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0" style="padding-bottom:40px;" >
									<img src="${pageContext.request.contextPath}/resources/images/jobSalary/salary_006.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">개발팀 리드 (Tech Lead)</h4>
									<p class="ge-job-card-company-name">스타릭스(Locar)</p>
									<div class="ge-job-card-company-location">서울
										<span class="addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0" style="padding-bottom:40px;" >
									<img src="${pageContext.request.contextPath}/resources/images/jobSalary/salary_007.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">개발자(프론트엔드/백엔드/풀스택)</h4>
									<p class="ge-job-card-company-name">원패밀리</p>
									<div class="ge-job-card-company-location">서울
										<span class="addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0" style="padding-bottom:40px;">
									<img src="${pageContext.request.contextPath}/resources/images/jobSalary/salary_008.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">매쓰플랫 개발팀 리더(팀장)</h4>
									<p class="ge-job-card-company-name">프리윌린</p>
									<div class="ge-job-card-company-location">서울
										<span class="addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
						</div>
		</section>
	</div>
</div>

<%@ include file="../inc/bottom.jsp" %>