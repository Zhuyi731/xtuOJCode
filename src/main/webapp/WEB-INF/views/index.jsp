<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<title>XTU Online Judgement System</title>
<link href="/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="/js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="/css/style.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- for bootstrap working -->
	<script type="text/javascript" src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<script src="js/responsiveslides.min.js"></script>
<script>
    // You can also use "$(window).load(function() {"
    $(function () {
      // Slideshow 1
      $("#slider1").responsiveSlides({
         auto: true,
		 nav: true,
		 speed: 500,
		 namespace: "callbacks",
      });
    });
 </script>
  <!-- web-fonts -->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,600italic,400italic,600,300italic,300,700italic,800,800italic' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="/js/move-top.js"></script>
<script type="text/javascript" src="/js/easing.js"></script>
<script type="text/javascript">
			jQuery(document).ready(function($) {
				$(".scroll").click(function(event){		
					event.preventDefault();
					$('html,body').animate({scrollTop:$(this.hash).offset().top},900);
				});
			});
</script>
</head>
<body>
	<!-- header-section-starts-here -->	
	<div class="header" id="movetop">
	<div class="container">
			<div class="header-top">			
				<div class="logo">
					<img src="images/logo.png" style="height: 87px; width: 316px; "><a></a>
				</div>
				             
				<div class="clearfix"></div>
			</div>
			<!-- navigation -->
			<div class="navigation">
					<nav class="navbar navbar-default">
					 
						<!-- Brand and toggle get grouped for better mobile display -->
						<div class="navbar-header">
						  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						  </button>
						</div>

						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse nav-wil" id="bs-example-navbar-collapse-1">
							  <ul class="nav navbar-nav">
								<li class="active"><a href=<%=basePath+"webapp/WEB-INF/views/index.jsp"%>>>首页</a></li>
								<li><a href="/problems">题库</a></li>
								<li><a href="/test">考试</a></li>
								<li><a href="/ranklist">Ranklist</a></li>
								<li><a href="/status">Status</a></li>
							  </ul>
						  <div class="clearfix"></div>
						</div><!-- /.navbar-collapse -->
					</nav>
			</div>
			<!-- //navigation -->
		</div>
	<!-- header-section-ends-here -->
	</div>
	<div class="slider">
	    <ul class="rslides" id="slider1" style="padding-bottom:0;margin-bottom:0;">
	      <li><img src="images/display1.jpg" alt=""></li>
	      <li><img src="images/display2.jpg" alt=""></li>
	      <li><img src="images/display3.jpg" alt=""></li>
	      <li><img src="images/display4.jpg" alt=""></li>
	      <li><img src="images/display5.jpg" alt=""></li>
	    </ul>
    </div>
    <%@ include file="/WEB-INF/views/copyright.html" %>
	
</body>
</html>