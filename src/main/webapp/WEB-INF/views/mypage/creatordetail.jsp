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
    
	<script src="/js/jquery-3.3.1.min.js"></script>
	<script>
		function creator(memeberId) {
		location.href='creator.do?member_id='+memeberId;
   		 }
		function modifycheck(memberId)
		{	
			if (confirm("수정하시겠습니까??") == true){    //확인				
			$.post( "creatordetailupdate.do", { 
				creator_num: ${mypage.creator_num},
				creator_type: document.getElementById('yn').value,
				creator_phone: document.getElementById('crphone').value,
				creator_name: document.getElementById('crname').value
			} )
			 .done(function( data ) {
			if(data == "ok"){
			location.href='creator.do?member_id='+ memberId;
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

	* {
	     box-sizing: border-box;
	        
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

    <!-- Hamburger (only visible on tablets and mobiles) -->
    <div class="hamburger__menu__overlay"></div>
    <div class="hamburger__menu__wrapper">
        <div class="hamburger__menu__logo">
            <a href="#"><img src="/img/logo.png" alt=""></a>
        </div>
        <div class="hamburger__menu__cart">
            <ul>
                <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
            </ul>
            <div class="header__cart__price"><span>$10.00</span></div>
        </div>
        <div class="hamburger__menu__widget">
            <div class="header__top__right__language">
                <img src="/img/language.png" alt="">
                <div>English</div>
                <span class="arrow_carrot-down"></span>
                <ul>
                    <li><a href="#">Spanish</a></li>
                    <li><a href="#">English</a></li>
                </ul>
            </div>
            <div class="header__top__right__auth">
                <a href="#"><i class="fa fa-user"></i> Login</a>
            </div>
        </div>
        <nav class="hamburger__menu__nav mobile-menu">
            <ul>
                <li class="active"><a href="./index.html">Home</a></li>
                <li><a href="/shop.html">Shop</a></li>
                <li><a href="#">Pages</a>
                    <ul class="header__menu__dropdown">
                        <li><a href="/shop-details.html">Shop Details</a></li>
                        <li><a href="/shoping-cart.html">Shoping Cart</a></li>
                        <li><a href="/checkout.html">Check Out</a></li>
                        <li><a href="/blog-details.html">Blog Details</a></li>
                    </ul>
                </li>
                <li><a href="/blog.html">Blog</a></li>
                <li><a href="/contact.html">Contact</a></li>
            </ul>
        </nav>
        <div id="mobile-menu-wrap"></div>
        <div class="header__top__right__social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-linkedin"></i></a>
            <a href="#"><i class="fa fa-pinterest-p"></i></a>
        </div>
        <div class="hamburger__menu__contact">
            <ul>
                <li><i class="fa fa-envelope"></i> info@ogani.com</li>
                <li>Free shipping for all orders over $50</li>
            </ul>
        </div>
    </div>
    <!-- Hamburger END -->

    <!-- Header Section (on tablets and mobiles it's hidden) -->
    <!-- Navigation -->
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="index.html"><img src="/img/funcat.jpg" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="./index.html">Home</a></li>
                            <li><a href="shop.html">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="/shop-details.html">Shop Details</a></li>
                                    <li><a href="/shoping-cart.html">Shoping Cart</a></li>
                                    <li><a href="/checkout.html">Check Out</a></li>
                                    <li><a href="/blog-details.html">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="/blog.html">Blog</a></li>
                            <li><a href="/contact.html">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul>
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
                            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                        </ul>
                        <div class="header__cart__price"><span>$10.00</span></div>
                    </div>
                </div>
            </div>
            <div class="hamburger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>
    <!-- Header Section END -->


    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="/img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>My page Modify</h2>
                        <div class="breadcrumb__option">
				<span># Modify, Save :</span>
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
                 
 <h3><button type="button"  class="btn btn-outline-secondary" onclick="creator('${mypage.member_id}');" input type='submit'>Go Creator</button>
 <button type="button" class="btn btn-outline-secondary" onclick= "modifycheck('${mypage.member_id}');" input type='submit'>Modify</button></h3>
	<br>
		<table class="table">
	    <tr>
	      <th>Division</th>
	      <th>Contents</th>
	    </tr>

		  <tr>
		    <td>Creator No.</td>
		    <td>${mypage.creator_num}</td>
		  </tr>
		  <tr>  
		    <td>ID</td>
		    <td>${mypage.member_id}</td>
		  </tr>
		  <tr>
		    <td>사업자 여부</td>
		    <td><select id= "yn" name="yn" >
		  		  <option disabled selected>Y/N</option>
			    <option value="Y">Y</option>
			    <option value="N">N</option>
			</select></td>
		  </tr>
		  <tr>
		    <td>Contact</td>
		    <td><textarea id='crphone' style="resize: none;" name='creator_phone' rows='1' cols='20' >${mypage.creator_phone}</textarea></td>
		  </tr>
		  <tr>
		    <td>개인정보 수집 동의</td>
		    <td>${mypage.creator_check}</td>
		  </tr>
		  <tr>
		    <td>Creator Name</td>
		    <td><textarea id='crname' style="resize: none;" name='creator_name' rows='1' cols='20' >${mypage.creator_name}</textarea></td>
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