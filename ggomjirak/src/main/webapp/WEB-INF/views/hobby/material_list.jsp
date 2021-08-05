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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="${contextPath}/resources/js/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${contextPath}/resources/css/sweetalert2.min.css">
<script>
$(document).ready(function() {
});

</script>
<title>준비물 조회</title>

<style>


/* 화면 width 1300px부터 이렇게 하겠다.라는 뜻*/
@media screen and (min-width: 1300px) {
.myContainer {
  display: grid; 
  grid-auto-flow: column dense; 
  grid-template-columns: 1fr 2.5fr 1fr; 
  grid-template-rows: 1fr; 
  gap: 0px 0px; 
  grid-template-areas: 
    "side-left body side-right"; 
  justify-content: end; 
  width: 100%; 
  height: 100%; 
}
.side-left { grid-area: side-left; }
.body { grid-area: body; }
.side-right { grid-area: side-right; }
 }
 
 /* 화면 width 1300px까지 이렇게 하겠다.라는 뜻*/
 @media screen and (max-width: 1300px) {
.body { padding: 0 80px; }
 }
  	

/*임시 */
a {
 color:black;
}

.category {
	text-decoration: none;
	color: black;
	line-height: 54px;
}
.category:hover {
	text-decoration: none;
	color: rgb(214, 156, 30);
}
.row_2 {
	margin-bottom: 20px;
}

</style>
</head>
<body>
<%@ include file="../include/header.jsp" %>
<div class="container-fluid">
	<div class="myContainer">
		<div class="side side-left">
		</div>
		<div class="body">
		<div class="col-lg-12">
           <div class="filter__item">
           		<div class="row">
				<div class="col-lg-12">
					<div class="filter__found">
                          <h6>${hmList }<span> ${fn:length(hmList)}</span></h6>
                      </div>
					<div class="">	
						<div style="float:left">
							<a class="category cate" id="0" href="search?sort=">전체</a> <span> |</span> 
							<a class="category sort" id="newSort" href="search?sort=new">최신순</a> <span> |</span> 
							<a class="category sort" id="likeSort" href="search?sort=like">좋아요순</a> <span> |</span> 
							<a class="category sort" id="viewSort" href="search?sort=view">조회수순</a> 
						</div>
						<div class="" style="float:right">
<%-- 							<a class="category cate" id="2" href="/search?cate=2&${sort}${sv}">시간순</a> <span> |</span>  --%>
<%-- 							<a class="category cate" id="1" href="/search?cate=1&${sort}${sv}">난이도순</a> <span> |</span> --%>
<%-- 							<a class="category cate" id="1" href="/search?cate=1&${sort}${sv}">비용순</a>  --%>
						</div>
					</div>
				</div>
			</div>
<!--                   <div class="col-lg-4 col-md-4"> -->
<!--                       <div class="filter__found"> -->
<!--                           <h6><span>16</span> Products found</h6> -->
<!--                       </div> -->
<!--                   </div> -->
               </div>
            </div>
            <div class="row">
            	<c:forEach items="${hmList}" var="hobbyVo">
	                <div class="col-lg-4 col-md-6 col-sm-6">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" data-setbg="/displayImage?filePath=${hobbyVo.main_img}" 
	                       	 style="background-image: url(&quot;img/product/product-1.jpg&quot;);">
	                            <ul class="product__item__pic__hover">
	                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="product__item__text">
	                            <h6><a href="#">${hobbyVo.hobby_title}</a></h6>
	                            <h5>${hobbyVo.user_nick}</h5>
	                        </div>
	                    </div>
	                </div>
            	</c:forEach>
            </div>
            <div class="product__pagination">
                <a href="#">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#"><i class="fa fa-long-arrow-right"></i></a>
            </div>
        </div>
		</div>
		<div class="side side-right">
		</div>
	</div>
<%@ include file="../include/footer.jsp" %>
<script>
// var loginVo = "${loginVo}";
// if (loginVo == "") {
// 	console.log("loginVo 없음:", loginVo);
// }
</script>
</body>
</html>