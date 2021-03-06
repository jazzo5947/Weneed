<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/cssJsImports.jsp" %>
<%-- <%@ include file="../inc/admin_top.jsp"%>  --%>
<style type="text/css">

.divheader>h1 {
    font-size: xx-large;
    margin-bottom: 30px;
    color: gray;
}

table.table.table-bordered.table_jy {
    font: status-bar;
    text-align: center;
    font-size: smaller;
    background: white;
}

thead {
    font-size: initial;
    color: #454545;
}
.divPage_jy {
    text-align: center;
}
.divSearch {
    TEXT-ALIGN: RIGHT;
    MARGIN-BOTTOM: 10PX;
}
input.inputKeyword {
    height: 33px;
}
table.table.table-bordered.table_jy {
    font: status-bar;
}

th.th_jy {
    font: status-bar;
    font-weight: 700;
}

td.td_jy.skilltd {
    max-width: 142px;
}

td.td_jy.reftd {max-width: 10px;padding-left: 0;padding-right: 0;}

td.td_jy {
    max-width: 59px;
}

td.td_jy {
    padding-left: 0.5px;
    padding-right: 0.5px;
}
</style>

<script type="text/javascript">
$(function(){
	$('tbody tr').hover(function(){
		$(this).css('background','#99daef54');
	}, function(){
		$(this).css('background','');		
	});
});

function pageFunc(curPage){
	$('input[name=currentPage]').val(curPage);
	 $('form[name=frmPage]').submit();
} 
</script>

<form action="<c:url value='/admin/adminMatchupMem.do'/>" name="frmPage" method="post">
	<input type="hidden" name="currentPage">
	<%-- <input type="hidden" name="searchCondition" value="${param.searchCondition}"> --%>
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
</form>

<section class="resumeListSection">
	<div class="wrap">
		<!-- <div class="divheader">
			<h1>매치업 회원 조회 관리</h1>
		</div> -->
		<div class="divSearch">
			<form name="frmSearch" method="post" action='<c:url value="/admin/adminMatchupMem.do"/>'>
				<input type="text" class="inputKeyword" name="searchKeyword" title="검색어 입력" value="${param.searchKeyword}">   
				<input type="submit" class="btSearch" value="검색">
			
			</form>			
		</div>
		<div class="tableWrapper">
			<table class="table table-bordered table_jy"> 
				<%-- <caption>매치업 회원 관리</caption> --%>
				<colgroup>
					<col style="width:1%;" />
					<%-- <col style="width:7%;" /> --%>
					<col style="width:10%;" />
					<col style="width:7%;" />
					<col style="width:7%;" />		
					<col style="width:6%;" />		
					<col style="width:6%;" />		
					<col style="width:3%;" />		
					<col style="width:3%;" />		
					<col style="width:5%;" />		
					<col style="width:10%;" />		
					<col style="width:2.5%;" />		
					<col style="width:1%;" />		
				</colgroup> 
				 	<thead>
						<tr class="tr_jy"> 
							<th scope="col" class="th_jy">No.</th>
					<!-- 		<th scope="col" class="th_jy">회원번호</th> -->
							<th scope="col" class="th_jy resumetd">이력서</th>
							<th scope="col" class="th_jy edutd">학교</th>
							<th scope="col" class="th_jy majortd">학과</th>
							<th scope="col" class="th_jy">회사</th>
							<th scope="col" class="th_jy">부서</th>
							<th scope="col" class="th_jy">직군</th>
							<th scope="col" class="th_jy">경력</th>
							<th scope="col" class="th_jy">연봉</th>
							<th scope="col" class="th_jy skilltd">기술</th>
							<th scope="col" class="th_jy reftd">추천인</th>
							<th scope="col" class="th_jy">구직</th>
						</tr>
				 	</thead>
				<tbody>
					<c:if test="${empty mcumemList }">
						<tr class="align_center"> 
							<td colspan="12">매치업 등록 회원이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty mcumemList }">
						<c:forEach var="mVo" items="${mcumemList }">
							<tr class="tr_jy">
								<td class="td_jy">${mVo.mcumemNo} </td>
								<%-- <td class="td_jy">${mVo.memNo} </td> --%>
								<td class="td_jy title_td">
									<%-- <a href='<c:url value="/resume/resumeDetailAdmin.do?resumeNo=${resumeNo}&memNo=${memNo}"></c:url>'>
										${mVo.resumeTitle} 
									</a> --%>
									<a href='#' onclick="window.open('<c:url value="/resume/resumeDetailAdmin.do?resumeNo=${mVo.resumeNo}&memNo=${mVo.memNo}"/>','newwin','width=1024,height=768,top=0,left=0,scrollbars=yes');return false;">
										${mVo.resumeTitle} 
									</a>
								</td>
								<td class="td_jy">${mVo.eduName} </td>
								<td class="td_jy majortd">${mVo.eduMajor } </td>
								<td class="td_jy">${mVo.careerName} </td>
								<td class="td_jy deptd">${mVo.careerDep } </td>
								<td class="td_jy">${mVo.jikgunName } </td>
								<td class="td_jy">${mVo.career} <c:if test="${mVo.career ne '신입' and  !empty mVo.career}">년</c:if> </td>
								<td class="td_jy">${mVo.salary} </td>
								<td class="td_jy skilltd">${mVo.skill} </td>
								<td class="td_jy reftd">${mVo.refName} </td>
								<td class="td_jy">${mVo.jobsearchFlag} </td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<!-- 페이지 번호 추가 --> 
		<div class="divPage_jy">
			<c:if test="${pagingInfo.firstPage>1 }">
				<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">         
        	  	<img src='<c:url value="/resources/images/first.JPG" />'  border="0">   </a>
   			</c:if>
   			<!-- [1][2][3][4][5][6][7][8][9][10] -->
		   <c:forEach var="i" begin="${pagingInfo.firstPage }"  end="${pagingInfo.lastPage }">
		      <c:if test="${i==pagingInfo.currentPage }">
		         <span style="color:blue;font-weight:bold">${i }</span>
		      </c:if>
		      <c:if test="${i!=pagingInfo.currentPage }">                  
		         <a href="#" onclick="pageFunc(${i})">
		            [${i }]
		         </a>
		      </c:if>
		   </c:forEach>
      
		   <c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
		      <a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">         
		         <img src="<c:url value="/resources/images/last.JPG" />" border="0">
		      </a>
		   </c:if>
  		 <!--  페이지 번호 끝 -->
		</div>
	</div>
	
	
</section>

<%-- <%@ include file="../inc/admin_bottom.jsp"%> --%>