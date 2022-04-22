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
   
    <title>Funcat Creator</title>
    
    <!-- Bootstrap CSS -->
    
	<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script> 
	
	<script>
	
		$(function(){
			$('#projectButton').click(function(){
				var offset = $('#projectTable').offset(); 
		        $('html').animate({scrollTop : offset.top}, 400);
			});
		});
	
		function modifyCreator(creator_num)
		{	
				 if (confirm("수정하시겠습니까??") == true){    //확인	
					 
					 location.href="creatordetail.do?creator_num="+creator_num;			
				 }else{   //취소				
				     return false;			
				 }	
		}
		function deletecheck(project_num,member_id)
		{	
				 if (confirm("정말 삭제하시겠습니까??") == true){    //확인				
					 $.get( "del.do", { project_num: project_num, member_id: member_id } )
					  .done(function( data ) {
					   		if(data == "ok"){
					   			location.reload();
					   		}
					  });			
				 }else{   //취소				
				     return false;			
				 }	
		}
		
		function projectmodify(project_num)
		{	
				 if (confirm("수정하시겠습니까??") == true){    //확인	
					 
					 location.href="projectdetail.do?project_num="+project_num;			
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
                        <h2>Creator</h2>
                        <div class="breadcrumb__option">
                            <span>Check my project details :</span>
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
  <button type="button" id="projectButton" class="btn btn-outline-secondary">Go Project</button>
		<button type="button" class="btn btn-outline-secondary" onclick= "modifyCreator('${mypage.creator_num}');" input type='submit'>Creator Modify</button></h3>
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
		    <td>사업자 여부</td>
		    <td>${mypage.creator_type}</td>
		  </tr>
		  <tr>
		    <td>Contact</td>
		    <td>${mypage.creator_phone}</td>
		  </tr>
		  <tr>
		    <td>개인정보 수집 동의</td>
		    <td>${mypage.creator_check}</td>
		  </tr>
		  <tr>
		    <td>Creator Name</td>
		    <td>${mypage.creator_name}</td>
		  </tr>
	  </tbody>
	  </table>
	<br>
		                    </div>
                </div>
            </div>
        </div>
		

	<table id="projectTable" class="table" style="table-layout : fixed;">
		  <h4># Check my project details : </h4>
	  <br>
	  <tbody>
	  			  <tr>
			    <th width="400">Subject</th>
			    <th>Goal</th>
			    <th>Price</th>
			    <th>OpenDate</th>
			    <th>CloseDate</th>
			    <th>Date of Modify</th>
			    <th>Level</th>
			    <th></th>
			  </tr>
			  
		 <c:if test="${empty projectlist}">
             <tr>
               <td colspan="10">projectList Empty</td>
            </tr>
         </c:if>
		 <c:forEach items="${projectlist}" var="projectlist">
			  <tr>	
			  
			    <td width="400">${projectlist.project_sub}</a></td>
			    <td>${projectlist.project_goal}</td>
			    <td>${projectlist.project_price}</td>
			    <td>${projectlist.project_open}</td>
			    <td>${projectlist.project_close}</td> 
			    <td>${projectlist.project_mdate}</td> 
			    <td>${projectlist.project_level}</td> 
			    <td><button type="button" class="btn btn-outline-secondary btn-sm" onclick= "projectmodify('${projectlist.project_num}');">수정</button> <button class="btn btn-outline-secondary btn-sm" onclick= "deletecheck('${projectlist.project_num}','${projectlist.member_id}');">삭제</button></td> 
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