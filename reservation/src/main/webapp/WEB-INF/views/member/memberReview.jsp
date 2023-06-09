<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>MyPage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- 이부분은 지우면 안됩니다 -->
    <style>
        /* 각 별들의 기본 설정 */
        .starR{
        display: inline-block;
        width: 30px;
        height: 30px;
        color: transparent;
        text-shadow: 0 0 0 #f0f0f0;
        font-size: 1.8em;
        box-sizing: border-box;
        cursor: pointer;
        }

        /* 별 이모지에 마우스 오버 시 */
        .starR:hover {
        text-shadow: 0 0 0 #ccc;
        }

        /* 별 이모지를 클릭 후 class="on"이 되었을 경우 */
        .starR.on{
        text-shadow: 0 0 0 #ffbc00;
        }
    </style>
</head>


<body>
   	<!-- 공통 상단바 구역 -->
<%@ include file="../common/common_header.jsp" %>
   	<!-- 공통 상단바 구역 -->

    <!-- 제목 구역 -->
	<div class="container">
        <div class="row mt-4">
          <div class="col">
            <h2><img src="${pageContext.request.contextPath }/resources/images/mypage/myReview.jpg" alt="" style="width: 100%;" class="justify-content-center"></h2>
          </div>
        </div>
    </div>

     <!-- 사이드바, 내용 넣는 구역!-->
    <div class="container">
        <div class="row">
            <div class="col-2" style="margin-top: 60px;">
                <!-- 왼쪽 사이드바 버튼영역-->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
                    <button type="button" class="btn btn-outline-dark p-3" onclick="location.href='member'">내 정보</button>
                    <button type="button" class="btn btn-outline-dark p-3" onclick="location.href='memberRSList'" >예약 내역</button>
                    <button type="button" class="btn btn-outline-dark p-3" onclick="location.href='memberAssignList'">판매 내역</button>
                    <button type="button" class="btn btn-outline-dark p-3" onclick="location.href='memberLike'">내가 찜한 식당</button>
                    <button type="button" class="btn btn-outline-dark active p-3" onclick="location.href='memberReview'">내가 쓴 리뷰</button>
                    <button type="button" class="btn btn-outline-dark p-3" onclick="location.href='memberWithdrawal'">회원탈퇴</button>
                </div>
                <!-- 왼쪽 사이드바 버튼영역-->
            </div>
                
            <!-- 내용 -->
            <div class="col-10">
                <div class="row align-items-center" style="margin-left: 100px; margin-top: 10px;">
	                <c:forEach items="${rvList }" var="rvList">
	                    <div class="card ms-3 me-5 mt-5 align-items-center" style="width: 20rem;">
	                        <img src="${pageContext.request.contextPath }/resources/upload/${rvList.rv_img }" width="100" height="100">
	                        <div class="card-body">
	                          <a class="card-title h5" href="getRestaurantInfo?res_idx=${rvList.res_idx }" style="text-decoration: none; color: black;">${rvList.res_name }</a>
	                          <br>
	                          <c:forEach begin="1" end="5" varStatus="status">
                         			<c:choose>
										<c:when test="${rvList.rv_scope >= status.index}">
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
								<br>
								<br>
	                          <p class="card-text">${rvList.rv_comment }</p>
	                          <div class="d-flex justify-content-center">
	                         	 <button class="btn btn-outline-dark me-1" onclick="location.href='getRestaurantInfo?res_idx=${rvList.res_idx }'">예약하기</button>
	                         	 <button class="btn btn-dark" style="color: white;" onclick="rvDelete(${rvList.rv_idx})">삭제</button>
	                          </div>
	                        </div>
	                    </div>
	                </c:forEach>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    	function rvDelete(num) {
			var result = confirm("정말 삭제하시겠습니까? ");
			if(result){
				location.href="RvDelete?rv_idx="+num
			}
    		
		}
    </script>
    
    
    <!-- 수정 버튼 클릭시 리뷰 수정 모달창-->
    <div class="modal" id="reviewmodify" tabindex="-1" >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5">리뷰 수정</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="#" method="post" enctype="multipart/form-data">
                    <table>
                        <tr>
                            <th>리뷰사진</th>
                            <td><input type="file" name="file"></td>
                        </tr>
                        <tr>
                            <th>별점</th>
                            <td>
                                <div class="starRev">
                                    <!-- 편의 상 가장 첫번째의 별은 기본으로 class="on"이 되게 설정해주었습니다. -->
                                    <span class="starR on">⭐</span>
                                    <span class="starR">⭐</span>
                                    <span class="starR">⭐</span>
                                    <span class="starR">⭐</span>
                                    <span class="starR">⭐</span>
                                </div>
                                <!-- 나중에 폼 전송시에는 type을 hidden으로 바꾸면 됨, 지금은 확인해야하니 text로 함-->
                                <input type="text" value="" id="starRating" name="starRating">
	                            <script>
	                                <!-- 별점 jQuery -->
	                                $('.starRev span').click(function(){
	                                $(this).parent().children('span').removeClass('on');
	                                $(this).addClass('on').prevAll('span').addClass('on');
	                                return false;
	                                });
	                                let starCount = 0; // 별점을 저장할 변수 선언
	                                $(".starRev span").click(function(e) { // 콜백함수에 파라미터 추가
	                                    e.preventDefault(); // a태그 기본 동작 방지
	                                    // 실제 클릭된 이벤트 요소(e.currentTarget)의 인덱스를 가져옴
	                                    // index는 0부터 시작이니 +1을 해주면 됨
	                                    let index = $(e.currentTarget).index() + 1; 
	//                                     console.log($(e.currentTarget).index()); // 콘솔 확인용
	                                    starCount = index;
	                                    $("#starRating").val(starCount); // 전송할 폼의 input에 값을 넣음
	                                });
	                                <!-- 별점 jQuery -->
	
	                            </script>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td><textarea cols="50" rows="5" name="content"></textarea></td>
                        </tr>

                    </table>
                </form>

            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-warning" style="color: white;">수정</button>
              <button type="button" class="btn btn-warning" style="color: white;"data-bs-dismiss="modal">취소</button>
            </div>
          </div>
        </div>
    </div>


    <!-- 삭제 버튼 클릭시 리뷰 삭제 모달창-->
    <div class="modal" id="reviewdelete" tabindex="-1" >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5">리뷰 삭제</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              선택하신 리뷰를 삭제 하시겠습니까?
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-warning" style="color: white;">삭제</button>
              <button type="button" class="btn btn-warning" style="color: white;" data-bs-dismiss="modal">취소</button>
            </div>
          </div>
        </div>
    </div>
 
    <!-- 하단 부분 include 처리영역 -->
    <hr style="margin-top: 100px;">
	<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 