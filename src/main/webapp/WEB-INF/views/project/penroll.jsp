<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>프로젝트 등록</title>

    <!-- Air-datepicker -->
    <script src="./datepicker/jquery-3.1.1.min.js"></script>
    <link rel="stylesheet" href="./datepicker/air-datepicker/dist/css/datepicker.min.css" type="text/css">
    
    <script src="./datepicker/air-datepicker/dist/js/datepicker.min.js"></script>
    <script src="./datepicker/air-datepicker/dist/js/i18n/datepicker.ko.js"></script>

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
                        <a href="/"><img src="/img/logo.jpg" width="70%" alt=""></a><!-- /img/logo.png -->
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
    <section class="breadcrumb-section set-bg" style="background-color:black" ><!-- data-setbg="img/breadcrumb.jpg" -->
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>프로젝트 등록</h2>
                        <div class="breadcrumb__option">
                            <!-- <a href="./index.html">Home</a> -->
                            <span>우리는 크리에이터를 응원합니다</span>
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
            <div class="row">
                <div class="col-lg-12">
                    <h6><span class="icon_tag_alt"></span> 프로젝트 등록이 처음이신가요? <a href="#">Click here</a> 프로젝트 등록 방법 확인하세요.
                    </h6>
                </div>
            </div>
            <div class="checkout__form">
                <h4>프로젝트 상세 등록</h4>
                <form action="/project/penroll" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>프로젝트 명<span>*</span></p>
                                        <input type="text" name="project_sub">
                                    </div>
                                    <div class="checkout__input">
                                        <p>카테고리<span>*</span></p>
                                        <select size=5 name="cateogry_num">
                                            <option value="1">영화</option>
                                            <option value="2">출판</option>
                                            <option value="3">음악</option>
                                            <option value="4">잡화</option>
                                            <option value="5">뷰티</option>
                                        </select>
                                    </div>
                                    <br><br>
                                    <div class="checkout__input">

                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>프로젝트 썸네일<span>*</span></p>
                            </div>
                            <div id="thumbDiv"><!-- fileDiv -->
                                <p>
                                    <input type="file" name="upload" accept="image/*" />  
                                    <!-- type="file" name="file_0" -->
                                    <!-- <a href="#this" name="delete" class="btn">삭제하기</a> -->
                                </p> 
                            </div>
                            <br>
                            <div class="checkout__input">
                                <p>프로젝트 요약소개<span>*</span></p>
                                <textarea class="form-control h-25" rows="10" name="project_comment" id="txtArea" placeholder="프로젝트 요약소개 50자 제한" style="max-width: 750px; min-width: 300px; resize: none;"></textarea>
                                <div id="project_comment_cnt" style="text-align: right;">(0/50)</div><br>
                                <!-- <p>프로젝트 스토리<span>*</span></p>
                                <textarea class="form-control h-25" rows="10" name="txtArea2" id="txtArea2" placeholder="프로젝트 스토리 500자 제한" style="max-width: 750px; min-width: 300px; resize: none;"></textarea>
                                <div id="project_story_cnt" style="text-align: right;">(0/500)</div> -->
                                </ul>
                            </div>
                            <div class="checkout__input">
                                <p>프로젝트 스토리<span>*</span></p>
                            </div>
                            <div id="storyDiv"><!-- fileDiv -->
                                <p>
                                    <input type="file" name="story" accept="image/*" /> 
                                    <!-- type="file" name="file_0" -->
                                    <!-- <a href="#this" name="delete" class="btn">삭제하기</a> -->
                                </p> 
                            </div>
                            <br>
                            <div class="checkout__input">
                                <p>목표금액<span>*</span></p>
                                <input type="text" id="price" onkeyup="inputNumberFormat(this)"/>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>프로젝트 오픈일<span>*</span></p>
                                         <input type="text" id="datepicker1" name="project_open" onkeyup="datePickerSet(this)">
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>프로젝트 종료일<span>*</span></p>
                                        <input type="text" id="datepicker2" name="project_close">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                        <div class="checkout__input">
                                        </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input__checkbox">
                            </div>
                            <div class="checkout__input">
                            </div>
                            <div class="checkout__input__checkbox">
                            </div>
                            <div class="checkout__input">
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>리워드 등록</h4>
                                <div class="checkout__input">
                                    <ul class="reward_list" style="list-style: none;">
                                        <li><p>- 리워드 1</p></li>
                                        <ul class="reward1_detail" style="list-style: none;">
                                            <li><input type="text" id="reward1_name" placeholder="리워드명 1"></li>
                                            <li><input type="text" id="reward1_price" placeholder="금액" onkeyup="inputNumberFormat(this)"></li>
                                            <li><input type="text" id="reward1_cnt" placeholder="제한수량"></li>
                                            <li><input type="text" id="reward1_datepicker" placeholder="발송시작일"></li>
                                        </ul><br>
                                        <li><p>- 리워드 2</p></li>
                                        <ul class="reward2_detail" style="list-style: none;">
                                            <li><input type="text" id="reward2_name" placeholder="리워드명 2"></li>
                                            <li><input type="text" id="reward2_price" placeholder="금액" onkeyup="inputNumberFormat(this)"></li>
                                            <li><input type="text" id="reward2_cnt" placeholder="제한수량"></li>
                                            <li><input type="text" id="reward2_datepicker" placeholder="발송시작일"></li>
                                        </ul><br>
                                        <li><p>- 리워드 3</p></li>
                                        <ul class="reward3_detail" style="list-style: none;">
                                            <li><input type="text" id="reward3_name" placeholder="리워드명 3"></li>
                                            <li><input type="text" id="reward3_price" placeholder="금액" onkeyup="inputNumberFormat(this)"></li>
                                            <li><input type="text" id="reward3_cnt" placeholder="제한수량"></li>
                                            <li><input type="text" id="reward3_datepicker" placeholder="발송시작일"></li><br>
                                        </ul>
                                    </ul>
                                </div>
                                <!-- <div class="checkout__order__products">Products <span>Total</span></div>
                                <ul>
                                    <li>Vegetable’s Package <span>$75.99</span></li>
                                    <li>Fresh Vegetable <span>$151.99</span></li>
                                    <li>Organic Bananas <span>$53.99</span></li>
                                </ul>
                                <div class="checkout__order__subtotal">Subtotal <span>$750.99</span></div>
                                <div class="checkout__order__total">Total <span>$750.99</span></div>
                                <div class="checkout__input__checkbox">
                                    <label for="acc-or">
                                        Create an account?
                                        <input type="checkbox" id="acc-or">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <p>Lorem ipsum dolor sit amet, consectetur adip elit, sed do eiusmod tempor incididunt
                                    ut labore et dolore magna aliqua.</p>
                                <div class="checkout__input__checkbox">
                                    <label for="payment">
                                        Check Payment
                                        <input type="checkbox" id="payment">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <div class="checkout__input__checkbox">
                                    <label for="paypal">
                                        Paypal
                                        <input type="checkbox" id="paypal">
                                        <span class="checkmark"></span>
                                    </label>
                                </div> -->
                                <button type="submit" class="site-btn" style="background-color:black;">프로젝트 등록하기</button>
                            </div>
                        </div>
                    </div>
                </form>
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
                        <div class="footer__copyright__payment"><img src="img/payment-item.png" alt=""></div>
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
        $('#txtArea').on('keyup', function() {
            $('#project_comment_cnt').html("("+$(this).val().length+" / 50)");
     
            if($(this).val().length > 50) {
                $(this).val($(this).val().substring(0, 50));
                $('#project_comment_cnt').html("(50 / 50)");
            }
        });
    });
    
    //숫자 1000단위 콤마(,) 표시
     function inputNumberFormat(obj) {
        obj.value = comma(uncomma(obj.value));
     }

     function comma(str) {
         str = String(str);
         return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
     }

     function uncomma(str) {
         str = String(str);
         return str.replace(/[^\d]+/g, '');
     }

     //---datepiker 동작
    $("#datepicker1").datepicker({
        language: 'ko',
        todayButton: new Date()
    }); 
    $("#datepicker2").datepicker({
        todayButton: new Date(),
        language: 'ko'
    }); 
    $("#reward1_datepicker").datepicker({
        todayButton: new Date(),
        language: 'ko'
    }); 
    $("#reward2_datepicker").datepicker({
        todayButton: new Date(),
        language: 'ko'
    }); 
    $("#reward3_datepicker").datepicker({
        todayButton: new Date(),
        language: 'ko'
    }); 


    //리워드 추가 등록
    /* function add_textbox(){
        document.getElementById("reward_list").innerHTML += "<input type='text' name='tbox' ><br>";
    }
    //리워드 삭제
    function del_textbox(){
        document.getElementById("reward_list").innerHTML -= "<input type='text' name='tbox' ><br>";
    }*/

    /*    //예시 글자 커서 올리면 사라지는 동작
    var flag = 1;
    function removeContent() {
      if(flag == 1) {
        $("#txtArea").val("");
        flag = 0;
      }
    }
    var flag2 = 1;
    function removeContent2() {
      if(flag2 == 1) {
        $("#txtArea2").val("");
        flag2 = 0;
      }
    }
    */
    </script>
</body>
</html>