<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>GOODEE CAFE-로그인</title>
    <link rel="stylesheet" href="${path}/resources/css/common.css">
    <link rel="stylesheet" href="${path}/resources/css/login.css">
    <script type="text/javascript" src="${path}/resources/js/jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="${path}/resources/js/prefixfree.min.js"></script>
    
    <script>
	$(document).ready(function(){
		$("#loginSubmit").click(function(){      
            var userId=$("#userId").val();     
            var userPwd=$("#userPwd").val();     
            if(userId == ""){                   
                alert("아이디를 입력하세요.");       
                $("#userId").focus();         
                return;
            }
            
            if(userPwd==""){                   
                alert("비밀번호를 입력하세요."); 
                $("#userPwd").focus();       
                return;
            }
            
            if(parseInt(userId) >= 1000 && parseInt(userId) < 10000){
            	document.loginFrm.action = "${path}/staffs"; //밑에 form1 폼을 Controller의 staff_login_check에 맵핑하도록 한다.
            }else{
                document.loginFrm.action = "${path}/admin";  //밑에 form1 폼을 Controller의 admin_login_check에 맵핑하도록 한다.	
            }
            
            document.loginFrm.submit(); //자료를 전송
        });
	});
    </script>
</head>
<body>
    <div id="logo"><a href="/gc"><img src="${path}/resources/images/gc_logo.png" alt="구디카페 로고" ></a></div>
    <h2 id="mobileLogin">로그인</h2>
    <!--form-->
    <form method="post" id="loginFrm" name="loginFrm">
        <h2 id="pcLogin">로그인</h2>
        <input type="text" id="userId" name="userId" placeholder="아이디를 입력해주세요">
        <input type="password" id="userPwd" name="userPwd" placeholder="패스워드를 입력해주세요">
      
        <div id="clear"></div>
        <input type="submit" value="로그인" id="loginSubmit" name="loginSubmit">
        <c:if test="${param.message == 'nologin' }">
			<div style="color: red;">먼저 로그인하세요.</div>
		</c:if>
	
		<c:if test="${param.message == 'error' }">
			<div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
		</c:if>
		
		<c:if test="${param.message == 'logout' }">
			<div style="color: red;">로그아웃 되었습니다.</div>
		</c:if>
    </form>
    <!--//form-->
    <!--footer-->
    <!-- <footer>

    </footer> -->
    <!--//footer-->
</body>
</html>