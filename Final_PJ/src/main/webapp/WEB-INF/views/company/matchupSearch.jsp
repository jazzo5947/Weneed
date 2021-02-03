<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/company_top.jsp" %>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="<c:url value='/resources/css/companyService/matchup.css'/>">
<script type="text/javascript">
$(function(){
	//경력 슬라이더
	$("#slider-range").slider({
		range: true,
		min: 0,
		max: 30,
		values: [ 0, 30 ],
		slide: function(event,ui) {
			$("#amount").val(ui.values[0] +" - "+ ui.values[1]+"년");
		}
	});
	$("#amount").val($("#slider-range").slider("values",0)
			+" - "+$("#slider-range").slider("values",1)+"년");
	
	//리스트 선택 시 표시해주기
	$('.matchupSearch-li').click(function(){
		var num=$(this).index(); //부모 요소를 기준으로 내가 몇번째 자식이냐
		$('.matchupSearch-li').removeClass('matchupSearch-selectedLi');
		$('.matchupSearch-li:eq('+num+')').addClass('matchupSearch-selectedLi')
	});
	
	//찜 버튼 금색 토글
	$(document).on('click', '.matchupSearch-ZzimBtn', function(){
		if($(this).children('i').hasClass('goldStar')){
			$(this).children('i').removeClass('goldStar');
			//찜에서 빼기도 해야하는구만
			var resumeStr=$(this).parent().siblings('.matchupSearch-resume-1st').children('span').text();
			//console.log(resumeStr.substr(3));
			var resumeNo=parseInt(resumeStr.substr(3), 10);
			$.ajax({
				url:"<c:url value='/company/delZzim.do'/>",
				type:"get",
				dataType:"text",
				data:{"resumeNo":resumeNo},
				success:function(result){
					console.log(result);
				},
				error:function(xhr, status, error){
					console.log("에러!:"+error);
				}
			});
		}else{
			$(this).children('i').addClass('goldStar');
			//찜하기를 해볼거예요
			//이력서번호 넘기고 세션에서 컴코드 받아와서 넘기고
			//컨트롤러에서 이력서 번호로 매치업일반넘버 찾아
			var resumeStr=$(this).parent().siblings('.matchupSearch-resume-1st').children('span').text();
			//console.log(resumeStr.substr(3));
			var resumeNo=parseInt(resumeStr.substr(3), 10);
			//console.log(resumeNo);
			
			$.ajax({
				url:"<c:url value='/company/addZzim.do'/>",
				type:"get",
				dataType:"text",
				data:{"resumeNo":resumeNo},
				success:function(result){
					//alert('성공');
					console.log(result);
				},
				error:function(xhr, status, error){
					alert('error: '+error);
				}
			});
			
		}
	});
	/* $('.matchupSearch-ZzimBtn').click(function(){
		if($(this).children('i').hasClass('goldStar')){
			$(this).children('i').removeClass('goldStar');
			//찜에서 빼기도 해야하는구만
			var resumeStr=$(this).parent().siblings('.matchupSearch-resume-1st').children('span').text();
			//console.log(resumeStr.substr(3));
			var resumeNo=parseInt(resumeStr.substr(3), 10);
			$.ajax({
				url:"<c:url value='/company/delZzim.do'/>",
				type:"get",
				dataType:"json",
				data:{"resumeNo":resumeNo},
				success:function(result){
					console.log(result);
				},
				error:function(xhr, status, error){
					console.log("에러!:"+error);
				}
			});
		}else{
			$(this).children('i').addClass('goldStar');
			//찜하기를 해볼거예요
			//이력서번호 넘기고 세션에서 컴코드 받아와서 넘기고
			//컨트롤러에서 이력서 번호로 매치업일반넘버 찾아
			var resumeStr=$(this).parent().siblings('.matchupSearch-resume-1st').children('span').text();
			//console.log(resumeStr.substr(3));
			var resumeNo=parseInt(resumeStr.substr(3), 10);
			//console.log(resumeNo);
			
			$.ajax({
				url:"<c:url value='/company/addZzim.do'/>",
				type:"get",
				dataType:"json",
				data:{"resumeNo":resumeNo},
				success:function(result){
					//alert('성공');
					console.log(result);
				},
				error:function(xhr, status, error){
					alert('error: '+error);
				}
			});
			
		} 
	});*/
	
	//더보기 기능 구현
	$('#matchupSearch-viewMoreBtn').click(function(){
		//console.log('눌렀당');
		
		var recordCnt=parseInt($('#matchupSearch-record').val(), 10);
		recordCnt+=5;
		console.log(recordCnt);
		$.ajax({
			url:"<c:url value='/company/viewMoreMatchupMem.do'/>",
			dataType:"json",
			type:"get",
			data:{
				recordCnt:recordCnt
			},
			success:function(memList){
				//alert('성공!');
				console.log(memList);
				for(mcumem of memList){
					makeMemList(mcumem);
				}
				$('#matchupSearch-record').val(recordCnt);
			},
			error:function(error){
				alert('error!:'+error)
			}
		});
	});
	
	
});

function makeMemList(mcumem){
	var str="";
	str+='<div class="matchupSearch-resumeBound">';
	str+='<div class="matchupSearch-resume-1st">';
	str+='<i class="fas fa-user-tie"></i>';
	str+='<span>No.'+ mcumem.RESUMENO +'</span>';
	str+='</div>';
	str+='<div class="matchupSearch-resume-2nd">';
	str+='<span>직군직종명</span>';
	str+='<span>6년 경력</span>';
	str+='<span>학력대학교 무슨학과</span>';
	str+='</div>';
	str+='<div class="matchupSearch-resume-3rd">';
	str+='<button class="matchupSearch-ZzimBtn"><i class="fas fa-star"></i> 찜</button>';
	str+='<button>이력서 미리보기</button>';
	str+='</div></div>';

	$('#matchupSearch-resumeListDiv').append(str);
}

function pageFunc(curPage){
	$('input[name=curPage]').val(curPage);
	$('form[name=frmPage]').submit();
}
</script>
	<input type="hidden" id="matchupSearch-record" value="0">
	<div class="container"> <!-- 가장 바깥 래퍼 --> 
		<section class="matchupSearch-1stSec"> <!-- 이름, 검색필터, 검색창, 필터 -->
			<h1>찾고 있는 인재의 직군/직무를 설정하세요</h1>
			<select id="matchupSearch-jikgunSelect" class="matchupSearch-select matchupSearch-selectShort">
				<c:forEach var="jikgunVo" items="${jikgunList}">
					<option value="${jikgunVo.jikgunCode}">${jikgunVo.jikgunName}</option>			
				</c:forEach>
			</select>
			<select id="matchupSearch-jikmuSelect" class="matchupSearch-select matchupSearch-selectLong"> 
				<option value="all">전체</option>
				<c:forEach var="jikmuVo" items="${jikmuList}">
					<option value="${jikmuVo.jikmuCode}">${jikmuVo.jikmuName}</option>			
				</c:forEach>
			</select>
			<div class="matchupSearch-searchFilter">
				<div class="matchupSearch-searchDiv">
					<input class="matchupSearch-searchInput" type="text" placeholder="회사명, 학교, 스킬 검색">
					<button class="matchupSearch-searchBtn"><i class="fas fa-search"></i></button>
				</div>
				<div class="matchupSearch-filter"> 
					<select class="matchupSearch-select matchupSearch-select-sub">
						<option>국가 선택</option>
						<option>한국</option>
						<option>일본</option>
						<option>대만</option>
						<option>홍콩</option>
						<option>싱가폴</option>
					</select>
				</div> <!-- 드롭다운 -->
				<!-- 분량이 안될거같으면 삭제 <div class="matchupSearch-filter">
					<select class="matchupSearch-select matchupSearch-select-sub">
						<option>언어 선택</option>
						<option>한국어</option>
						<option>일본어</option>
						<option>중국어</option>
						<option>영어</option>
					</select>
				 드롭다운 -->
				<div class="matchupSearch-rangeSlider">
					<div class="matchupSearch-rangeSliderLabel">
						<label class="matchupSearch-label" for="amount">경력</label>
						<input type="text" id="amount" readonly style="border:0; font-weight:bold;">
					</div>
					<!-- Range Slider -->
					<div id="slider-range"></div>
				</div> 
			</div>
		</section>
		<section class="matchupSearch-2ndSec"> <!-- 목록  -->
			<div class="matchupSearch-tabBound">
				<ul class="matchupSearch-resultList">
					<li class="matchupSearch-li matchupSearch-selectedLi">목록 전체</li>
					<li class="matchupSearch-li">찜한 이력서</li>
					<li class="matchupSearch-li">미열람 이력서</li>
					<li class="matchupSearch-li">열람한 이력서</li>
					<li class="matchupSearch-li">면접 제안한 이력서</li>
				</ul>
			</div>
			<div class="matchupSearch-resultOrderFilters">
				<input type="radio" id="matchupSearch-orderFilter-new" name="matchupSearch-orderFilter" value="new">
				<label class="matchupSearch-orderFilterLb" for="matchupSearch-orderFilter-new">최신순</label>
				<input type="radio" id="matchupSearch-orderFilter-read" name="matchupSearch-orderFilter" value="read">
				<label class="matchupSearch-orderFilterLb" for="matchupSearch-orderFilter-read">열람순</label>
			</div>
		</section>
		<section class="matchupSearch-resumeList">
			<div id="matchupSearch-resumeListDiv">
			<!-- 
			 select m.resume_no as resumeNo, m.mem_no as memNo, m.expertise_no as expertiseNo, 
				  m.jobsearch_flag as jobSearchFlag, m.resumeopen_flag as resumepenFlag,
				  r.resume_title as resumeTitle, r.resume_name as resumeName, r.resume_introduce as resumeIntroduce, 
				  r.lang_flag as langFlag from matchupMem m join resume r 
				  on m.resume_No = r.resume_no 
			 -->
				<c:forEach var="mcumemMap" items="${memList }">
					<div class="matchupSearch-resumeBound">
						<div class="matchupSearch-resume-1st">
							<i class="fas fa-user-tie"></i>
							<span>No.${mcumemMap.RESUMENO}</span>
						</div>
						<div class="matchupSearch-resume-2nd"> <!-- 이력서 목록 -->
							<span>직군직종명</span>
							<span>6년 경력</span>
							<span>학력대학교 무슨학과${mcumemMap.CNT}</span>
						</div>
						<div class="matchupSearch-resume-3rd">
							<button class="matchupSearch-ZzimBtn">
								<i class="fas fa-star <c:if test="${mcumemMap.CNT eq 1}">goldStar</c:if>
								"></i> 찜</button>
							<button>이력서 미리보기</button>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="matchupSearch-resume-paging">
				<div id="matchupSearch-viewMoreBtn" class="matchupSearch-pagingDiv matchupSearch-pagingDiv_next" >더보기</div>
			</div>
		</section>			
	</div>
</body>
</html>