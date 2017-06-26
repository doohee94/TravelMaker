var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(37.554701, 126.970600), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(33.450701, 126.570667); 


//지도를 클릭했을때 클릭한 위치에 마커를 추가하도록 지도에 클릭이벤트를 등록합니다
daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
 // 클릭한 위치에 마커를 표시합니다 
 addMarker(mouseEvent.latLng);             
});

//지도에 표시된 마커 객체를 가지고 있을 배열입니다
var markers = [];


//마커를 생성하고 지도위에 표시하는 함수입니다
function addMarker(position) {
 
 // 마커를 생성합니다
 var marker = new daum.maps.Marker({
     position: position
 });

 // 마커가 지도 위에 표시되도록 설정합니다
 marker.setMap(map);
 
 // 생성된 마커를 배열에 추가합니다
 markers.push(marker);
}