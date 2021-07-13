<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<!-- 썸네일 style -->
<style>
	body {
    background-color: #7B1FA2
}

.container {
    margin-top: 100px;
    margin-bottom: 100px
}

.carousel-inner img {
    width: 10%;
    height: 100%
}

#custCarousel .carousel-indicators {
    position: static;
    margin-top: 20px
}

#custCarousel .carousel-indicators>li {
    width: 100px
}

#custCarousel .carousel-indicators li img {
    display: block;
    opacity: 0.5
}

#custCarousel .carousel-indicators li.active img {
    opacity: 1
}

#custCarousel .carousel-indicators li:hover img {
    opacity: 0.75
}

.carousel-item img {
    width: 10%
}
</style>
<!-- //썸네일스타일 -->

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2">
				</div>
				<!-- 중심부분 -->
				<div class="col-md-8">
					<div class="section">
						<!-- 카테고리 컨테이너 -->
						<div class="cate_cont">
							<a class="btn btn-sm btn-primary" href="#">1차 분류</a>
							<a class="btn btn-sm btn-primary" href="#">2차 분류</a>
						</div>
						<!-- 상단 컨테이너 -->
						<div class="title_cont">
							<p>여기는 취미 제목 부분 입니다</p>
							<p>여기는 취미 설명 부분 입니다</p>
							<section>
    							<div class="container">
        							<div class="row">
            							<div class="col-lg-6 col-md-6">
            								<div class="container">
											    <div class="row">
											        <div class="col-md-12">
											            <div id="custCarousel" class="carousel slide" data-ride="carousel" align="center">
											                <!-- slides -->
											                <div class="carousel-inner">
											                    <div class="carousel-item active"> <img src="https://i.imgur.com/weXVL8M.jpg" alt="Hills"> </div>
											                    <div class="carousel-item"> <img src="https://i.imgur.com/Rpxx6wU.jpg" alt="Hills"> </div>
											                    <div class="carousel-item"> <img src="https://i.imgur.com/83fandJ.jpg" alt="Hills"> </div>
											                    <div class="carousel-item"> <img src="https://i.imgur.com/JiQ9Ppv.jpg" alt="Hills"> </div>
											                </div> <!-- Left right --> <a class="carousel-control-prev" href="#custCarousel" data-slide="prev"> <span class="carousel-control-prev-icon"></span> </a> <a class="carousel-control-next" href="#custCarousel" data-slide="next"> <span class="carousel-control-next-icon"></span> </a> <!-- Thumbnails -->
											                <ol class="carousel-indicators list-inline">
											                    <li class="list-inline-item active"> <a id="carousel-selector-0" class="selected" data-slide-to="0" data-target="#custCarousel"> <img src="https://i.imgur.com/weXVL8M.jpg" class="img-fluid"> </a> </li>
											                    <li class="list-inline-item"> <a id="carousel-selector-1" data-slide-to="1" data-target="#custCarousel"> <img src="https://i.imgur.com/Rpxx6wU.jpg" class="img-fluid"> </a> </li>
											                    <li class="list-inline-item"> <a id="carousel-selector-2" data-slide-to="2" data-target="#custCarousel"> <img src="https://i.imgur.com/83fandJ.jpg" class="img-fluid"> </a> </li>
											                    <li class="list-inline-item"> <a id="carousel-selector-2" data-slide-to="3" data-target="#custCarousel"> <img src="https://i.imgur.com/JiQ9Ppv.jpg" class="img-fluid"> </a> </li>
											                </ol>
											            </div>
											        </div>
											    </div>
											</div>
            							</div>
            							<div class="col-lg-6 col-md-6">
            							
            							</div>
    							    </div>
    						</section>
						</div>
						<!-- 준비물 컨테이너 -->
						<div class="material_cont">
						
						</div>
						<!-- 만들기 순서 컨테이너-->
						<div class="step_cont">
						
						</div>
						<!-- 동영상 컨테이너 -->
						<div class="video_cont">
						
						</div>
						<!-- 태그 컨테이너 -->
						<div class="tag_cont">
						
						</div>
						<!-- scrollspy 컨테이너 -->
						<div class="scrollspy_cont">
						
						</div>
					</div>
				</div>
				<!-- //중심 부분 -->
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>