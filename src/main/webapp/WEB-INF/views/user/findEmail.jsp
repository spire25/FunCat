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
				url: "findEmail",
				type: "POST",
				data: data,
				complete: function(result){
					//console.log(result);	
					var str = result.responseText;
					
					if(str === '미등록'){
						alert('FunCat에 등록되어 있지 않은 계정입니다.');
						document.getElementById('div1Span').innerHTML='<h2 class="inactive underlineHover"><a href="signup.do"> 회원가입 </a></h2>하러가기';
					} else if(str === '등록'){
						alert('회원으로 등록된 이메일 아이디입니다.\n해당 이메일로 로그인하고 FunCat를 이용하세요!');
						document.getElementById('div1Span').innerHTML='<h2 class="inactive underlineHover"><a href="login.do"> 로그인 </a></h2>하러가기';
					}
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
    <h2 class="active"> 이메일 찾기 </h2>
    <h2 class="inactive underlineHover"><a href="findPw.do"> 비밀번호 찾기 </a></h2>

    <!-- Icon -->
    <div class="fadeIn first">
      <a href="/"><img src="/img/logo.jpg" id="icon" alt="User Icon" /></a>
    </div>

    <!-- Login Form -->
    <form>
      <p class="fadeIn second">FunCat은 이메일을 아이디로 사용합니다.<br>
        소유하고 계신 계정을 입력해보세요.<br>
        가입여부를 확인해드립니다.</p>
      <input type="text" id="member_id" class="fadeIn third" name="member_id" placeholder="email">
      <div class="div1">
        <span id="div1Span"></span>
      </div>
      <input type="button" class="fadeIn fourth" value="확인" id="btn">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
     <!--  <a class="underlineHover" href="#">Forgot Password?</a> -->
    </div>

  </div>
</div>
</body>
</html>