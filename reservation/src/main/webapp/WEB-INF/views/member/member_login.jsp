<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
 
	<!-- Required meta tags -->
	<meta charset="utf-8">
	
	<!-- Bootstrap CSS -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
		
	<title>Login</title>
	
	<!-- login.css 추가 -->
	<link href="${pageContext.request.contextPath }/resources/css/member_login.css" rel="stylesheet">
	
	<!-- jQuery CDN -->
	<script
            src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer">
    </script>
    	
    <script>
    $(function() {

      // 카카오 로그인 후 회원가입 진행 시
	  // 로컬의 세션 스토리지에 저장 한 이메일과 닉네임을 <input> 요소에 설정
	  let nickname = sessionStorage.getItem('nickname');
	  let email = sessionStorage.getItem('email');
	  $('#m_nickname').val(nickname);
	  $('#m_email').val(email);
	  $('#c_email').val(email);
	  
	  // 세션 스토리지에 카카오 이메일 값이 존재할 경우에 회원가입 모달창 자동으로 실행
	  // 모달창 실행 후 세션 스토리지에 저장된 이메일과 닉네임을 삭제
	  if (email) {
		  $('#personal-modal').modal('show');
		  sessionStorage.removeItem("nickname");
		  sessionStorage.removeItem("email");
	  }
	
	  // 세션 스토리지에 카카오 이메일 값이 존재할 경우에 <input> 요소를 읽기 전용으로 설정
	  if (email) {
	    $('#m_email').attr('readOnly', 'readOnly');
	    $('#c_email').attr('readOnly', 'readOnly');
	  }
	
	  // 개인회원 클릭 시
	  $(".personalButton").click(function() {
	    $(".form").removeClass("businessLogin").addClass("personalLogin");
	    $('.join').attr('data-bs-target', '#personal-modal');
	  });
	
	  // 기업회원 클릭 시
	  $(".businessButton").click(function() {
	    $(".form").removeClass("personalLogin").addClass("businessLogin");
	    $('.join').attr('data-bs-target', '#business-modal');
	  });
	});
    
    // 새 창 열렸을 때 창크기 조절
	function openNewWindow(url) {
		event.preventDefault(); // 기본 동작인 링크 이동을 막습니다.
 	  
		// 새 창의 크기 및 위치를 지정합니다.
		var width = 800;
		var height = 600;
		var left = (window.innerWidth - width) / 2;
		var top = (window.innerHeight - height) / 2;
 	  
		// 전달된 url로 이동
		var newWindow = window.open(url, '_blank', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);
		
		// 팝업이 차단되어있을 경우 경고메세지
		if (!newWindow || newWindow.closed || typeof newWindow.closed == 'undefined') {
			alert("팝업 차단되었습니다. 팝업 차단을 해제하고 다시 시도하세요.");
		}
		
	}
    
    </script>
    
</head>
<body>
	<jsp:include page="../common/common_header.jsp"/>
	
	<!-- 세션 아이디가 존재하지 않을 경우에만 로그인폼을 출력 -->
	<div class="container">
	<c:choose>	
		<c:when test="${empty sessionScope.sId }">
			<!-- 로그인 시작 -->
			<div class="form personalLogin" style="margin-top: 30px;">
				<form action="loginPro" method="post">
					<div class="form-header">
					    <div class="personalButton">개인회원</div>
					    <div class="businessButton">기업회원</div>
					</div>
	                  <!-- 아이디, 비번 입력 -->
                	 <div class="form-elements">
                     <div class="form-element">
                        <input type="text" placeholder="아이디" name="id" value="${cookie.rememberId.value }">
                     </div>
                    <div class="form-element">
                      <input type="password" placeholder="비밀번호" name="passwd">
				    </div>
				    	<div class="form-element d-flex flex-row">
				    		<button type="submit" id="submit-btn">로그인</button>
				    	</div>
				    </div>
				    	<div class="form-wrapper">
							<div class="mt-2">
							    <input type="checkbox" id="rememberId" name="rememberId" ${empty cookie.rememberId.value ? "" : "checked"}>
							    <label for="rememberId">아이디 저장</label>
							</div>
							<!-- 회원가입, 아이디/비밀번호 찾기 -->
							<div class="signup-forgotten">
							    <a class="join" data-bs-toggle="modal" data-bs-target="#personal-modal">회원가입</a> | 
							    <a class="forgotten" onclick="location.href='forgotten'">아이디/비밀번호 찾기</a>
							</div>
					    	<div class="mt-2 sns-login-title text-center text-muted">
								<div class="d-flex align-items-center mb-2 w-100">
									<span class="lineLogin"></span>
									SNS 로그인
									<span class="lineLogin"></span>
								</div>
							</div>
						    <div class="form-element d-flex flex-column">
						        <!-- 카카오 로그인 -->
						        <!-- <button type="button" id="submit-btn" onclick="loginWithKakao()" style="background-color: #FEE500; color: #000000 85%;">카카오 로그인</button> -->
						        <img src="${pageContext.request.contextPath}/resources/images/kakao_logo.jpg" onclick="loginWithKakao()" style="margin-bottom: 6px;">
						        <!-- 네이버 로그인 -->
						        <img src="${pageContext.request.contextPath}/resources/images/naver_logo.jpg" id="naverIdLogin_loginButton">
						    </div>
						</div>
				</form>
			</div>
		</c:when>
		<c:otherwise>
				<!-- 세션 아이디가 존재할 경우 -->
		</c:otherwise>
	</c:choose>
	</div>
		
		<!-- 카카오 로그인 시작 -->
		<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
		<script type="text/javascript">
		    Kakao.init('082bc23de092d792956cd62812f9a103');
		    Kakao.isInitialized();
		    function loginWithKakao() {
		        Kakao.Auth.login({
		        	// 닉네임 이용 중 동의 설정 후 받아오기
		            scope: "profile_nickname, account_email",
		            success: function (response) {
		                Kakao.API.request({
		                    url: '/v2/user/me',
		                    success: function (response) {
								// 이메일과 닉네임을 변수에 저장		                    	
		                        var email = response.kakao_account.email;
		                        var nickname = response.kakao_account.profile.nickname;
		                        
		                        // JSON 객체 출력하기
		                        console.log(JSON.stringify(response));
// 		                        alert(JSON.stringify(response));
		                        
		                        // ajax요청
		                        // 이메일을 사용하여 회원가입 여부 판별
		                        $.ajax({
		                            url: '<c:url value="/checkUser"/>',
		                            method: 'POST',
		                            data: {email: email, nickname: nickname},
		                            success: function (result) {
		                                if (result === 'new') {
		                                	// DB에 카카오에서 받아온 이메일이 존재하지 않을 경우 => 회원가입 진행
		                                	alert('카카오 로그인 성공! 회원가입을 완료해주세요');
		                                	console.log('카카오 로그인 성공! 회원가입을 완료해주세요');
		                                	
		                                	// 회원가입 진행시 자동으로 값을 입력해주기 위해서
		                                	// 로컬의 세션 스토리지에 이메일과 닉네임 저장
		                                    sessionStorage.setItem('email', email);
		                                    sessionStorage.setItem('nickname', nickname);
											
		                                    // 회원가입 페이지로 이동
		                                    location.href = '<c:url value="/loginForm"/>';
		                                    
		                                } else if (result === 'existing') {
		                                	alert('카카오 로그인 성공!')
		                                	// DB에 이메일이 존재할 경우 => 이미 가입된 회원인 경우
		                                	// 세션 스토리지 값 비우기
		                                	sessionStorage.removeItem("nickname");
		                        			sessionStorage.removeItem("email");
		                        			
		                                	console.log('기존 회원이므로 로그인 처리 진행');
		                                	
		                                    // 로그인 완료 후 메인 페이지로 이동
		                                    location.href = '<c:url value="/" />';
		                                }
		                            }
		                        });
		                    },
		                    fail: function (error) {
		                        alert(JSON.stringify(error));
		                    }
		                });
		            },
		            fail: function (error) {
		                alert(JSON.stringify(error));
		            }
		        });
		    }
		</script>
		<!-- 카카오 로그인 끝 -->
		
		<!-- 네이버 로그인 시작 -->
		<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
		<script>
		var naverLogin = new naver.LoginWithNaverId(
				{
					clientId: "0591cHHMSEoSaK8mneX2", // cliendId
					callbackUrl: "http://c5d2302t2.itwillbs.com/reservation/loginForm", // Callback URL => 콜백 URL을 8089 or 8080로 수정해주면 됨! 네이버 로그인 현재 검수 신청해놨습니다!
					isPopup: false,
					callbackHandle: true
				}
			);	
		
		naverLogin.init();
		
		$('#naverIdLogin_loginButton').on('click', function() {
			  naverLogin.getLoginStatus(function(status) {
				  
			    if (status) {
			      var email = naverLogin.user.getEmail();
			      console.log(email);
			      console.log(naverLogin);
			      
			      $.ajax({
			        type: 'post',
			        url: '<c:url value="/checkUserNaver"/>',
			        data: {email: email},
			        dataType: 'text',
			        success: function(response) {
			          console.log(response);
			          if (response === 'new') {
			        	  
			            sessionStorage.setItem('email', email);
			            location.href = '<c:url value="/loginForm"/>';
			            alert('네이버 로그인 성공! 회원가입을 완료해주세요');
			            
			          } else if (response === 'existing') {
			            sessionStorage.removeItem("email");
			            location.href = '<c:url value="/" />';
			            alert('네이버 로그인 성공!')
			          }
			          
			        },
			        error: function(xhr, status, error) {
			          console.log(error);
			        }
			      });
			    } else {
			      alert("fail");
			    }
			  });
			});
		</script>
		<!-- 네이버 로그인 끝 -->
		
	
	<!-- 개인회원 모달창 -->
	<div class="modal fade" id="personal-modal" tabindex="-1" aria-labelledby="personalModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title fs-5" id="personalModalLabel">개인회원가입</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>
          			<!-- 개인회원 form 시작 -->
          			<form class="validation-form" action="memberJoinPro" method="post" novalidate>
						<div class="container">
			            	<h3 class="fs-3">Clean Plate로 식당 예약 간편하게!</h3>
			            	<div class="input-container">
				                <label for="m_id" style="width: 100%;">아이디<br></label>
				                	<input type="text" name="m_id" id="m_id" class="form-control" placeholder="4~20자리 / 영문, 숫자, 특수문자'_' 사용가능" minlength="4" maxlength="20" pattern="^[A-Za-z0-9_]{4,20}$" oninput="checkId()" required>
			                	<div class="invalid-feedback">
				                    아이디는 4~20자리의 영문, 숫자 특수문자'_'만 사용 가능합니다.
				                </div>
	              			</div>
							<div class="input-container">
								<label for="m_passwd" style="width: 100%;">비밀번호<br></label>
							    	<input type="password" name="m_passwd" id="m_passwd" class="form-control" placeholder="8~16자리/영문, 숫자, 특수문자 조합" minlength="8" maxlength="16" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}$" required>
								<div class="invalid-feedback">
				                    비밀번호는 8~16자리의 영문, 숫자 특수문자 조합만 사용 가능합니다.
				                </div>
							</div>
							<div class="input-container">
								<label for="m_passwdCheck" style="width: 100%;">비밀번호 확인<br></label>
									<input type="password" name="m_passwdCheck" id="m_passwdCheck" class="form-control" required>
								<div class="invalid-feedback" id="password-error">
				                    비밀번호가 일치하지 않습니다.
				                </div>
	              			</div>
							<div class="input-container">
								<label for="m_name" style="width: 100%;">이름<br></label>
									<input type="text" name="m_name" id="m_name" class="form-control" minlength="2" maxlength="13" pattern="^[가-힣A-Za-z\s]+$" placeholder="이름을 두글자 이상 입력" required>
								<div class="invalid-feedback">
				                    이름을 한글과 영문으로만 입력해주세요.
				                </div>
							</div>
							<div class="input-container">
								<label for="m_nick" style="width: 100%;">닉네임<br></label>
									<input type="text" name="m_nick" id="m_nick" class="form-control" minlength="2" maxlength="10"  pattern="^[가-힣A-Za-z\s]+$" required>
								<div class="invalid-feedback">
				                    닉네임은 최대 10글자까지 입력해주세요.
				                </div>
							</div>
							<div class="input-container">
								<label for="m_birth" style="width: 100%;">생년월일<br></label>
									<input type="text" name="m_birth" id="m_birth" class="form-control" placeholder="YYYY-MM-DD 형식으로 입력" maxlength="10" pattern="^[0-9]{4}-[0-9]{2}-[0-9]{2}$" required>
								<div class="invalid-feedback">
				                    생년월일을 입력해주세요. 예시) 1990-10-01
				                </div>
							</div>
	              			<!-- 휴대폰 번호 인증 버튼 -->
							<div class="input-container">
								<label for="m_tel">전화번호<br></label>
								<div class="d-flex flex-row">
									<input type="text" name="m_tel" id="m_tel" class="form-control" placeholder="'-'빼고 숫자만 입력" minlength="9" maxlength="15" pattern="^[0-9]+$" style="width: 77%;" required>
									<button type="button" class="ml-2 btn btn-dark" id="verifyRequest" style="margin-left: 7px;">인증요청</button>
								</div>
								<div class="invalid-feedback">
				                    전화번호를 숫자만 입력해주세요.
				                </div>
							</div>
	              			<div class="input-container">
			                <label for="verifyNum">인증번호<br></label>
			                	<div class="d-flex flex-row">
				                	<input type="text" id="verifyNum" class="form-control" maxlength="4" pattern="^[0-9]{4}$"  style="width: 77%;" required>
		                			<button type="button" class="btn btn-dark" id="verifyConfirm" style="margin-left: 7px;">인증확인</button>
			                	</div>
		                	<div class="invalid-feedback">
			                    인증번호를 입력해주세요.
			                </div>
	              			</div>
							<div class="input-container">
								<label for="m_email" style="width: 100%;">이메일<br></label>
									<input type="text" name="m_email" id="m_email" class="form-control" placeholder="xxx@xxxx.xxx 형식으로 입력" pattern="^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]{2,})+$" minlength="5" required>
								<div class="invalid-feedback">
				                    이메일을 입력해주세요.
				                </div>
							</div>
	              			<!-- 약관 시작 -->
	              			<div class="cont_division">
	                			<span class="terms_agree">약관</span>
	                			<div class="agree_box border border-bottom" style="border-radius: 5px;">
	                  				<ul class="agree_article" style="margin-top:10px; margin-left: -15px;">
									<li style="list-style-type: none;">
										<div class="InpBox">
											<div class="form-check">
												<input class="form-check-input" type="checkbox" id="agreeAll">
												<label class="form-check-label" for="agreeAll">
													<strong class="all_agree">전체 동의</strong>
												</label>
											</div>
											<input type="hidden" name="hidden_check_all" value="0" id="hidden_check_all">
										</div>
									</li>
									</ul>
									<ul class="agree_article depth2" style="margin-left: -15px;">
									<li style="list-style-type: none;">
										<div class="agree_desc">
											<div class="InpBox">
												<div class="form-check">
													<input class="form-check-input" type="checkbox" name="agreeCheck" id="agree_rule1" required>
														<label class="form-check-label" for="agree_rule1">
															<span><strong>(필수) 회원 약관에 동의</strong></span>
														</label>
												</div>
											</div>
										</div>
										<a class="view_indetail" target="_blank" onclick="openNewWindow('registrationForm')">
											<span class="blind">회원 약관 상세보기</span>
										</a>
									</li>
	                    			<li style="list-style-type: none;">
	                      				<div class="agree_desc">
											<div class="InpBox">
												<div class="form-check">
													<input class="form-check-input" type="checkbox" name="agreeCheck" id="agree_take1" required>
														<label class="form-check-label" for="agree_take1">
															<span><strong>(필수) 개인정보 수집 및 이용에 동의</strong></span>
														</label>
												</div>
											</div>
										</div>
										<a id="popupClausePrivacyPerson" class="view_indetail popup_clause_open" target="_blank" onclick="openNewWindow('piAgreeForm')">
											<span class="blind">개인정보 수집 및 이용에 동의 약관 상세보기</span>
										</a>
	                    			</li>
	                  				</ul>
								</div>
							</div>
							<div class="input-container">
								<label for="agree_privacy">개인정보 수집 및 이용에 대한 안내 및 동의<br></label>
								<textarea id="agree_privacy" rows="5" readonly style="width: 100%;">본인은 [개인정보 수집 및 이용]안내 및 본인의 동의에 대하여 모두 확인하였으며, 동의합니다.

이용자는 개인정보 제공에 동의하지 않거나 개인정보 기재를 거부할 권리가 있으나, 이 경우 회원 가입 및 이용이 제한될 수 있습니다.</textarea>
							</div>
						</div>
						<!-- 약관 끝 -->
						<!-- 회원가입 버튼 -->
						<div class="d-flex justify-content-center">
							<button type="submit" class="mt-1 btn btn-dark" id="signup-button">회원가입</button>
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 개인회원 모달창 끝 -->
	
	<!-- CoolSMS 문자인증 시작 -->
	<script>
	$('#verifyRequest').click(function(){
		let to = $('input[id="m_tel"]').val();
		$.ajax({
			url : '<c:url value="/checkPhone"/>',
			type : "POST",
			data : "to=" + to,
			dataType : "json",
			success : function(data) {
				let checkNum = data;
				alert('checkNum:'+ checkNum);
				$('#verifyConfirm').click(function(){
					let userNum = $('input[id="verifyNum"]').val();		
					if(checkNum == userNum){
						alert('인증 성공하였습니다.');
					}else {
						alert('인증 실패하였습니다. 다시 입력해주세요.');
					}
				});
			},
			error : function() {
				alert("에러")
			}
		});
	});
	</script>
	<!-- CoolSMS 문자인증 끝 -->
	
	<!-- 기업회원 모달창 -->
	<div class="modal fade" id="business-modal" tabindex="-1" aria-labelledby="businessModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="businessModalLabel">기업회원가입</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div>
					<!-- form 태그 시작 -->
					<form class="validation-form" action="ceoJoinPro" method="post" novalidate>
						<div class="container">
							<h3>Clean Plate로 식당 예약 간편하게!</h3>
							<div class="input-container">
								<label for="c_id" style="width: 100%;">아이디<br></label>
									<input type="text" name="c_id" id="c_id" class="form-control" placeholder="4~20자리 / 영문, 숫자, 특수문자'_' 사용가능" minlength="4" maxlength="20" pattern="^[A-Za-z0-9_]{4,20}$" oninput="checkBusinessId()" required>
									<div class="invalid-feedback">
						                    아이디는 4~20자리의 영문, 숫자 특수문자'_'만 사용 가능합니다.
						            </div>
		              			</div>
							<div class="input-container">
								<label for="c_passwd" style="width: 100%;">비밀번호<br></label>
							    	<input type="password" name="c_passwd" id="c_passwd" class="form-control" placeholder="8~16자리/영문, 숫자, 특수문자 조합" minlength="8" maxlength="16" pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}$" required>
								<div class="invalid-feedback">
				                    비밀번호는 8~16자리/영문, 숫자, 특수문자 조합만 사용 가능합니다.
				                </div>
							</div>
							<div class="input-container">
								<label for="c_passwdCheck" style="width: 100%;">비밀번호 확인<br></label>
									<input type="password" name="c_passwdCheck" id="c_passwdCheck" class="form-control" required>
								<div class="invalid-feedback" id="password-error2">
				                    비밀번호가 일치하지 않습니다.
				                </div>
	              			</div>
							<div class="input-container">
								<label for="c_name" style="width: 100%;">이름<br></label>
									<input type="text" name="c_name" id="c_name" class="form-control" placeholder="이름 입력" minlength="2" maxlength="13" pattern="^[가-힣A-Za-z\s]+$" required>
								<div class="invalid-feedback">
				                    이름을 입력해주세요.
				                </div>
							</div>
 							<!-- 휴대폰 번호 인증 버튼 -->
							<div class="input-container">
								<label for="c_tel">전화번호<br></label>
									<div class="d-flex flex-row">
										<input type="text" name="c_tel" id="c_tel" class="form-control" placeholder="'_'빼고 숫자만 입력" minlength="9" maxlength="15" pattern="^[0-9]+$" style="width:77%;" required>
										<button type="button" class="btn btn-dark" id="businessRequest" style="margin-left: 7px;">인증요청</button>
									</div>
								<div class="invalid-feedback">
				                    전화번호를 숫자만 입력해주세요.
				                </div>
							</div>
							<div class="input-container">
								<label for="businessNum">인증번호<br></label>
									<div class="d-flex flex-row">
										<input type="text" id="businessNum" class="form-control" maxlength="4" pattern="^[0-9]{4}$" style="width:77%" required>
										<button type="button" class="btn btn-dark" id="businessConfirm" style="margin-left: 7px;">인증확인</button>
									</div>
								<div class="invalid-feedback">
				                    인증번호를 입력해주세요.
				                </div>
							</div>
							<div class="input-container">
								<label for="c_email" style="width: 100%;">이메일<br></label>
									<input type="text" name="c_email" id="c_email" class="form-control" placeholder="xxx@xxxx.xxx 형식으로 입력" pattern="^[a-zA-Z0-9+-_.]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]{2,})+$" minlength="5" required>
								<div class="invalid-feedback">
				                    이메일을 입력해주세요.
				                </div>
							</div>
	              			<!-- 약관 시작 -->
	              			<div class="cont_division">
	                			<span class="terms_agree">약관</span>
	                			<div class="agree_box border border-bottom" style="border-radius: 5px;">
	                  				<ul class="agree_article" style="margin-top:10px; margin-left: -15px;">
									<li style="list-style-type: none;">
										<div class="InpBox">
											<div class="form-check">
												<input class="form-check-input" type="checkbox" id="agreeAllCeo">
												<label class="form-check-label" for="agreeAllCeo">
													<strong class="all_agree">전체 동의</strong>
												</label>
											</div>
											<input type="hidden" name="hidden_check_all" value="0" id="hidden_check_all">
										</div>
									</li>
									</ul>
									<ul class="agree_article depth2" style="margin-left: -15px;">
									<li style="list-style-type: none;">
										<div class="agree_desc">
											<div class="InpBox">
												<div class="form-check">
													<input class="form-check-input" type="checkbox" name="agreeCheckCeo" id="agree_rule2" required>
														<label class="form-check-label" for="agree_rule2">
															<span><strong>(필수) 회원 약관에 동의</strong></span>
														</label>
												</div>
											</div>
										</div>
										<a class="view_indetail" target="_blank" onclick="openNewWindow('registrationForm')">
											<span class="blind">회원 약관 상세보기</span>
										</a>
									</li>
	                    			<li style="list-style-type: none;">
	                      				<div class="agree_desc">
											<div class="InpBox">
												<div class="form-check">
													<input class="form-check-input" type="checkbox" name="agreeCheckCeo" id="agree_take2" required>
														<label class="form-check-label" for="agree_take2">
															<span><strong>(필수) 개인정보 수집 및 이용에 동의</strong></span>
														</label>
												 </div>
											</div>
										</div>
										<a id="popupClausePrivacyPerson" class="view_indetail popup_clause_open" target="_blank" onclick="openNewWindow('piAgreeForm')">
											<span class="blind">개인정보 수집 및 이용에 동의 약관 상세보기</span>
										</a>
	                    			</li>
	                  				</ul>
								</div>
							</div>
							<div class="input-container">
								<label for="agree_privacy">개인정보 수집 및 이용에 대한 안내 및 동의<br></label>
								<textarea id="agree_privacy" rows="5" readonly style="width: 100%;">본인은 [개인정보 수집 및 이용]안내 및 본인의 동의에 대하여 모두 확인하였으며, 동의합니다.

이용자는 개인정보 제공에 동의하지 않거나 개인정보 기재를 거부할 권리가 있으나, 이 경우 회원 가입 및 이용이 제한될 수 있습니다.</textarea>
							</div>
						</div>
						<!-- 약관 끝 -->
						<!-- 회원가입 버튼 -->
						<div class="d-flex justify-content-center">
							<button type="submit" class="mt-1 btn btn-dark" id="signup-button">회원가입</button>
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 기업회원 모달창 끝 --> 
	
	<!-- 개인회원/기업회원 모달창 공통 스크립트 -->
	<script>
	// 개인회원 - 체크박스 
	$(document).ready(function() {
		$("#agreeAll").click(function() {
			if($("#agreeAll").is(":checked")) $("input[name=agreeCheck]").prop("checked", true);
			else $("input[name=agreeCheck]").prop("checked", false);
		});

		$("input[name=agreeCheck]").click(function() {
			var total = $("input[name=agreeCheck]").length;
			var checked = $("input[name=agreeCheck]:checked").length;

			if(total != checked) $("#agreeAll").prop("checked", false);
			else $("#agreeAll").prop("checked", true); 
		});
	});
	
	// 기업회원 - 체크박스 
	$(document).ready(function() {
		$("#agreeAllCeo").click(function() {
			if($("#agreeAllCeo").is(":checked")) $("input[name=agreeCheckCeo]").prop("checked", true);
			else $("input[name=agreeCheckCeo]").prop("checked", false);
		});
	
		$("input[name=agreeCheckCeo]").click(function() {
			var total = $("input[name=agreeCheckCeo]").length;
			var checked = $("input[name=agreeCheckCeo]:checked").length;
	
			if(total != checked) $("#agreeAllCeo").prop("checked", false);
			else $("#agreeAllCeo").prop("checked", true); 
		});
	});
	
	  // 개인회원 비밀번호 확인
	  $(document).ready(function() {
	    $('#m_passwdCheck').on('input', function() {
	      var password = $('#m_passwd').val().trim();
	      var confirmPassword = $(this).val().trim();
	
	      if (password !== confirmPassword) {
	        $(this).removeClass('is-valid').addClass('is-invalid');
	        $('#password-error').show();
	      } else {
	        $(this).removeClass('is-invalid').addClass('is-valid');
	        $('#password-error').hide();
	      }
	    });
	  });
	
	 
	// 기업회원 비밀번호 확인
	$(document).ready(function() {
	  $('#c_passwdCheck').on('input', function() {
	    var password = $('#c_passwd').val().trim();
	    var confirmPassword = $(this).val().trim();
	
	    if (password !== confirmPassword) {
	      $(this).removeClass('is-valid').addClass('is-invalid');
	      $('#password-error2').show();
	    } else {
	      $(this).removeClass('is-invalid').addClass('is-valid');
	      $('#password-error2').hide();
	    }
	  });
	});
	
	// 유효성 검사
 	window.addEventListener('load', () => {
        const forms = document.getElementsByClassName('validation-form');

        Array.prototype.filter.call(forms, (form) => {
            form.addEventListener('submit', function (event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    }, false);
	</script>
	<!-- 개인회원/기업회원 모달창 공통 스크립트 끝 -->
	
	<!-- CoolSMS 문자인증 시작 -->
	<script>
	$('#businessRequest').click(function(){
		let to = $('input[id="c_tel"]').val();
		$.ajax({
			url : '<c:url value="/checkPhone"/>',
			type : "POST",
			data : "to=" + to,
			dataType : "json",
			success : function(data) {
				let checkNum = data;
				alert('checkNum:'+ checkNum);
				$('#businessConfirm').click(function(){
					let userNum = $('input[id="businessNum"]').val();		
					if(checkNum == userNum){
						alert('인증 성공하였습니다.');
					}else {
						alert('인증 실패하였습니다. 다시 입력해주세요.');
					}
				});
			},
			error : function() {
				alert("에러")
			}
		});
	});
	</script>
	<!-- CoolSMS 문자인증 끝 -->
	
	<!-- 일반회원 아이디 실시간 중복 체크 -->
	<script>
		$(() => {
		    $("input[name=m_id]").on('input', () => {
		        var inputVal = $("input[name=m_id]").val();
		        console.log(inputVal);
		        $.ajax({
		            data: {
		                m_id: inputVal
		            },
		            url: '<c:url value="/dupId"/>',
		            success: function(response) {
		            	console.log(response);
		                if (response === "1") { // 아이디가 중복되었을 때
		                    alert("중복된 아이디 입니다.");
		                    $("input[name=m_id]").focus();
		                    $("input[name=m_id]").css('color', 'red');
		                } else if (response === "0") {
		                	console.log('사용 가능한 아이디 입니다.');
	// 		                    alert("사용 가능한 아이디 입니다.");
		                    $("input[name=m_id]").css('color', 'green');
		                }
		            }
		        });
		    });
		});
	</script>
	
	<!-- 기업회원 아이디 실시간 중복 체크 -->
	<script>
		$(() => {
		    $("input[name=c_id]").on('input', () => {
		        var inputVal = $("input[name=c_id]").val();
		        console.log(inputVal);
		        $.ajax({
		            data: {
		            	c_id: inputVal
		            },
		            url: '<c:url value="/dupId2"/>',
		            success: function(response) {
		            	console.log(response);
		                if (response === "1") { // 아이디가 중복되었을 때
		                    alert("중복된 아이디 입니다.");
		                    $("input[name=c_id]").focus();
		                    $("input[name=c_id]").css('color', 'red');
		                } else if (response === "0") {
		                	console.log('사용 가능한 아이디 입니다.');
	// 		                    alert("사용 가능한 아이디 입니다.");
		                    $("input[name=c_id]").css('color', 'green');
		                }
		            }
		        });
		    });
		});
	</script>
	
	<footer class="footer">
		<hr style="margin-top: 100px;">
		<jsp:include page="../common/common_footer.jsp"/>
	</footer>
	
	<!-- Bootstrap CDN -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>