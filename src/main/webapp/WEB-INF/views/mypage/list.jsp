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
    <title>Funcat</title>

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
   
    <title>Funcat</title>
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
	<script>
	
	$(function(){
		var creatorCheck = "${mypage.member_check}";
		if(creatorCheck != "Y") {
	  		  $("#creatorCheck").hide();
	    }
		else{
			$("#creatorCheck").show();
		}
	});
	
	$(function(){
		var applyCheck = "${mypage.member_check}";
		if(applyCheck != "N") {
	  		  $("#applyCheck").hide();
	    }
		else{
			$("#applyCheck").show();
		}
	});

	$(function(){
		$('#orderButton').click(function(){
			var offset = $('#orderTable').offset(); 
	        $('html').animate({scrollTop : offset.top}, 400);
		});
	});
	
	$(function(){
		$('#orderButton').click(function(){
			var offset = $('#orderTable').offset(); 
	        $('html').animate({scrollTop : offset.top}, 400);
		});
	});
	
		function applyCreator(memeberId) {
			 location.href='applyCreatorForm.do?member_id='+memeberId;
	   }
		function update(memeberId) {
			 location.href='update.do?member_id='+memeberId;
        }
		function creator(memeberId) {
			location.href='creator.do?member_id='+memeberId;
        }
		function deletecheck(order_num,member_id)
		{	
				 if (confirm("정말 주문 취소하시겠습니까??") == true){    //확인				
					 $.get( "orderDel.do", { order_num: order_num, member_id: member_id } )
					  .done(function( data ) {
					   		if(data == "ok"){
					   			location.reload();
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
                        <h2>My page</h2>
                        <div class="breadcrumb__option">
                            <a href="/">Home</a>
                            <span># My page details, Order check :</span>
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
                 
						  <!-- <h3> <button type="button" onclick= "location.href='detail.do?project_num=1'" input type='submit'>Go Mypage</button> -->
						  
						  <button type="button" id="applyCheck" class="btn btn-warning" onclick="applyCreator('${mypage.member_id}');" input type='submit'>Apply Creator</button>
						  <button type="button" class="btn btn-outline-warning" onclick="update('${mypage.member_id}');" input type='submit'>Mypage Modify</button>
						<button type="button" id="orderButton" class="btn btn-outline-warning">Go OrderList</button>
						<button type="button" id="creatorCheck" class="btn btn-outline-secondary" onclick="creator('${mypage.member_id}');" input type='submit'>Creator</button></h3>
							<br><br>

	<table class="table">
	    <tr>
	      <th>Division</th>
	      <th>Contents</th>
	    </tr>
		  <tbody>
		    <tr>
		      <td scope="row">ID</td>
		      <td>${mypage.member_id}</td>
		    </tr>
		    <tr>
		      <td>Nick name</td>
		      <td>${mypage.member_name}</td>
		    </tr>
		    <tr>
		      <td>Contact</td>
		      <td>${mypage.member_phone}</td>
		    </tr>
		    <tr>
		      <td>E-mail 수신 여부</td>
		      <td>${mypage.member_email_check}</td>
		    </tr>
		    <tr>
		      <td>Join</td>
		      <td>${mypage.member_rdate}</td>
		    </tr>
		    <tr>
		      <td>Creator</td>
		      <td>${mypage.member_check}</td>
		    </tr>         
	  </tbody>
	  </table>
	<br>
	                    </div>
                </div>
            </div>
        </div>
		
	<table id="orderTable" class="table" style="table-layout:fixed;">
	  <h4># Check my order details : </h4>
	  <br>
	  <tbody>
			<tr>
			    <th>Order No.</th>
			    <th>Reward</th>
			    <th>Name</th>
			    <th>Price</th>
			    <th>Date</th>
			    <th>State</th>
			    <th>Option</th>
			    <th>Delivery</th>
			    <th></th>
			</tr>
			
		 <c:if test="${empty orderList}">
             <tr>
               <td colspan="10">OrderList Empty</td>
            </tr>
         </c:if>
  		 <c:forEach items="${orderList}" var="orderList">
			  <tr>
			    <td>${orderList.order_num}</td>
			    <td>${orderList.reward_num}</td>
			    <td>${orderList.order_name}</td>
			    <td>${orderList.order_price}</td>
			    <td>${orderList.order_date}</td>
			    <td>${orderList.order_statement}</td>
			    <td width="400" style = "word-break: break-all">${orderList.order_option}</td>
			    <td>${orderList.order_delivery}</td> 
			    <td><button class="btn btn-outline-secondary btn-sm" onclick= "deletecheck('${orderList.order_num}','${mypage.member_id}');">취소</button></td>
			  </tr>
		</c:forEach> 
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

    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/jquery.nice-select.min.js"></script>
    <script src="/js/jquery-ui.min.js"></script>
    <script src="/js/jquery.slicknav.js"></script>
    <script src="/js/mixitup.min.js"></script>
    <script src="/js/owl.carousel.min.js"></script>

    <script src="/js/main.js"></script>
</body>

</html>