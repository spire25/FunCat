<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>



<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>FunCat 비밀번호 찾기</title>
  <link rel="stylesheet" type="text/css" href="/css/login.css">
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script type="text/javascript">
	$(function(){
		$("#btn").on("click", function(){
			console.log("click btn");
			
			var data = {member_id: $("#member_id").val()}
			console.log("전송 data id: "+data.member_id);
			
			$.ajax({
				url: "findPw",
				type: "POST",
				data: data,
				/* dataType: "text", */
				complete: function(result){
					console.log(result);
					alert(result.responseText);
					
					document.getElementById('div1Span').innerHTML='<h2 class="inactive underlineHover"><a href="login.do"> 로그인 </a></h2>하러가기';
				}
			}); // end of ajax
		}); // end of #btn()
	});
  </script>
</head>
<body>
  <div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->
    <h2 class="inactive underlineHover"><a href="findEmail.do"> 이메일 찾기 </a></h2>
    <h2 class="active"> 비밀번호 찾기 </h2>

    <!-- Icon -->
    <div class="fadeIn first">
      <a href="/"><img src="/img/logo.jpg" id="icon" alt="User Icon" /></a>
    </div>

    <!-- Login Form -->
    <form>
      <p class="fadeIn second">가입하셨던 이메일 계정을 입력하시면,<br>
		임시 비밀번호를 확인할 수 있는 이메일을<br>
		발송해드립니다.</p>
      <input type="text" id="member_id" class="fadeIn third" name="member_id" placeholder="email">
      <div class="div1">
        <span id="div1Span"></span>
      </div>
      <input type="button" class="fadeIn fourth" value="링크 발송" id="btn">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <!-- <a class="underlineHover" href="#">Forgot Password?</a> -->
    </div>

  </div>
</div>
</body>
</html>
