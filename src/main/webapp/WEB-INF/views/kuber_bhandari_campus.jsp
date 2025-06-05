<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>

		<!-- Basic -->
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

		<title>Shree Kuber Bhandari Campus</title>

		<meta name="keywords" content="Shree Kuber Mantra, Kuber Mantra, Mening of Shree Kuber Mantra, about shree kuber bhandari, history of shree kuber bhandari" />
		<meta name="description" content="Here is the meaning of chanting of shree kuber mantra. History of Shree Kuber Bhandari temple at Karnali.">
		<meta name="author" content="UltraInfotech.net">

		<!-- Favicon -->
		<link rel="shortcut icon" href="resources/front/img/favicon.ico" type="image/x-icon" />
		<link rel="apple-touch-icon" href="resources/front/img/apple-touch-icon.png">

		<!-- Mobile Metas -->
		<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, shrink-to-fit=no">

		<!-- Web Fonts  -->
		<link id="googleFonts" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800%7CShadows+Into+Light&display=swap" rel="stylesheet" type="text/css">

		<!-- Vendor CSS -->
		<link rel="stylesheet" href="resources/front/vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="resources/front/vendor/fontawesome-free/css/all.min.css">
		<link rel="stylesheet" href="resources/front/vendor/animate/animate.compat.css">
		<link rel="stylesheet" href="resources/front/vendor/simple-line-icons/css/simple-line-icons.min.css">
		<link rel="stylesheet" href="resources/front/vendor/owl.carousel/assets/owl.carousel.min.css">
		<link rel="stylesheet" href="resources/front/vendor/owl.carousel/assets/owl.theme.default.min.css">
		<link rel="stylesheet" href="resources/front/vendor/magnific-popup/magnific-popup.min.css">

		<!-- Theme CSS -->
		<link rel="stylesheet" href="resources/front/css/theme.css">
		<link rel="stylesheet" href="resources/front/css/theme-elements.css">
		<link rel="stylesheet" href="resources/front/css/theme-blog.css">
		<link rel="stylesheet" href="resources/front/css/theme-shop.css">

		<!-- Demo CSS -->
		<!-- <link rel="stylesheet" href="css/demos/demo-business-consulting-3.css"> -->
        <link rel="stylesheet" href="resources/front/css/demos/demo-medical.css">
		<link rel="stylesheet" href="resources/front/css/demos/demo-startup-agency.css">

		<!-- Skin CSS -->
        <link id="skinCSS" rel="stylesheet" href="resources/front/css/skins/skin-medical.css">
		<!-- <link id="skinCSS" rel="stylesheet" href="css/skins/skin-business-consulting-3.css"> -->

		<!-- Theme Custom CSS -->
		<link rel="stylesheet" href="resources/front/css/custom.css">

		<!-- Head Libs -->
		<script src="resources/front/vendor/modernizr/modernizr.min.js"></script>
		<script type="text/javascript">

			//Created / Generates the captcha function
			function DrawCaptcha()
			{
			var a = Math.ceil(Math.random() * 10)+ '';
			var b = Math.ceil(Math.random() * 10)+ '';
			var c = Math.ceil(Math.random() * 10)+ '';
			var d = Math.ceil(Math.random() * 10)+ '';
			var e = Math.ceil(Math.random() * 10)+ '';
			var f = Math.ceil(Math.random() * 10)+ '';
			var g = Math.ceil(Math.random() * 10)+ '';
			var code = a + ' ' + b + ' ' + ' ' + c + ' ' + d + ' ' + e + ' '+ f + ' ' + g;
			document.getElementById("txtCaptcha").value = code
			}

			// Validate the Entered input aganist the generated security code function
			function ValidCaptcha(){
			var str1 = removeSpaces(document.getElementById('txtCaptcha').value);
			var str2 = removeSpaces(document.getElementById('txtInput').value);

			if(document.getElementById('form_name').value=="")
			{
			alert('Please enter Firstname');
			return false;
			}
			else if(document.getElementById('form_phone').value=="")
			{
			alert('Please enter Phonenumber');
			return false;
			}

			else if (str1 == str2) {return true;}
			else{
			alert('Please enter valid code');
			return false;
			}
			}

			// Remove the spaces from the entered and generated code
			function removeSpaces(string)
			{
			return string.split(' ').join('');
			}


			</script>


		<style>
			.hvr:hover{
				color:red !important;

			}
            .sticky-note {
			position: fixed;
			top: 50%;
			right: 10px;
			transform: translateY(-50%);
			padding: 5px;
			width: 50px;
			z-index: 9999;
		}
		.sticky-notes {
			position: fixed;
			top: 60%;
			right: 120px;
			transform: translateY(-50%);
			padding: 5px;
			width: 50px;
			z-index: 9999;
		}
		</style>
<script async src="https://www.googletagmanager.com/gtag/js?id=G-4GPVW5TV8B"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-4GPVW5TV8B');
</script>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
	</head>

	<body>
		<div class="body " >
            <div class="sticky-note">
				<div class="sticky-note-content">
					<a href="tel:+91-9824332016" class="text-4 text-color-light text-color-hover-primary font-weight-light mb-0">
						<img src="resources/front/images/whtpp.svg" height="40px" width="40px" alt="">
						<!-- <img width="180%"  src="Website-Photos/market-svg/inquiry-1.png" > -->
						<!-- <h3>Important Note</h3>
					  <p>This is a sticky note on the side of the website.</p> -->
					</a>
				</div>
			</div>
			<div class="sticky-notes">
				<div class="sticky-note-contents">

					<div id="google_translate_element" ></div>
				</div>
			</div>
			<!-- <div class="header" id="Header"></div> -->
				<%@include file="header.jsp"%>
				
			<!-- <div role="main" class="main"> -->
                <!-- <div class="header" id="myHeader"></div> -->
				<section class="page-header page-header-modern  bg-tertiary border-0 my-0 " style="background-color:#ffad28 !important ;">
					<div class="container my-3">
						<div class="row p-4" >
							<div class="col-md-12 align-self-center p-static order-2 text-center">
								<h1 class="font-weight-bold text-10">Shree Kuber Bhandari Campus</h1>
							</div>
							<div class="col-md-12 align-self-center order-1">
								<ul class="breadcrumb breadcrumb-light d-block text-center">
									<li><a href="<%=request.getContextPath()%>/">Home</a></li>
									<li class="active">Shree Kuber Bhandari Campus</li>
								</ul>
							</div>
						</div>
					</div>
				</section>
				<div class="container ">


                    <div>
                        <div class="row" style="display:flex ;flex-direction:row">

                            <div style="flex:4" class="mt-5">
                                <!-- <img src="images/Dev-Devta-KubereshwarCampus/BhogMaharaj-1.jpg" class="appear-animation animated fadeInLeft appear-animation-visible" data-appear-animation="fadeInLeft" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms; border-radius:10px ;"> -->


									<div style="width:286px;height:308px">


											<img src="resources/front/images/Dev-Devta-KubereshwarCampus/BhogMaharaj-1.jpg" class="appear-animation animated fadeInLeft appear-animation-visible" data-appear-animation="fadeInLeft" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms;  border-top-left-radius:10px ;border-top-right-radius:10px ;"alt="">
											<div class="appear-animation p-2 animated fadeInLeft appear-animation-visible" data-appear-animation="fadeInLeft" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms;background-color:#ffad28;text-align: center; " >
                                             <span style="color:white;font-weight: 700;font-size:large">   Bhog Maharaj </span>
                                            </div>


                                </div>




                            </div>

                            <div style="flex:4" class="mt-5">

                                <div style="width:286px;height:308px">


                                    <img src="resources/front/images/Dev-Devta-KubereshwarCampus/AmbaMata-1.jpg" class="appear-animation animated fadeInDown appear-animation-visible" data-appear-animation="fadeInDown" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms;  border-top-left-radius:10px ;border-top-right-radius:10px ;"alt="">
                                    <div class="appear-animation p-2 animated fadeInDown appear-animation-visible" data-appear-animation="fadeInDown" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms;background-color:#ffad28;text-align: center; " >
                                     <span style="color:white;font-weight: 700;font-size:large">   Amba Mata </span>
                                    </div>


                        </div>
                                <!-- <img src="images/Dev-Devta-KubereshwarCampus/AmbaMata-1.jpg" class=" appear-animation animated fadeInDown appear-animation-visible" data-appear-animation="fadeInDown" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms; border-radius:10px ;"> -->



                            </div>

                            <div style="flex:4" class="mt-5">
                                <div style="width:286px;height:308px">


                                    <img src="resources/front/images/Dev-Devta-KubereshwarCampus/BhandareshwarMahadev-1.jpg" class="appear-animation animated fadeInRight appear-animation-visible" data-appear-animation="fadeInLeft" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms;  border-top-left-radius:10px ;border-top-right-radius:10px ;"alt="">
                                    <div class="appear-animation p-2 animated fadeInRight appear-animation-visible" data-appear-animation="fadeInRight" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms;background-color:#ffad28;text-align: center; " >
                                     <span style="color:white;font-weight: 700;font-size:large">   Bhandareshwar Mahadev </span>
                                    </div>


                        </div>
                                        <!-- <img src="images/Dev-Devta-KubereshwarCampus/BhandareshwarMahadev-1.jpg" class=" appear-animation animated fadeInRight appear-animation-visible" data-appear-animation="fadeInRight" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms;border-radius:10px"> -->



                                </div>
                                <!-- <img src="images/Dev-Devta-KubereshwarCampus/kubereshwar-main-1.jpeg"  alt="" /> -->

                            </div>

                            <div class="row" style="display:flex ;flex-direction:row">

                                <div style="flex:4">
                                    <!-- <img src="img/device.png" class="img-fluid appear-animation animated fadeInLeft appear-animation-visible" data-appear-animation="fadeInLeft" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms;"> -->




                                </div>
                                <div style="flex:4" class="mt-5">
                                    <div style="width:286px;height:308px" class="mt-4">


                                        <img src="resources/front/images/Dev-Devta-KubereshwarCampus/kubereshwar-mahadev.jpg" class="appear-animation animated fadeInLeft appear-animation-visible" data-appear-animation="fadeInLeft" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms;  border-top-left-radius:10px ;border-top-right-radius:10px ;"alt="">
                                        <div class="appear-animation p-2 animated fadeInLeft appear-animation-visible" data-appear-animation="fadeInLeft" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms;background-color:#ffad28;text-align: center; " >
                                         <span style="color:white;font-weight: 700;font-size:large">   Kubereshwar Mahadev </span>
                                        </div>


                            </div>
                                    <!-- <img src="images/Dev-Devta-KubereshwarCampus/kubereshwar-mahadev.jpg" class="img-fluid appear-animation animated fadeInRight appear-animation-visible" data-appear-animation="fadeInRight" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms;border-radius:10px"> -->
                                    <!-- <img src="images/Dev-Devta-KubereshwarCampus/kubereshwar-main-1.jpeg"  alt="" /> -->

                                </div>
                                <div style="flex:4">

                                            <!-- <img src="img/device.png" class="img-fluid appear-animation animated fadeInRight appear-animation-visible" data-appear-animation="fadeInRight" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms;"> -->



                                    </div>
                                    <!-- <img src="images/Dev-Devta-KubereshwarCampus/kubereshwar-main-1.jpeg"  alt="" /> -->

                                </div>

                                <div class="row" style="display:flex ;flex-direction:row">

                                    <div style="flex:4">
                                        <!-- <img src="img/device.png" class="img-fluid appear-animation animated fadeInLeft appear-animation-visible" data-appear-animation="fadeInLeft" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms;"> -->




                                    </div>
                                    <div style="flex:4" class="mt-5">
                                        <div style="width:286px;height:308px" class="mt-4">


                                            <img src="resources/front/images/Dev-Devta-KubereshwarCampus/MahalaxmiMata.jpg" class="appear-animation animated fadeInRight appear-animation-visible" data-appear-animation="fadeInRight" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms;  border-top-left-radius:10px ;border-top-right-radius:10px ;"alt="">
                                            <div class="appear-animation p-2 animated fadeInRight appear-animation-visible" data-appear-animation="fadeInRight" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms;background-color:#ffad28;text-align: center; " >
                                             <span style="color:white;font-weight: 700;font-size:large">   Mahalaxmi Mata </span>
                                            </div>


                                </div>
                                        <!-- <img src="images/Dev-Devta-KubereshwarCampus/MahalaxmiMata.jpg" class="img-fluid appear-animation animated fadeInLeft appear-animation-visible" data-appear-animation="fadeInLeft" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms;border-radius:10px ;"> -->
                                        <!-- <img src="images/Dev-Devta-KubereshwarCampus/kubereshwar-main-1.jpeg"  alt="" /> -->

                                    </div>
                                    <div style="flex:4">

                                                <!-- <img src="img/device.png" class="img-fluid appear-animation animated fadeInRight appear-animation-visible" data-appear-animation="fadeInRight" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms;"> -->



                                        </div>
                                        <!-- <img src="images/Dev-Devta-KubereshwarCampus/kubereshwar-main-1.jpeg"  alt="" /> -->

                                    </div>
                            <!-- <div >

                                <img src="img/device.png" class="img-fluid appear-animation animated fadeInLeft appear-animation-visible" data-appear-animation="fadeInLeft" data-appear-animation-delay="0" data-appear-animation-duration="1s" style="animation-duration: 1s; animation-delay: 0ms;">


                            </div> -->


                        </div>
                    </div>

                    <div class=" container" style="padding-top:130px">
                    <div class="row ">
                    <div class="col-md-3 pt-5  isotope-item websites" style=" left: 0px; top: 0px;">
                        <div class="portfolio-item">
                            <a href="#">
                                <span class="thumb-info thumb-info-lighten border-radius-0">
                                    <span class="thumb-info-wrapper border-radius-0">
                                        <img src="resources/front/images/Dev-Devta-KubereshwarCampus/ganeshji-1.jpeg" class="img-fluid border-radius-0" alt="">
                                        <span class="thumb-info-title">
                                            <span class="thumb-info-inner">Ganpatiji</span>
                                            <!-- <span class="thumb-info-type">Website</span> -->
                                        </span>
                                        <span class="thumb-info-action">
                                            <span class="thumb-info-action-icon bg-dark opacity-8"><i class="fas fa-plus"></i></span>
                                        </span>
                                    </span>
                                </span>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-3  pt-5  isotope-item websites" style=" left: 0px; top: 0px;">
                        <div class="portfolio-item">
                            <a href="#">
                                <span class="thumb-info thumb-info-lighten border-radius-0">
                                    <span class="thumb-info-wrapper border-radius-0">
                                        <img src="resources/front/images/Dev-Devta-KubereshwarCampus/Hanumanji-1.jpg" class="img-fluid border-radius-0" alt="">
                                        <span class="thumb-info-title">
                                            <span class="thumb-info-inner">Hanumanji</span>
                                            <!-- <span class="thumb-info-type">Website</span> -->
                                        </span>
                                        <span class="thumb-info-action">
                                            <span class="thumb-info-action-icon bg-dark opacity-8"><i class="fas fa-plus"></i></span>
                                        </span>
                                    </span>
                                </span>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-3  pt-5  isotope-item websites" style=" left: 0px; top: 0px;">
                        <div class="portfolio-item">
                            <a href="#">
                                <span class="thumb-info thumb-info-lighten border-radius-0">
                                    <span class="thumb-info-wrapper border-radius-0">
                                        <img src="resources/front/images/Dev-Devta-KubereshwarCampus/BahuchrajiMataji-1.jpg" class="img-fluid border-radius-0" alt="">
                                        <span class="thumb-info-title">
                                            <span class="thumb-info-inner">Bahuchraji Mataji</span>
                                            <!-- <span class="thumb-info-type">Website</span> -->
                                        </span>
                                        <span class="thumb-info-action">
                                            <span class="thumb-info-action-icon bg-dark opacity-8"><i class="fas fa-plus"></i></span>
                                        </span>
                                    </span>
                                </span>
                            </a>
                        </div>
                    </div>
                    <div class="col-md-3  pt-5  isotope-item websites" style=" left: 0px; top: 0px;">
                        <div class="portfolio-item">
                            <a href="#">
                                <span class="thumb-info thumb-info-lighten border-radius-0">
                                    <span class="thumb-info-wrapper border-radius-0">
                                        <img src="resources/front/images/Dev-Devta-KubereshwarCampus/piplo.jpeg" class="img-fluid border-radius-0" alt="">
                                        <span class="thumb-info-title">
                                            <span class="thumb-info-inner">Jyotirling</span>
                                            <!-- <span class="thumb-info-type">Website</span> -->
                                        </span>
                                        <span class="thumb-info-action">
                                            <span class="thumb-info-action-icon bg-dark opacity-8"><i class="fas fa-plus"></i></span>
                                        </span>
                                    </span>
                                </span>
                            </a>
                        </div>
                    </div>
                </div>

            </div>
				</div>




	<%@include file="footer.jsp"%>

	<!-- <div id="footer" ></div> -->


	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY"></script>
	<script>

		$(function()
        {
        $(".header").load("header.html");
        $("#footer").load("footer.html");
        });

    window.onscroll = function() {myFunction()};

    var header = document.getElementById("myHeader");
    var sticky = header.offsetTop;

    function myFunction() {
     if (window.pageYOffset > sticky) {
     header.classList.add("sticky");
    } else {
    header.classList.remove("sticky");
    }
    }
	</script>


	</body>
</html>