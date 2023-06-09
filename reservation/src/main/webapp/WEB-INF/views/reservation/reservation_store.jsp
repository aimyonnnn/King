<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Clean Plate</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bookMark.css" />
    
   	<!-- 공통 상단바 구역 -->
	<%@ include file="../common/common_header.jsp" %>
   	<!-- 공통 상단바 구역 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- 이부분은 지우면 안됩니다 -->
    <script type="text/javascript" src="/assets/global/js/jquery.bxslider.min.js"></script>
    <style type="text/css">
    /* 위로 가기 버튼 */
	    #go-top {
		  display: none;
		  position: fixed;
		  right: 28px;
		  bottom: 105px;
		  outline: 0;
		  border: 0;
		  background: transparent;
		  cursor: pointer;
		  z-index: 9999;
		  color: #ffc107; /* 색상변경*/
		}
		
		/* 이미지 출력용 */
		.image-cell {
	    position: relative;
	    padding: 0;
	    width: 450px; 
    	height: 250px; 
		}
		
		.cell-image {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	    }
		    
		.carousel-img {
	    width: 100%; 
	    height: 400px;
	    object-fit: cover; /* 종횡비 유지 */
		}	
    </style>
    <!-- 위로가기 버튼 CSS -->
    <!-- 찜하기 -->
		<script>
		$(document).ready(function() {
			  var res_idx = ${restaurantInfo.res_idx};
			  var m_id = '<c:out value="${sessionScope.sId}" />';
			  var liked = $("#likeBtn").val() ? "true" : "false";

			  // 찜하기 버튼 클릭 이벤트
			  $("#likeBtn").click(function() {
			    liked = !liked ? "true" : "false";
			    console.log(liked);
			    console.log(m_id);
			    $.ajax({
			      url: '${pageContext.request.contextPath}/toggleLikeStatus',
			      type: 'GET',
			      data: {'res_idx': res_idx, 'm_id': m_id, 'liked': liked},
			      async: false,
			      success: function(response) {
			        if (response == "ok") {
			          if (liked == "true") {
			            $("#likeBtn").removeClass("unliked").addClass("liked");
			          } else {
			            $("#likeBtn").removeClass("liked").addClass("unliked");
			          }
			          alert("찜 완료!");
			        } else {
			          alert("에러 발생");
			        }
			      }
			    });
			  });
			});

		</script>    
    <!-- 찜하기 -->
    
</head>
<body>
   	<!-- 위로 가기 버튼 -->
   	<button id="go-top"><svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor"
	  class="bi bi-arrow-up-circle-fill" viewBox="0 0 16 16">
	  <path fill-rule="evenodd"
	    d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-7.5 3.5a.5.5 0 0 1-1 0V5.707L5.354 7.854a.5.5 0 1 1-.708-.708l3-3a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1-.708.708L8.5 5.707V11.5z" />
	</svg></button>
	<!-- 위로 가기 버튼 -->
	
	<script>
	var backToTop = () => {
		  // Scroll | button show/hide
		  window.addEventListener('scroll', () => {
		    if (document.querySelector('html').scrollTop > 100) {
		      document.getElementById('go-top').style.display = "block";
		    } else {
		      document.getElementById('go-top').style.display = "none";
		    }
		  });
		  // back to top
		  document.getElementById('go-top').addEventListener('click', () => {
		    window.scrollTo({
		      top: 0,
		      left: 0,
		      behavior: 'smooth'
		    });
		  })
		};
		backToTop();
	</script>
   	<!-- 위로 가기 버튼 -->

	<!-- 가게 상세페이지 시작 -->
	<div class="container-fluid w-75">
		<h3 class="fw-bold mt-4 text-center" style="font-size: 33px; line-height:36px; letter-spacing: -3px;">${restaurantInfo.res_name}</h3>
		<!-- 이미지 슬라이드 시작 -->
		<div id="carouselExampleControls" class="mt-4 carousel slide" data-bs-ride="carousel">
			<div class="carousel-inner">
				<c:if test="${not empty restaurantInfo.res_photo1 }">
					<div class="carousel-item ${restaurantInfo.res_photo1 == restaurantInfo.res_photo1 ? 'active' : ''}">
						<img class="carousel-img" src="${pageContext.request.contextPath }/resources/upload/${restaurantInfo.res_photo1 }">
					</div>
				</c:if>
				<c:if test="${not empty restaurantInfo.res_photo2 }">
					<div class="carousel-item ${empty restaurantInfo.res_photo1 and not empty restaurantInfo.res_photo2 ? 'active' : ''}">
						<img class="carousel-img" src="${pageContext.request.contextPath }/resources/upload/${restaurantInfo.res_photo2 }">
					</div>
				</c:if>
				<c:if test="${not empty restaurantInfo.res_photo3 }">
					<div class="carousel-item ${empty restaurantInfo.res_photo1 and empty restaurantInfo.res_photo2 and not empty restaurantInfo.res_photo3 ? 'active' : ''}">
						<img class="carousel-img" src="${pageContext.request.contextPath }/resources/upload/${restaurantInfo.res_photo3 }">
					</div>
				</c:if>
			</div>
			<c:if test="${not empty restaurantInfo.res_photo1 and not empty restaurantInfo.res_photo2 or not empty restaurantInfo.res_photo1 and not empty restaurantInfo.res_photo3 or not empty restaurantInfo.res_photo2 and not empty restaurantInfo.res_photo3}">
				<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</c:if>
		</div>
	<!-- 이미지 슬라이드 끝 -->
	
	<!-- 가게 메인 소개 -->
	<div class="mb-2 text-center" style="padding-top:30px">
		 <h5 class="fw-bold p-2">${restaurantInfo.res_name}</h5>
		 <p style="font-size: 14px;">${restaurantInfo.res_intro}</p>
	</div>
	<div style="inline">	
	   <c:if test="${not empty sessionScope.sId && sessionScope.sId ne 'admin' && sessionScope.sId ne c_id}">
	     <button id="likeBtn" class="unliked" value="true">❤</button>
	   </c:if>
   	</div>
	<!-- 가게 메인 소개 끝 -->
	<hr>
	 
	<!-- 가게 정보 -->
	<div>
		<table class="table">
			<thead>
				<tr>
					<th scope="col" colspan="2">
						<h3 class="fw-bold mt-2 p-2 text-center">INFORMATION</h3>
					</th>
				</tr>
			</thead>
			<tbody class="table-group-divider" style="border-left: 1px solid #dee2e6; border-right: 1px solid #dee2e6;">
			    <tr>
					<td style="border-right: 1px solid #dee2e6; width: 50%;">
					    <dl class="row">
					    	<dt class="col-sm-3">운영 시간</dt>
					        <dd class="col-sm-9">· ${restaurantInfo.res_openinghours}</dd>
					        <dt class="col-sm-3">휴식 시간</dt>
					        <dd class="col-sm-9">· ${restaurantInfo.res_breaktime}</dd>
					        <dt class="col-sm-3">정기 휴무일</dt>
					        <dd class="col-sm-9">· 
					        <c:choose>
						        <c:when test="${restaurantInfo.res_dayoff == '1'}">월요일</c:when>
							    <c:when test="${restaurantInfo.res_dayoff == '2'}">화요일</c:when>
							    <c:when test="${restaurantInfo.res_dayoff == '3'}">수요일</c:when>
							    <c:when test="${restaurantInfo.res_dayoff == '4'}">목요일</c:when>
							    <c:when test="${restaurantInfo.res_dayoff == '5'}">금요일</c:when>
							    <c:when test="${restaurantInfo.res_dayoff == '6'}">토요일</c:when>
							    <c:when test="${restaurantInfo.res_dayoff == '0'}">일요일</c:when>
					        </c:choose>
					        </dd>
					        <dt class="col-sm-3">위치</dt>
					        <dd class="col-sm-9">· ${restaurantInfo.res_address},<br>　${restaurantInfo.res_detailAddress}</dd>
					        <dt class="col-sm-3">예약 및 문의</dt>
					        <dd class="col-sm-9">· ${restaurantInfo.res_tel}</dd>
					    </dl>
					</td>
			      <td>
			      	<dl class="row">
			      		<dt class="col-sm-3">총 좌석 수</dt>
			      		<dd class="col-sm-9">
						    <dl class="row">
						        <dd class="col-sm-12">· ${restaurantInfo.res_total_table * 4}석</dd>
						        <dd class="col-sm-12">· ${restaurantInfo.res_total_table} 테이블</dd>
						        <dd class="col-sm-12">· 테이블 당 최대 4인 수용 가능 (단체석 문의)</dd>
					      		<dd><button type="button" class="btn btn-danger rounded-0 mt-3" style="width: 90%;" onclick="goToReservationReserve('${restaurantInfo.res_idx}')">지금 예약하기</button>
						    </dl>
						</dd>
			      	</dl>
			      </td>
			    </tr>
			    <tr>
			      <td colspan="2">
			      	<dl class="mt-2">
			      		<dt class="mb-2">가게 편의시설</dt>
			      		<dd>· ${restaurantInfo.res_amenity}</dd>
			      		<dd>· ${restaurantInfo.res_amenity_info}</dd>
			      	</dl>
			      </td>
			    </tr>
			</tbody>
		</table>
		<ul class="list-unstyled" style="font-size: 13px;">
        		<li>· 드레스 코드 : 본 매장은 정중히 드레스 코드를 요청 드리고 있습니다. * 트레이닝복, 반바지, 민소매, 크록스, 슬리퍼, 샌들 제한 </li>
        </ul>
		<!-- 가게 정보 끝 -->
		
		<!-- 예약하기 클릭 시 가게 상세정보 페이지로 이동 -->
		<script>
  	     function goToReservationReserve(res_idx) {
  		    location.href = "<c:url value='/reservationReserve'/>?res_idx=" + res_idx;
  	     }
		</script>
		<!-- 예약하기 클릭 시 가게 상세정보 페이지로 이동 -->
		
		<!-- 메뉴 시작 -->
		<div>
			<h3 class="fw-bold mt-2 p-2">MENU</h3>
			<table class="table table-bordered">
				<tbody>
					<c:forEach var="menus" items="${menusList }">
					<tr>
						<td class='image-cell'>
							<img class="cell-image" src="${pageContext.request.contextPath }/resources/upload/${menus.me_photo }">
						</td>
						<td>
							<dl class="row">
								<dt class="mt-3">${menus.me_name}</dt>
					        	<dd class="mt-3">${menus.me_context}</dd>
								<dt class="mt-3">${menus.me_price}원</dt>
							</dl>
						</td>
				    </tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- 메뉴 끝 -->
		
		<!-- 리뷰 시작 -->
		<div>
			<h3 class="fw-bold mt-2 p-2">REVIEW</h3>
			<table class="table table-bordered REVIEW">
				<tbody>
					<c:forEach items="${reviewList }" var="reviewList">
						<tr>
							<td class="image-cell">
								<img class="cell-image" src="${pageContext.request.contextPath }/resources/upload/${reviewList.rv_img }">
							</td>
							<td>
								<dl class="row">				
									<!-- 별점 출력 -->					
									<dt class="mt-3 reviewStars">
										<c:forEach begin="1" end="5" varStatus="status">
											<c:choose>
												<c:when test="${reviewList.rv_scope >= status.index}">
													<span class="star">
														<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#ffc107" class="bi bi-star-fill" viewBox="0 0 16 16">
														  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
														</svg>
													</span>
												</c:when>
												<c:otherwise>
													<span class="star-empty">
														<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#ffc107" class="bi bi-star" viewBox="0 0 16 16">
														  <path d="M2.866 14.85c-.078.444.36.791.746.593l4.39-2.256 4.389 2.256c.386.198.824-.149.746-.592l-.83-4.73 3.522-3.356c.33-.314.16-.888-.282-.95l-4.898-.696L8.465.792a.513.513 0 0 0-.927 0L5.354 5.12l-4.898.696c-.441.062-.612.636-.283.95l3.523 3.356-.83 4.73zm4.905-2.767-3.686 1.894.694-3.957a.565.565 0 0 0-.163-.505L1.71 6.745l4.052-.576a.525.525 0 0 0 .393-.288L8 2.223l1.847 3.658a.525.525 0 0 0 .393.288l4.052.575-2.906 2.77a.565.565 0 0 0-.163.506l.694 3.957-3.686-1.894a.503.503 0 0 0-.461 0z"/>
														</svg>
													</span>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										<!-- 별점 출력 끝 -->	
									</dt>
						        	<dd class="mt-3">${reviewList.m_nick }</dd>
									<dt class="mt-3">${reviewList.rv_comment }</dt>
								</dl>
							</td>
					    </tr>
				    </c:forEach>
				</tbody>
			</table>
			<div style="text-align: center;">
			<img id="load" src="${pageContext.request.contextPath }/resources/images/more.png" style="width: 50px; height: 50px;">
			</div>
		</div>
		    <script>
		    $('.REVIEW tr').css("display", "none");

		 // 초기에 보이도록 설정할 행의 개수를 변수에 저장합니다.
		 var initialRowCount = 5;

		 // 처음에 보이도록 설정할 행을 선택합니다.
		 $(".REVIEW tr").slice(0, initialRowCount).css("display", "table-row");
		 if ($(".REVIEW tr").length <= initialRowCount) {
		     $('#load').fadeOut(0);
		   }
		 $("#load").click(function(e) {
		   e.preventDefault();

		   // 이미 보이는 행의 개수를 세어 변수에 저장합니다.
		   var visibleRowCount = $(".REVIEW tr:visible").length;

		   // 추가적으로 보여줄 행의 개수를 변수에 저장합니다.
		   var increment = 5;

		   // 추가적으로 보여줄 행을 선택합니다.
		   $(".REVIEW tr").slice(visibleRowCount, visibleRowCount + increment).fadeIn(200).css('display', 'table-row');

		   // 모든 행이 보여졌는지 확인합니다.
		   if ($(".REVIEW tr").length <= visibleRowCount + increment) {
		     $('#load').fadeOut(0);
		   }
		 });
			</script>
		<!-- 리뷰 끝 -->
		
		<!-- 찾아오는 길 시작 -->
		<div class="mb-5">
			<h3 class="fw-bold mt-2 p-2">GETTING HERE</h3>
			<div id="map" style="width:100%;height:500px;"></div>
			<!-- 카카오API -->
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	082bc23de092d792956cd62812f9a103&libraries=services"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 1 // 지도의 확대 레벨
			    };  
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${restaurantInfo.res_address}', function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});    
			</script>
			<!-- 카카오API -->
		</div>
		<!-- 찾아오는 길 끝 -->
	</div>
	<!-- 가게 정보 끝 -->
	</div>
	<!-- 가게 상세페이지 끝 -->
	
	<!-- footer -->
	<footer class="footer">
		<hr style="margin-top: 100px;">
		<jsp:include page="../common/common_footer.jsp"/>
	</footer>
	<!-- footer -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 
</body>
</html>