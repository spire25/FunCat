<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>FunCat 회원가입</title>
	<link rel="stylesheet" type="text/css" href="/css/signup.css">
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="/js/signup.js"></script>
	<script type="text/javascript">
	$(function() {
		// server 전송
		$("#btn").on("click", function get_action(){
			var jsObj = {member_id: $("#member_id").val(), 
						member_pw: $("#member_pw").val(),
						member_name: $("#member_name").val(),
						member_phone: $("#member_phone").val(),
						member_email_check: $('input[name="member_email_check"]:checked').val()
						}
			var jsonData = JSON.stringify(jsObj);
			
			console.log(jsonData)
			$.ajax({
				url: "signup.json",
				type: "POST",
				contentType: "application/json; charset=utf-8",
				data: jsonData
			});
		}); // end of #btn function()
	});
	</script>
</head>
<body>
  <div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->
    <h2 class="inactive underlineHover"><a href="login.do"> Sign In </a></h2>
    <h2 class="active">Sign Up</h2>

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="/imgs/logo.png" id="icon" alt="User Icon" />
    </div>

    <!-- Login Form -->
    <form onsubmit="this.action=get_action">
      <table border="0" width="100%">
        <tr class="fadeIn second">
          <td class="table_title">이메일</td>
          <td class="table_content">
            <input type="text" id="member_id" class="fadeIn second" name="email" placeholder="email" required autofocus required>
            <input type="button" class="duplicateCheckBox" name="idcheck" value="중복확인"><br>
            <span class="red" id="idcheck">* idcheck</span>
          </td>
        </tr>
        <tr class="fadeIn third">
          <td class="table_title">비밀번호</td>
          <td class="table_content">
            <input type="password" id="member_pw" class="fadeIn second" name="pwd" placeholder="password" required><br>
            <span class="red" id="pwdcheck"></span>
          </td>
        </tr>
        <tr class="fadeIn fourth">
          <td class="table_title">비밀번호<br/>확인</td>
          <td class="table_content">
            <input type="password" id="pwd2" class="fadeIn second" name="pwd2" placeholder="password check" required><br>
            <span class="red" id="pwdvalidate"></span>
          </td>
        </tr>
        <tr class="fadeIn fifth">
          <td class="table_title">회원명</td>
          <td class="table_content">
            <input type="text" id="member_name" class="fadeIn second" name="name" placeholder="name" required>
            <input type="button" class="duplicateCheckBox" name="namecheck" value="중복확인"><br>
            <span class="red" id="namecheck">* namecheck</span>
          </td>
        </tr>
        <tr class="fadeIn sixth">
          <td class="table_title">핸드폰<br>번호</td>
          <td class="table_content">
            <input type="text" id="member_phone" class="fadeIn second" name="phonNumber" placeholder="숫자만입력" pattern="[0-1]{3}-[0-9]{4}-[0-9]{4}" required>
          </td>
        </tr>
        <tr class="fadeIn seventh">
          <td class="table_title">email<br/>수신여부</td>
          <td class="table_content"> &nbsp;
            <label><input type="radio" name="member_email_check" value="Y">예, 펀딩 알림을 받겠습니다.</label><br>&nbsp;
            <label><input type="radio" name="member_email_check" value="N">아니오, 펀딩 알림을 받지 않겠습니다.</label>
          </td>
        </tr>
      </table>

      <input type="submit" class="fadeIn ninth" value="sign up" id="btn">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
      <!-- <a class="underlineHover" href="#">Forgot Password?</a> -->
    </div>

  </div>
</div>
</body>
</html>


<!-- id / pwd / 회원명 / 전화번호 / email수신여부   -->