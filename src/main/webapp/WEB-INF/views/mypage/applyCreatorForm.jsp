<%@ page contentType="text/html;charset=utf-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Funcat Mypage Modify</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">

    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css">

    <link rel="stylesheet" href="/sass/style.css" type="text/css">


    <!-- Required meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
   
    <title>Funcat Mypage Modify</title>
    
    <!-- Bootstrap CSS -->
    
	<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script> 
	
	<script>
		function applyCheck(memberId)
		{	
				if (confirm("신청하시겠습니까??") == true){    //확인				
					  $.post( "applyCreator.do", { 
						 member_id: memberId,
						 creator_type: document.getElementById('businessYn').value,
						 creator_phone: document.getElementById('phone').value,
						 creator_check: document.getElementById('privacyYn').value,
						 creator_name: document.getElementById('name').value
						 } )
					  .done(function( data ) {
					   		if(data == "ok"){
					   			location.href='list.do?member_id='+ memberId;
					   		}
					  });			
				 }else{   //취소				
				     return false;			
				 }	
		}	
	</script>
	
	<style>
	
	th {
	text-align: center;
	background-color: #FAED7D;
	}	
	tr {
	text-align: center;
	}
	textarea {
	width: 60%;
	padding: 5px 5px;
	font-size: 12px;
	background-color:#FAED7D; 
    }
	</style>

</head>

<body>
    <!-- Page Preloader -->
    <div id="preloader">
        <div class="loader"></div>
    </div>
    <!-- Page Preloader END -->

    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="header__top__left">
                            <ul>
                                <li><i class="fa fa-envelope"></i> pjfuncat@gmail.com</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="header__top__right">
     
                            <div class="header__top__right__language">
                                <i class="fa fa-user"></i>
                                <!-- start -->
								<c:choose>
							 		<c:when test="${empty sessionScope.user }">
										<div>로그인</div>
		                                <span class="arrow_carrot-down"></span>
		                                <ul>
		                                    <li><a href="user/login.do">로그인</a></li>
		                                    <li><a href="user/signup.do">회원가입</a></li>
		                                </ul>
									</c:when>
									<c:otherwise>
										<div>${user.member_name}님</div>
		                                <span class="arrow_carrot-down"></span>
		                                <ul>
		                                    <li><a href="member/list.do?member_id=${user.member_id}">마이페이지</a></li>
		                                    <li><a href="user/logout.do" id="project_regist">프로젝트 등록</a></li>
		                                    <li><a href="user/logout.do">로그아웃</a></li>
		                                </ul>
									</c:otherwise>
								</c:choose>
                                <!-- end -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="/"><img src="/img/logo.jpg" width="70%" alt=""></a><!-- img/logo.png -->
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li><a href="/">홈</a></li>
                           <!--  <li class="active"><a href="./shop-grid.html">Shop</a></li> -->
                            <li><a href="#">카테고리</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="../project/category?category=영화">영화</a></li>
                                    <li><a href="../project/category?category=출판">출판</a></li>
                                    <li><a href="../project/category?category=음악">음악</a></li>
                                    <li><a href="../project/category?category=잡화">잡화</a></li>
                                    <li><a href="../project/category?category=뷰티">뷰티</a></li>
                                </ul>
                            </li>
                            <li><a href="../notice/list">공지</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- Header Section End -->


    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Apply Creator</h2>
                        <div class="breadcrumb__option">
				<span># Get Creator, Good Sale :</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->


     <!-- Contact Form -->
    <div class="contact-form spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="contact__form__title">
                 
  <h3><button type="button" class="btn btn-outline-warning" onclick= "location.href='list.do?member_id=${mypage.member_id}'" input type='submit'>Go Mypage</button>
  <button type="button" class="btn btn-outline-warning" onclick= "applyCheck('${mypage.member_id}');" input type='submit'>Apply</button></h3>
 	<br>
		<table class="table">
	    <tr>
	      <th>Division</th>
	      <th>Contents</th>
	    </tr>
    
			<tbody>	  
		  <tr>
		    <td>ID</td>
		    <td>${mypage.member_id}</td>
		  </tr>
		  <tr>
		    <td>사업자 여부</td>
		    <td><select id= "businessYn" name="creator_type" >
		  		  <option disabled selected>Y/N</option>
			    <option value="Y">Y</option>
			    <option value="N">N</option>
			</select></td>
		  </tr>
		  <tr>
		    <td>Contact</td>
		    <td><textarea id='phone' name='creator_phone' rows='1' cols='20' ></textarea></td>
		  </tr>
		  <tr>
		    <td>개인정보 수집 동의 여부</td>
		    <td><select id= "privacyYn" name="creator_check" >
		  		  <option disabled selected>Y/N</option>
			    <option value="Y">Y</option>
			    <option value="N">N</option>
			</select></td>
		  </tr>
		   <td>Business Name</td>
		    <td><textarea id='name' name='creator_name' rows='1' cols='20' ></textarea></td>
		  </tr>
		  		  
	 	 </tbody>
	  </table>
    </div>

    <!-- Contact Form END -->

    <!-- Footer Section -->
    <footer class="footer spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text">
                            <p>
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | <b>TK</b>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section END -->

    <!-- JS Plugins -->
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.nice-select.min.js"></script>
    <script src="/js/jquery-ui.min.js"></script>
    <script src="/js/jquery.slicknav.js"></script>
    <script src="/js/mixitup.min.js"></script>
    <script src="/js/owl.carousel.min.js"></script>

    <script src="/js/main.js"></script>
</body>

</html>