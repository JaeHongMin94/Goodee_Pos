<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="auothor" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title></title>
    <script src="https://kit.fontawesome.com/cccee664d4.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${path}/resources/css/common.css">
    <link rel="stylesheet" href="${path}/resources/css/menuBoard.css">
    <script type="text/javascript" src="${path}/resources/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${path}/resources/js/prefixfree.min.js"></script>
	<script>
		$(function(){$(document).attr("title","GOODEE COFFEE | "+$('#title').html());});
	</script>
</head>
<body>
	
	<!-- 헤더 -->
	<header>
		<div id="header_wrapper">
			<div id="logo_image">
				<!-- <img src="#"> -->
			</div>
			<h1 id="title">메뉴관리</h1>
			<button id="logout" value="로그아웃">로그아웃</button>
			<p id="login_name">
				<span>이름</span> 님
			</p>
			<p id="login_date">
				영업일자 :<span>날짜</span>
			</p>
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
	<!-- 메인 -->
	<main> 
	<!-- 카테고리 관리 -->
        <section id="category">
            <ul id="tabs">
                <li><a href="#" title="tab1">카테고리 변경</a></li>
                <li><a href="#" title="tab2">카테고리 추가</a></li>   
            </ul>
            <div id="content"> 
                <div id="tab1">
                   <ul>
                   		<c:forEach items="${category}" var="category">
                   			<li>${category.category_name}<span class="category_sub" onclick="location.href='/gc/menu/categoryDelete?category_name=${category.category_name}'">삭제</span></li>
                   		</c:forEach>
                   </ul>
                </div>
                <form action="/gc/menu/categoryInsert" method="POST">
	                <div id="tab2">
	                  		<!-- 메뉴추가 내용물 넣어야함-->
	                  	<input name="category_name" type="text" id="categoryInsertText"/>
	                  	<button type="submit">카테고리 추가</button>
	                </div>
                </form>
            </div>
		</section>
	<script>
	<!--탭메뉴 제이쿼리-->
		$(document).ready(function() {
			$("#content div").hide();
			$("#tabs li:first").attr("id", "current");
			$("#content div:first").fadeIn();

			$('#tabs a').click(function(e) {
				e.preventDefault();
				$("#content div").hide();
				$("#tabs li").attr("id", "");
				$(this).parent().attr("id", "current");
				$('#' + $(this).attr('title')).fadeIn();
			});
		});
	</script> <!-- 메뉴설정 -->
	<script>
	<!--체크박스 생성 제이쿼리 -->
						
		$(document).ready(function() {
			$(".menu_sub").click(function() {
				$(this).parent().siblings(".menu_contents").find(".menuList")
				.append('<input type="checkbox" class="menuSubChk">');
			});
			
			//메뉴 삭제 체크 시 메뉴 색깔 바뀌는 제이쿼리문
			
			$(".menu_label").click(function(){
				if($(this).next().is(":checked")==false){
					$(this).next().prop("checked",true);
					console.log("if문");
				}else if($(this).next().is(":checked")==true){
					$(this).next().prop("checked",false);
					console.log("else문");
				}
				
				//메뉴 체크 시 배경색 바꿔줌
				if($(this).next().is(":checked")==true){
					$(this).css({"backgroundColor":"red", "color":"white"});
				}else{
					$(this).css({"backgroundColor":"#F1C40F", "color":"black"});
				}
			});
		});
	</script>
		<!-- 메뉴설정 -->
		<section class="menu_setting">
			<form action="/gc/menu/deleteMenu" method="GET"> 
				<c:forEach items="${category}" var="category">
					<div class="menuWrapper">
						<div class="menu_title">
							<div class="catagory_title">${category.category_name}</div>
							<div class="menu_sub"><input id=deleteButton type="submit" value="메뉴 삭제"></div>
							<div class="menu_add">메뉴 추가</div>
						</div>
						<div class="menu_contents">
							<ul>
								<c:forEach items="${menuList}" var="menuList">
									<c:if test="${category.category_no eq menuList.categoryNO}">
										<li class="menu_label">${menuList.menuName}</li>
										<input type="checkbox" class="chkMenu" name="menuID" value="${menuList.menuID}"}>			
									</c:if>
								</c:forEach>
							</ul>
						</div>
					</div>
				</c:forEach>
			</form>
		</section>
	</main>

	<!-- 메뉴 추가 레이어 팝업 제이쿼리 -->
	<script>
		$(function() {
			$(".menu_add").click(function() {
				$("#pop").show();
			});
		});
		$(function(){
			$(".closePop").click(function(){
				$("#pop").css("display","none");
			});
		})
	</script>
	<div id="pop">
		<h1>메뉴 추가</h1>
		<button class="closePop">닫기</button>
		<form action="/gc/menu/menuInsert" method="GET">
			<p class="inputBox">
				<label for="category">카테고리</label>
				<select name="category_no"
					id="category">
					<c:forEach items="${category }" var="category">
						<option value="${category.category_no }">${category.category_name }</option>
					</c:forEach>
				</select>
			</p>
			<p class="inputBox">
				<label for="menu_name">메뉴이름</label> <input type="text" id="menuName"
					name="menu_name">
			</p>
			<p class="inputBox">
				<label for="price">가격</label> <input type="text" id="menuPrice"
					name="price">
			</p>
			<button type="submit" class="menuRegiBtn">등&nbsp;&nbsp;록</button>
		</form>
	</div>
	<!-- //메뉴추가 레이어팝업 -->
</body>
</html>