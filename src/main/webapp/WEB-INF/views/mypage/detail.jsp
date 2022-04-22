<%@ page contentType="text/html;charset=utf-8" session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Funcat Project Detail</title>

    <!-- Google Font -->
    
	<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">

    <!-- Css Styles -->
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
    
    <!-- Css Styles -->
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css">

    <link rel="stylesheet" href="/sass/style.css" type="text/css">

    <!-- 후원달성 프로그레스 바 스타일 -->
    <style type="text/css">
        #progress { 
            appearance: none; 
        } 
        #progress::-webkit-progress-bar { 
            width: 550px;
            background:#f0f0f0; 
            /*border-radius:10px; */
           /* box-shadow: inset 3px 3px 10px #ccc; */
        } #progress::-webkit-progress-value { 
            /*border-radius:10px; */
            background: #1D976C; 
            background: -webkit-linear-gradient(to right, #fcf5ae, #f0b000); 
            background: linear-gradient(to right, #fcf5ae, #f0b000); 
        }
    </style>
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

    <!-- Breadcrumb Section -->
    <section class="breadcrumb-section set-bg" style="background-color:black;"> <!-- data-setbg="img/breadcrumb.jpg" -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <div class="breadcrumb__option">
<!--                             <a href="./index.html">Home</a>
                            <a href="./index.html">Vegetables</a> -->
                            <span>${mypage.category_sub}</span>
                        </div>
                        <h2>${mypage.project_sub}</h2>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section END -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <!-- 썸네일 이미지 넣기 -->
                            <!-- <img class="product__details__pic__item--large"
                                src="img/product/details/product-details-1.jpg" alt=""> -->
                            <img class="product__details__pic__item--large"
                                src="../image/${mypage.project_thumbnail }" alt=""> 
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>${mypage.project_sub}</h3>
                        <div class="product__details__rating">
                        <h6>펀딩금액</h6>
<!--                             <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 reviews)</span> -->
                        </div>
                        <div class="product__details__price" style="color:#f0b000"><fmt:formatNumber type="number" value="${mypage.project_price}"/></div>

                        <h6>달성현황</h6><br><!-- 달성현황의 value 값은 현재후원된금액/펀딩목표금액을 계산하여 나타내야합니다 -->
                        <progress id="progress" name="progress" value="${mypage.project_price}" min="0" max="${mypage.project_goal}"></progress>
                        <br><br>
                        <p>${mypage.project_comment}</p>
 <!--                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                        </div> -->
                       <!--  <a href="#" class="primary-btn">ADD TO CARD</a>
                        <a href="#" class="heart-icon"><span class="icon_heart_alt"></span></a> -->
                        <ul>
                            <li><b>프로젝트 오픈일</b> <span>${mypage.project_open}</span></li>
                            <li><b>프로젝트 종료일</b> <span>${mypage.project_close}</span></li>
                            <li><b>프로젝트 단계</b> <span>${mypage.project_level}</span></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <!-- Bootstrap Dynamic Tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">펀딩 상세설명</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">리워드</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="../funcat/community/boardlist"
                                    aria-selected="false"><span id="board">게시판</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab"
                                    aria-selected="false">펀딩 주의사항<span></span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <!-- 프로젝트 스토리 이미지 넣어주세요 -->
                                    <center><img src="../image/${mypage.project_detail }" width="40%"></center>
                                </div>
                            </div>
                                <div class="tab-pane" id="tabs-2" role="tabpanel">
                                  <div class="product__details__tab__desc">
                                    <form action="#">
                                     <c:if test="${empty reward}">
							             <tr>
							               <td>reward Empty</td>
							            </tr>
							         </c:if>
									 <c:forEach items="${reward}" var="reward">
                                        <ul class="project_reward_list" style="list-style: none;">
                                            <li style="background-color:#f2f2f2; max-width: 380px;padding:15px;border-radius: 5px;float: left; width: 31.3%;margin-right: 20px;"><h6><input type="radio"> ${reward.reward_sub}</h6>${reward.reward_price}<br>${reward.reward_cnt}<br>${reward.reward_date}</li>
                                 <!--       <li style="background-color:#f2f2f2; max-width: 380px;padding:15px;border-radius: 5px;float: left; width: 31.3%;margin-right: 20px;"><h6><input type="radio"> 리워드명</h6>리워드 금액<br>제한수량<br>발송시작일</li>
                                            <li style="background-color:#f2f2f2; max-width: 380px;padding:15px;border-radius: 5px;float: left; width: 31.3%;margin-right: 20px;"><h6><input type="radio"> 리워드명</h6>리워드 금액<br>제한수량<br>발송시작일</li>-->   
                                        </ul>
                                        </c:forEach>
                                        <br><br><br>
                                    
                                        <center><button class="site-btn" style="background-color:black;margin-top:30px" id="funding_btn">펀딩하기</button></center>
                                  
                                    </form>
                                </div>
                            </div>
<!--  ----------------------------------게시판 연동--------------------------------- -->
                            <div class="tab-pane" id="tabs-3" role="tabpanel">
                                <div class="product__details__tab__desc">
                                </div>
                            </div>
<!--  ----------------------------------게시판 연동--------------------------------- -->
                            <div class="tab-pane" id="tabs-4" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h4>크라우드 펀딩에 대한 안내</h4><br>

                                    <b> <img src="https://tumblbug.com/wpa/1f66831ec9af8b200c2861bccde76bd5.png" width="3%">펀딩은 구매가 아닌 창의적인 계획에 자금을 지원하는 일입니다.</b>
                                    <p>전자상거래법상 통신판매는 소비자의 청약 전 규격, 제조연월일 등 구체적인 상품정보가 제공 가능한 것을 대상으로 합니다. 따라서 텀블벅에서의 후원은 통신판매에 해당하지 않고, 전자상거래법 및 소비자보호규정(수령 후 7일 내 청약철회 등)이 적용되지 않습니다</p><br>
                                    <b><img src="https://tumblbug.com/wpa/0a4ed12c1a38cc261a6ec633931e12b3.png" width="3%">프로젝트는 계획과 달리 진행될 수 있습니다.</b>
                                    <p>예상을 뛰어넘는 멋진 결과가 나올 수 있지만 진행 과정에서 계획이 지연, 변경되거나 무산될 수도 있습니다. 본 프로젝트를 완수할 책임과 권리는 크리에이터에게 있습니다.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section END -->

    <!-- Related Product Section -->
<!--     <section class="related-product">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title related__product__title">
                        <h2>Related Product</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-1.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">1</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-2.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">2</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-3.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">3</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="img/product/product-7.jpg">
                            <ul class="product__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><a href="#">4</a></h6>
                            <h5>$30.00</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
    <!-- Related Product Section END -->

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
    <script type="text/javascript" language="javascript"  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- //펀딩 현황 그래프 계산 공식 수정해야함! 이건 아무 의미 없는 함수-->
    <script type="text/javascript">
        function  Calculator(){
                for(let i = 1; i <= 3; i++){
                let check = document.getElementById("price"+i);
                check.onclick = Calculator;
            }
        }
        
        $(function() {
        	// server 전송
			$("#funding_btn").on("click", function(){
				console.log("click");
			});
			
			// board click
			$("#board").on("click", function(){
				console.log(" board click");
			});
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