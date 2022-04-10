<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>team4 FunCat</title>
</head>
<body>
	<h1>funcat... </h1><br>
	

	<P>  The time on the server is ${serverTime}. </P>
	
	<!-- 
	<p><a href="user/login.do"> 로그인 </a></p>
	<p><a href="user/signup.do"> 회원가입 </a></p> 
	
	<c:out value="${sessionScope.user }"></c:out>
	-->
	
	<c:choose>
 		<c:when test="${empty sessionScope.user }">
			<a href="user/login.do"><h5>로그인</h5></a>
			<a href="user/signup.do"><h5>회원가입</h5></a>
		</c:when>
		<c:otherwise>
			<p>user_name: <a href="#"> ${user.member_name}</a>, 로그인 중..</p>
			<a href="user/logout.do"><h5>로그아웃</h5></a>  
			<p>  <a href="member/list.do?member_id=${user.member_id}">마이페이지</a></p>
		</c:otherwise>
	</c:choose>
	
	<p><a href="user/findPw">메일 전송</a></p>
</body>
</html>
