<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
	<link rel="icon" type="image/png" href="/img/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/animate/animate.css">

<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="/css/util.css">	
<!--===============================================================================================-->	
	<script src="/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/bootstrap/js/popper.js"></script>
	<script src="/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="/js/main.js"></script>
<!--===============================================================================================-->
<!-- Css Styles -->
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css">

    <link rel="stylesheet" href="/sass/style.css" type="text/css">

<style>
	table, th, td {
	   border: 1px solid black;
	   border-collapse: collapse;
	}
	th, td {
	   padding: 5px;
	}
	a { text-decoration:none }
</style>
<meta charset="utf-8">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
<body>
	<!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

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
		                                    <li><a href="../user/login.do">로그인</a></li>
		                                    <li><a href="../user/signup.do">회원가입</a></li>
		                                </ul>
									</c:when>
									<c:otherwise>
										<div>${user.member_name}님</div>
		                                <span class="arrow_carrot-down"></span>
		                                <ul>
		                                    <li><a href="../member/list.do?member_id=${user.member_id}">마이페이지</a></li>
		                                    <li><a href="../project/penroll" id="project_regist">프로젝트 등록</a></li>
		                                    <li><a href="../user/logout.do">로그아웃</a></li>
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
        </div>
    </header>
    <!-- Header Section End -->

	<center>
		<font color='black' size='15' face='NanumSquareExtraBold'>
			<h3>Community</h3>
		</font><br>
	</center>
	<table border='2' width='600' align='center' >
		<font color='black' size='4' face='NanumSquare'>
			<tr>
				<td width='20%' align='center' style="font-family: NanumSquareExtraBold">NO</td>
				<td style="font-family: NanumSquare">${content.community_num}</td>
			</tr>
			
			<tr>
				<td width='20%' align='center' style="font-family: NanumSquareExtraBold">프로젝트</td>
				<td style="font-family: NanumSquare">${content.project_num}</td>
			</tr>
			
			<tr>
				<td align='center' style="font-family: NanumSquareExtraBold">아이디</td>
				<td style="font-family: NanumSquare">${content.member_id}</td>
			</tr>
			
			<tr>
				<td align='center' style="font-family: NanumSquareExtraBold">제목</td>
				<td style="font-family: NanumSquare">${content.community_sub}</td>
			</tr>
			
			<tr>
				<td align='center' style="font-family: NanumSquareExtraBold">내용</td>
				<td style="font-family: NanumSquare">${content.community_con}</td>
			</tr>
		</font>
	</table>

	<center>
	<font color='gray' size='4' face='NanumSquareExtraBold'>	
		<a href="/funcat/community/boardlist">목록</a>
	</font>
	
	<font color='gray' size='4' face='NanumSquareExtraBold'>	
		<a href="/funcat/community/boardlist">수정</a>  <!-- 링크 수정해야됨 -->
	</font>
	
	<font color='gray' size='4' face='NanumSquareExtraBold'>
		<a href="/funcat/community/content/delete?community_num=${content.community_num}">삭제</a>
	</font>
	</center>
	
	<!-- Footer Section -->
<!--     <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text">
                            <p>
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | <b>TK</b>
                            </p>
                        </div>
                        <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
                    </div>
                </div>
            </div>
        </div>
    </footer> -->
    <!-- Footer Section END -->
    
    <!-- Js Plugins -->
    <script src="/js/jquery-3.3.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.nice-select.min.js"></script>
    <script src="/js/jquery-ui.min.js"></script>
    <script src="/js/jquery.slicknav.js"></script>
    <script src="/js/mixitup.min.js"></script>
    <script src="/js/owl.carousel.min.js"></script>
    <script src="/js/main.js"></script>
     <script type="text/javascript" language="javascript"  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>


    <script type="text/javascript">
        $(function(){
    		var creatorCheck = "${user.member_check}";
    		if(creatorCheck != "Y") {
    	  		  $("#project_regist").hide();
    	    }
    		else{
    			$("#project_regist").show();
    		}
    	});

    </script>
    
    </body> 
 </html>   
