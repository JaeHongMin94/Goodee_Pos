<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제화면 POS</title>
    <script src="https://kit.fontawesome.com/cccee664d4.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${path}/resources/css/common.css">
    <link rel="stylesheet" href="${path}/resources/css/member.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
    <script type="text/javascript" src="${path}/resources/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${path}/resources/js/prefixfree.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script>
      $(function(){$(document).attr("title","GOODEE COFFEE | "+$('#title').html());});
   	</script>
</head>
<body>
	 <!-- 헤더 -->
	<header>
        <div id="header_wrapper">
            <div id="logo_image"><!-- <img src="#"> --></div>
            <h1 id="title">회원관리</h1>
            <button id="logout" value="로그아웃">로그아웃</button>
            <p id="login_name"><span>이름</span> 님</p>
            <p id="login_date">영업일자 :<span>날짜</span></p>
            
        </div>
    </header>
    <%@ include file="../gnb_staff.jsp" %>
	<script type="text/javascript">
			$(document).ready(function() {
				printTime();
				setInterval(printTime, 1000);	
			});
			// TODO 보여주는 시간을 서버 시간으로 고칠 것(처음에 한번만 서버 시간을 가져와서 셋팅)
			function printTime() {
				var d = new Date();
				var currentDate = d.getFullYear() + "년 " + ( d.getMonth() + 1 ) + "월 " + d.getDate() + "일"; 
				var currentTime = d.getHours() + "시 " + d.getMinutes() + "분 " + d.getSeconds() + "초"; 
				
				$("#login_date").find("span").html(currentDate+currentTime);
			}
			
	</script>
	<!-- main -->
    <div id="memberList">
        <h1>-고객 리스트-</h1>
        <table border="1">
            <tr>
                <th></th>
                <th>순번</th>
                <th>고객번호</th>
                <th>이름</th>
                <th>휴대번호</th>
                <th>결제금액</th>
            </tr>
            <c:forEach items="${memberList}" var="memberList">
	            <tr>
	             	<td><input type="checkbox"></td>
	                <td><a href="/gc/member/member_alterInto?m_id=${memberList.m_id}">${memberList.m_id}</a></td>
	                <td>${memberList.m_name}</td>
	                <td>${memberList.m_phone}</td>
	                <td><fmt:formatDate value="${memberList.indate}" pattern="yyyy-MM-dd"/></td>
	                <td>${memberList.use}</td>
	            </tr>
             </c:forEach>
        </table>
        <p id="page">
            <span>&lt; &nbsp;</span>
            <span>1</span>
            <span>2</span>
            <span>3</span>
            <span>4</span>
            <span>5</span>
            <span>&nbsp; &gt;</span>
        </p>
        <div id="ListbtnBox">
            <a href="member_withdraw"><button id="movetoWithdraw">삭제</button></a>
            <a href="${pageContext.request.contextPath}/member/member_alterInfo"><button id="movetoAlter">수정</button></a>
            <a href="member_rigister"><button id="movetoRegi">등록</button></a>
        </div>
    </div>
</body>
</html>