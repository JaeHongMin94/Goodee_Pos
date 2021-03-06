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
            <h1 id="title">매출조회</h1>
            <p id="login_name"><span>이름</span> 님</p>
            <p id="login_date">영업일자 :<span>날짜</span></p>
        </div>
    </header>
   <%@ include file="../gnb_staff.jsp"%>
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
	<form method="POST" action="member_withdrawDelete" id="member_withdrawFrm" name="member_withdrawFrm">
		<h2 class="title">회원삭제</h2>
		<p class="inputBox">		
			<label for="m_Name" class="labelTitle">이름</label>
			<input type="text" id="m_Name" name="m_Name" class="infoInput" placeholder="이름을 입력하세요"><br>
		</p>
		<p class="inputBox">
			<label for="m_Phone" class="labelTitle">휴대전화</label>
			<input type="tel" id="m_Phone" name="m_Phone" class="infoInput" placeholder="전화번호를 입력하세요"><br>
		</p>
		<button type="reset" onclick="history.go(-1);" class="resetBtn btn" name="resetBtn">취소</button>
		<button id="memberWithdrawBtn" class="btn" name="withdrawBtn" onclick="withdraw();">회원삭제</button>
	</form>
	<script>
		// 번호입력 자동으로 하이푼 생성
		$(document).on("keyup", "#w_phone", function() {
			$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		});
	
		function withdraw(){
			 var msgConfirm;
			 var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
			 if($("#w_name").val()==""){
			 	 alert("이름을 입력해주세요.");
				 $("#w_name").focus();
				 return;
			 }else if($("#w_name").val().length>10){
				 alert("이름은 최대 10자 입니다.");
				 $("#w_name").focus();
				 return;
			 }
			 
			 if($("#w_phone").val()==""){
				 alert("휴대전화를 입력해주세요.");
				 $("#w_phone").focus();
			 	 return;
			 } else if(!regExp.test($("input[id='w_phone']").val())){
				 alert("휴대전화는 최대('-'포함) 13자 입니다.");
				 $("#w_phone").focus();
				 return;
			 }else{
				 msgConfirm = confirm("삭제하시겠습니까?");
				 if(msgConfirm)
			 	 	 $("#withdrawFrm").submit();					 
				 else
				 	return;
			 }
		}
	</script>
</body>
</html>