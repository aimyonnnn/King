<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- CSS -->
    <link href="${pageContext.request.contextPath }/resources/css/help.css" rel="styleSheet" type="text/css">
</head>
<body>
<%@ include file="../common/common_header.jsp" %>

<!-- ==================================================================================================================================== -->
<!-- 상단 부분 inclue넣을꺼니깐 참고용 -->


<!-- 여기부터 공지사항 메뉴 버튼 -->
<div class="container mt-5">
	<div class="row">
		<div class="col">
			<h2 class="display-5 fst-italic fw-bold"><img src="${pageContext.request.contextPath }/resources/images/help.jpg" style="width: 100%;"></h2>
		</div>
	</div>
</div>
<div class="container mt-4">
    <div class="row gy-3 justify-content-center text-center">
        <div class="col-12">
	      <div class="list-group list-group-horizontal">
	        <a href="Notice" class="list-group-item-dark list-group-item-action" aria-current="true">
	          공지사항
	        </a>
	        <a href="FAQ" class="list-group-item-dark list-group-item-action active">FAQ</a>
	        <a href="QNA" class="list-group-item-dark list-group-item-action">Q&A</a>
	      </div>
        </div>
<!-- 서브메뉴버튼 -->
        <div class="col-6">
            <div class="list-group list-group-horizontal">
                <a href="FAQ" class="list-group-item-dark list-group-item-action" aria-current="true">회원</a>
                <a href="FAQ2" class="list-group-item-dark list-group-item-action active">점주</a>
            </div>
        </div>
    </div>
</div>
<!-- FAQ 목록 페이지 -->

<div class="container my-5">
	<div class="accordion" id="accordionExample">
		<div class="accordion-item">
		<h2 class="accordion-header">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                Q.  가게를 삭제하고 싶어요!
            </button>
        </h2>
        <div id="collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
            <div class="accordion-body">
                A. 가게 삭제를 원하시나요? <br>
                가게 삭제를 원하실 경우 Q&A [문의하기] 버튼을 클릭하신후 문의 내용에<br>
                삭제하고 싶으신 가게명과 사업자번호를 남겨주시면 확인 후 삭제 해드리겠습니다.
            </div>
        </div>
        </div>
        <div class="accordion-item">
        <h2 class="accordion-header">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                Q.  가게 정보를 수정하고 싶어요!
            </button>
        </h2>
        <div id="collapseTwo" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
            <div class="accordion-body">
                A. 가게 정보를 수정하고 싶으신가요?<br>
                로그인 후 [마이페이지] - [가게 리스트] - 수정하고 싶으신 가게 -[수정] 버튼을 클릭 후<br>
                변경하고싶으신 항목을 수정하실 수 있습니다.
            </div>
        </div>
        </div>
        <div class="accordion-item">
        <h2 class="accordion-header">
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                Q.  내가 등록한 가게를 확인하고 싶어요!
            </button>
        </h2>
        <div id="collapseThree" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
            <div class="accordion-body">
                A. 
                로그인 후 [마이페이지] - [가게 리스트] - 확인하고 싶으신 가게의 가게명을 클릭하시면<br>
                해당 가게의 상세페이지로 이동하여 확인하실수 있습니다.
            </div>
        </div>
        </div>
    </div>
</div>
<!-- FAQ 목록 페이지 -->

<!-- 하단 부분은 나중에 inclue로 넣을꺼니깐 참고 -->
<!-- ==================================================================================================================================== -->

<hr style="margin-top: 100px;">
<%@ include file="../common/common_footer.jsp" %>



 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>