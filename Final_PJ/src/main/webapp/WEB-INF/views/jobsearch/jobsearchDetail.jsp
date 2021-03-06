<%@ include file="../inc/top.jsp" %>
<!-- 자연 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%-- <link rel="stylesheet" href="<c:url value='/resources/css/resumeIntro.css'/>"> --%>
<link rel="stylesheet" href="<c:url value='/resources/css/jobsearchApply.css'/>">

<script type="text/javascript">

	$(function(){
/* 여기부터 자연 */
		$('#btApply').click(function(){
			$.ajax({
				url:"<c:url value='/jobsearch/apply.do'/>",
				data:"posNo="+ ${param.posNo},/* 포지션번호 넣어주기! ${posNo} */
				type:"get",
				success:function(result){
					$('#asideApply').empty();
					$('#asideApply').html(result);
				},
				error:function(xhr,status,error){
					alert("error!!:"+error);
				}
			});	 		
		});
		
		$('#btBookmark').click(function(){
			//alert(${param.posNo});
			$.ajax({
				url:"<c:url value='/jobsearch/bookmark.do'/>",
				data:"posNo="+ ${param.posNo},//posNo,memNo
				type:"get",
				dataType:"text",
				success:function(res){
					alert(res);
					//console.log(res); 
					//console.dir();
				},
				error:function(xhr,status,error){
					alert("error!!:"+error);
				}
			});
		});
		/*여기까지 자연 */
		
		
	});
	

	
</script>
<style type="text/css">
.replyBtn{
    cursor: default;
    border: 1px solid #36f;
    color: #36f;
    border-radius: 2px;
    font-size: 10px;
    font-weight: 600;
    margin-left: 5px;
    margin-right: 5px
}
.container{
	color: #444444;
}
#comImg{
    width: 700px;
    height: 500px;
    object-fit: cover;
}
.positionList{
	margin-top: 40px;
    margin-bottom: 20px;
    font-size: 20px;
    font-weight: 600;
    text-align: left;
}
.nameCard{
	width: 730px;
	height:80px;
	border: 1px solid #e1e2e3;
	margin-top: 50px;
	border-radius: 3px;
}
</style>
<section class="section blog-wrap" style="margin-top:-70px;">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="row">
					<div class="col-lg-12 mb-5">
						<div class="single-blog-item">
							<img src="<c:url value='/companyImgUpload/${comImg}'/>" alt="" class="img-fluid" id="comImg">
				
							<div class="blog-item-content mt-5">
				<!-- 상세페이지 제목/ 직무 -->
								<h2 class="mb-4 text-md" style="font-size: 22px;">${posVo.posName}</h2>
				<!-- 회사명, 회사정보페이지로 연결 -->
								
								<!-- 회사명, 응답률, 지역 나란히 출력되도록 위치 조정 (유정) -->
								<div class="companyInfo_jy" style="margin-top: -15px; font-size: 14px;">				
									<div class="replyperbt_jy">
										<span class="comName_jy" > <a href="#"> ${comInfoMap.COM_NAME }</a></span>
										<button type="button" class="replyBtn">응답률 높음</button>
										<span> | ${comInfoMap.REGION_NAME_KR } · ${comInfoMap.NATION_NAME_KR }</span>
										<c:set var="nation" value="${comInfoMap.NATION_NAME_KR }"/>
										<c:set var="region" value="${comInfoMap.REGION_NAME_KR }"/>
									</div>
								</div>
								<!-- 기존 코드!
								<div class="companyInfo_jy">				
									<span class="comName_jy" > <a href="#"> ${comInfoMap.COM_NAME }</a></span>
									<div class="replyperbt_jy">
											<button style="cursor:default" type="button" >응답률 평균이상</button>
									</div>
									<span> | ${comInfoMap.REGION_NAME_KR } · ${comInfoMap.NATION_NAME_KR }</span>	
								</div>
								 -->
				<!-- 회사정보 태그넣기 -->				
								<div class="sidebar-widget tags mb-3" style="margin-top: 20px;">
									<a href="#">#통신비</a>
									<a href="#">#단체보험</a>
									<a href="#">#건강검진</a>
									<a href="#">#택시비</a>
									<a href="#">#사내카페</a>
									<a href="#">#간식</a>
									<a href="#">#음료</a>
									<a href="#">#상여금</a>
									<a href="#">#IT,컨텐츠</a>
								</div>
				
								<!-- <p class="lead mb-4"> </p>-->	
								<!-- <p class="lead mb-4 font-weight-normal text-black">The same </p> -->
												
								<div class="jobsearch-contetns_jy">
								
				<!-- 주요직무/소개? -->
									<div class="divcontent div-jscontext_jy">
										<div>
											<p>${posVo.posContext }</p>
											<br>
										</div>
											
										<div>
											<h3><b>주요업무</b></h3><br>
											<p>${posVo.posCareer }</p>
										</div>										
									</div>
									<br>
									
				<!-- 자격요건 -->	
									<div class="divcontent div-jsqualification_jy">				
										<div>
											<h3><b>	자격요건</b></h3>
											${posVo.qualification }
										</div>	
											<br>
					<!-- 우대가 따로있나? -->						
										<div>
											<h3><b>우대사항</b></h3>
											${posVo.preferentialTreatment }
										</div>
									 </div>
											<br>
					<!-- 복지정책 -->	
				
									<div class="divcontent div-jsbenefit_jy">
										<div>
											<h3><b>혜택과 복지</b></h3>
											${posVo.welfareBenefits}
										</div>
									</div>
									<br>
								</div><!-- jobsearchcontents div -->
								<hr>
<!-- 마감일, 회사주소, 지도-->									
								<div style="color: black; font-size:16px; margin-bottom: 20px;">
									<span style="color:gray; margin-bottom: 20px;"><b>마감일</b> &nbsp;&nbsp;&emsp;</span><span><b>${proVo.endDate }</b></span><br>
									<span style="color:gray; margin-bottom: 20px;"><b>근무지역</b> &nbsp;&nbsp;</span><span><b>${comInfoMap.COM_ADDRESS }</b></span>
								</div>
								
								<div class="google-map ">
									<%@ include file="map.jsp" %>
								</div>
								
								<!-- 여기다가 회사 네임카드랑 팔로우 -->								
								<div class="nameCard">
								   	<button type="button" class="btnCompan" onClick="location.href='companyDetail.do'" style="outline:none;">
								   	<div style="width:280px; margin:15px;">
							   			<div>
							   				<img alt="" src="<c:url value='/companyImgUpload/${comImg}'/>" style="width:50px; height:50px; float:left;">
							   			</div>
							   			<div style="float:left; margin-left:10px; text-align:left; font-size:15px; font-weight: 600;">
							   				<p>${comInfoMap.COM_NAME }</p>
							   				<p style="color:gray; margin-top:-8px;">${comInfoMap.INDUSTRY }</p>
							   			</div>
							   			</div>
								   	</button>
								   
								   	<button type="button" class="followButton" onClick="location.href='#'" style="font-weight: bold; width:85px; height:30px; background-color:#258bf7; border-radius: 3px; color: #fff; float:right; margin:21px;">
								   		팔로우
								   	</button>
								</div>
							</div>
						</div>
					</div>
				</div>
            </div>
<!-- 여기부터 aside -->
<!-- 자연임포트  ajax 이벤트 걸어야함!!!! posNo파라미터로 넣기-->
			<%-- <div id="displayApply">
				<c:import url="/jobsearch/apply.do?posNo=27"></c:import>
			</div> --%>
			<div id="displayAside" style="position: inherit;">
				  <aside class="col-lg-4 asideApply_jy" id="asideApply">
				  <%@include file="aside.jsp"%>
					   <!-- <div class="sidebar-wrap pl-lg-4 mt-5 mt-lg-0" style="width:350px;">
							<div class="sidebar-widget schedule-widget mb-3">
								<div>
									<h5 class="mb-4">채용보상금</h5>
									<ul>
										<li> 
											<h4>추천인</h4>
											<p>500,000원</p>
										</li>
										<li> 
											<h4>지원자</h4>
											<p>500,000원</p>
										</li>
									</ul>
									<button type="button">
										공유버튼
									</button>
								</div>
								
								<div class="buttonsdiv_jy">
									<div class="btdiv_jy bookmarkbtdiv_jy"> 
										<button class="bookmark_jy" type="button">
											북마크하기
										</button>
									</div>
									<div class="btdiv_jy applybtdiv_jy">
										<button class="btapply_jy" type="button" id="btApply">
											지원하기
										</button>
									</div>
								</div>	
								
								<div>
									<button>
										<i class="icon-ic_favorite_black_24px :before"></i>
		좋아요 갯수		 				<span>32</span>
									</button>
									<button>
		좋아요 누른 사람들   				  <ul>
											<li style='background-image: url("https://static.wanted.co.kr/images/avatars/1345710/c968c352.jpg"), url("https://s3.ap-northeast-2.amazonaws.com/wanted-public/profile_default.png")'></li>
											<li style='background-image: url("https://s3.ap-northeast-2.amazonaws.com/wanted-public/profile_default.png"), url("https://s3.ap-northeast-2.amazonaws.com/wanted-public/profile_default.png")'></li>
										</ul>
									</button>
								</div>
						 </div>
					</div> -->
	           </aside> 
 			</div>
 			
 			
 <!-- 어사이드끝 -->     
					<!--  <section class="section service-2"> -->
						<div class="container">
							<div class="positionList">
					<!-- 세션에서 이름가져와서 뿌리기 -->
								<c:if test="${!empty memName}">
									<h2 style="text-align: left;"><b>${memName}님, 이 포지션을 찾고 계셨나요?</b></h2>
								</c:if>
								<c:if test="${empty memName}">
									<h2 style="text-align: left;"><b>이 포지션을 찾고 계셨나요?</b></h2>
								</c:if>
							</div>
					
					<c:if test="${empty jsDetailsViewVoList }">
							<div style="text-align:center;">	
								<h2>비슷한 채용포지션이  없습니다.</h2>
							</div>	
					</c:if>
					<c:if test="${!empty jsDetailsViewVoList }">
						<!-- 반복 시작 -->
								
						<div class="row">
							<c:forEach var="map" items="${jsDetailsViewVoList}">
								<div class="col-lg-3 col-md-6 ">
									<div class="department-block mb-5">				
										<img src="<c:url value='/companyImgUpload/${map["COM_IMG_URL"]}'/>" class="img-fluid w-100" style="margin-bottom: 20px;"> 
											<div class="content">
												<a href="#" class="read-more">
														<span style="color: #333; font-size: 17px; font-weight: 600;">${map["POS_NAME"]}</span><br>
														<span class="mb-4" style="font-size: 14px; font-weight: 600;">${map['COM_NAME']}</span><br>
														<!-- 직무명은 불러올 필요가 없는 것 같아 주석처리합니다!
														<span class="mb-4" style="font-size: 14px;">${map['JIKMU_NAME']}</span><br>												
														국가, 도시는 한글로 받아오기 위해 c:set 이용해 불러왔습니다									
														<span>${map['REGION']}ㆍ${map['NATION']}</span><br> -->
														<span style="font-size: 14px; color: #999">${region}ㆍ${nation}</span><br>
														<span style="font-size: 14px; color: #666">채용보상금 1,000,000원</span>
												</a>
											</div>
									</div>
								</div>
							</c:forEach>
						</div>		
					</c:if>

					
				</div> <!-- containerdiv -->
            
              
        </div> <!-- 바깥 rowdiv -->
    </div>
</section> <!-- 바깥containerdiv -->





<%@ include file="../inc/bottom.jsp" %>