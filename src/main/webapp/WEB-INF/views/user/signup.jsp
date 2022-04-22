<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
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
	var idCheck = 'F';
	var pwCheck = 'F';
	var pwSameCheck = 'F';
	var nameCheck = 'F';
	
	$(function() {
		$('#member_id').on("keyup", function(){
			document.getElementById('idcheckSpan').innerHTML='';
			idCheck = 'F';
		});
		
		$('#member_name').on("keyup", function(){
			document.getElementById("namecheckSpan").innerHTML='';
			nameCheck = 'F';
		});
		
		// 비밀번호 조건
	    $('#member_pw').on("keyup", function(){
	        var pwd = document.getElementById('member_pw').value;
	        var pwd2 = document.getElementById('pwd2').value;
	        var special = ["!", ".", "@", "#", "$", "%", "&"];
	        var length_check = 0;
	        var special_check = 0;
	        pwCheck = 'F';
	        pwSameCheck = 'F';
	        var pwdSameCheckSpan = document.getElementById('pwdvalidate').html;

			if((pwd.length != 0) && (pwd2.length != 0)){
				document.getElementById('pwdvalidate').innerHTML='* 비밀번호가 일치하지 않습니다.';
			}
	        
			
			if(pwd.length < 6){
				//alert('6글자 이상, 16글자 이하만 이용 가능합니다.');
				document.getElementById('pwdcheck').innerHTML='* 6글자 이상, 16글자 이하만 이용 가능합니다.';
			} else if(pwd.length>16){
	            //alert('6글자 이상, 16글자 이하만 이용 가능합니다.');
				document.getElementById('pwdcheck').innerHTML='* 6글자 이상, 16글자 이하만 이용 가능합니다.';
			} else if(pwd.length >= 6 && pwd.length<=16){
				for(var i=0;i<special.length;i++){
					if(pwd.indexOf(special[i]) != -1){
						document.getElementById('pwdcheck').innerHTML='<span class="blue">사용가능한 비밀번호입니다.</sapn>';
						pwCheck = 'T';
						break;
					} else {
						document.getElementById('pwdcheck').innerHTML='* !, @, ., #, $, %, & 특수기호를 포함해주세요.';
					}
				}
			}
		});

		// 비밀번호 같은지 확인
		$('#pwd2').on("keyup", function(){
			var pwd = document.getElementById('member_pw').value;
			var pwd2 = document.getElementById('pwd2').value;
			pwSameCheck = 'F';
			
			if((pwd.length == 0) && (pwd2.length == 0)){
				document.getElementById('pwdvalidate').innerHTML='';
			} else if(pwd != pwd2 ){
				document.getElementById('pwdvalidate').innerHTML='* 비밀번호가 일치하지 않습니다.';
			} else{
				document.getElementById('pwdvalidate').innerHTML='<span class="blue">비밀번호가 일치합니다.</span>';
				pwSameCheck = 'T';
			}
		});

		// 핸드폰 번호 패턴
		$('#member_phone').on("keyup", function(){
			var phoneStr = document.getElementById('member_phone').value;
			var temp = phoneStr.replace(/^(\d{3})(\d{4})(\d{4})$/, `$1-$2-$3`);
			document.getElementById('member_phone').value = temp;
		});
	    
		// email 중복 체크
		$("#idcheck").on("click", function(){
			var member_id = document.getElementById("member_id").value;
			idCheck = 'F';
			
			//console.log(member_id);
			$.ajax({
	    		url: "idcheck",
	    		type: "post",
	    		data: {member_id:member_id},
				dataType: 'JSON',
	    		success: function(result){
	    			console.log("result...: "+result);
	    			if(result != null){
	    				document.getElementById('idcheckSpan').innerHTML='이미 가입된 이메일입니다.';
	    				idCheck='F';
	    			} else{
	    				console.log("실패");
	    				idCheck='F';
	    			}
				},
	    		error: function(){
	    			document.getElementById('idcheckSpan').innerHTML='<span class="blue">사용가능한 이메일입니다.</span>';
    				idCheck='T';
				}
			});
		}); // end of email 중복체크
	    
	    // name 중복체크
		$("#namecheck").on("click", function(){
	    	var member_name = document.getElementById("member_name").value;
	    	nameCheck = 'F';
	    	
	    	//console.log(member_name);
	    	$.ajax({
	    		url: "namecheck",
	    		type: "post",
	    		data: {member_name:member_name},
				dataType: 'JSON',
	    		success: function(result){
	    			//console.log("result "+result);
	    			if(result != null){
	    				document.getElementById("namecheckSpan").innerHTML='사용하고 있는 이름입니다.';
	    				nameCheck='F';
	    			} else{
	    				console.log("실패");
	    				nameCheck='F';
	    			}
	    		},
	    		error: function(){
	    			document.getElementById("namecheckSpan").innerHTML='<span class="blue">사용가능한 이름입니다.</span>';
    				nameCheck='T';
				}
			});
		}); // end of name 중복체크
	    
	    
		// 회원가입 server 전송
		$("#btn").on("click", function get_action(){
			// 다 채워졌는지 확인
			var member_id = document.getElementById("member_id").value;
			var member_pw = document.getElementById("member_pw").value;
			var member_name = document.getElementById("member_name").value;
			var member_phone = document.getElementById("member_phone").value;
			var temp = document.getElementsByName("member_email_check");
			var member_email_check;
			temp.forEach(function(node){
				if(node.checked){
					member_email_check = node.value;
			        //console.log("member_email_check 확인: " + member_email_check);
				}
			})

			if(member_id == ""){
				alert("이메일을 입력해주세요.");
			}else if(member_pw== ""){
				alert("비밀번호를 입력해주세요.");
			}else if(member_name == ""){
				alert("이름을 입력해주세요.");
			}else if(member_phone == ""){
				alert("휴대폰 번호를 입력해주세요.");
			}else if(typeof member_email_check == "undefined"){
				alert("이메일 수신여부를 확인해주세요.");
			}else{
				// 다 채웠는지 조건 맞췄는지 확인
				if((idCheck=='T') && (pwCheck=='T') && (pwSameCheck=='T') && (nameCheck=='T') && (member_phone.length==13) && (typeof member_email_check !== "undefined")){
				
					//console.log("회원가입 됨!");
					//console.log("member_email_check: "+ member_email_check);
					
					// 회원가입
					var jsObj = {member_id: $("#member_id").val(), 
								member_pw: $("#member_pw").val(),
								member_name: $("#member_name").val(),
								member_phone: $("#member_phone").val(),
								member_email_check: $('input[name="member_email_check"]:checked').val()
								}
					var jsonData = JSON.stringify(jsObj);
					
					//console.log(jsonData)
					$.ajax({
						url: "signup.json",
						type: "POST",
						dataType: "text",
						contentType: "application/json; charset=utf-8",
						data: jsonData, /* {member_id: $("#member_id").val(), 
							member_pw: $("#member_pw").val(),
							member_name: $("#member_name").val(),
							member_phone: $("#member_phone").val(),
							member_email_check: $('input[name="member_email_check"]:checked').val()
							}, -->*/ //jsonData,
						success: function(){
							alert("회원가입 되었습니다.");
							location.href = 'login.do';
						},
						error: function(request,status,error){
							alert("회원가입에 실패했습니다.");
							console.log("회원가입 실패 code: ",request.status, ", message: ", request.responseText, ", error: ",  error);
						}
					}); 
					
				} else{ // 조건 안 맞으면 팝업창
					console.log("조건을 확인해주세요!");
					console.log("idCheck: "+idCheck+", pwCheck: "+pwCheck + ", pwSameCheck: "+pwSameCheck + 
							", nameCheck: "+nameCheck + ", member_phone.length: "+member_phone.length + ", member_email_check: "+member_email_check);
					
					if(idCheck=='F'){
						console.log("이메일 중복확인이 필요합니다.");
						alert("이메일 중복확인이 필요합니다.");
					} else if(pwCheck=='F'){
						console.log("비밀번호 조건을 확인해주세요.");
						alert("비밀번호 조건을 확인해주세요.");
					} else if(pwSameCheck=='F'){
						console.log("비밀번호 확인 칸을 다시채워주세요.");
						alert("비밀번호 확인 칸을 다시채워주세요.");
					} else if(nameCheck=='F'){
						console.log("닉네임 중복확인이 필요합니다.");
						alert("닉네임 중복확인이 필요합니다.");
					} else if(member_phone.length!=13){
						console.log("전화번호 포맷을 확인해주세요.");
						alert("전화번호 포맷을 확인해주세요.");
					} else{  /* if(member_email_check === undefined) */
						console.log("이메일 수신 여부에 체크해주세요.");
						alert("이메일 수신 여부에 체크해주세요.");
					}
				}
				
			}
			
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
      <a href="/"><img src="/img/logo.jpg" id="icon" alt="User Icon" /></a>
    </div>

    <!-- Login Form -->
    <form onsubmit="this.action=get_action">
      <s:csrfInput/>
      <table border="0" width="100%">
        <tr class="fadeIn second">
          <td class="table_title">이메일</td>
          <td class="table_content">
            <input type="text" id="member_id" class="fadeIn second" name="email" placeholder="email" required autofocus required>
            <input type="button" class="duplicateCheckBox" name="idcheck" id="idcheck" value="중복확인"><br>
            <span class="red" id="idcheckSpan"></span>
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
            <input type="button" class="duplicateCheckBox" name="namecheck" id="namecheck" value="중복확인"><br>
            <span class="red" id="namecheckSpan"></span>
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

      <input type="button" class="fadeIn ninth" value="sign up" id="btn">
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