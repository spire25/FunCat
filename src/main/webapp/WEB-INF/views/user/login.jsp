<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<%@ page session="false" %>




<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>FunCat 로그인</title>
  <link rel="stylesheet" type="text/css" href="/css/login.css">
	<script type="text/javascript" language="javascript"  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(function() {
			// 커서 포커스
			$("#member_id").focus();
			
			// server 전송
			/* $("#btn").on("click", function(){
				var jsObj = {member_id: $("#member_id").val(), member_pw: $("#member_pw").val()}
				var jsonData = JSON.stringify(jsObj);
				
				//console.log(jsonData)
				$.ajax({
					url: "login.json",
					type: "POST",
					contentType: "application/json; charset=utf-8",
					data: jsonData,
					complete: function(data){
						
					}
				});
			}); */ // end of #btn function()
		});
	</script>
</head>




<body>
  <div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->
    <h2 class="active"> Sign In </h2>
    <h2 class="inactive underlineHover"><a href="signup.do">Sign Up </a></h2>

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="/imgs/logo.png" id="icon" alt="User Icon" />
    </div>

    <!-- Login Form -->
    <form action="login" method="post">
      <s:csrfInput/>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      <input type="text" id="member_id" class="fadeIn second" name="member_id" placeholder="login" required>
      <input type="password" id="member_pw" class="fadeIn third" name="member_pw" placeholder="password" required>
      <c:if test="${param.ng!=null}">
        <p><c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/> </p>
      </c:if>
      <input type="submit" class="fadeIn fourth" value="Log In" id="btn">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <a class="underlineHover" href="#">Forgot Password?</a>
    </div>

  </div>
</div>
</body>
</html>