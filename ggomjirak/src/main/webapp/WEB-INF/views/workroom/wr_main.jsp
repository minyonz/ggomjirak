<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 이미지넘기기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<meta charset="UTF-8">
<title>WorkRoom Test</title>
<style>
 body {
 	background-color:#F5F5F5
 }
 
 .box {
    width: 80px;
    height: 80px; 
    border-radius: 70%;
    overflow: hidden;
}
.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.swiper-container {
	height:200px;
	border:5px;
	border-radius:7px;
}
.swiper-slide {
	text-align:center;
	display:flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items:center; /* 위아래 기준 중앙정렬 */
	justify-content:center; /* 좌우 기준 중앙정렬 */
}
.swiper-slide img {
	max-width:100%; /* 이미지 최대너비를 제한, 슬라이드에 이미지가 여러개가 보여질때 필요 */
	max-height:100%;/* 이 예제에서 필요해서 설정했습니다. 상황에따라 다를 수 있습니다. */
}

.mainbox {
	max-width:100%;
	height:auto;
	background-color:#FFFFFF;
	border-radius:10px;
	border-style:solid;
	border-width:0.5px;
	border-color:#E5E8E8;
}

</style>
</head>
<body>
<header>
	헤더부분
</header>
<div class="container-fluid" style="background:#F5F5F5">
	<div class="row" >
		<div class="col-md-2" >
		</div>
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-3">
					<div class="mainbox" style="width:250px; margin-bottom:12px">
						<div class="box" style="margin: 12px auto;">
					    <img class="profile" src="/resources/img/duck.png" alt="Card image" style="width:100%; text-align: center">
					    </div>
					    <div class="card-body">
					      <h4 class="card-title text-center">사용자 이름</h4>
					      <p class="card-text text-center">간단한 소개글 넣기</p><hr>
					      <div style="text-align: center;">
					      <div style="display: inline-block;"><p style="margin-bottom:-5px">팔로워</p>
					      		<p style="text-align: center">5</p>
					      </div>
					      <div style="display:inline-block;"><p style="margin:-2px"><img src="/resources/img/minus.png" height="25px"></p>
					      	<p><img src="/resources/img/minus.png" height="25px"></p>
					      </div>
					      <div style="display: inline-block;"><p style="margin-bottom:-5px">좋아요</p>
					      		<p style="text-align: center">5</p>
					      </div>
					      </div>
					      <div style="text-align:center;">
					      <a href="#" class="btn btn-primary">팔로우</a>
					      <a href="#" class="btn btn-primary">쪽지보내기</a>
					      </div>
					    </div>
					</div>
					<div class="mainbox" style="width:250px; margin-bottom:12px">
						<div class="card-body">
							 <a class="card-text text-center">소개</a><br>
							<a class="card-text text-center">취미</a><br>
							<a class="card-text text-center">스토리</a><br>
							<a class="card-text text-center" href="#mbm">MadeByMe</a><br>
							<a class="card-text text-center" href="#feed">피드</a>
						</div>
					</div>
						<div>
							<div style="display:inline-block;">
								<select class="form-control" style="width:200px">
								  <option selected>글쓰기 선택</option>
								  <option value="1">소개</option>
								  <option value="2">취미</option>
								  <option value="3">스토리</option>
								</select>
							</div>
							<div  style="display:inline-block;">
							<a href="#"><img src="/resources/img/writing.svg" height="30px"></a>
							</div>
						</div>
					</div>
				<div class="col-md-9">
					<div class="card" style="margin-bottom:12px">
						<div class="card-header" style="background:#FFFFFF">
							사용자 소개
						</div>
						<div class="card-body">
							안녕하세요
						</div>
					</div>
					<div class="card" style="margin-bottom:12px">
						<div class="card-header" style="background:#FFFFFF">
							취미
						</div>
						<div class="card-body">
        					<div class="swiper-container">
								<div class="swiper-wrapper">
									<div class="swiper-slide"><img src="/resources/img/littleduck.png"></div>
									<div class="swiper-slide"><img src="/resources/img/littleduck.png"></div>
									<div class="swiper-slide"><img src="/resources/img/littleduck.png"></div>
									<div class="swiper-slide"><img src="/resources/img/duck2.png"></div>
									<div class="swiper-slide"><img src="/resources/img/duck2.png"></div>
									<div class="swiper-slide"><img src="/resources/img/duck2.png"></div>
									<div class="swiper-slide"><img src="/resources/img/duck2.png"></div>
									<div class="swiper-slide"><img src="/resources/img/duck2.png"></div>
									<div class="swiper-slide"><img src="/resources/img/duck2.png"></div>
								</div>
								<!-- 네비게이션 -->
								<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
								<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
							
								<!-- 페이징 -->
								<div class="swiper-pagination"></div>
							</div>
						</div>
					</div>
					<div class="card" style="margin-bottom:12px">
						<div class="card-header" style="background:#FFFFFF">
							스토리
						</div>
						<div class="card-body">
							안녕하세요
						</div>
					</div>
					<div class="card" style="margin-bottom:12px" id="mbm">
						<div class="card-header" style="background:#FFFFFF">
							MadeByMe
						</div>
						<div class="card-body">
								<div class="swiper-container">
								<div class="swiper-wrapper">
									<div class="swiper-slide"><img src="/resources/img/littleduck.png"></div>
									<div class="swiper-slide"><img src="/resources/img/littleduck.png"></div>
									<div class="swiper-slide"><img src="/resources/img/littleduck.png"></div>
									<div class="swiper-slide"><img src="/resources/img/duck2.png"></div>
									<div class="swiper-slide"><img src="/resources/img/duck2.png"></div>
									<div class="swiper-slide"><img src="/resources/img/duck2.png"></div>
									<div class="swiper-slide"><img src="/resources/img/duck2.png"></div>
									<div class="swiper-slide"><img src="/resources/img/duck2.png"></div>
									<div class="swiper-slide"><img src="/resources/img/duck2.png"></div>
								</div>
								<!-- 네비게이션 -->
								<div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
								<div class="swiper-button-prev"></div><!-- 이전 버튼 -->
							
								<!-- 페이징 -->
								<div class="swiper-pagination"></div>
						</div>
					</div>
				</div>
					<div class="card" style="margin-bottom:12px" id="feed">
						<div class="card-header" style="background:#FFFFFF">
							피드
						</div>
						<div class="card-body">
							신규 글
						</div>
					</div>
			</div>
		</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
<script>
new Swiper('.swiper-container', {

	slidesPerView : 3, // 동시에 보여줄 슬라이드 갯수
	spaceBetween : 30, // 슬라이드간 간격
	slidesPerGroup : 3, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

	// 그룹수가 맞지 않을 경우 빈칸으로 메우기
	// 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
	loopFillGroupWithBlank : true,

	loop : true, // 무한 반복

	pagination : { // 페이징
		el : '.swiper-pagination',
		clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
	},
	navigation : { // 네비게이션
		nextEl : '.swiper-button-next', // 다음 버튼 클래스명
		prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
	},
});
</script>
</body>
</html>