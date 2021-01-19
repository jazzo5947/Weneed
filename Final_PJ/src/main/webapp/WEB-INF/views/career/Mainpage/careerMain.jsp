<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../inc/top.jsp" %>
    

  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/resources/images/favicon.ico'/>" />

  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="<c:url value='/resources/plugins/bootstrap/css/bootstrap.min.css'/>">
  <!-- Icon Font Css -->
  <link rel="stylesheet" href="<c:url value='/resources/plugins/icofont/icofont.min.css'/>">
<%--   <!-- Slick Slider  CSS -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/slick-carousel/slick/slick.css'/>">
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/slick-carousel/slick/slick-theme.css'/>">
 --%>
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">

  <!-- 커리어성장 카테고리메뉴 css -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/slick-carousel/slick/slick.css'/>">
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/slick-carousel/slick/slick-theme.css'/>">
    
  <!-- 커리어성장 필터 팝업창 css -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jiwonPopup.css'/>">


<body id="top">


<!-- 구독신청 배너부분!!!!!!!!! -->
<section class="page-title bg-1" style="padding:0px;">
    <a href="<c:url value='careerDetail.do'/>">
         <section class="_2LiFavTzcqjq8ansnAqKSQ _2bqGiY6XO2ke3gSGZbbVm3" style="padding-bottom: 15%; background-image: url(&quot;https://static.wanted.co.kr/banner/Web_Event_Banner_C.jpg&quot;);"></section>
	</a>
</section>
<!-- 구독신청 배너부분 끝  -->

<%-- <!-- 슬라이드 메뉴부분!!!!!!!!! -->
<c:import url="career/category/categoryList.do">
	<c:param name="eventName" value="NEW"></c:param>
</c:import>
 --%>

<!-- 슬라이드 메뉴부분!!!!!!!!! -->
<section class="section doctors">
	<div class="container">
		<div class="row">
	 	<div class="careerMenu" style="width:100%; height: 50px; background-color: #fff; padding-bottom:-10px;">				
		<div class="col-12 text-center mb-5">
			<div class="btn-group btn-group-toggle " data-toggle="buttons" >
 
          <label class="btn active " >
	            <input type="radio" name="shuffle-filter" value="all" checked="checked" style="width:0px;"/>전체
	          </label>
	          <label class="btn ">
	            <input type="radio" name="shuffle-filter" value="cat1" style="width:0px;"/>인사
	          </label>
	          <label class="btn">
	            <input type="radio" name="shuffle-filter" value="cat2" style="width:0px;" />Wanted Plus
	          </label>
	          <label class="btn">
	            <input type="radio" name="shuffle-filter" value="cat3" style="width:0px;"/>커리어
	          </label>
	          <label class="btn">
	            <input type="radio" name="shuffle-filter" value="cat4" style="width:0px;"/>경영·비즈니스
	          </label>
	           <label class="btn">
	            <input type="radio" name="shuffle-filter" value="cat5" style="width:0px;"/>기술/IT
	          </label>
	          <label class="btn">
	            <input type="radio" name="shuffle-filter" value="cat6" style="width:0px;"/>마케팅·광고
	          </label>
	          <label class="btn">
	            <input type="radio" name="shuffle-filter" value="cat7" style="width:0px;"/>크리에이티브
	          </label>
	          <label class="btn">
	            <input type="radio" name="shuffle-filter" value="cat8" style="width:0px;"/>디자인
	          </label>
	          <label class="btn">
	            <input type="radio" name="shuffle-filter" value="cat9" style="width:0px;"/>리더십
	          </label>
	          <label class="btn">
	            <input type="radio" name="shuffle-filter" value="cat10" style="width:0px;"/>교육
	          </label>
	          <label class="btn">
	            <input type="radio" name="shuffle-filter" value="cat11" style="width:0px;"/>UX
	          </label>
	          <label class="btn">
	            <input type="radio" name="shuffle-filter" value="cat12" style="width:0px;"/>데이터
	          </label>
	          <label class="btn">
	            <input type="radio" name="shuffle-filter" value="cat12" style="width:0px;"/>브랜딩
	          </label>
	          <label class="btn">
	            <input type="radio" name="shuffle-filter" value="cat12" style="width:0px;"/>개발
	          </label>
	          <label class="btn">
	            <input type="radio" name="shuffle-filter" value="cat12" style="width:0px;"/>핀테크
	          </label>
	          <label class="btn">
	            <input type="radio" name="shuffle-filter" value="cat12" style="width:0px;"/>건강
	          </label>
	          <label class="btn">
	            <input type="radio" name="shuffle-filter" value="cat12" style="width:0px;"/>금융
	          </label>
	          <label class="btn">
	            <input type="radio" name="shuffle-filter" value="cat12" style="width:0px;"/>영어
	          </label>
	          <label class="btn">
	            <input type="radio" name="shuffle-filter" value="cat12" style="width:0px;"/>고객서비스·리테일
	          </label> 
	        </div>
		
			</div>
		</div>
	</div>
<!-- 슬라이드 메뉴부분 끝  -->
      
<div style="width: 100%; height: 50px;"></div>     
      

<!-- 카테고리 이름, 필터, 키워드알림 부분 !!!!!!  -->
<div>${vo.CATE_NAME }</div><br>
<div class="filter" style="width: 100%; height: 70px;">
	<div style="float:left;"><button onclick="showPopup(true)" class="btnFilter" style="border:0.3px solid #d2d3d4; border-radius:0.5em; outline:none; width:150px; height:40px;padding:15px, 15px; background-color:white; font-size:11px;">
	<i class="fas fa-list"></i> 필터 및 정렬</button></div>
	<div style="float:right;"><button onclick="showPopup(true)" class="btnFilter" style="border:none; border-radius:3em; outline:none; width:150px; height:40px;padding:10px, 7px; background-color:#3366ff; font-size:11px; color:white">
	<i class="far fa-bell"></i>	키워드 알림 신청</button></div>
</div>     



<!-- 필터 팝업창 내용  -->
<div id="popup" class="hide">
  <div class="content">
    <div style="font-size:13px; color:black; text-align:center;"><p>
		<b>필터 및 정렬</b>
    </p></div>
    <div>
    	<form action="">
    		<label id="popupB"><b>정렬</b></label><br>
    		<select style="width: 95%; margin:auto; outline:none; height: 30px; border:0.3 solid gray;">
    		<option></option>
    		</select><br>
    		<div class="popDiv">
    		<label id="popupB"><b>유형</b></label><br>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="all" style="width:0px;"/>전체
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat13" style="width:0px;"/>이벤트
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat10" style="width:0px;"/>교육
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat14" style="width:0px;"/>프로모션
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat15" style="width:0px;"/>커뮤니티
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat16" style="width:0px;"/>캠페인
		          </label><br>
		    </div>
    		<div class="popDiv">
    		<label id="popupB"><b>유/무료</b></label><br>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="all" style="width:0px;"/>전체
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat17" style="width:0px;"/>유료
		          </label>
    		 	<label class="btn">
	          	  <input type="radio" name="shuffle-filter" value="cat18" style="width:0px;"/>무료
	         	 </label><br>
    		</div>
    		<div class="popDiv">
    		<label id="popupB"><b>태그</b></label><br>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat19" style="width:0px;"/>워크샵
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat20" style="width:0px;"/>시리즈
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat21" style="width:0px;"/>100%보상
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat22" style="width:0px;"/>취업연계
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat23" style="width:0px;"/>컨퍼런스
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat24" style="width:0px;"/>세미나
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat25" style="width:0px;"/>토크
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat26" style="width:0px;"/>라이브
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat27" style="width:0px;"/>채용이벤트
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat28" style="width:0px;"/>UpSchool
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat29" style="width:0px;"/>BoolClub
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat10" style="width:0px;"/>교육
		          </label><br>
		    </div>      
    	</form>
    </div>
    <div style="align-items:center;">
    <button onclick="closePopup()" style="">닫기</button>
  	</div>
  </div>
</div>
<!-- 팝업창 내용  끝-->


<!-- 키워드 팝업창 내용 -->
	<div id="popup" class="hide">
  <div class="content">
    <div style="font-size:13px; color:black; text-align:center;"><p>
		<b>필터 및 정렬</b>
    </p></div>
    <div>
    	<form action="">
    		<label id="popupB"><b>정렬</b></label><br>
    		<select style="width: 95%; margin:auto; outline:none; height: 30px; border:0.3 solid gray;">
    		<option></option>
    		</select><br>
    		<div class="popDiv">
    		<label id="popupB"><b>유형</b></label><br>
				<div class="sidebar-widget tags mb-3">
						<h5 class="mb-4">Tags</h5>
				
						<a href="#">Doctors</a>
						<a href="#">agency</a>
						<a href="#">company</a>
						<a href="#">medicine</a>
						<a href="#">surgery</a>
						<a href="#">Marketing</a>
						<a href="#">Social Media</a>
						<a href="#">Branding</a>
						<a href="#">Laboratory</a>
					</div>
				

    		<div class="popDiv">
    		<label id="popupB"><b>유/무료</b></label><br>
				<div class="sidebar-widget tags mb-3">
						<h5 class="mb-4">Tags</h5>
				
						<a href="#">Doctors</a>
						<a href="#">agency</a>
						<a href="#">company</a>
						<a href="#">medicine</a>
						<a href="#">surgery</a>
						<a href="#">Marketing</a>
						<a href="#">Social Media</a>
						<a href="#">Branding</a>
						<a href="#">Laboratory</a>
					</div>
				

    		</div>
    		<div class="popDiv">
    		<label id="popupB"><b>태그</b></label><br>
			  <div class="sidebar-widget tags mb-3">
				<h5 class="mb-4">Tags</h5>
		
				<a href="#">Doctors</a>
				<a href="#">agency</a>
				<a href="#">company</a>
				<a href="#">medicine</a>
				<a href="#">surgery</a>
				<a href="#">Marketing</a>
				<a href="#">Social Media</a>
				<a href="#">Branding</a>
				<a href="#">Laboratory</a>
			</div>

	    
		    </div>      
    	</form>
    </div>
    <div style="align-items:center;">
    <button onclick="closePopup()" style="">닫기</button>
  	</div>
  </div>
</div>
	
	
	

<!-- 키워드 팝업창 내용  끝-->
<!-- 필터, 키워드알림 부분 끝  -->







<!-- 프로젝트 리스트 섹션!!!!!!! -->
<%@ include file="programList.jsp" %>
<!-- 프로젝트 리스트 섹션 끝 -->






<!-- 푸터부분!!!!! -->
<%@ include file="../../inc/bottom.jsp" %>

   

    <!-- 
    Essential Scripts
    =====================================-->

    
    <!-- Main jQuery -->
    <script src="<c:url value='/resources/plugins/jquery/jquery.js'/>"></script>
    <!-- Bootstrap 4.3.2 -->
    <script src="<c:url value='/resources/plugins/bootstrap/js/popper.js'/>"></script>
    <script src="<c:url value='/resources/plugins/bootstrap/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/plugins/counterup/jquery.easing.js'/>"></script>
    <!-- Slick Slider -->
    <script src="<c:url value='/resources/plugins/slick-carousel/slick/slick.min.js'/>"></script>
    <!-- Counterup -->
    <script src="<c:url value='/plugins/counterup/jquery.waypoints.min.js'/>"></script>
    
    <script src="<c:url value='/resources/plugins/shuffle/shuffle.min.js'/>"></script>
    <script src="<c:url value='/resources/plugins/counterup/jquery.counterup.min.js'/>"></script>
    <!-- Google Map -->
    <script src="<c:url value='/resources/plugins/google-map/map.js'/>"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>    
    
    <script src="<c:url value='/resources/js/script.js'/>"></script>
    <script src="<c:url value='/resources/js/contact.js'/>"></script>

	<!-- 커리어성장 카테고리메뉴 쿼리문 -->
	<script type="text/javascript" src="<c:url value='/resources/code.jquery.com/jquery-1.11.0.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/code.jquery.com/jquery-migrate-1.2.1.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/plugins/slick-carousel/slick/slick.min.js'/>"></script>

	<!-- 필터, 키워드 알림 -->

<script type="text/javascript">
/* 커리어성장 카테고리메뉴 */

  $(document).ready(function(){
    $('.btn-group').slick({
    	slide: 'label',		//슬라이드 되어야 할 태그 ex) div, li 
		infinite : true, 	//무한 반복 옵션	 
		slidesToShow : 8,		// 한 화면에 보여질 컨텐츠 개수
		slidesToScroll : 5,		//스크롤 한번에 움직일 컨텐츠 개수
		speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
		arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
		dots : false, 		// 스크롤바 아래 점으로 페이지네이션 여부
		pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
		vertical : false,		// 세로 방향 슬라이드 옵션
		prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
		nextArrow : "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정
		draggable : false, 	//드래그 가능 여부 
    });
  });

  /* 필터 팝업창  */
  function showPopup(multipleFilter) {
		const popup = document.querySelector('#popup');
	  
	  if (multipleFilter) {
	  	popup.classList.add('multiple-filter');
	  } else {
	  	popup.classList.remove('multiple-filter');
	  }
	  
	  popup.classList.remove('hide');
	}

	function closePopup() {
		const popup = document.querySelector('#popup');
	  popup.classList.add('hide');
	}  
  
  
</script>

<style type="text/css">
.slick-prev{
	height:50px;
	margin-bottom:10px;
	background-color:#eef0f4;
}
.slick-next{
	height:50px;
	margin-bottom:10px;
	background-color:#eef0f4;
}
.slick-prev slick-arrow{
}


</style>
</body>
</html>