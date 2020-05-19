<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Object addrObj = request.getAttribute("addr");//.toString();
   		String addr = "";
    	if(addrObj != null){
    		addr = addrObj.toString();
    	}
    %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>MASK SEARCH</title>
	<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
</head>
<body>	

<div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                <input type="text"  id="txtAddr" name = "addr" class="form-control form-control-lg" placeholder="목적지를 검색하세요..." size="200">
                <!-- <input type="text" value="" id="keyword" size="105">  -->                
                <input type="button" id="btnSearch" class="btn btn-block btn-lg btn-primary" value = "검색" >                
                    <!-- <button type="submit">검색하기</button> --> 
                </form>
            </div>
</div>

<hr>
        
<div class="map_wrap">
    <!-- <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> -->
	<div id="map" style="width:1900px;height:1200px"></div> 
	<div id="menu_wrap" class="bg_white">
        
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div> 
    </div>

	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf4affbe89e457c74f97f0cdb1d2dde9&libraries=services"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript">
	
		<%-- alert("<%=addr%>"); --%>
	
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};
		
		var ga = null;
		var ha = null;
		
		// 마커를 담을 배열입니다
		var markers = [];

		var map = new kakao.maps.Map(container, options);
		
		// 장소 검색 객체를 생성합니다		
		var ps = new kakao.maps.services.Places(); 
		
		// 키워드로 장소를 검색합니다 
		ps.keywordSearch("<%=addr%>", placesSearchCB);
		
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		
		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, remain_stat) {
			
			var imageSrcT;
			
			if (remain_stat == "plenty")
			{
				imageSrcT = '${pageContext.request.contextPath}/resources/img/cnt100.png'
			}
			else if(remain_stat == "some")
			{
				imageSrcT = '${pageContext.request.contextPath}/resources/img/cnt30.png'
			}
			else if(remain_stat == "few")
			{
				imageSrcT = '${pageContext.request.contextPath}/resources/img/cnt2.png'
			}
			else
			{
				imageSrcT = '${pageContext.request.contextPath}/resources/img/cnt0.png'
			}
			
				
		    var imageSrc = imageSrcT, // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(60, 40),  // 마커 이미지의 크기
		        imgOptions =  {
		            /* spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표 */
		            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });

		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

		    return marker;
		}
		
		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();
		        
		        var coords = new kakao.maps.LatLng(data[0].y, data[0].x);
		        
		        ga = coords.Ga;
		        ha = coords.Ha;
		        
		         for (var i=0; i<data.length; i++) {
		            /* displayMarker(data[i]); */
		            
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		            
		            
		        }        

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		        
		        // 해당 위도 경도 기준으로 마스크 데이터 Search
		        var result = SearchMask(ga,ha);
		        
		        console.log(result);
		        
		        // 해당 약국정도 목록과 마커 표출
		        displayPlaces(result);

		        
		        console.log(result);
		        
		    } 
		}
		
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			  var 	listEl = document.getElementById('placesList'), 
			    	menuEl = document.getElementById('menu_wrap'),
			    	fragment = document.createDocumentFragment(),
			    	bounds = new kakao.maps.LatLngBounds();
		    
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);

		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {
		    	
		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new kakao.maps.LatLng(places[i].lat, places[i].lng),
		            marker = addMarker(placePosition, i, places[i].remain_stat),
		            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);

		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, name, addr, created_at, stock_at, remain_stat) {
		            kakao.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, name, addr, created_at, stock_at, remain_stat);
		            });

		            kakao.maps.event.addListener(marker, 'mouseout', function() {
		                infowindow.close();
		            });

		            itemEl.onmouseover =  function () {
		                displayInfowindow(marker, name, addr, created_at, stock_at, remain_stat);
		            };

		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		        })(marker, places[i].name, places[i].addr, places[i].created_at, places[i].stock_at, places[i].remain_stat);

		        fragment.appendChild(itemEl);		        
		    }

		 	// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;  
		    
		 // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    //map.setBounds(bounds);
		    
		}
		
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}
		
	 	// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
		
		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {

		    var el = document.createElement('li'),
		    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
		                '<div class="info">' +
		                '   <h5>' + places.name + '</h5>';

          	itemStr += '    <span>' + places.addr + '</span>' ;
	                    
		  /*     itemStr += '  <span class="tel">' + places.phone  + '</span>' +
		                '</div>';            */

		    el.innerHTML = itemStr;
		    el.className = 'item';

		    return el;
		}
		
		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, name, addr, created_at, stock_at, remain_stat) {
		    var content = '<div style="padding:5px;z-index:1;">' + name + 
		    			  '<p>' + addr + '</p>' +
		    			  '<p>업데이트시간 : ' + created_at + '</p>' + 
		    			  '<p>재고등록시간 : '+ stock_at + '</p>' + 
		    			  '<p>재고상태 : '+ remain_stat + '</p>'
		    '</div>';

		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}
		
		// 마우스 드래그로 지도 이동이 완료되었을 때 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'dragend', function() {        
		    
		    // 지도 중심좌표를 얻어옵니다 
		    var latlng = map.getCenter(); 
		    
		   /*  var message = '변경된 지도 중심좌표는 ' + latlng.getLat() + ' 이고, ';
		    message += '경도는 ' + latlng.getLng() + ' 입니다';
		    
		    var resultDiv = document.getElementById('result');  
		    alert(message); */
		    
		    // 해당 위도 경도 기준으로 마스크 데이터 Search
	        var result = SearchMask(latlng.getLng(),latlng.getLat());
	        
	        console.log(result);
	        
	        // 해당 약국정도 목록과 마커 표출
	        displayPlaces(result);
	        
	     	// 이동할 위도 경도 위치를 생성합니다 
	        var moveLatLon = new kakao.maps.LatLng(latlng.getLat(), latlng.getLng());
	        
	        // 지도 중심을 부드럽게 이동시킵니다
	        // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
	        map.panTo(moveLatLon);            
		    
		});
		
		
		
		function SearchMask(ga, ha){
			
			$.ajax({
				contentType:'application/json',				
				method : "get",
				url : "/map/searchMask",
				async: false,
				data: {	ga:ga,	ha:ha }
				
			}).done(function(data){
				maskData = data;
			});
			
			return maskData;
			
		}
		
		
			
	</script>
	
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
  	
  	
  
</body>
</html>	