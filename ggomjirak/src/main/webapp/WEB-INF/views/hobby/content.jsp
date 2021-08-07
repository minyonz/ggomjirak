<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta property="og:title" content="${hobbyVo.hobby_title }" />
<meta property="og:url" content="${url}" />
<meta property="og:image" content="/displayImage?filePath=${hobbyVo.main_img}" />
<meta property="og:description" content="${hobbyVo.hobby_intro}">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/sweetalert2.min.css">
<script>
$(document).ready(function() {
	selectCommentList();
	 var selectTarget = $('.selectbox select');

	var gap = 6000;
	selectTarget.on("change", function() {
		console.log("체인지")
		var select_name = $(this).children('option:selected').text();
        $(this).siblings('label').text(select_name);
        var speed = $(this).children('option:selected').val();
        gap = gap / speed;
        console.log("gap", gap);
        $(".carousel-item").attr("data-interval", gap);
	})
	
	$('#stepSlide').on('slid.bs.carousel', function () {
// 		console.log("호출");
// 		console.log(gap);
	});
	
// 	$('#stepSlide').carousel('pause');
	
	var isStart = false;
	$("#carousel_cycle").on("click", function() {
		if(isStart == false) {
			console.log("시작");
			$("#stepSlide").attr("data-interval", true);
			$('#stepSlide').carousel('cycle');
			console.log($(".carousel-item").attr("data-interval"));
			$(this).text("정지");
// 			$("#msg_play").text("정지 버튼을 누르면 자동 슬라이드가 정지돼요.");
			isStart = true;
		} else {
			console.log("정지");
			$('#stepSlide').carousel('pause');
			$(this).text("재생");
// 			$("#msg_play").text("재생 버튼을 누르면 자동 슬라이드가 시작돼요.");
			isStart = false;
		}
		
	});
	
	$("#carousel_prev").on("click", function() {
		$('#stepSlide').carousel('prev');
	});
	
	$("#carousel_next").on("click", function() {
		$('#stepSlide').carousel('next');
	});


		
});

</script>
<title>상세보기</title>

<style>

.selectbox {
	display: inline-block;
    height: 1.5rem;
    font-size: 10px;
    position: relative;
    width: 3.5rem;  /* 너비설정 */
    border: 1px solid #999;  /* 테두리 설정 */
    z-index: 1;
    top:1px;
}
.selectbox:hover {
  background: #e7705c8f;
}

/* 가상 선택자를 활용 화살표 대체 */
.selectbox:before {
   content: "";
    position: absolute;
    top: 50%;
    right: 8px;
    width: 0;
    height: 0;
    margin-top: -1px;
    border-left: 4px solid transparent;
    border-right: 4px solid transparent;
    border-top: 4px solid #3a3a3a;
}


.selectbox label {
	cursor:pointer;
    z-index: -1;
    position: absolute;
/*     top: 1px;  /* 위치정렬 */ 
    left: 5px;  /* 위치정렬 */
    padding: .4em .2em;  /* select의 여백 크기 만큼 */
/*     color: #999; */
    z-index: -1;  /* IE8에서 label이 위치한 곳이 클릭되지 않는 것 해결 */
}

.selectbox select {
	cursor:pointer;
    width: 100%;
    height: auto;  /* 높이 초기화 */
    line-height: normal;  /* line-height 초기화 */
    font-family: inherit;  /* 폰트 상속 */
    padding: .4em .2em;  /* 여백과 높이 결정 */
    border: 0;
    opacity: 0;  /* 숨기기 */
    filter:alpha(opacity=0);  /* IE8 숨기기 */
    -webkit-appearance: none; /* 네이티브 외형 감추기 */
    -moz-appearance: none;
    appearance: none;
}
.selectbox {

    -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
    -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

.selectbox.focus {
    border-color: #66afe9;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075), 0 0 8px rgba(102, 175, 233, .6);
}



.article_profile_cont {
    width: 2.5rem;
    height: 2.5rem;
    overflow: hidden;
    display: inline-block;
}

.img_fit {
    width: 100%;
    height: 100%;
    object-fit: cover;
}


.review-row{
 padding: 1rem;
 border-bottom: 1px solid #c1c1c1;
}
.review-content p{
/* 	max-height: 4.8em; */
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 4;
	-webkit-box-orient: vertical;
}
.comment-row{
 padding: 1rem;
 border-bottom: 1px solid #c1c1c1;
}
.comment-row.recomment-row{
 background: url(/resources/images/reply.png) no-repeat 3px 0px;
 background-size: 2.45rem;;
 padding-left: 2.5rem;;
 padding-top: 10px;
 padding-bottom: 10px;
}
/* #reply_div{ */
/*  background: url(/resources/images/reply.png) no-repeat 3px 0px; */
/*  background-size: 45px; */
/*  padding-left: 40px; */
/*  padding-top: 10px; */
/*  padding-bottom: 10px; */
/* } */

.c_user_nick{
	font-weight:600;
}
.c_parent_user_nick {
	font-weight:600;
	color:#1f5e43;
    font-size: 14px;
}
#reply_div {
margin: 10px 0 10px 35px;
}
.c_reg_date {
	font-size: 13px;
    color: #1f5e43;
    font-weight: bold;
}
.btnMenu {
	background: url("${contextPath}/resources/images/menu.png") no-repeat center; 
	outline : none;
	border: none;
	width: 25px;
	height: 25px;
}

.btnMenu_cmt {
	background: url("${contextPath}/resources/images/menu.png") no-repeat center; 
	background-size: 15px;
	outline : none;
	border: none;
	width: 15px;
	height: 15px;
}


.green {
 color: #1f5e43;
}
.displayNone {
display:none;
}
#hobby_title{
text-align: center;
color: #1f5e43;
font-size: 27px;
font-weight: 700;
}
#hobby_intro{
text-align: center;
color: #1f5e43;
font-weight: 550;
}
#reg_date{
color: #1f5e43;
font-weight: 700;
}
.divCnt{
color: #1f5e43;
float: right;
font-weight: 700;
}
.mainImg_cont{
	margin-top: 1rem;
    overflow: hidden;
    width: 34rem;
    height: 25rem;
}
#main_img{
object-fit: cover;
height: 100%;
width: 100%;
}
.user_row, .time_row, .cost_row, 
.level_row {
height: 90px;
}
.sm_tit{
font-weight:700;
color: #1f5e43;
}

.carousel-indicators li {
    width: 20px;
    height: 3px;
    margin-right: 0px; 
    margin-left: 0px;
    background: url(/resources/images/circle-border.png) no-repeat center;
    background-size: 10px;
    opacity: 1;
}

/* carousel 슬라이드 */
.stepCarousel {
	margin: 0 auto;
	width: 47rem;
/* 	height:1100px; */
}

.stepSlideImgCont{
	width: 100%;
    height: 23rem;
}
.craftCarousel {
	margin: 0 auto;
	width: 550px;
/* 	height:1100px; */
}
.craftCarousel-inner {
    position: relative;
    justify-content: center;
    align-items: center;
    overflow: hidden;
    border: hidden;
    width: 550px;
    height: auto;
}
.carousel-item{
/* 	height: 1100px; */
    overflow: hidden;
}
.slideImg{
	width: 100%;
    height: 100%;
    object-fit: cover;
    border-radius: 4px;
}
.extra_tip {
    background: url(/resources/images/lamp.png) left -2px no-repeat;
/*     background-size: 26px 26px; */
}
.extra_note {
    background: url(/resources/images/note.png) left -2px no-repeat;
/*     background-size: 26px 26px; */
}
.extra_link {
    background: url(/resources/images/link.png) left -2px no-repeat;
/*     background-size: 26px 26px; */
}
.step_extra {
    font-size: 16px!important;
    color: #888;
    padding: 0 0 0 32px!important;
    line-height: 1.6;
    margin: 14px 0 14px 0;
}
.body {
    border-bottom : 3px solid #1f5e43;
}
/* 화면 width 1300px부터 이렇게 하겠다.라는 뜻*/
@media screen and (min-width: 1300px) {
.myContainer{
  display: grid; 
  grid-auto-flow: column dense; 
  grid-template-columns: 1fr 3.5fr 1fr; 
  grid-template-rows: 1fr; 
  gap: 0px 0px; 
  grid-template-areas: 
    "side-left body side-right"; 
  justify-content: end; 
  width: 100%; 
  height: 100%; 
}
.side-left { grid-area: side-left; }
.body { grid-area: body; padding:3% 7%;}
.side-right { grid-area: side-right; }   
 .rcNav {padding: 0 15%;} 
 }
 
 /* 화면 width 1300px까지 이렇게 하겠다.라는 뜻*/
 @media screen and (max-width: 1300px) {
.body .rcNav {padding-left: 3.5rem;}
.body { padding : 3% 10%; }
 }
  	
.divViewOption a{
    display: inline-block;
    float: left;
    margin: 0;
    padding: 0;
}

.divViewOption a img{
    height: 40px;
}
/* 1. 만들기 css */
.view_step {padding:0 0 10px;}
.view_step_cont {padding:6px 0 60px 50px; width:850px; font-size:22px;}
.view_step_cont.step1 {background:url(${contextPath}/resources/images/1.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step2 {background:url(${contextPath}/resources/images/2.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step3 {background:url(${contextPath}/resources/images/3.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step4 {background:url(${contextPath}/resources/images/4.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step5 {background:url(${contextPath}/resources/images/5.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step6 {background:url(${contextPath}/resources/images/6.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step7 {background:url(${contextPath}/resources/images/7.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step8 {background:url(${contextPath}/resources/images/8.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step9 {background:url(${contextPath}/resources/images/9.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step10 {background:url(${contextPath}/resources/images/10.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step11 {background:url(${contextPath}/resources/images/11.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step12 {background:url(${contextPath}/resources/images/12.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step13 {background:url(${contextPath}/resources/images/13.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step14 {background:url(${contextPath}/resources/images/14.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step15 {background:url(${contextPath}/resources/images/15.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step16 {background:url(${contextPath}/resources/images/16.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step17 {background:url(${contextPath}/resources/images/17.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step18 {background:url(${contextPath}/resources/images/18.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step19 {background:url(${contextPath}/resources/images/19.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step20 {background:url(${contextPath}/resources/images/20.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step21 {background:url(${contextPath}/resources/images/21.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step22 {background:url(${contextPath}/resources/images/22.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step23 {background:url(${contextPath}/resources/images/23.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step24 {background:url(${contextPath}/resources/images/24.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step25 {background:url(${contextPath}/resources/images/25.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step26 {background:url(${contextPath}/resources/images/26.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step27 {background:url(${contextPath}/resources/images/27.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step28 {background:url(${contextPath}/resources/images/28.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step29 {background:url(${contextPath}/resources/images/29.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont.step30 {background:url(${contextPath}/resources/images/30.jpg) no-repeat 4px 6px; background-size:36px;}
.view_step_cont img {border-radius:3px; max-width:100%; height:auto; margin:20px 0 10px;}
.view_step_cont .media-left {padding-right:20px;}
.view_step_cont .media-left img {margin:0;}
.media-body, .media-left, .media-right {
    display: table-cell;
    vertical-align: top;
}
.media-body {
    width: 10000px;
    word-break: break-all;
}
.view_step .view_step_cont .media-left img {max-width:300px;}
/* .view_step_tip {padding-bottom:40px;} */
/* .view_step_tip dd {font-size:20px; padding:20px 32px 0;} */
/* .view_step_tip.st2 {padding:30px 0 40px 0; clear:both; margin-left:-21px;} */
/* .view_step_tip.st2 dd {padding:14px 28px 0; font-size:16px; line-height:1.6;} */
.view_step .carousel .carouItem img {max-width:100%;}
.view_step_cont .none {display:none;}
.view_step_cont .media-left {width:300px;}

.tab-head{
padding-left: 0px !important;
padding-right: 0px !important;
}
.rcNav-item a:focus{
outline: unset;
}
.rcNav-item a:hover{
border: 1px solid #fff !important;
}
.rcNav-item a{
/* color: black !important; */
font-weight: 600;
padding-left: 28px;
padding-right: 28px;
}
.rcNav-item .active{
color: #1f5e43 !important;
border:none !important;
border-bottom: 3px solid #1f5e43 !important;
font-weight: 600;
}
.rcNav-item .active:hover{
border:none !important;
border-bottom: 3px solid #1f5e43 !important;
}
.nav-tabs{
border-bottom: none !important;
}
.tab-pane h5{
border-left: 4px solid #1f5e43;
}
.myPagination a:hover {
	background: #1f5e43;
	border-color: #1f5e43;
     color: #fff;
}

.myPagination a {
	display: inline-block;
    width: 30px;
    height: 30px;
    border: 1px solid #b2b2b2;
    font-size: 14px;
/*     color: #b2b2b2; */
    font-weight: 700;
    line-height: 28px;
    text-align: center;
    margin-right: 16px;
    -webkit-transition: all, 0.3s;
    -moz-transition: all, 0.3s;
    -ms-transition: all, 0.3s;
    -o-transition: all, 0.3s;
    transition: all, 0.3s;
}
/* URL*/

figure[data-ke-type='opengraph'] a {
    box-sizing: border-box;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    box-shadow: 0 2px 4px 0 rgb(0 0 0 / 4%);
    border: solid 1px rgba(0, 0, 0, 0.06);
    text-decoration: none;
    color: #000;
}
figure[data-ke-type='opengraph'] div.og-image {
   border-right: solid 1px rgba(0, 0, 0, 0.06);
    width: 8.3rem;
    height: 7.3rem;;
    background-size: cover;
    background-position: center;
}
figure[data-ke-type='opengraph'] div {
    position: relative;
}
figure[data-ke-type='opengraph'] div.og-text {
   flex-grow: 1;
    height: 7.3rem;
    padding-left: 1.5rem;
    padding-top: 0.5rem;
}
figure[data-ke-type='opengraph'] p.og-title {
font-size:14px;
color: #000000;
padding-bottom: 0.2rem;
max-width: 467px;
text-overflow: ellipsis;
white-space: nowrap;
margin: 0px;
overflow: hidden;
}
figure[data-ke-type='opengraph'] .og-desc {
    margin: 0px;
    max-width: 467px;
    text-overflow: ellipsis;
    overflow: hidden;
/*     font-family: 'Noto Sans', 'Noto Sans KR'; */
    font-size: 11px;
    font-weight: 300;
/*     font-style: normal; */
/*     font-stretch: normal; */
    line-height: unset;
/*     letter-spacing: normal; */
    color: #909090;
    min-height: 2.8rem;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    display: -webkit-box;
}

figure[data-ke-type='opengraph'] .og-host {
	font-size:10px;
}
.btn-more {
   padding: 3px 13px;
   font-size: 14px;
   padding-top: 7px;
   margin: 0 4px;
   border: 1px solid #1F5E43;
}

.btn-circle {
    box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    /* -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s; */
    -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
    /* transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s; */
    /* height: 1.95rem; */
    font-size: 10px;
    /* position: relative; */
    /* width: 3.5rem; */
    border: 1px solid #999;
    /* z-index: 1; */
    font-size: 10px;
    margin: 0 4px;
    /* border: 1px solid #102e21; */
    border-radius: 100%;
    padding: 7px 4px;
}

.btn-circle:hover {
  background: #e7705c8f;
}
</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<c:if test="${swalIcon == 'success' }">
	<script>
		Swal.fire({
			icon : "${swalIcon}",
			title : "${swalTitle}",
		}).then(function(){close()});
	</script>
</c:if>
<c:if test="${swalIcon == 'error' }">
	<script>
		Swal.fire({
			icon : "${swalIcon}",
			title : "${swalTitle}",
		});
	</script>
</c:if>
	<c:set var="m_no" value="m_no=${ms.m_no}" />
	<c:if test="${not empty ms.time }">
		<c:set var="time" value="&time=${ms.time}" />
	</c:if>
	<c:if test="${not empty ms.level }">
		<c:set var="level" value="&level=${ms.level}" />
	</c:if>
	<c:if test="${not empty ms.cost }">
		<c:set var="cost" value="&cost=${ms.cost}" />
	</c:if>
	
	<c:if test="${not empty ms.sort }">
		<c:set var="sort" value="&sort=${ms.sort}" />
	</c:if>
	
	<c:if test="${not empty ms.page }">
		<c:set var="page" value="&page=${ms.page}" />
	</c:if>

<div class="container-fluid">
	<!-- 취미글 메인부분 -->
	<div class="myContainer">
		<div class="side side-left"></div>
		<div class="body">
		<!-- 카테고리 -->
			<div style="display:flex;">
				<div style="text-align: center; margin-left: 46%;padding-left: auto;">
				<span class="btn btn-outline-light btn-sm green_background">
					${hobbyVo.l_cate_name}
				</span>
				<span class="btn btn-outline-light btn-sm green_background">
					${hobbyVo.m_cate_name}
				</span>
				</div>
				<!-- 수정/ 삭제 버튼을 위한 메뉴 -->
				<c:if test="${not empty loginVo }">
					<c:if test="${loginVo.user_id == hobbyVo.user_id}">
						<div class="dropdown" style="margin-left:auto;">
							<button class="btnMenu" type="button" id="dropdownMenuButton" data-toggle="dropdown">
							</button>
							<div class="dropdown-menu" aria-labelledby="dropdownMenuButton" 
								style="min-width: 4rem;font-size: 13px;">
								 <a class="dropdown-item mydr" href="/hobby/update/${hobbyVo.hobby_no}">수정</a>
								  <div class="dropdown-divider"></div> 
								 <a class="dropdown-item mydr" href="javascript:doDelete();">삭제</a>
							</div>
						</div>
					</c:if>
				</c:if>
				<!--//  수정/ 삭제 버튼을 위한 메뉴 -->
			</div>
			<!-- 핵심 부분 컨테이너 -->
				
				<div id="hobby_title">${hobbyVo.hobby_title}</div>
				<div id="hobby_intro">${hobbyVo.hobby_intro}</div>
				<div>
<!-- 				<span style="color:#1f5e43;" class="fa fa-clock-o"></span> -->
				<span id="reg_date">
					<fmt:formatDate value="${hobbyVo.reg_date}" pattern="yyyy.MM.dd KK:mm:ss"/>
				</span>
				<div class="divCnt">
					<span class="fa fa-eye"></span>
					<span id="view_cnt">${hobbyVo.view_cnt}</span>
					<span>|</span>
					<span class="fa fa-heart-o"></span>
					<span id="like_cnt">${hobbyVo.like_cnt}</span>
					<span>|</span>
					<span class="fa fa-commenting-o"></span>
					<span class="cmt_cnt">${hobbyVo.cmt_cnt}</span>
				</div>
				</div>
				<div class="row">
					<div class="col-md-7">
						<div class="mainImg_cont">
							<img id="main_img" src="/displayImage?filePath=${hobbyVo.main_img}"/>
						</div>
					</div>
					<div class="col-md-5">
						<div class="user_row">
							<div class="row sm_tit">
								작가
							</div>
							<a href="/workroom/main/${hobbyVo.user_id}">
							<div style="margin-top: 10px; position: relative;">
								<div class="article_profile_cont">
									<img class="rounded-circle circle-image img_fit" 
										src="/displayImage?filePath=${hobbyVo.user_img}"/> 
								</div>
									<span style=" display: inline-block;
											    position: absolute;
											    top: 0.5rem;
											    margin-left: 0.5rem;
											    color:#212529;
												">
										${hobbyVo.user_nick} >
									</span>
							</div>
							</a>
						</div>
						<div class="time_row">
							<div class="row sm_tit">
								소요시간
							</div>
							<span class="fa fa-clock-o"></span>${hobbyVo.time_name}
						</div>
						<div class="cost_row">
							<div class="row sm_tit">
								비용
							</div>
							<span class="fa fa-krw"></span>${hobbyVo.cost_name}
						</div>
						<div class="level_row">
							<div class="row sm_tit">
								난이도
							</div>
							<span class="fa fa-hand-paper-o"></span>${hobbyVo.level_name}
						</div>
						<div class="respon_row">
							<button type="button" class="loginNeed btn green_background" id="like">
								<span style="color:white;" class="fa fa-heart-o"></span>
								<span style="color:white;">좋아요</span>
							</button>
							<button type="button" class="loginNeed btn green_background" id="bookmark">
								<span style="color:white;" class="fa fa-bookmark-o"></span>
								<span style="color:white;">북마크</span>
							</button>
							<button type="button" class="loginNeed btn green_background">
								<span style="color:white;" class="fa fa-envelope-o"> 쪽지</span>
							</button>
						</div>
					</div>
				</div>
		</div>
		<div class="side side-right"></div>
	</div>
	<!-- // 취미글 메인부분 -->
	<!-- 준비물 부분 -->
	<div class="myContainer">
		<div class="side side-left"></div>
		<style>
		.ready_ingre3 ul {
    padding: 0 0 25px 0;
    width: 49%;
    display: inline-block;
    vertical-align: top;
}
.ready_ingre3 li {
    border-bottom: 1px solid #ececec;
    padding: 10px 6px;
    list-style: none;
    margin: 0 35px;
    font-size: 16px;
}
		</style>
		<div class="body">
			<div><b>준비물</b><span>Material</span></div>
			<div class="ready_ingre3">
				<ul>
					<b class="ready_ingre3_tt">[재료]</b> <a
						href="javascript:viewMaterial('57');"
						onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '새송이 버섯');">
						<li>새송이 버섯 <img
							src="https://recipe1.ezmember.co.kr/img/mobile/icon_info.png"
							style="width: 20px; height: 20px; margin-left: 2px; vertical-align: middle;">
							<span class="ingre_unit">3동</span>
					</li>
					</a> <a href="javascript:viewMaterial('296');"
						onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '청양고추');">
						<li>청양고추 <img
							src="https://recipe1.ezmember.co.kr/img/mobile/icon_info.png"
							style="width: 20px; height: 20px; margin-left: 2px; vertical-align: middle;">
							<span class="ingre_unit">1개</span>
					</li>
					</a> <a href="javascript:viewMaterial('26');"
						onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '대파');">
						<li>대파 <img
							src="https://recipe1.ezmember.co.kr/img/mobile/icon_info.png"
							style="width: 20px; height: 20px; margin-left: 2px; vertical-align: middle;">
							<span class="ingre_unit">1/2대</span>
					</li>
					</a> <a href="javascript:viewMaterial('197');"
						onclick="ga('send', 'event', '레시피본문', '재료정보버튼클릭', '버터');">
						<li>버터 <img
							src="https://recipe1.ezmember.co.kr/img/mobile/icon_info.png"
							style="width: 20px; height: 20px; margin-left: 2px; vertical-align: middle;">
							<span class="ingre_unit">1T</span>
					</li>
					</a>
					</ul>
			</div>

				<table class="table table-hover table-sm">
					<tbody>
						<c:forEach var="hobbyMaterialVo" items="${hobbyVo.hobbyMaterials}">
							<tr>
								<td><a href="/hobby/material/search?m_no=${hobbyMaterialVo.material_no}">${hobbyMaterialVo.materialName}</a></td>
								<td>
									${hobbyMaterialVo.material_detail}
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
		</div>
		<div class="side side-right"></div>
	</div>
	<!-- //준비물 부분 -->
	<!-- 만들기 부분 -->
	<div class="myContainer">
		<div class="side side-left"></div>
		<div class="body">
			<div class="view_step">
				<div>
					<b>만들기 순서</b><span>Steps</span>
					<div class="divViewOption" style="float: right;">
	                    <a href="javascript:void(0);" onclick="chgViewStep(1)"><img id="tabStepView1" src="${contextPath}/resources/images/tab_view1_on.png" alt="슬라이드보기"></a>
	                    <a href="javascript:void(0);" onclick="chgViewStep(2)"><img id="tabStepView2" src="${contextPath}/resources/images/tab_view2.png" alt="이미지크게보기"></a>
	                    <a href="javascript:void(0);" onclick="chgViewStep(3)"><img id="tabStepView3" src="${contextPath}/resources/images/tab_view3.png" alt="이미지작게보기"></a>
	                    <a href="javascript:void(0);" onclick="chgViewStep(4)"><img id="tabStepView4" src="${contextPath}/resources/images/tab_view4.png" alt="텍스트만보기"></a>
               		 </div>
				</div>
	            <!-- 슬라이드 이미지 -->
	            <div>
	            	<div class="divSlideView" style="margin-top: 60px;">
<!-- 	            		<span>슬라이드 조작하기</span> -->
	            		<div style="display:flex; padding: 0 8.5rem; margin-bottom: 1rem;">
	            			<span style="font-size: 14px;">슬라이드 기능을 이용해 보세요!
	            				<br/><span style="font-size: 11px; color: #888888;">자동 슬라이드의 기본 간격은 약 6초입니다.</span>
	            			</span>
	            			<div style="margin-left: auto; padding-top: 0.7rem;">
		            			<span class="btn-circle" id="carousel_prev" style="cursor:pointer;">이전</span>
		            			<span class="btn-circle" id="carousel_cycle" style="cursor:pointer;">재생</span>
		            			<span class="btn-circle" id="carousel_next" style="cursor:pointer; margin-right: 9px;">다음</span>
		            			<div class="selectbox">
								  <label for="select">배속</label>
								    <select id="select">
								        <option value="0.5" >0.5&times;</option>
								        <option value="1" selected>1.0&times;</option>
								        <option value="1.5">1.5&times;</option>
								        <option value="2">2.0&times;</option>
								    </select>
								</div>
	            			</div>
	            		</div>

	            		<!-- 이미지 슬라이드 -->
	            		<!-- data-interval=false -> 자동 슬라이드 취소 -->
            			<div class="carousel stepCarousel slide" id="stepSlide" data-interval=false>
							<ol class="carousel-indicators" style="top: 21rem; height: 30px;">
								<c:forEach var="makeStepVo" items="${hobbyVo.makeSteps }">
									<li data-slide-to="${makeStepVo.make_step_num - 1 }" 
										data-target="#stepSlide"
										class="${makeStepVo.make_step_num==1  ? 'active' : ''}">
									</li>
								</c:forEach>
							</ol>
							<div class="carousel-inner stepCarousel-inner">
								<c:forEach var="makeStepVo" items="${hobbyVo.makeSteps }">
									<div data-num="${makeStepVo.make_step_num}" data-interval="4000" class="carousel-item ${makeStepVo.make_step_num==1  ? 'active' : ''}">
										<div class="stepSlideImgCont">
											<c:choose>
												<c:when test="${not empty makeStepVo.make_step_img}">
													<img class="slideImg" src="/displayImage?filePath=${makeStepVo.make_step_img }" />
												</c:when>
												<c:otherwise>
													<img class="slideImg" src="${contextPath}/resources/images/no-img.png" />
												</c:otherwise>
											</c:choose>
										</div>
										<div class="carousel-caption">
												<div id="stepDiv${makeStepVo.make_step_num}" 
												class="view_step_cont step${makeStepVo.make_step_num}"
												style="width:100%;" >
												<div id="stepdescr${makeStepVo.make_step_num}" class="media-body">
												${makeStepVo.make_step_text }
												</div>
												<div class="stepExtra">
													<c:if test="${not empty makeStepVo.tip}">
														<p class="step_extra extra_tip">
															${makeStepVo.tip}
														</p>
													</c:if>
													<c:if test="${not empty makeStepVo.note}">
														<p class="step_extra extra_note">
															${makeStepVo.note}
														</p>
													</c:if>
													<c:if test="${not empty makeStepVo.urlOgTag}">
														<c:choose>
															<c:when test="${makeStepVo.urlOgTag.status == 0}">
																<a href="${makeStepVo.urlOgTag.url }">${makeStepVo.urlOgTag.url}</a>
															</c:when>
															<c:otherwise>
																<figure data-ke-type="opengraph" data-og-title="${makeStepVo.urlOgTag.title}" 
																data-og-description="${makeStepVo.urlOgTag.desc}"  data-og-url="${makeStepVo.urlOgTag.url }" 
																data-og-image="${makeStepVo.urlOgTag.image}" style="margin-top: 0.5rem;"> 
															      <a href="${makeStepVo.urlOgTag.url }">
														   			<c:set var = "image" value = "${makeStepVo.urlOgTag.image }"/>
														   				<c:choose>
														   					<c:when test="${fn:contains(image, 'blogthumb')}">
														   						<div class="og-image" 
															        			style="background-image:url(${contextPath}/resources/images/sad.png)"></div>
														   					</c:when>
														   					<c:otherwise>
														   						 <div class="og-image" 
															        				style="background-image:url(${makeStepVo.urlOgTag.image })"></div>
														   					</c:otherwise>
														   				</c:choose>
															        <div class="og-text">
															          <p class="og-title">${makeStepVo.urlOgTag.title}</p>
															          <p class="og-desc">${makeStepVo.urlOgTag.desc}</p>
															          <p class="og-host">${makeStepVo.urlOgTag.url }</p>
															        </div>
															      </a>
															   	 </figure>
															</c:otherwise>
														</c:choose>
														    <p class="step_extra extra_link">
																${makeStepVo.link_desc}
													</c:if>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div> 
							<a class="carousel-control-prev" href="#stepSlide" 
								data-slide="prev" style="height: 23rem;;">
								<span class="carousel-control-prev-icon"></span> 
								<span class="sr-only">Previous</span>
							</a> 
							<a class="carousel-control-next" href="#stepSlide" 
								data-slide="next"  style="height:23rem;">
								<span class="carousel-control-next-icon"></span> 
								<span class="sr-only">Next</span>
							</a>
						</div>
						<!-- //이미지 슬라이드 -->
	            </div>
	            </div>
	            <!-- //슬라이드 이미지 -->
	            <!-- 만들기 컨테이너 -->
	            
	            <div class="divStepView" style="display:none; padding-top:50px;">
	            <c:forEach var="makeStepVo" items="${hobbyVo.makeSteps}">
					<div id="stepDiv${makeStepVo.make_step_num}" class="view_step_cont step${makeStepVo.make_step_num}">
						<div id="stepimg${makeStepVo.make_step_num}" class="media-left">
							<c:if test="${not empty makeStepVo.make_step_img}">
							<img class="make_step_img" style="margin-top: 0px;"
								src="/displayImage?filePath=${makeStepVo.make_step_img }">
							</c:if>
						</div>
						<div id="stepdescr${makeStepVo.make_step_num}" class="media-body">
							${makeStepVo.make_step_text }
						</div>
						<div class="stepExtra">
							<c:if test="${not empty makeStepVo.tip}">
								<p class="step_extra extra_tip">
									${makeStepVo.tip}
								</p>
							</c:if>
							<c:if test="${not empty makeStepVo.note}">
								<p class="step_extra extra_note">
									${makeStepVo.note}
								</p>
							</c:if>
							<c:if test="${not empty makeStepVo.urlOgTag}">
									<figure data-ke-type="opengraph" data-og-title="${makeStepVo.urlOgTag.title}" 
										data-og-description="${makeStepVo.urlOgTag.desc}"  data-og-url="${makeStepVo.urlOgTag.url }" 
										data-og-image="${makeStepVo.urlOgTag.image}" style="margin-top: 0.5rem;"> 
								      <a href="${makeStepVo.urlOgTag.url }">
								        <c:set var = "image" value = "${makeStepVo.urlOgTag.image }"/>
							   				<c:choose>
							   					<c:when test="${fn:contains(image, 'blogthumb')}">
							   						<div class="og-image" 
								        			style="background-image:url(${contextPath}/resources/images/sad.png)"></div>
							   					</c:when>
							   					<c:otherwise>
							   						 <div class="og-image" 
								        				style="background-image:url(${makeStepVo.urlOgTag.image })"></div>
							   					</c:otherwise>
							   				</c:choose>
								        <div class="og-text">
								          <p class="og-title">${makeStepVo.urlOgTag.title}</p>
								          <p class="og-desc">${makeStepVo.urlOgTag.desc}</p>
								          <p class="og-host">${makeStepVo.urlOgTag.url }</p>
								        </div>
								      </a>
								    </figure>
								     <p class="step_extra extra_link"> 
								     	${makeStepVo.link_desc}
							</c:if>
						</div>
					</div>
				</c:forEach>
				</div>
			</div>
			<!-- 완성사진 영역 -->
			<c:if test="${fn:length(hobbyVo.completeImgs) > 0}">
			<div style="margin-top: 5rem; border-top: 1.5px solid #c8c8c8;">
			<div style="text-align:center; margin-top: 20px;">
				<b>완성 사진</b><span>Craft</span>
			</div>
			 <div class="col-lg-6 col-md-6" style="margin: 0 auto;">
			    <div class="product__details__pic">
                        <div class="product__details__pic__item" style="width:100%;height:20rem; overflow:hidden; margin: 1rem auto;">
                            <img style="width:100%;height:100%; object-fit:cover; "
                            	class="product__details__pic__item--large"
                                src="/displayImage?filePath=${hobbyVo.completeImgs[0].img_name}" alt="">
                        </div>
                        <div class="product__details__pic__slider owl-carousel">
                        	<c:forEach var="completeImgVo" items="${hobbyVo.completeImgs}" varStatus="vs">
                        		<div style="width:100px;height:100px; overflow:hidden;">
									 <img style="width:100%;height:100%; object-fit:cover;"
									 	data-imgbigurl="/displayImage?filePath=${completeImgVo.img_name}"
	                                	src="/displayImage?filePath=${completeImgVo.img_name}" alt="">
                        		</div>
							</c:forEach>
                        </div>
                    </div>
                 </div>
<!-- 				<div class="carousel craftCarousel slide" id="craftSlide" style="box-shadow: 0 2px 4px 0 rgb(0 0 0 / 50%);"> -->
<!-- 				<ol class="carousel-indicators"> -->
<%-- 					<c:forEach var="completeImgVo" items="${hobbyVo.completeImgs}" varStatus="vs"> --%>
<%-- 						<li data-slide-to="${vs.index}"  --%>
<!-- 							data-target="#craftSlide" -->
<%-- 							class="${vs.index==0  ? 'active' : ''}"> --%>
<!-- 						</li> -->
<%-- 					</c:forEach> --%>
<!-- 				</ol> -->
<!-- 				<div class="carousel-inner craftCarousel-inner"> -->
<%-- 					<c:forEach var="completeImgVo" items="${hobbyVo.completeImgs}" varStatus="vs"> --%>
<%-- 						<div data-num="${vs.count}" class="carousel-item ${vs.count==1  ? 'active' : ''}"> --%>
<!-- 							<div style="width:550px; height:300px"> -->
<%-- 								<img class="slideImg" src="/displayImage?filePath=${completeImgVo.img_name}" /> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<%-- 					</c:forEach> --%>
<!-- 				</div>  -->
<!-- 				<a class="carousel-control-prev" href="#craftSlide"  -->
<!-- 					data-slide="prev" style="height:300px"> -->
<!-- 					<span class="carousel-control-prev-icon"></span>  -->
<!-- 					<span class="sr-only">Previous</span> -->
<!-- 				</a>  -->
<!-- 				<a class="carousel-control-next" href="#craftSlide"  -->
<!-- 					data-slide="next"  style="height:300px"> -->
<!-- 					<span class="carousel-control-next-icon"></span>  -->
<!-- 					<span class="sr-only">Next</span> -->
<!-- 				</a> -->
<!-- 				</div> -->
			</div>
			</c:if>
		</div>
		<div class="side side-right"></div>
	</div>
	<!-- //만들기 부분 -->
	<!-- 동영상 부분 -->
	<c:if test="${not empty hobbyVo.hobby_video}">
		<div class="myContainer">
			<div class="side side-left"></div>
			<div class="body">
				<div><b>동영상</b><span>Video</span></div>
				<div style="text-align: center;">
					<iframe width="560" height="315" 
					src="https://www.youtube.com/embed/${hobbyVo.hobby_video}" 
					title="YouTube video player"></iframe>
				</div>
			</div>
			<div class="side side-right"></div>
		</div>						
	</c:if>
	<!-- //동영상 부분 -->
	<!-- 댓글, 후기 부분 -->
	<div class="myContainer">
		<div class="side side-left"></div>
		<div class="body">
			<!-- 후기, 댓글 컨테이너 -->
			<!-- style="padding-left: 18%;" 없앰 노트북으로 보니깐 이상해짐 스크린클때만 여백넣는작업 들어가야할듯 -->
		  <ul class="nav nav-tabs rcNav" >
		    <li class="nav-item rcNav-item">
		      <a class="nav-link active" data-toggle="tab" href="#madeByMe">made by me</a>
		    </li>
		    <li class="nav-item rcNav-item">
		      <a class="nav-link" data-toggle="tab" href="#comment">comment</a>
		    </li>
		  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div id="madeByMe" class="container tab-pane active" style="width: 80%;"><br>
<!--       <h5 class="pl-2">made by me</h5> -->
		<a class="loginNeed btn-more" 
			type="button" href="/mbm/write/${hobbyVo.hobby_no}" 
			style="float: right; margin-bottom: 20px">후기작성</a>
		<!-- review-container -->
		<div class="review-container">
		<c:forEach begin="1" end="6">
		<!-- review-row -->
		<div class="review-row">
			<div class="row">
				<div class="col-md-1">
					<img class="rounded-circle circle-image" 
					src="https://recipe1.ezmember.co.kr/img/df/pf_100_100.png"
					style="width:2.2rem;"/> 
				</div>
				<div class="col-md-11">
					<div class="row">
						홍길동
					</div>
					<div class="row">
						2021.07.20
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					<div style="width:10rem; height:8rem; overflow:hidden;">
						<img class="img_fit" 
							src="/resources/images/madeByMeThum.jpg"/> 
					</div>
				</div>
				<div class="col-md-9">
					<div>
						<div class="row">체감 난이도: 최상</div>
					</div>
					<div class="row review-content">
						<p>후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용
						</p>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		<!-- // review-row -->
		</div>
		<!-- //review-container -->
		<!-- pagination-container -->
		<div class="pagination-container" style="text-align: center;">
			  <div class="myPagination" style="text-align: center; margin-top: 1.5rem">
            <c:set var="prev" value=""/>
            <c:set var="next" value=""/>
            
<%--             	<c:if test=""> --%>
               		 <a href=""><i class="fa fa-long-arrow-left"></i></a>
<%--                 </c:if> --%>
            	<c:forEach var="v" begin="1" end="10">
	                <a class="" 
	                	href="">${v}</a>
				</c:forEach>
<%-- 				<c:if test=""> --%>
               		 <a href=""><i class="fa fa-long-arrow-right"></i></a>
<%--                 </c:if> --%>
            </div>
		</div>
		<!--// pagination-container --> 
	 </div>
	 <!-- comment 시작 -->
    <div id="comment" class="container tab-pane fade" style="width: 80%;"><br>
<!--     		<h5 class="pl-2">comment</h5> -->
			<div class="sm_tit">댓글 <span class="cmt_cnt">3</span></div>
			<!--commentList-container -->
			<div class="commentList-container" id="commentContainer">
			<!-- comment-row-->
				<div class="comment-row" style="display:none">
					<input type="hidden" class="c_no" value=""/>
					<input type="hidden" class="re_group" value=""/>
					<div class="updateCommentDiv" style="display:none">
						<div class="c_info_area">
							<div style="width:2.3rem; height:2.3rem; overflow:hidden; display: inline-block;">
								<img class="rounded-circle circle-image user_img" 
									src="/resources/images/profile.png"  style="width:100%; height:100%; object-fit:cover;"/>
							</div>
							<span class="c_user_nick" style="position: absolute; padding: 0.4rem 0 0 0.4rem;"> 하윤지</span>
							<a class="cancel" href="javascript:cancelUpdate();" style="float:right">취소</a>
						</div>
						<div class="input-group" style="width:680px;">
						<!-- 아이디부분 로그인기능 생기면 삭제 -->
							<textarea name="c_content" class="form-control c_content" 
									 spellcheck="false" autocomplete="off"
									 style="height:100px; width:100%; resize:none;"></textarea>
							<!-- 로그인 기능 생기면 insertComment함수 인자안에 세션으로 얻은${user_id}넣기 -->
							<button class="btn btn-outline-light green_background updateBtn" type="button" 
									onclick="updateComment()" style="height:100px; width:100px;">등록</button>
						</div>
					</div>
					<div class="view_comment">
						<div class="c_info_area">
								<a class="user_link" href="#프로필링크" style="vertical-align: top;">
									<label style="width:2.3rem; height:2.3rem; overflow:hidden;">
										<img class="rounded-circle circle-image user_img" 
											src="/resources/images/profile.png"  style="width:100%; height:100%; object-fit:cover;"/>
									</label>
									<span class="c_user_nick" style="margin-left: 0.5rem; color:#212529;     vertical-align: top;"> 하윤지</span>
								</a>
								<span class="is_hobby_writer badge badge-pill badge-success" 
									style="display:none; background: #1f5e43; padding-top: 5px; vertical-align: top;"> 글주인</span>
								<!-- 댓글, 수정 삭제 -->
								<div class="dropdown" style="float:right">
									<button class="btnMenu_cmt" type="button" id="dropdownMenuButton" data-toggle="dropdown">
									</button>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton"
										style="min-width: 4rem;font-size: 13px;">
										 <a class="dropdown-item doUpdateComment" 
										 	href="javascript:void(0);" >수정</a> 
										 <a class="dropdown-item deleteComment" 
										 	href="javascript:void(0);">삭제</a>
									</div>
								</div>
								<!-- //댓글, 수정 삭제 -->
							</div>
							<div class="c_content_area">
								<span class="c_parent_user_nick" style="display:none">@하윤지 </span> 
								<span class="c_content">댓글내용 댓글댓글내용 댓글댓글내용 11</span>
							</div>
							<div class="c_etc_area">
								<span class="c_reg_date"></span>
<!-- 									<a href="javascript:void(0);" class="report" style="display:none;" -->
<!-- 										 onclick="신고()"><span>|</span>신고</a> -->
							</div>
							<div class="c_btn_area">
								<button class="loginNeed doRecomment btn btn-sm btn-outline-light green_background"
										style="margin-top: 0.5rem;" onclick="doRecomment()">답글</button>
							</div>
					</div>
					<div class="row replyCommentDiv">
					
					</div>
				</div>
				<!-- //comment-row -->
			</div>
			<!--//  댓글 리스트 컨테이너 -->
			<div style="text-align:center; margin: 20px 0 20px 0;">
				<button type="button" id="btnMoreComments"
					onclick="moreViewToggle(this);"
					class="btn btn-sm btn-outline-light green_background">댓글 더보기</button>
			</div>
			<!--//commentList-container -->
			<!--commentWrite-container -->
			<div class="commentWrite-container">
				<div class="input-group" style="width:680px;">
					<!-- 아이디부분 로그인기능 생기면 삭제 -->
<!-- 					<input type="text" id="user_id" name="user_id" placeholder="댓글작성자 id(테스트를 위한)"/> -->
					<textarea id="c_content" name="c_content" spellcheck="false" autocomplete="off"
						class="form-control" placeholder="댓글을 남겨주세요."
						 style="height:100px; width:100%; resize:none;"></textarea>
					<!-- 로그인 기능 생기면 insertComment함수 인자안에 세션으로 얻은${user_id}넣기 -->
					<button class="loginNeed btn btn-outline-light green_background" type="button" 
						onclick="insertComment(this)" style="height:100px; width:100px;">등록</button>
				</div>
			</div>
			<!--// commentWrite-container -->
				<!-- 답댓작성 -->
				<div id="reply_div" style="display:none;">
					<div class="input-group" style="width:640px;">
<!-- 						<input type="text" id="re_user_id" name="user_id" placeholder="댓글작성자 id(테스트를 위한)"/> -->
						<input type="hidden" id="parent_c_no" value=""/>
						<textarea id="re_c_content" class="form-control" spellcheck="false" autocomplete="off"
							 style="height:100px; width:100%; resize:none;"></textarea>
						<button class="loginNeed btn btn-outline-light green_background insertRecomment" type="button" 
							onclick="insertRecomment(this)" style="height:100px; width:100px;">등록</button>
					</div>
				</div>
				<!--// 답댓작성 -->
				<!-- moreviewdiv -->
					<div id="moreViewDiv" style="display:none"></div>
				<!-- //moreviewdiv -->
	  		  </div>
	    	<!-- comment 끝 -->
		  </div>
		  <!-- // Tab panes -->
		<div class="side side-right"></div>
		</div>
	</div>
	<!--// 댓글, 후기 부분 -->
</div>
<%@ include file="../include/footer.jsp" %>
<script>
var loginVo = "${loginVo}";
if (loginVo == "") {
	console.log("loginVo 없음:", loginVo);
	$(".loginNeed").on("click", function(e) {
		alert("로그인 해주세요");
		console.log(e);
		return false;
	});
	$("#comment").on("click", ".loginNeed", function(e) {
		alert("로그인 해주세요");
		console.log(e);
		return false;
	}).on("click", ".form-control", function() {
		alert("로그인 해주세요");
		return false;
	});
}

//좋아요
$("#like").click(function() {
	if(loginVo == "") {
		return false;
	}
	var url = "/hobby/like/${hobbyVo.hobby_no}";
	$.get(url, function(rData) {
		console.log(rData);
		if (rData == "like") {
			console.log("좋아용");
			$("#like > span:first-child").attr({
				"class" : "fa fa-heart",
				style : "color:#C32424"
			});
			$("#like_cnt").prev().attr({
		        "class" : "fa fa-heart",
		        style : "color:#C32424"
		     });
			$("#like_cnt").text(Number($("#like_cnt").text()) + 1);
		} else {
			$("#like > span:first-child").attr({
				"class" : "fa fa-heart-o",
				style : "color:white"
			});
			$("#like_cnt").prev().attr({
				"class" : "fa fa-heart-o",
				style : "color:#1f5e43"
		     });
			$("#like_cnt").text(Number($("#like_cnt").text()) - 1);
		}
	});
});

if ("${likeCheck}" == 1) {
    $("#like > span:first-child").attr({
       "class" : "fa fa-heart",
       style : "color:#C32424"
    });
    $("#like_cnt").prev().attr({
        "class" : "fa fa-heart",
        style : "color:#C32424"
     });
 }
 
//북마크
$("#bookmark").click(function() {
	if(loginVo == "") {
		return false;
	}
	var url = "/hobby/bookmark/${hobbyVo.hobby_no}";
	$.get(url, function(rData) {
		console.log(rData);
		if (rData == "bookmark") {
			$("#bookmark > span:first-child").attr({
				"class" : "fa fa-bookmark",
				style : "color:#FFC300"
			})
		} else {
			$("#bookmark > span:first-child").attr({
				"class" : "fa fa-bookmark-o",
				style : "color:white"
			})
		}
	});
});

if ("${bookmarkCheck}" == 1) {
    $("#bookmark > span:first-child").attr({
    	"class" : "fa fa-bookmark",
       style : "color:#FFC300"
    })
 }
 
function chgViewStep(step) {	
	if (step == 1) {
		$(".divStepView").hide();
		$(".divSlideView").show();
	} else {
		$(".divStepView").show();
		$(".divSlideView").hide();
	}
	
    $("[id^='tabStepView']").each(function(){
        $(this).attr("src",$(this).attr("src").replace("_on.png",".png"));
    });
    $("#tabStepView"+step).attr("src",$("#tabStepView"+step).attr("src").replace(".png","_on.png"));
    $("[id^='stepimg']").each(function(){
        $(this).removeClass('media-left');
        $(this).removeClass('none');
        if(step==3) $(this).addClass('media-left');
        else if(step==4) $(this).addClass('none');
    });
}


function doDelete() {
	Swal.fire({
		text: '삭제하시겠습니까?', 
		allowOutsideClick: false,
		iconColor: "#1f5e43",
		icon: 'question', 
		confirmButtonText: "확인",
		confirmButtonColor: "#1f5e43",
		cancelButtonText: "취소",
		showCancelButton: true,
	}).then(function(result) {
		if(result.isConfirmed) {
			location.href = "${contextPath}/hobby/delete/${hobbyVo.hobby_no}?${m_no}${time}${cost}${level}${sort}${page}";
		} 
	});
}

//* 댓글 부분
// 일반 댓글 작성
function insertComment() {
	var c_content = $("#c_content").val();
	if (c_content.length < 1 || c_content.trim() == "") {
		alert("댓글 내용을 입력하지 않았습니다.")
		return false;
	}
	var h_no = parseInt("${hobbyVo.hobby_no}");
// 	var user_id = $("#user_id").val();
	var url = "/comment/insertComment";
	var sendData = {
			"c_content" : c_content,
			"h_no" 	    : h_no,
// 			"user_id"	: user_id
	}
	$.ajax({
		"url" : url,
		"headers" : {
			"Content-Type" : "application/json"
		},
		"method" : "post",
		"dataType" : "text",
		"data" : JSON.stringify(sendData),
		"success" : function(rData) {
			console.log(rData);
			if(rData == "success") {
				selectCommentList();
				$("#c_content").val("");
			}
		}
	});
	
}	
//답댓글 작성
function insertRecomment(el) {
	var re_group = $(el).parent().parent().parent().parent().find(".re_group").val()
	var parent_c_no = $("#parent_c_no").val();
// 	var user_id = $("#re_user_id").val()
	var c_content = $("#re_c_content").val();
	if (c_content.length < 1 || c_content.trim() == "") {
		alert("댓글 내용을 입력하지 않았습니다.")
		return false;
	}
	var h_no = parseInt("${hobbyVo.hobby_no}");
	var url = "/comment/insertRecomment";
	var sendData = {
			"c_content" : c_content,
			"h_no" 	    : h_no,
// 			"user_id"	: user_id,
			"parent_c_no" : parent_c_no,
			"re_group" : re_group,
	}
	console.log(sendData);
	$.ajax({
		"url" : url,
		"headers" : {
			"Content-Type" : "application/json"
		},
		"method" : "post", 
		"dataType" : "text",
		"data" : JSON.stringify(sendData),
		"success" : function(rData) {
			console.log(rData);
			if(rData == "success") {
				var reply = '<div id="reply_div" style="display:none;">'+$('#reply_div').html()+'</div>';
	            $('#comment').append(reply);
				selectCommentList();
			}
		}
	});
}

// 답글 버튼 누를때 
function doRecomment(c_no) {
	var reply = '<div id="reply_div">'+$('#reply_div').html()+'</div>';
	if ($("#reply_div").css("display") == "block") {
 		console.log($("#replyCommentDiv_"+ c_no).find("#reply_div"));
 		if($("#replyCommentDiv_"+ c_no).find("#reply_div").length == 0) {
  			$('#reply_div').remove();
     		$("#replyCommentDiv_"+ c_no).html(reply);
		 } else {
  			$("#replyCommentDiv_"+ c_no).find("#reply_div").hide();
 		}
	} else {
		$('#reply_div').remove();
		$("#replyCommentDiv_"+ c_no).html(reply);
	}
    
    $("#parent_c_no").val(c_no);
}	

var hobby_writer = "${hobbyVo.user_id}"; // 글작성자 id

if (loginVo != null) {
	var login_id = "${loginVo.user_id}"; // 로그인한사람 id
}
// 댓글 리스트 조회
function selectCommentList() {
	
	$("#commentContainer > .comment-row:gt(0)").remove();
	$("#moreViewDiv").empty();
	var url = "/comment/selectCommentList/${hobbyVo.hobby_no}";
	$.get(url, function(rData) {
		if (rData.length < 4) {
			$("#btnMoreComments").hide();
		} else {
			$("#btnMoreComments").show();
		}
// 		$("#comment_cnt").text(rData.length);
		$(".cmt_cnt").text(rData.length);
		$.each(rData, function(i) {
			var cloneDiv = $("#commentContainer > .comment-row:eq(0)").clone();
			if (this.c_depth == 1) {
				cloneDiv.addClass("recomment-row");
				cloneDiv.find(".c_parent_user_nick").show();
			}
			cloneDiv.show();
			
			//자기 댓글이 아닐경우 수정삭제 안보이게하기, 신고버튼은 보이게 하기(신고 기능 없음)
			if(this.user_id != login_id) {
				cloneDiv.find(".dropdown").hide();
// 				cloneDiv.find(".report").show();
			}
			
			//
			cloneDiv.find(".view_comment").attr("id", "view_comment_" + this.c_no );
			cloneDiv.find(".c_no").val(this.c_no);
			cloneDiv.find(".re_group").val(this.re_group);
			cloneDiv.find(".user_link").attr("href", "/workroom/main/" + this.user_id);
			cloneDiv.find(".user_img").attr("src", "/displayImage?filePath=" + this.user_img);
			cloneDiv.find(".c_user_nick").text(this.user_nick);
			if (this.user_id == hobby_writer) {
				cloneDiv.find(".is_hobby_writer").show();
			}
			cloneDiv.find(".doUpdateComment").attr("onclick", "doUpdateComment(" + this.c_no + ")");
			cloneDiv.find(".updateCommentDiv").attr("id", "updateCommentDiv_" + this.c_no);
			// 댓글 수정 취소
			cloneDiv.find(".cancel").attr("href", "javascript:cancelUpdate(" + this.c_no + ")");
			cloneDiv.find(".updateBtn").attr("onclick", "updateComment(" + this.c_no + ")");
			cloneDiv.find(".deleteComment").attr("onclick", "deleteComment(" + this.c_no + ")");
			cloneDiv.find(".doRecomment").attr("onclick", "doRecomment(" + this.c_no + ")");
			cloneDiv.find(".c_parent_user_nick").text("@" + this.parent_user_nick);
			cloneDiv.find(".c_content").text(this.c_content);
			var reg_date = changeDateString(this.reg_date);
			cloneDiv.find(".c_reg_date").text(reg_date);
			cloneDiv.find(".replyCommentDiv").attr("id", "replyCommentDiv_" + this.c_no);
			
			// 댓글 3개까지는 전체보기 줄여보기 x, 4개부터 보일때 3개까지만 보이고 전체보기 버튼 눌러야 전체보임
			if(i > 2) {
				$("#moreViewDiv").append(cloneDiv);
// 				console.log(i + "," + "moreview" +  cloneDiv.html());
				$("#moreViewDiv").insertAfter("#commentContainer > .comment-row:last"); 
			} else {
				$("#commentContainer").append(cloneDiv);
// 				console.log(i + "," + "일반" + cloneDiv.html());
			}
// 			console.log("댓글들", $("#commentContainer > .comment-row:gt(3)"));
		});
	});
	
}
// 댓글 수정 버튼 누를때
function doUpdateComment(c_no) {
	console.log(c_no);
	var c_content = $("#view_comment_" + c_no).find(".c_content").text();
    $("#updateCommentDiv_" + c_no).show();
    $("#updateCommentDiv_" + c_no).find(".c_content").val(c_content);
	$("#view_comment_" + c_no).hide();
}

//수정 취소 누를때
function cancelUpdate(c_no) {
	 $("#updateCommentDiv_" + c_no).hide();
	 $("#view_comment_" + c_no).show();
}

function updateComment(c_no) {
	var c_content = $("#updateCommentDiv_" + c_no).find(".c_content").val();
	if (c_content.length < 1 || c_content.trim() == "") {
		alert("1자 이상 입력해야 글을 등록할 수 있습니다.");
		return false;
	}
	var url = "/comment/updateComment";
	var sendData = {
			"c_content" : c_content,
			"c_no"	: c_no
	}
	
	$.ajax({
		"url" : url,
		"headers" : {
			"Content-Type" : "application/json"
		},
		"method" : "post",
		"dataType" : "text",
		"data" : JSON.stringify(sendData),
		"success" : function(rData) {
			console.log(rData);
			if(rData == "success") {
				selectCommentList();
			}
		}
	});
}
// 댓글 삭제  
function deleteComment(c_no) {
	var url = "/comment/deleteComment";
	if(confirm("삭제 하시겠습니까?")) {
		var sendData = {
				"h_no" : "${hobbyVo.hobby_no}",
				"c_no"	: c_no
		}
		
		$.ajax({
			"url" : url,
			"headers" : {
				"Content-Type" : "application/json"
			},
			"method" : "post",
			"dataType" : "text",
			"data" : JSON.stringify(sendData),
			"success" : function(rData) {
				console.log(rData);
				if(rData == 0) {
					alert("답댓이 있는 댓글은 삭제할 수 없습니다.");
				} else {
					selectCommentList();
				}
			}
		});
	}
}
var commentOpens = 0;
function moreViewToggle() {
	if(commentOpens == 0) {
		$("#moreViewDiv").show();
        $("#btnMoreComments").html('줄여보기');
        commentOpens = 1;
    }
    else {
        $("#moreViewDiv").hide();
        $("#btnMoreComments").html('전체보기');
        commentOpens = 0;
    }
}

function make2digits(num) {
	if (num < 10) {
		num = "0" +  num;
	}
	return num;
}

function changeDateString(timestamp) {
	var d = new Date(timestamp);
	var year = d.getFullYear();
	var month = d.getMonth() + 1;
	var date = d.getDate();
	var hour = make2digits(d.getHours());
	var minute = make2digits(d.getMinutes());
	return year + "." + month + "." + date + ". " + hour + ":" + minute;
}
</script>
</body>
</html>