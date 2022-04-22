<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>프로젝트 등록</title>

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

<!-- <!--   <!--   <!-- 값 제어를 위해 jquery : counting text -->
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script> 
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
                            <li><a href="/list">공지</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- Header Section End -->


    <!-- Breadcrumb Section -->
    <section class="breadcrumb-section set-bg" data-setbg="../img/breadcrumb.jpg" ><!-- data-setbg="img/breadcrumb.jpg" -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>게시글 관리</h2>
                        <div class="breadcrumb__option">
                            <!-- <a href="./index.html">Home</a> -->
                            <span></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section END -->

    <!-- Checkout Section -->
    <section class="checkout spad">
        <div class="container">
<!--             <div class="row">
                <div class="col-lg-12">
                    <h6><span class="icon_tag_alt"></span> <a href="#">목록 페이지</a> <a href="#">목록 페이지</a>
                    </h6>
                </div>
            </div> -->
            <div class="checkout__form">
                <h4>게시 조회</h4>
                <form id="infoForm" action="/notice/modify" method="get">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>게시글 번호<span>*</span></p>
                                        <input name="notice_num" readonly="readonly" value='<c:out value="${pageInfo.notice_num}"/>'>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="checkout__input">
                                <p>게시글 제목<span>*</span></p>
                                <input name="notice_sub" readonly="readonly" value='<c:out value="${pageInfo.notice_sub}"/>'>
                            </div>
                            <br>
                            <div class="checkout__input">
                                <p>게시글 내용<span>*</span></p>
                                <textarea class="form-control h-25" rows="10" name="notice_con" id="notice_con" placeholder="프로젝트 요약소개 50자 제한" style="max-width: 750px; min-width: 300px; resize: none;"><c:out value="${pageInfo.notice_con}"/></textarea>
                                <div id="project_comment_cnt" style="text-align: right;">(0/235)</div><br>
                            </div>
                            <div class="checkout__input">
                                <p>게시글 등록일<span>*</span></p>
                                <input name="notice_date" readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.notice_date}"/>'>
                            </div>
                            <br>
                            <div class="checkout__input">
                                <p>게시글 조회수<span>*</span></p>
                                <input  name="notice_view" readonly="readonly" value='<c:out value="${pageInfo.notice_view}"/>'>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                   <div class="btn_wrap">
                                    <center>
                                      <a class ="btn" id="list_btn">목록 페이지</a><br>
                                      <a class ="btn" id="modify_btn">수정 페이지</a>
                                    </center>
                                   </div>
                                   
                                      <input type="hidden" id="notice_num" name="notice_num" value='<c:out value="${pageInfo.notice_num}"/>'>
                                      <input type="hidden" name="pageNum" value='<c:out value="${str.pageNum}"/>'>
                                      <input type="hidden" name="amount" value='<c:out value="${str.amount}"/>'>
                                      <input type="hidden" name="type" value="${str.type }">
                                      <input type="hidden" name="keyword" value="${str.keyword }">
                                    </form>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->

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
                        <div class="footer__copyright__payment"><img src="/img/payment-item.png" alt=""></div>
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

    <script type="text/javascript">
    //글자수 카운팅
    $(document).ready(function() {
        $('#notice_con').on('keyup', function() {
            $('#project_comment_cnt').html("("+$(this).val().length+" / 235)");
     
            if($(this).val().length > 235) {
                $(this).val($(this).val().substring(0, 235));
                $('#project_comment_cnt').html("(235 / 235)");
            }
        });
    });



    let form = $("#infoForm");
   
    $("#list_btn").on("click", function(e){
      form.find("#notice_num").remove();
      form.attr("action", "/notice/list");
      form.submit();
    });
   
    $("#modify_btn").on("click", function(e){
      form.attr("action", "/notice/modify");
      form.submit();
    }); 
    
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