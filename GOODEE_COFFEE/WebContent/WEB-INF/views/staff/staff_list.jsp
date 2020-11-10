<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>직원-리스트</title>
    <script src="https://kit.fontawesome.com/cccee664d4.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${path}/resources/css/common.css">
    <link rel="stylesheet" href="${path}/resources/css/staff.css">
    <script type="text/javascript" src="${path}/resources/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${path}/resources/js/prefixfree.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/common/common.js"></script>
    <script type="text/javascript" src="${path}/resources/js/staff/staff_list.js"></script>
</head>
<body>
     <!-- 헤더 -->
   <header>
        <div id="header_wrapper">
            <div id="logo_image"><!-- <img src="#"> --></div>
            <h1 id="title">직원조회</h1>
             <button id="logout" value="로그아웃">로그아웃</button>
            <p id="login_name"><span>이름</span> 님</p>
            <p id="login_date">영업일자 :<span>날짜</span></p>
        </div>
    </header>
    <%@ include file="../gnb_admin.jsp"%>
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
    <div id="saffList">
        <h1>-직원 리스트-</h1>
        <table border="1">
            <tr>
                <th>직원ID</th>
                <th>이름</th>
                <th>휴대번호</th>
                <th>등록날짜</th>
                <th>근무여부</th>
            </tr>
            <c:forEach items="${staffList}" var="staffList">
	            <tr>
	                <td><a href="/gc/staff/staff_alterInto?w_id=${staffList.w_id}">${staffList.w_id}</a></td>
	                <td>${staffList.w_name}</td>
	                <td>${staffList.w_phone}</td>
	                <td><fmt:formatDate value="${staffList.indate}" pattern="yyyy-MM-dd"/></td>
	                <td>${staffList.use}</td>
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
            <a href="staff_withdraw"><button id="movetoWithdraw">삭제</button></a>
            <a href="staff_register"><button id="movetoRegi">등록</button></a>
        </div>
    </div>
</body>
</html>