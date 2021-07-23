<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<!-- mypage/alarmSetup.jsp -->
<!-- <title>회원 가입</title>
</head>
<body> -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2">
						<!-- 전체 페이지에서 왼쪽 패널  -->
					</div>
					<div class="col-md-8">
						<!-- 전체 페이지 메인 패널 -->
						<div class="row">
							<div class="col-md-3">
								<!-- 내부 패널 왼쪽 -->
								<%@ include file="mypage_include/mypage_left.jsp"%>
							</div>
							<div class="col-md-9">
								<!-- 내부 패널 메인 -->
								<form role="form" id="join" action="joinRun" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label for="user_id">아이디*</label> 
										<input type="text" class="form-control" id="user_id" name="user_id" /> 
										<br />
										<button type="button" class="btn btn-small btn-danger" id="btnCheckDupId">아이디 중복 확인</button>
										<span id="checkDupIdResult"></span>
									</div>
									<div class="form-group">
										<label for="user_pw">비밀번호*</label> 
										<input type="password" class="form-control" id="user_pw" name="user_pw" required />
									</div>
									<div class="form-group">
										<label for="user_pw2">비밀번호 확인</label>
										<input type="password" class="form-control" id="user_pw2" required />
									</div>
									<div class="form-group">
										<label for="user_name">이름</label>
										<input type="text" class="form-control" id="user_name" name="user_name" />
									</div>
									<div class="form-group">
										<label for="user_email">이메일*</label>
										<input type="email"	class="form-control" id="user_email" name="user_email" />
									</div>
									<div class="form-group">
										<label for="user_name">연락처</label>
										<input type="text" class="form-control" id="user_name" name="user_name" />
									</div>
									<div>
										<label for="cars">차</label>
									</div>
									<div class="form-group">
										<label for="cars">차</label>
										<select name="cars" id="cars">
											<option value="volvo">Volvo</option>
											<option value="saab">Saab</option>
											<option value="opel">Opel</option>
											<option value="audi">Audi</option>
										</select> <br>
										
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-primary">가입완료</button>
									</div>
								</form>
							</div> <!-- </div class="row"> --> 
						</div> <!-- 내부 패널 메인  끝 -->
					</div> 	<!-- 전체 페이지 메인 패널 끝 -->
					<div class="col-md-2">
						<!-- 전체 페이지 오른쪽 패널 -->
					</div>
				</div> <!-- </div class="row"> -->
			</div> <!-- </div class="col-md-12"> -->
		</div> <!-- </div class="row"> -->
	</div> <!-- <div class="container-fluid"> -->
</body>

<%@ include file="../include/footer.jsp"%>