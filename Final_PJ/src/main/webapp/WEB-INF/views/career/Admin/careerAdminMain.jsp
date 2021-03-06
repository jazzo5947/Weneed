<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../../inc/admin_top.jsp" %>  

  
  <!-- 커리어성장 카테고리메뉴 css -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/slick-carousel/slick/slick.css'/>">
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/slick-carousel/slick/slick-theme.css'/>">
    
  <!-- 커리어성장 필터 팝업창 css -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jiwonPopup.css'/>">
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/careerAdminJiwon.css'/>">


    
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
$( document ).ready( function() {
	  var Offset = $( '.jbMenu' ).offset();
	  $( window ).scroll( function() {
	   if ( $( document ).scrollTop() > Offset.top ) {
	      $( '.jbMenu' ).addClass( 'fixed' );
	    }
	    else {
	      $( '.jbMenu' ).removeClass( 'fixed' );
	    }
	  });
	});
	
	
/* 마우스오버시 이미지 변경 */
  $(".hover").mouseleave(
    function () {
      $(this).removeClass("hover");
    }
  );

	
</script>
<style "type="text/css">
body{
	margin:0px;
	padding:0px;
}
.fixed {
     position: fixed;
     top: 0px;
}
.subscribeBody {
 } 
</style>
	

<script src="http://code.jquery.com.jquery-3.5.1.min.js"></script>

<body>
	<%
		String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");  //userID에 해당 세션 사용자의 값을 스트링 형식으로 바꿔서 넣어줌으로써 해당 사용자의 접속 유무를 알 수 있음
	}
	%>
	
<!-- 메뉴 부분!!!!! -->

<!-- 메뉴 탑부분 끝!! -->


<!-- 몸통부분!!! -->
<section class="section blog-wrap">
	<div class="subscribeBody" style="margin-top:70px;width:1400px; margin-left:auto; margin-right:auto;">
		<!-- 직장인의 커리어 여정을 행복하게 -->
		<div class="img_admin_career2" style="max-height:350px; overflow:hidden;">
			<img alt="" src="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.0-9/118121468_1722859387865670_6932201002241137751_o.jpg?_nc_cat=105&ccb=2&_nc_sid=dd9801&_nc_ohc=EkvV99Ynvb0AX9KlL8X&_nc_ht=scontent-ssn1-1.xx&oh=15778fa29a00b4a694b1a9b123fca561&oe=602EFE6A" class="campus-recruit-img"  style="max-width:100%;max-height:initial; margin-top:-8%;">
		</div>
		
		<a name="title"></a>   
		<div class="img_admin_career">
			<a href="programWrite.do"><img alt="클릭시 프로그램 등록페이지로 이동" src="<c:url value='/resources/images/career/wantedwanted.png'/>" class="campus-recruit-img" title="프로그램 등록" style="width:100%;"></a>
		</div>
		
		
		
		<div class="img_admin_career">
			<a href="programAdminList.do"><img alt="등록된 프로그램 조회 페이지로 이동" src="<c:url value='/resources/images/career/programList.JPG'/>" class="campus-recruit-img" title="프로그램 조회" style="width:100%;"></a>
		</div>
		
		
		<!-- 원티드플러스 구독자 조회 페이지로 이동 -->
		<a name="title2"></a>
		<div class="img_admin_career">
			<a href="wantedPlusSelect.do"><img alt="Wanted+ 회원" src="<c:url value='/resources/images/career/wantedPlus.JPG'/>" class="campus-recruit-img" style="width:100%;"></a>
		</div>
		
		<!-- 채팅 섹션 -->
		<a name="title3"></a>
		<div class="img_admin_career">
			<a href="https://dashboard.tawk.to/#/admin/6024a5279c4f165d47c223b7/chat-widget"><img alt="" src="<c:url value='/resources/images/career/wantedbal.JPG'/>" class="campus-recruit-img" title="채팅보드" style="width:100%; margin-top:-56px;"></a>
		</div>
		
		<div style="float:left;width:100%; height:20px; background-color:#258bf7;"></div>

	</div> <!-- subscribeBody 디브끝 -->
</section>

<!-- 푸터부분!!!!! -->
	<%@ include file="../../inc/admin_bottom.jsp" %>