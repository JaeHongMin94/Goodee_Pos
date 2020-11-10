<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="author" content="윤희원,박가연">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제화면 POS</title>
    <script src="https://kit.fontawesome.com/cccee664d4.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${path}/resources/css/common.css">
    <link rel="stylesheet" href="${path}/resources/css/payment.css">
    <link rel="stylesheet" href="${path}/resources/css/open.css">
    <link rel="stylesheet" href="${path}/resources/css/breakdown.css">
    <link rel="stylesheet" href="${path}/resources/css/pay_delete.css">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
    <script type="text/javascript" src="${path}/resources/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${path}/resources/js/prefixfree.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<body>
	<!-- header -->
   <header>
	    <div id="header_wrapper">
	        <!-- <div id="logo_image"><img src="#"></div> -->
	        <h1 id="title">GOODEE CAFE</h1>
	        <p id="login_date">영업일자 : <span>날짜</span></p>
	        <p id="login_name">${sessionScope.staff_name} 님</p>
	    </div>
    </header>
    <!-- //header -->
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