<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


    
    
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>FunCat</title>

    <style type="text/css">
    /* 자동이미지 슬라이더 만들기 */
    * {box-sizing: border-box;}
    body {font-family: Verdana, sans-serif;}
    .mySlides {display: none;}
    img {vertical-align: middle;}

    /* 슬라이드 컨테이너 */
    .slideshow-container {
      max-width: 1000px;
      position: relative;
      margin: auto;
    }

    /* 상단에 보여줄 넘버 (1/3 etc) */
    .numbertext {
      color: #f2f2f2;
      font-size: 12px;
      padding: 8px 12px;
      position: absolute;
      top: 0;
    }

    /* The dots/bullets/indicators */
    .dot {
      height: 15px;
      width: 15px;
      margin: 0 2px;
      background-color: #bbb;
      border-radius: 50%;
      display: inline-block;
      transition: background-color 0.6s ease;
    }

    .active {
      background-color: #717171;
    }

    /* Fade 애니메이션*/
    .fade {
      -webkit-animation-name: fade;
      -webkit-animation-duration: 1.5s;
      animation-name: fade;
      animation-duration: 1.5s;
    }

    @-webkit-keyframes fade {
      from {opacity: .4} 
      to {opacity: 1}
    }

    @keyframes fade { /* @keyframes 특정한 시간에 해당 요소가 가져야 할 CSS 스타일을 명시 */
      from {opacity: .4} 
      to {opacity: 1}
    }

    /* 이미지 슬라이드 반응형 */
    @media only screen and (max-width: 300px) {
      .text {font-size: 11px}
    }

    /*프로젝트명 말줄임*/
    .featured__item__text{
        width: 250px;
        text-overflow: ellipsis;
        overflow: hidden;
        white-space: normal;
        line-height: 1.2;
        word-wrap: break-word; /*단어단위 줄바꿈*/
        display: -webkit-box;  /*유연하게 height를 증감시킬 수 있는 플렉스 박스형태로 변환*/
        -webkit-line-clamp: 1 ;/*보여줄 줄 수*/
        -webkit-box-orient: vertical;/*플렉스 박스의 방향 설정(가로)*/
    }

    /*프로젝트 이미지에 마우스 올리면 확대*/
    .scale{
        overflow: hidden;
    }

    .project_thumb_hover{
        max-width: 100%;
    }

    .img_scale img {
      transition: all 0.2s linear;
    }
    .img_scale:hover img {
      transform: scale(1.4);
    }

   /* 프로젝트 이미지에 마우스 올리면 figcaption 나타나기*/
    @import url(https://fonts.googleapis.com/css?family=Raleway:400,500,700);
    .img_scale {
      font-family: 'Raleway', Arial, sans-serif;
      position: relative;
      margin: 0px;
      min-width: 310px -60px;
      max-width: 310px;
      width: 100%;
      color: white;
      text-align: left;
    /*  background-color: #000000;*/
      font-size: 16px;
    }
    .img_scale * {
      -webkit-box-sizing: border-box;
      box-sizing: border-box;
      -webkit-transition: all 0.4s ease-in;
      transition: all 0.4s ease-in;
    }
    .img_scale img {
      position: relative;
      max-width: 100%;
      vertical-align: top;
    }
    .img_scale figcaption {
      position: absolute;
      top: 0;
      right: 0;
      width: 100%;
      height: 100%;
      z-index: 1;
      opacity: 0;
      padding: 20px 30px;
    }
    .img_scale figcaption:before,
    .img_scale figcaption:after {
      width: 1px;
      height: 0;
    }
    .img_scale figcaption:before {
      right: 0;
      top: 0;
    }
    .img_scale figcaption:after {
      left: 0;
      bottom: 0;
    }
    .img_scale h3,
/*    .img_scale p {
      line-height: 1.5em;
    }*/
    .img_scale h3 {
      margin: 0 0 5px;
      font-weight: 700;
      text-transform: uppercase;
    }
/*    .img_scale p {
      font-size: 0.8em;
      font-weight: 500;
      margin: 0 0 15px;
    }*/
    .img_scale a {
      position: absolute;
      top: 0;
      bottom: 0;
      right: 0;
      left: 0;
      z-index: 1;
    }
    .img_scale:before,
    .img_scale:after,
    .img_scale figcaption:before,
    .img_scale figcaption:after {
      position: absolute;
      content: '';
      background-color: #f0b000;
      z-index: 1;
      -webkit-transition: all 0.4s ease-in;
      transition: all 0.4s ease-in;
      opacity: 0.8;
    }
    .img_scale:before,
    .img_scale:after {
      height: 2px;
      width: 0%;
    }
    .img_scale:before {
      top: 0;
      left: 0;
    }
    .img_scale:after {
      bottom: 0;
      right: 0;
    }
    .img_scale:hover img,
    .img_scale.hover img {
      opacity: 0.4;
    }
    .img_scale:hover figcaption,
    .img_scale.hover figcaption {
      opacity: 1;
    }
    .img_scale:hover figcaption:before,
    .img_scale.hover figcaption:before,
    .img_scale:hover figcaption:after,
    .img_scale.hover figcaption:after {
      height: 100%;
    }
    .img_scale:hover:before,
    .img_scale.hover:before,
    .img_scale:hover:after,
    .img_scale.hover:after {
      width: 100%;
    }
    .img_scale:hover:before,
    .img_scale.hover:before,
    .img_scale:hover:after,
    .img_scale.hover:after,
    .img_scale:hover figcaption:before,
    .img_scale.hover figcaption:before,
    .img_scale:hover figcaption:after,
    .img_scale.hover figcaption:after {
      opacity: 0.1;
    }

    </style>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
    <link rel=”stylesheet” href=”http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css“>
    <link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/jquery-ui.min.css" type="text/css"> 
    <link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css">

    <link rel="stylesheet" href="/sass/style.css" type="text/css">
</head>

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
		                                    <li><a href="../user/logout.do" id="project_regist">프로젝트 등록</a></li>
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
            <!-- 햄버거 오픈 -->
<!--             <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div> -->
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero" style="position:absolute;left: 50%; transform: translateX(-50%);">
        <div class="container">
          <!--   <div class="row"> -->
				<!-- <div class="col-lg-9"> -->
					<div class="hero__search" >
						<div class="hero__search__form" >
							<form action="search" method="GET">
								
								<input type="text" placeholder="프로젝트 검색..." name="search_sub">
								<button type="submit" class="site-btn" style="float:right;background-color:black">검색</button>
							</form>
						</div>
					</div>
               <!--  </div> -->
            <!-- </div> -->
        </div>
    </section><br><br><br>

    <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>검색한 프로젝트</h2>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
            <!-- 반복문 -->
                <c:forEach items="${searchList}" var="project">
                	<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
	                    <div class="featured__item">
	                        <a href="../member/detail.do?project_num=${project.PROJECT_NUM}">
	                        <div class="featured__item__pic set-bg">
	                            <!-- 프로젝트에 등록한 썸네일을 불러와야합니다. -->
	                            <figure class="img_scale">
	                                <img src="/image/${project.PROJECT_THUMBNAIL }" class="project_thumb_hover" style="padding-top: 40px;padding-bottom: 20px;">
	                                <figcaption>
	                                    <h3>프로젝트<br>밀어주기</h3>
	                                </figcaption>
	                            </figure>
	                        </div>
	                        <div class="featured__item__text">
	                            <h6>${project.PROJECT_SUB}</h6>
	                        </div>
	                    </div></a>
	                </div>
                </c:forEach>
                <c:forEach items="${categoryList}" var="project">
                	<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
	                    <div class="featured__item">
	                        <a href="../member/detail.do?project_num=${project.PROJECT_NUM}">
	                        <div class="featured__item__pic set-bg">
	                            <!-- 프로젝트에 등록한 썸네일을 불러와야합니다. -->
	                            <figure class="img_scale">
	                                <img src="/image/${project.PROJECT_THUMBNAIL }" class="project_thumb_hover" style="padding-top: 40px;padding-bottom: 20px;">
	                                <figcaption>
	                                    <h3>프로젝트<br>밀어주기</h3>
	                                </figcaption>
	                            </figure>
	                        </div>
	                        <div class="featured__item__text">
	                            <h6>${project.PROJECT_SUB}</h6>
	                        </div>
	                    </div></a>
	                </div>
                </c:forEach>
                <!-- 반복문 end -->
            </div>
        </div>
    </section>
    <!-- Featured Section End -->

    <!-- Banner Begin -->

    <!-- Banner End -->

    <!-- Latest Product Section Begin -->

    <!-- Latest Product Section End -->

    <!-- Blog Section Begin -->

  
    <!-- Footer Section -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="footer__copyright">
                        <div class="footer__copyright__text">
                            <p>
                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | <b>TK</b>
                            </p>
                        </div>
                        <div class="footer__copyright__payment"><img src="../img/payment-item.png" alt=""></div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
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
</body>

</html>



