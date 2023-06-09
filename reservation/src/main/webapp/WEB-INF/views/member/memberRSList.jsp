<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head> 
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>MyPage</title>
		<!-- jQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- bootstrap -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
      	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
      	<!-- iamport -->
		<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		<!-- Sweet Alert 플러그인 -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
		<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
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
            <h2><img src="${pageContext.request.contextPath }/resources/images/mypage/myReservation.jpg" alt="" style="width: 100%;" class="justify-content-center"></h2>
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
                    <button type="button" class="btn btn-outline-dark active p-3" onclick="location.href='memberRSList'" >예약 내역</button>
                    <button type="button" class="btn btn-outline-dark p-3" onclick="location.href='memberAssignList'">판매 내역</button>
                    <button type="button" class="btn btn-outline-dark p-3" onclick="location.href='memberLike'">내가 찜한 식당</button>
                    <button type="button" class="btn btn-outline-dark p-3" onclick="location.href='memberReview'">내가 쓴 리뷰</button>
                    <button type="button" class="btn btn-outline-dark p-3" onclick="location.href='memberWithdrawal'">회원탈퇴</button>
                </div>
                <!-- 왼쪽 사이드바 버튼영역-->
            </div>
            <!-- 내용 -->
            <div class="col-md-8">
		        <div class="row d-flex justify-content-start" style="margin-left: 90px; margin-top: 60px;">
		            <div class="col-10">
				        <!-- 드롭다운 시작 -->
				        <div class="row">
				        	<div class="col-2">
						        <div class="dropdown">
									<select class="form-select form-select mb-3" id="status" aria-label=".form-select example" style="width: 180px;">
										<option selected value="">전체상태</option>
										<option value="방문예정">방문예정</option>
										<option value="방문완료">방문완료</option>
										<option value="취소">취소</option>
										<option value="양도완료[구매]">양도완료[구매]</option>
										<option value="판매중">판매중</option>
										<option value="판매실패">판매실패</option>
									</select>
								</div>
							</div>
							<div class="col" style="margin-left: 90px;">
								<div class="dropdown">
									<select class="form-select form-select mb-3" aria-label=".form-select example" style="width: 180px;" id="dateFilter">
									  <option value="">전체날짜</option>
									  <c:forEach items="${sortedDates}" var="date">
									    <option>${date }</option>
									  </c:forEach>
									</select>
								</div>
							</div>
						</div>
					</div>
		        </div>
                <!-- 내용(추후에 foreach문으로 수정할 부분!) -->
                <table class="table table-striped text-center" style="margin-left: 100px;">
                    <thead>
                        <tr>
                            <th>예약번호</th>
                            <th>식당</th>
                            <th>날짜</th>
                            <th>시간</th>
                            <th>상태</th>
                            <th>상세내역</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${resList }" var="resList" >
                        <tr class="res">
                            <td>${resList.r_idx }</td>
                            <td>${resList.res_name }</td>
                            <td><fmt:formatDate value="${resList.r_date }" pattern="yy-MM-dd"/></td>
                            <td><fmt:formatDate value="${resList.r_date }" pattern="HH:mm"/></td>
                            <td>
                            	<!--  -->
	                            <c:choose>
	                           		<c:when test="${resList.r_status eq 1 }">
	                           			방문예정
	                           		</c:when>
	                           		<c:when test="${resList.r_status eq 2 }">
	                           			방문완료
	                           		</c:when>
	                           		<c:when test="${resList.r_status eq 3 }">
	                           			<span style="color: red;">취소</span>
	                           		</c:when>
	                           		<c:when test="${resList.r_status eq 4 }">
	                           			<span style="color: green;">양도완료[구매]</span>
	                           		</c:when>
	                           		<c:when test="${resList.r_status eq 5 }">
	                           			판매중
	                           		</c:when>
	                           		<c:otherwise>
	                           			판매실패
	                           		</c:otherwise>
	                           	</c:choose>
	                            <!--  -->
                            </td>
                            <td>
                            	<!--  -->
                          		<button type="button" class="btn btn-dark" style="color: white;" data-bs-toggle="modal" data-bs-target="#rsListModal${resList.r_idx }">상세보기</button>
                            	<button type="button" class="btn btn-outline-dark" style="margin-left: 10px;" data-bs-toggle="modal" data-bs-target="#assignmentModal${resList.r_idx }">예약관리</button>
                            	<!--  -->                       
                            </td>
                        </tr>
                   </c:forEach>
                    </tbody>
                </table> 
                <c:if test="${empty resList }">
                   <h5 style="color: gray; text-align: center;">아직 예약이 없습니다.</h5>
                </c:if>
            </div>
        </div>
    </div>



	<!-- 24시간을 밀리초로 나타낸 값 -->
    <c:set var="twentyFourHours" value="86400000" />
 
 	<!-- 예약내역 출력 첫번째 모달창 -->
 	<c:forEach var="resList" items="${resList }">
	 <div class="modal fade" id="rsListModal${resList.r_idx }" tabindex="-1" aria-labelledby="rsListModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
	    	<div class="modal-content">
	    		<div class="modal-header">
	        		<h1 class="modal-title fs-5" id="rsListModalLabel">예약 내역</h1>
	        		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      		</div>
	      		<div class="modal-body">
	        		<!-- 예약내역 내용 시작-->
					<div class="container">
					    <div class="row">
	        				<div class="col-md-12" style="text-align: center;">
				            <h3 style="font-weight: bold;">${resList.res_name }</h3>
	        			</div>
	    			</div>
				    <div class="row">
				        <div class="mt-2 col-md-12">
				        	<c:forEach items="${rsList }" var="rsList">
				        		<c:if test="${rsList.res_idx eq resList.res_idx }">
						            <img src="${pageContext.request.contextPath }/resources/upload/${rsList.res_photo1 }" 
						                 class="rounded mx-auto d-block" height="300px" width="500px">
				            	</c:if>
			            	</c:forEach>
				        </div>
	   				 </div>
				    <div class="container">
					    <div class="row">
					        <div class="col-md-12">
					        	<!-- 예약내역 테이블 시작 -->
					            <table class="mt-3 table d-flex justify-content-center">
					                <tbody>
										<tr>
					                        <th>예약번호</th>
					                        <td>${resList.r_idx }</td>
					                    </tr>
					                    <tr>
					                    	<th>예약상태</th>
					                    	<td>
					                    		<c:choose>
					                           		<c:when test="${resList.r_status eq 1 }">
					                           			방문예정
					                           		</c:when>
					                           		<c:when test="${resList.r_status eq 2 }">
					                           			방문완료
					                           		</c:when>
					                           		<c:when test="${resList.r_status eq 3 }">
					                           			<span style="color: red;">취소</span>
					                           		</c:when>
					                           		<c:when test="${resList.r_status eq 4 }">
					                           			<span style="color: green;">양도완료[구매]</span>
					                           		</c:when>
					                           		<c:when test="${resList.r_status eq 5 }">
					                           			판매중
					                           		</c:when>
					                           		<c:otherwise>
					                           			판매실패
					                           		</c:otherwise>
					                           	</c:choose>
					                    	</td>
					                    </tr>
					                    <tr>
					                        <th>날짜</th>
					                        <td><fmt:formatDate value="${resList.r_date }" pattern="yyyy년 MM월 dd일"/></td>
					                    </tr>
					                    <tr>
					                        <th>시간</th>
					                        <td><fmt:formatDate value="${resList.r_date }" pattern="HH시 mm분"/></td>
					                    </tr>
					                    <tr>
					                        <th>인원</th>
					                        <td>${resList.r_personnel } 명</td>
					                    </tr>
					                    <tr>
					                        <th>예약자</th>
					                        <td>${resList.m_name } 님</td>
					                    </tr>
					                    <tr>
					                        <th>예약코스</th>
					                        <td>${resList.me_name }</td>
					                    </tr>
					                    <tr>
					                        <th>예약비용</th>
					                        <td>${resList.r_amount } 원</td>
					                    </tr>
					                    <tr>
					                        <th>테이블 수</th>
					                        <td>${resList.r_tables } 개</td>
					                    </tr>
					                    <c:forEach var="rsList" items="${rsList }">
						                   <c:if test="${rsList.res_idx eq resList.res_idx }">
						                    <tr>
						                        <th>[오시는길]</th>
						                        <td>
					                        		${rsList.res_address } <br>
					                        		${rsList.res_detailAddress }
						                        </td>
						                    </tr>
						                    <tr>
						                        <th>[편의시설]</th>
						                        <td>
						                        	${rsList.res_amenity } <br>
					                        		${rsList.res_amenity_info }
						                        </td>
						                    </tr>
						                    <tr>
						                        <th>[안내사항]</th>
						                        <td>
						                            예약 변경 및 취소는 예약일 기준 일주일 전까지만 가능합니다.<br>
						                            그 이후로는 환불 및 날짜변경이 불가하니 변동사항 있으실 경우<br>
						                            사전에 레스토랑으로 연락 주시기 바랍니다.
						                        </td>
						                    </tr>
						                    </c:if>
					                    </c:forEach>
		                			</tbody>
		           				 </table>
		            			<!-- 예약내역 테이블 끝 -->
		        			</div>
						    <div class="d-flex justify-content-center">
					    	 	  <!-- 예약상태에 따른 취소하기 버튼 활성화, 비활성화 -->
					    	 	  <!-- 예약상태가 "1-방문예정" 일때만 취소버튼 활성화 -->
					    	 	  <!-- DB구문으로 처리 예정 -->
								  <c:choose>
								    <c:when test="${resList.r_status eq 1 && resList.r_date.time - currentDateTime.time > twentyFourHours }">
						        		 <button type="button" class="btn btn-outline-warning" onclick="cancel(${resList.r_idx })">예약 취소하기</button>
									     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="margin-left: 10px;">닫기</button>
								    </c:when>
								    <c:when test="${resList.r_status eq 2 && resList.rv_status eq 1 }">
						        		 <button type="button" class="btn btn-warning" style="color: white;" data-bs-toggle="modal" data-bs-target="#reviewmodify">리뷰작성하기</button>
									     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="margin-left: 10px;">닫기</button>
								    </c:when>
								    <c:otherwise>
								    	 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="margin-left: 10px;">닫기</button>
								    </c:otherwise>
								  </c:choose>
								  <!--  -->
						    </div>
					</div>
					<!-- 예약내역 내용 끝-->
					</div>
	      		</div>
	    	</div>
		</div>
	</div>
</div>
</c:forEach>
	<!-- 예약내역 출력 첫번째 모달창 끝 -->
 	
 	<!-- 두번째 양도 관련 모달창 -->
 	<c:forEach var="resList" items="${resList }">
	<div class="modal fade" id="assignmentModal${resList.r_idx }" tabindex="-1" aria-labelledby="assignmentModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="assignmentModalLabel">예약 관리</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <table class="table table-striped text-center">
                    <thead>
                        <tr>
                            <th>예약번호</th>
                            <th>식당</th>
                            <th>날짜</th>
                            <th>시간</th>
                            <th>상태</th>
                            <th>
                               <!--  -->
	                           <c:choose>
				                    <c:when test="${resList.r_status eq 5}">
								     	수정할 가격을 입력하세요
								    </c:when>
	                           		<c:when test="${resList.r_status eq 1}">
								  		판매할 가격을 입력하세요
								    </c:when>
								    <c:otherwise>
								    	기타
								    </c:otherwise>
	                           </c:choose>
	                           <!--  -->
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>${resList.r_idx }</td>
                            <td>${resList.res_name }</td>
                            <td><fmt:formatDate value="${resList.r_date }" pattern="yy-MM-dd"/></td>
                            <td><fmt:formatDate value="${resList.r_date }" pattern="HH:mm"/></td>
                            <td>
	                           	<!-- r_status가 1-방문예정, 2-방문완료, 3-취소, 4-양도완료, 5-판매중, 6-판매실패 -->
							    <c:choose>
						           <c:when test="${resList.r_status eq 1}">방문예정</c:when>
						           <c:when test="${resList.r_status eq 2}">방문완료</c:when>
						           <c:when test="${resList.r_status eq 3}">취소</c:when>
						           <c:when test="${resList.r_status eq 4}">양도완료[구매]</c:when>
						           <c:when test="${resList.r_status eq 5}">판매중</c:when>
						           <c:when test="${resList.r_status eq 6}">판매실패</c:when>
							    </c:choose>
						     </td>
						     <td>
						     	<!-- -->
					     	    <c:choose>
				                    <c:when test="${resList.r_status eq 5}">
								        <div>
								        	<input type="text" class="salesValue2" id="salesValue2${resList.r_idx}" placeholder="가격을 입력하세요" maxlength="9">
								        </div>
								    </c:when>
								    <c:when test="${resList.r_status eq 1}">
								    	<input type="text" class="salesValue" id="salesValue${resList.r_idx}" placeholder="가격을 입력하세요" maxlength="9">
								    </c:when>
	                           </c:choose>
	                           <!-- -->
					     	 </td>
                        </tr>
                   </tbody>
            </table>
	            <div class="d-flex justify-content-center">
	            	<a>양도한 예약은 양도 게시판에 등록되며, 고객센터를 통해서만 취소가 가능합니다.</a> 
	            </div>
	         <div class="mt-3 d-flex justify-content-center">
	         
	          <!--  ====================================== 예약상태에 따른 동적 버튼 생성하기 ====================================== -->
			  <!-- 예약상태가 "1-방문예정" 일 경우 "양도하기" 버튼 활성화 -->
			  <!-- 예약상태가 "5-판매중" 일 경우 가격을 수정할 수 있도록 "수정하기" 버튼 활성화 -->
			  <!-- 가격 입력 인풋과 가격 수정 버튼을 함께 표시 -->
			  <!-- 판매중이 아닌 경우에는 가격 수정 버튼 비활성화 -->
			  <c:choose>
				    <c:when test="${resList.r_status eq 1}">
	   					<button type="button" class="btn btn-outline-dark" id="assignmentButton" onclick="redirectToAssignment(${resList.r_idx})">양도하기</button>
				    </c:when>
				    <c:when test="${resList.r_status eq 5}">
			            <button type="button" class="btn btn-outline-dark" onclick="updatePrice(${resList.r_idx})">수정하기</button>
				    </c:when>
			  </c:choose>
<!-- 				    	 <button type="button" class="btn btn-danger" id="assignmentButton" -->
<!-- 					     onclick="alert('이미 취소 또는 완료된 예약입니다.')">이미 취소 또는 완료된 예약입니다.</button> -->
	          <!--  ====================================== 예약상태에 따른 동적 버튼 생성하기 ====================================== -->
	          
			</div>
	      </div>
	    </div>
	  </div>
	</div>
	</c:forEach>
	<!-- 두번째 양도 관련 모달창 끝 -->

<!-- 세번째 리뷰 관련 모달창 시작 -->
<c:forEach items="${resList }" var="resList">
	<c:if test="${resList.rv_status eq 1 }">
    <div class="modal" id="reviewmodify" tabindex="-1" >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5">리뷰 작성</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="ReviewPro" method="post" enctype="multipart/form-data">
            <div class="modal-body">
                <input type="hidden" name="r_idx" value="${resList.r_idx }">
				<input type="hidden" name="rv_status" value="1">
                    <table>
                        <tr>
                            <th>리뷰사진</th>
                            <td><input type="file" name="img" accept="image/*" onchange="checkFileExtension(event)"></td>
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
                                <input type="hidden" value="1" id="starRating" name="rv_scope">
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
                            <td>
                            	<textarea cols="50" rows="5" name="rv_comment" oninput="countTextareaCharacters()" id="rv_comment" required="required"></textarea>
                            	<p id="characterCount">0/100</p>
                            </td>
                        </tr>
                    </table>
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn btn-warning" style="color: white;">등록</button>
              <button type="button" class="btn btn-warning" style="color: white;"data-bs-dismiss="modal">취소</button>
            </div>
            </form>
          </div>
        </div>
    </div>
    </c:if>
</c:forEach>
<!-- 세번째 리뷰 관련 모달창 끝 -->
	<!-- 리뷰 글자 갯수 제한 -->
	<script>
	function countTextareaCharacters() {
        var textarea = document.getElementById('rv_comment');
        var countElement = document.getElementById('characterCount');
        var maxLength = 100; // 최대 글자 수

        var currentLength = textarea.value.length;
        if (currentLength > maxLength) {
            textarea.value = textarea.value.slice(0, maxLength); // 최대 글자 수까지만 남기고 잘라냄
            currentLength = maxLength; // 현재 글자 수를 최대 글자 수로 설정
            alert("최대 글자 수입니다.");
        }
        countElement.textContent = currentLength + "/" + maxLength;
	}

	</script>
	
	<!-- 업로드파일의 확장자가 img가 아니면 등록이 불가능하다는 문구를 띄우는 스크립트 -->
	 <script>
	    function checkFileExtension(event) {
	      const fileInput = event.target;
	      const file = fileInput.files[0];
	      const allowedExtensions = ['jpg', 'jpeg', 'png', 'gif'];
	
	      const fileName = file.name;
	      const fileExtension = fileName.split('.').pop().toLowerCase();
	
	      if (!allowedExtensions.includes(fileExtension)) {
	        alert('등록이 불가능한 파일입니다.');
	        fileInput.value = '';
	      }
	    }
	 </script>	
	
 	<!-- 가격 수정을 위한 ajax요청 -->
 	<script>
	    function updatePrice(r_idx) {
	    	
	        var salesValue =$("#salesValue2" + r_idx).val();
	        console.log(salesValue);
	        
	        // 확인 메시지 출력
	        var confirmation = confirm('입력한 금액이 맞습니까?');
	        
	        if (confirmation) {
	        	
	        	// ======================================== ajax ========================================
		        $.ajax({
		            url: '<c:url value="modifySalesPrice"/>',
		            method: "POST",
		            data: {
		            	r_idx: r_idx,
		                salesValue: salesValue
		            },
		            dataType: "text",
		            success: function(response) {
		            	
						var modifyValue = response.trim();
						console.log(modifyValue);
						
						if(response === '1') {
			                alert("가격이 성공적으로 업데이트되었습니다.");
			                location.href='<c:url value="memberRSList"/>'
			                
						} else {
							alert("예약금액 보다 높게 판매할 수 없습니다. 가격을 다시 입력해주세요");
						}
						
		            },
		            error: function(xhr, status, error) {
		                console.error("가격 업데이트 오류:", error);
		            }
		        });
		    	// ======================================== ajax ========================================
		    		
	        } // if
	    } // updatePrice
	</script>
 	
 	<!-- 양도 관련 스크립트 -->
 	<script>
 	// 양도 금액 입력 시 유효성 검사
 	$(document).ready(function() {
	  	$('.salesValue').on('input', function() {
	    var value = $(this).val();
	    // 값에서 숫자가 아닌 문자를 빈 문자열로 대체함!
	    // 이렇게 하면 입력 필드에는 숫자 값만 입력됨
	    $(this).val(value.replace(/[^0-9]/g, ''));
	 	});
	});
	
 	// 양도 게시판에 글 등록하기
 	function redirectToAssignment(r_idx) {
 		
 	   // id 속성명이 salesValue + r_idx 값을 변수에 저장! => 동적으로 바뀌어야 하는 부분임!
 	   // 원래 코드에서는 모든 .salesValue 입력란의 값을 가져오려고 했으나 수정된 코드에서는
 	   // 해당 예약의 입력란 값을 정확하게 가져오는 방식으로 변경함!
 	   var value = $('#salesValue' + r_idx).val();

	   // 확인 메시지 출력
	   var confirmation = confirm('입력한 금액이 맞습니까?');
	   
	   // 아무값도 입력하지 않았을 때 리턴시켜서 다시 입력하게 하기!
	   // 입력된 값에서 앞뒤 공백을 제거한 결과가 빈 문자열인지를 확인함
	   // 즉, 값이 공백으로만 이루어져 있다면 조건이 참이됨!
	   if (value.trim() === '') {
	        alert('판매 가격을 정확하게 입력해주세요.');
	        return;
	   }
		
	   if (confirmation) {
	      var url = '<c:url value="registAssignment?r_idx=' + r_idx + '&salesValue=' + value + '"/>';
	      window.location.href = url;
   	   }
	   
  	}
 	</script>
 	<!--  -->
 	
 	<!-- 기타 클릭 이벤트 -->
 	<script>
	 	<!-- 모달창에서 취소버튼 클릭 시 환불 페이지로 넘어가기 -->
	 	$(document).on("click", "#cancelButton", function(event){
	 	    // 예약 환불 페이지로 이동
	 		window.location.href = '<c:url value="환불페이지"/>';
	 	});
	 	<!-- 모달창에서 닫기버튼 클릭 시 현재 페이지로 돌아가기 -->
	 	$(document).on("click", "#closeButton", function(event){
	 	    // 예약 양도 페이지로 이동
	 		window.location.href = "memberRSList";
	 	});
 	</script>
 	
	<script>
	  $(document).ready(function() {
	    $('#dateFilter, #status').change(function() {
	      var selectedDate = $('#dateFilter').val();
	      var selectedStatus = $('#status').val();
	
	      $('.res').hide(); // 모든 데이터 숨기기
	
	      $('.res').each(function() {
	        var dateCell = $(this).find("td:nth-child(3)");
	        var statusCell = $(this).find("td:nth-child(5)");
	        var date = dateCell.text().trim();
	        var status = statusCell.text().trim();
	
	        var showRow = (selectedDate === '' || date === selectedDate) && (selectedStatus === '' || status === selectedStatus);
	
	        $(this).toggle(showRow);
	      });
	    });
	  });
	</script>
	
	<script type="text/javascript">
		function noShow(r_idx) {
			let result = confirm("노쇼가 확실합니까?");
			if(result){
				location.href='resCancel?r_idx=' + r_idx + '&r_status=4';
			}
		}
	</script>
	
	<!-- 예약 취소 -->
	<script type="text/javascript">
    function cancel(r_idx) {
    	
        let result = confirm("취소가 확실합니까? \n (취소할 경우 예약을 되돌릴 수 없으며 다시 예약해야합니다.)");

        if (result) {

            // 결제정보 조회를 위한 ajax요청
            $.ajax({
                url: '<c:url value="paymentCancel"/>',
                type: 'POST',
                data: { r_idx: r_idx },
                dataType: 'json',
                success: function(response) {
					
                    console.log(JSON.stringify(response));

                    alert('주문번호 ' + JSON.stringify(response.payment_num)
                    		+ '결제 취소를 진행합니다. \n취소하실 금액은 '
                    		+ JSON.stringify(response.payment_total_price) + '원 입니다.');
					
                    // 결제 취소를 위한 ajax요청
                    $.ajax({
                        url: "payCancel",
                        type: "POST",
                        data: {
                            'payment_num': response.payment_num,
                            'payment_total_price': response.payment_total_price,
                            'reason': "테스트 결제 환불"
                        },
                        success: function(data) {
                            // 환불 완료 swal창으로 안내
                            swal({
                                title: "환불 성공!",
                                text: "예약이 성공적으로 취소되었습니다.",
                                icon: "success",
                                button: "확인"
                            }, function() {
                                // 환불 완료 후 전 화면으로 이동
                                location.href = "memberRSList";
                            });
                        },
                        error: function(xhr, status, error) {
                            swal("환불 실패!" + error);
                        }
                    }); // ajax

                //=========================================================================
                	
                },
                error: function(xhr, status, error) {
                    console.log('Ajax 오류 발생했습니다');
                    console.log('상태 코드: ' + xhr.status);
                    console.log('에러 메시지: ' + error);
                }
            }); // ajax
            
        } // if
    }
	</script>
	
	<!-- 판매금액 정산하기 - 부분취소 -->
	<script type="text/javascript">
	function cancelAndCalculate(r_idx) {
		
		 let result = confirm("예약번호 " + r_idx + "번의 판매내역 정산을 하시겠습니까? \n결제금액의 5퍼센트를 차감 후 카드 부분취소가 진행됩니다.");
		 
		 if(result) {
			 
// 			 alert('카드 결제 취소가 완료되었습니다!');
			 
			 // 결제정보 조회를 위한 ajax요청
	            $.ajax({
	                url: '<c:url value="paymentCancel2"/>',
	                type: 'POST',
	                data: { r_idx: r_idx },
	                dataType: 'json',
	                success: function(response) {
						
	                    console.log(JSON.stringify(response));
						
	                    var refundAmount = response.payment_total_price * 0.95; // 수수료 5% 차감
	                    
	                    alert('주문번호 ' + JSON.stringify(response.payment_num)
	                    		+ '판매금액 정산을 진행합니다. \n수수료 차감 후 최종 정산금액은 '
	                    		+ refundAmount + '원 입니다.');
						
	                    // 판매금액 정산을 위한 ajax요청 - 부분취소
	                    $.ajax({
	                        url: "payCancel2",
	                        type: "POST",
	                        data: {
	                            'payment_num': response.payment_num,
	                            'payment_total_price': response.payment_total_price,
	                            'reason': "테스트 결제 환불"
	                        },
	                        success: function(data) {
	                            // 환불 완료 swal창으로 안내
	                            swal({
	                                title: "정산 완료!",
	                                text: "판매금액이 성공적으로 정산되었습니다.",
	                                icon: "success",
	                                button: "확인"
	                            }, function() {
	                                // 환불 완료 후 전 화면으로 이동
	                                location.href = "memberRSList";
	                            });
	                        },
	                        error: function(xhr, status, error) {
	                            swal("환불 실패!" + error);
	                        }
	                    }); // ajax

	                //=========================================================================
	                	
	                },
	                error: function(xhr, status, error) {
	                    console.log('Ajax 오류 발생했습니다');
	                    console.log('상태 코드: ' + xhr.status);
	                    console.log('에러 메시지: ' + error);
	                }
	            }); // ajax
			 
		 } // if
	}
	</script>

 
    <!-- 하단 부분 include 처리영역 -->
    <hr style="margin-top: 100px;">
	<%@ include file="../common/common_footer.jsp" %>
    <!-- 하단 부분 include 처리영역 -->
    
    <!-- 이부분은 지우면 안됩니다 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html> 