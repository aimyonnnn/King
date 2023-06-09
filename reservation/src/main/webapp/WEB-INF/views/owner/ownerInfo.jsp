<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- 이부분은 지우면 안됩니다 -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>MyPage</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- 이부분은 지우면 안됩니다 -->
<script>
	function upOK(){
		// submit 확인 스크립트
   	 	if(confirm('수정하시겠습니까?') == true){ // 확인
   	 		alert('수정되었습니다.');
       		document.form.submit();
    	} else { // 취소
    		alert('취소되었습니다.');
    		return;
   		}
	}
		// email domain selectbox 값 받아오기
        var selectBoxChange = function(value) {
        	$("#changeInput").val(value);
        }
		
</script>
</head>
<body>
   	<!-- 공통 상단바 구역 -->
	<%@ include file="../common/common_header.jsp" %>
   	<!-- 공통 상단바 구역 -->

    <!-- 제목 구역 -->
	<div class="container">
        <div class="row mt-4">
          <div class="col">
            <h2><img src="${pageContext.request.contextPath }/resources/images/mypage/ceopage.jpg" alt="" style="width: 100%;" class="justify-content-center"></h2>
          </div>
        </div>
    </div>

    <!-- 사이드바, 내용 넣는 구역!-->
    <div class="container">
        <div class="row">
            <div class="col-2" style="margin-top: 60px;">
                <!-- 왼쪽 사이드바 버튼영역-->
                <div class="btn-group-vertical btn-group-lg d-flex align-self-start" role="group" aria-label="Vertical button group">
					<button type="button" class="btn btn-outline-dark text-white active p-3" onclick="location.href='ownerMypage'">내 정보</button>
					<button type="button" class="btn btn-outline-dark text-black p-3" onclick="location.href='restaurantList'">가게리스트 </button>
					<button type="button" class="btn btn-outline-dark text-black p-3" onclick="location.href='restaurantReservation'">예약관리</button>
					<button type="button" class="btn btn-outline-dark text-black p-3" onclick="location.href='ownerWithdrawal'">회원탈퇴</button>
                </div>
                <!-- 왼쪽 사이드바 버튼영역-->
            </div>
            <!-- 내용 -->
            <div class="col-10 mt-4">
            	<!-- 내정보 수정 폼 시작 -->
                <form action="OwnerInfoPro" method="post">
                	<table class="table" style="margin-left: 140px; margin-top: 35px; width: 58%;">
						<tbody>
						    <tr>
						    	<th scope="row" width="150"><label for="name">이름</label></th>
						    	<td colspan="2"><input class="form-control" type="text" id="name" name="c_name" value="${ceo.c_name }" aria-label="default input example"></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="id">아이디</label></th>
						    	<td colspan="2"><input class="form-control" type="text" id="id" name="c_id" value="${ceo.c_id }" aria-label="Disabled input example" disabled readonly></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="passwd">비밀번호</label></th>
						    	<td colspan="2"><input type="password" class="form-control" id="c_passwd" name="c_passwd" aria-label="default input example" placeholder="8~16자리의 영문, 숫자 특수문자 조합만 사용 가능합니다." minlength="8" maxlength="16" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}$"></td>
						    </tr>
						    <tr>
						    	<th scope="row"><label for="phone">휴대폰번호</label></th>
						    	<td style="height: 40px; vertical-align: middle;">
							  		<div class="d-flex align-items-center">
							    		<input class="form-control" type="text" id="phone" name="c_tel" value="${ceo.c_tel }" aria-label="default input example" style="width: 200px;">
							        	<br><button type="button" class="btn btn-outline-dark" style="margin-left: 6px;">인증요청</button>
							    	</div>
							    	<div class="mt-2 d-flex align-items-center">
							    		<input class="form-control" type="text" id="verifyPhone" aria-label="default input example" style="width: 120px;">
							        	<button type="button" class="btn btn-outline-dark" style="margin-left: 6px;">인증확인</button>
							    	</div>
								</td>
						    </tr>
						    <tr>
							    <th scope="row"><label for="email">이메일</label></th>
							    <td colspan="2">
							        <div class="input-group">
							            <input type="text" class="form-control rounded" name="c_email1" id="email" value="${ceo.c_email1 }" aria-label="default input example" style="width: 120px;">@
							            <input type="text" class="form-control rounded" name="c_email2" id="changeInput" value="${ceo.c_email2 }" aria-label="default input example" style="width: 120px;"> 
							            <div class="input-group-append">
							                <select class="form-select" id="email-domain" style="margin-left: 6px;" onchange="selectBoxChange(this.value)">
							                	<option value="">직접입력</option>
							                    <option value="gmail.com" <c:if test="${fn:contains(ceo.c_email2, 'gmail.com')}">selected</c:if>>gmail.com</option>
							                    <option value="naver.com" <c:if test="${fn:contains(ceo.c_email2, 'naver.com')}">selected</c:if>>naver.com</option>
							                    <option value="daum.net" <c:if test="${fn:contains(ceo.c_email2, 'daum.com')}">selected</c:if>>daum.net</option>
							                </select>
							            </div>
							        </div>
							    </td>
							</tr>
						  </tbody>
                	</table>
					<div style="margin-left:420px;">
					    <button type="submit" class="btn btn-dark mt-2" onclick="upOK()" style="color: white;">수정완료</button>
					</div>
                </form>
                <!-- 내정보 수정 폼 끝 -->
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