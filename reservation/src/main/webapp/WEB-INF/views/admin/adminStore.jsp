<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimum-scale=1">
	<%--line-awesome icon 사용을 위한 스타일 시트 --%>
	<link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <title>가게 관리</title>
    <link href="${pageContext.request.contextPath }/resources/css/adminDetail.css" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="#">
  </head>
  <body>
<!-- --------------------사이드 바 영역----------------------------  -->
   <input type="checkbox" name="" id="sidebar-toggle">
   
    <div class="sidebar">
      <div class="sidebar-main"> 
        <div class="sidebar-user">
            <img src="${pageContext.request.contextPath }/resources/images/adminProfile.png">
          <div>
            <span>관리자 페이지</span>
          </div>
        </div>

        <div class="sidebar-menu">
          <div class="menu-head">
              <span></span>
            </div>
            <ul>
              <li>
                <a href="./">
                  <span class="las la-home"></span>
                  홈페이지
                </a>
              </li>
              <li>
                <a href="adminMain">
                  <span class="las la-user"></span>
                  관리자 메인
                </a>
              </li>
              <li>
                <a href="adminStatistics">
                  <span class="las la-chart-line"></span>
                  주간 데이터 통계
                </a>
              </li>
            </ul>

          <div class="menu-head">
            <span>MENU</span>
          </div>
          <ul>
            <li>
                <a href="adminMember">
                 <span class="las la-users"></span>
                 회원 관리
                 </a>
            </li>
            <li>
                <a href="adminStore">
                 <span class="las la-store"></span>
                 가게 관리
                 </a>
             </li>
             <li>
                <a href="adminReservation">
                  <span class="las la-history"></span>
                  예약 관리
                </a>
             </li>
            <li>
              <a href="adminAssignment">
                  <span class="las la-exchange-alt"></span>
                 양도 관리
              </a>
            </li>
            <li>
              <a href="adminReview">
                  <span class="las la-comment-dots"></span>
                 리뷰 관리
              </a>
            </li>
           </ul>
           <div class="menu-head">
             <span>2 TEAM</span>
           </div>
            <li><a><span class="las la-crown"></span>박수민</a></li>
            <li><a><span class="las la-laugh"></span>김민진</a></li>
            <li><a><span class="las la-laugh"></span>김보희</a></li>
            <li><a><span class="las la-laugh"></span>이재승</a></li>
            <li><a><span class="las la-laugh"></span>김묘정</a></li>
            <li><a><span class="las la-laugh"></span>이건무</a></li>
        </div>
      </div>
    </div>
<!-- ------------------------------------------------------------------ -->
    <div class="main-content">
      <header>
        <div class="menu-toggle">
          <label for="sidebar-toggle">
            <span class="las la-bars"></span>
          </label>
        </div>
      </header>

     <main>
        <div class="page-header">
          <div>
            <h1>가게 관리</h1>
            <br>
            <small>가게 관리 페이지</small>
          </div>
        </div> 

    <div class="main">
      <div class="title row">
        <div class="col-7">
          <h5 class="title6">총 가게 수 :</h5>
          <h5 class="title6">${restaurantList.size() } 개</h5>
        </div>
      </div>
    </div>
	<br>
    <div class="nav2">
      <table class="zui-table" style="width:100%">
        <thead>
        <tr>
          <th>No.</th>
          <th>가게 이름</th>
          <th>사업자등록번호</th>
          <th>전화 번호</th>
          <th>가게 주소</th>
          <th>점주 이름</th>
          <th>가게 관리</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${restaurantList }" var="restaurant">
        <tr>
          <td>${restaurant.res_idx }</td>
          <td>${restaurant.res_name }</td>
          <td>${restaurant.res_brn }</td>
          <td>${restaurant.res_tel }</td>
          <td>${restaurant.res_address }, ${restaurant.res_detailAddress }</td>
          <td>${restaurant.c_name }</td>
       	  <td><button type="button" class="btn btn-sm btn-primary"
          onclick="location.href='deleteStoreForm?idx=${restaurant.res_idx}'"><i class="la la-gear"></i>정보 수정</button></td>
        </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
    </main>
      
    </div> 
    <label for="sidebar-toggle" class="body-label"></label>
  </body>
</html>