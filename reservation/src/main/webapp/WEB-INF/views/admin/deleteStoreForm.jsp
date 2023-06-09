<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
  <div class="py-5 text-center">
    <h2>가게 관리</h2>
  </div>
<div class="container">

  <form action="adminStoreUpdate" method="post">
    <div>
      <label for="restaurantIdx">가게 번호</label>
      <input type="text" id="#" name="#" class="form-control" value="${restaurantVO.res_idx }" disabled="disabled">
      <input type="hidden" id="res_idx" name="res_idx" class="form-control" value="${restaurantVO.res_idx }">
    </div>
    <div>
      <label for="ceoIdx">점주 이름</label>
      <input type="text" id="#" name="#" class="form-control" value="${restaurantVO.c_name }" disabled="disabled">
      <input type="hidden" id="c_name" name="c_name" class="form-control" value="${restaurantVO.c_name }">
    </div>
    <div>
      <label for="restaurantBrn">사업자등록번호</label>
      <input type="text" id="#" name="#" class="form-control" value="${restaurantVO.res_brn }" disabled="disabled">
      <input type="hidden" id="res_brn" name="res_brn" class="form-control" value="${restaurantVO.res_brn }">
    </div>
    <div>
      <label for="restaurantName">가게 이름</label>
      <input type="text" id="#" name="#" class="form-control" value="${restaurantVO.res_name }" disabled="disabled">
      <input type="hidden" id="res_name" name="res_name" class="form-control" value="${restaurantVO.res_name }">
    </div>
    <div>
      <label for="restaurantTel">가게 전화번호</label>
      <input type="text" id="res_tel" name="res_tel" class="form-control" value="${restaurantVO.res_tel }">
    </div>
    <div>
      <label for="restaurantAdress">가게 주소</label>
      <input type="text" id="res_address" name="res_address" class="form-control" value="${restaurantVO.res_address }">
    </div>
    <div>
      <label for="restaurantAdress">가게 상세 주소</label>
      <input type="text" id="res_detailAddress" name="res_detailAddress" class="form-control" value="${restaurantVO.res_detailAddress }">
    </div>

    <hr class="my-4">

   <div class="row">
      <div class="col">
        <button class="w-100 btn btn-info btn-lg" type="submit">수정하기</button>
      </div>
   </div>
   <br>
   <div class="row">
      <div class="col">
        <button class="w-100 btn btn-danger btn-lg" type="button" onclick="location.href='deleteStore?idx=${restaurantVO.res_idx}'">삭제하기</button>
        </div>
   </div>
   <br>
   <div class="row">
      <div class="col">        
        <button class="w-100 btn btn-secondary btn-lg" onclick="location.href='adminStore'" type="button">취소</button>
      </div>
   </div>
  </form>
</div> <!-- /container -->

</body>
</html>