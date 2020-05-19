<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>MASK SEARCH</title>

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
  <!-- <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->

  <!-- Custom fonts for this template -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css">
  <!-- <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"> -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/simple-line-icons/css/simple-line-icons.css">
  <!-- <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css"> -->
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/landing-page.min.css">
  <!-- <link href="css/landing-page.min.css" rel="stylesheet"> -->

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar navbar-light bg-light static-top">
    <div class="container">
      <a class="navbar-brand" href="#">MASK SEARCH</a>
      <a class="btn btn-primary" href="#">INFO</a>
    </div>
  </nav>

  <!-- Masthead -->
  <header class="masthead text-white text-center">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <h1 class="mb-5">마스크 구매 가능 장소를 찾아보세요!</h1>
        </div>
        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
        <div class="form-row">
              <div class="col-12 col-md-9 mb-2 mb-md-0">
                <input type="text"  id="txtAddr" name = "addr" class="form-control form-control-lg" placeholder="목적지를 검색하세요...">
              </div>
              <div class="col-12 col-md-3">
                <input type="button" id="btnSearch" class="btn btn-block btn-lg btn-primary" value = "검색" >
                
              </div>
        </div>
       	</div>
      </div>
    </div>
  </header>

  <!-- Icons Grid -->
  <section class="features-icons bg-light text-center">
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <!-- <i class="icon-screen-desktop m-auto text-primary"></i> -->
            </div>
            <!-- <h3>Fully Responsive</h3>
            <p class="lead mb-0">This theme will look great on any device, no matter the size!</p> -->
          </div>
        </div> 
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <i class="icon-layers m-auto text-primary" id = "now_location"></i>
            </div>
            <h3 id = "now_location">현재위치로찾기</h3>
            <!-- <p class="lead mb-0">Featuring the latest build of the new Bootstrap 4 framework!</p> -->
          </div>
        </div>
        <div class="col-lg-4">
          <div class="features-icons-item mx-auto mb-0 mb-lg-3">
            <div class="features-icons-icon d-flex">
              <!-- <i class="icon-check m-auto text-primary"></i> -->
            </div>
            <!-- <h3>Easy to Use</h3>
            <p class="lead mb-0">Ready to use with your own content, or customize the source files!</p> -->
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Image Showcases -->
  <section class="showcase">
    <div class="container-fluid p-0">
      <div class="row no-gutters">

        <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('${pageContext.request.contextPath}/resources/img/bg-showcase-1.jpg');"></div>
        <div class="col-lg-6 order-lg-1 my-auto showcase-text">
          <h2>COVID-19</h2>
          <p class="lead mb-0">2019년 12월 중국 우한에서 처음 발생한 이후 중국 전역과 전 세계로 확산된, 새로운 유형의 코로나바이러스(SARS-CoV-2)에 의한 호흡기 감염질환이다. 코로나바이러스감염증-19는 감염자의 비말(침방울)이 호흡기나 눈·코·입의 점막으로 침투될 때 전염된다. 감염되면 약 2~14일(추정)의 잠복기를 거친 뒤 발열(37.5도) 및 기침이나 호흡곤란 등 호흡기 증상, 폐렴이 주증상으로 나타나지만 무증상 감염 사례도 드물게 나오고 있다.</p>
        </div>
      </div>
      <div class="row no-gutters">
        <div class="col-lg-6 text-white showcase-img" style="background-image: url('${pageContext.request.contextPath}/resources/img/bg-showcase-2.jpg');"></div>
        <div class="col-lg-6 my-auto showcase-text">
          <h2>증상</h2>
          <p class="lead mb-0">코로나19에 감염되면 약 2~14일(추정)의 잠복기를 거친 뒤 발열(37.5도) 및 기침이나 호흡곤란 등 호흡기 증상, 폐렴이 주증상으로 나타난다. 또 근육통과 피로감, 설사 증상이 나타나기도 하지만, 드물게 무증상 감염 사례도 있다. 실제로 세계보건기구(WHO)는 2월 1일 무증상 감염자의 전파 가능성을 재차 밝혔으며, 다만 무증상 감염자의 전파는 드물 수 있으며 주요 전염 경로가 아닐 수 있다고 알렸다. 또 우리 보건복지부도 2월 2일 코로나19는 무증상·경증 환자에서 감염증이 전파되는 경우도 나타나고 있다며, 해당 증상들은 차도가 좋아지기도 하지만 일부에서 중증 폐렴을 유발할 가능성이 있어 주의가 요구된다고 밝혔다. </p>
        </div>
      </div>
      <div class="row no-gutters">
        <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('${pageContext.request.contextPath}/resources/img/bg-showcase-3.jpg');"></div>
        <div class="col-lg-6 order-lg-1 my-auto showcase-text">
          <h2>관련사이트</h2>
          <p class="lead mb-0"><a href="http://ncov.mohw.go.kr/">코로나19 홈페이지</a></p>
          <p class="lead mb-0"><a href="http://ncov.mohw.go.kr/bdBoardList_Real.do/">코로나바이러스감염증-19 > 발생동향 > 국내 발생 현황</a></p>
          <p class="lead mb-0"><a href="http://ncov.mohw.go.kr/bdBoardList_Real.do/">코로나바이러스감염증-19 > 발생동향 > 국내 발생 현황</a></p>
          <p class="lead mb-0"><a href="http://www.seoul.go.kr/coronaV/coronaStatus.do">서울시 코로나19 - 서울특별시</a></p>
          <p class="lead mb-0"><a href="http://news.seoul.go.kr/welfare/archives/512553">코로나19 선별진료소 현황 < 복지 < 서울특별시</a></p>
        </div>
      </div>
    </div>
  </section>


 <%--  <!-- Testimonials -->
  <section class="testimonials text-center bg-light">
    <div class="container">
      <h2 class="mb-5">What people are saying...</h2>
      <div class="row">
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            <img class="img-fluid rounded-circle mb-3" src="${pageContext.request.contextPath}/resources/img/testimonials-1.jpg" alt="">
            <h5>Margaret E.</h5>
            <p class="font-weight-light mb-0">"This is fantastic! Thanks so much guys!"</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            <img class="img-fluid rounded-circle mb-3" src="${pageContext.request.contextPath}/resources/img/testimonials-2.jpg" alt="">
            <h5>Fred S.</h5>
            <p class="font-weight-light mb-0">"Bootstrap is amazing. I've been using it to create lots of super nice landing pages."</p>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="testimonial-item mx-auto mb-5 mb-lg-0">
            <img class="img-fluid rounded-circle mb-3" src="${pageContext.request.contextPath}/resources/img/testimonials-3.jpg" alt="">
            <h5>Sarah W.</h5>
            <p class="font-weight-light mb-0">"Thanks so much for making these free resources available to us!"</p>
          </div>
        </div>
      </div>
    </div>
  </section> --%>

  <!-- Call to Action -->
  <!-- <section class="call-to-action text-white text-center">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <h2 class="mb-4">Ready to get started? Sign up now!</h2>
        </div>
        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
          <form>
            <div class="form-row">
              <div class="col-12 col-md-9 mb-2 mb-md-0">
                <input type="email" class="form-control form-control-lg" placeholder="Enter your email...">
              </div>
              <div class="col-12 col-md-3">
                <button type="submit" class="btn btn-block btn-lg btn-primary">Sign up!</button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section> -->

  <!-- Footer -->
  <footer class="footer bg-light">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 h-100 text-center text-lg-left my-auto">
          <ul class="list-inline mb-2">
            <li class="list-inline-item">
              <a href="#">About</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">Contact</a>
            </li>
           <!--  <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">Terms of Use</a>
            </li> -->
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">Privacy Policy</a>
            </li>
          </ul>
          <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website 2020. All Rights Reserved.</p>
        </div>
        <div class="col-lg-6 h-100 text-center text-lg-right my-auto">
          <ul class="list-inline mb-0">
            <li class="list-inline-item mr-3">
              <a href="#">
                <i class="fab fa-facebook fa-2x fa-fw"></i>
              </a>
            </li>
            <li class="list-inline-item mr-3">
              <a href="#">
                <i class="fab fa-twitter-square fa-2x fa-fw"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-instagram fa-2x fa-fw"></i>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>

  <!-- Bootstrap core JavaScript -->
  
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf4affbe89e457c74f97f0cdb1d2dde9&libraries=services"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript">
  	$(document).ready(function(){
  		$("#btnSearch").on("click",function(e){
  			btnSearchClick();
  		});
  	});
  	function btnSearchClick(){
  		
  		location.href = "/map?addr=" + $("#txtAddr").val(); 
  	}
  </script>
  
  
  <script type="text/javascript">
  $(document).ready(function(){
	  $("#now_location").on("click",function(e){
			btnLocationClick();  
	  });
  });
  
  function btnLocationClick(){	  
	  
	  if (navigator.geolocation) { // GPS를 지원하면
		  
		    navigator.geolocation.getCurrentPosition(function(position) {
		    	
	    	// 현재 좌표 기준으로 지번 주소 알아냄
	    	var lng = position.coords.longitude;
	    	var lat = position.coords.latitude;
	    	
	    	
	    	searchDetailAddrFromCoords(lng, lat, function(result,status){
	    		var detailAddr = result[0].address.address_name;
	    		location.href = "/map?addr=" + detailAddr; 
	    		
	    		}
	    	);
	    	
	    	
	    	
			//geocoder.coord2Address(position.coords.longitude, position.coords.latitude, callback);
		    	
	    	//location.href = "/map?addr=" + $("#txtAddr").val(); 	
		     //alert(geocoder.coord2Address(position.coords.longitude, position.coords.latitude));
		    }, function(error) {
		      console.error(error);
		    }, {
		      enableHighAccuracy: false,
		      maximumAge: 0,
		      timeout: Infinity
		    });
		  } else {
		    alert('GPS를 지원하지 않습니다');
		  }
  }
  
  function searchDetailAddrFromCoords(lng, lat, callback) {
		// 주소-좌표 변환 객체를 생성합니다
	 	var geocoder = new kakao.maps.services.Geocoder();
	    // 좌표로 법정동 상세 주소 정보를 요청합니다
	    geocoder.coord2Address(lng, lat, callback);
	}
  
  </script>
  <!-- <script src="vendor/jquery/jquery.min.js"></script> -->
  <!-- <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->

</body>

</html>
