<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<!-- mypage/alarmSetup.jsp -->
<title>알람 설정</title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="row">
					<%@ include file="mypage_include/mypage_left.jsp"%>
					<div class="col-md-9">
						<form role="form" id="frmProfile" action="joinRun" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="user_id">알림 설정</label> 
								<input type="text" class="form-control" id="user_id" name="user_id" /> <br/>
								<button type="button" class="btn btn-small btn-danger"
									id="btnCheckDupId">닉네임 중복 확인</button>
								<span id="checkDupIdResult"></span>
							</div>
							<div class="form-group">
								<label for="floatingTextarea2">프로필 정보</label> 
							  	<textarea class="form-control" placeholder="프로필을 입력해주세요..." id="floatingTextarea2" 
							  			style="height: 100px"></textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputFile">사진</label> <input type="file"
									class="form-control-file" id="file" name="file" />
							</div>
							<button type="submit" class="btn btn-primary">프로필 저장</button>
						</form>
					</div>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
</div>
</body>
<%@ include file="../include/footer.jsp"%>