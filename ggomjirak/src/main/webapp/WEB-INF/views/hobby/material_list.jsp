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
	color: #1f5e43;
}

.active {
 	background: #1f5e43; 
     border-color: #1f5e43; 
     color: #fff; 
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

.info_cate_area table th span {
    color: #74b243;
    display: block;
    font-weight: 500;
    margin: 0 5px 0 0;
    text-align: center;
    padding-top: 6px;
    vertical-align: middle;
    font-size: 15px;
    height: 41px;
    width: 100%;
    padding-top: 12px;
}

.info_cate_area table th {
    text-align: center;
    vertical-align: top;
    border-right: 1px solid #e6e7e8;
    border-bottom: 1px solid #e6e7e8;
}

.info_cate_area table td {
    border-bottom: 1px solid #e6e7e8;
}

.info_cate.row3 {
    background: #fff;
    padding: 16px 15px 8px 12px;
    vertical-align: top;
    margin-top: 0;
    border-right: none;
    border-left: none;
    border-top: none;
}

.info_cate .cate_list {
    font-size: 15px;
    padding: 8px 0;
    line-height: 1;
    height: 41px;
}

.info_cate .cate_list a.active {
    color: #fff;
    background: #74b243;
    margin: 0;
    border-radius: 16px;
}
.info_cate .cate_list a {
    padding: 3px 8px 4px;
    color: #666;
    vertical-align: middle;
    font-size: 15px;
    line-height: 1;
    font-weight: 300;
}
.info_cate .cate_list a:hover {
    color: #1f5e43;
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
                          <h6>${materialSearch.m_name}<span> ${materialSearch.count}</span></h6>
                      </div>
                     <div id="divCate" style="display: block;" class="info_cate_area">
   						 <table>
      						  <tbody>
      							  <tr>
          							  <th style="padding-top: 10px;">
						                <span>시간</span>
						                <span>난이도</span>
						                <span>비용</span>
      							      </th>
          							  <td>
               							 <div class="info_cate row3">
                						    <div class="cate_list">
                								<a href="#" class="active">전체</a>
                								<c:forEach items="${times}" var="time">
                									<a href="#" class="">${time.time_name}</a>
                								</c:forEach>
                							</div>
                						    <div class="cate_list">
                								<a href="#" class="active">전체</a>
                								<c:forEach items="${levels}" var="level">
                									<a href="#" class="">${level.level_name}</a>
                								</c:forEach>
                							</div>
                						    <div class="cate_list">
                								<a href="#" class="active">전체</a>
                								<c:forEach items="${costs}" var="cost">
                									<a href="#" class="">${cost.cost_name}</a>
                								</c:forEach>
                							</div>
                           				 </div>
          						 	 </td>
        							</tr>
       						 </tbody>
   						 </table>
					</div>
					<div class="">	
					${materialSearch }
						<div style="float:right">
							<a class="category sort" id="allSort" ${materialSearch.sort == 'all' ? 'style="color: #1f5e43;"' : '' }
								href="search?m_no=${materialSearch.m_no}&sort=all">전체</a> <span> |</span> 
							<a class="category sort" id="newSort" ${materialSearch.sort == 'new' ? 'style="color: #1f5e43;"' : '' }
								 href="search?m_no=${materialSearch.m_no}&sort=new">최신순</a> <span> |</span> 
							<a class="category sort" id="likeSort" ${materialSearch.sort == 'like' ? 'style="color: #1f5e43;"' : '' }
								href="search?m_no=${materialSearch.m_no}&sort=like">좋아요순</a> <span> |</span> 
							<a class="category sort" id="viewSort" ${materialSearch.sort == 'view' ? 'style="color: #1f5e43;"' : '' }
								href="search?m_no=${materialSearch.m_no}&sort=view">조회수순</a> <span> |</span> 
							<a class="category sort" id="cmtSort" ${materialSearch.sort == 'cmt' ? 'style="color: #1f5e43;"' : '' }
								href="search?m_no=${materialSearch.m_no}&sort=cmt">댓글순</a> 
						</div>
					</div>
				</div>
			</div>
            </div>
            </div>
            <div class="row">
            	<c:forEach items="${hmList}" var="hobbyVo">
	                <div class="col-lg-4 col-md-6 col-sm-6">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" data-setbg="/displayImage?filePath=${hobbyVo.main_img}" 
	                       	 style="background-image: url(&quot;/displayImage?filePath=${hobbyVo.main_img}&quot;);">
	                            <ul class="product__item__pic__hover">
	                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
	                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
	                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
	                            </ul>
	                        </div>
	                        <div class="product__item__text">
	                        	${hobbyVo }
	                            <h6><a href="/hobby/content/${hobbyVo.hobby_no}">${hobbyVo.hobby_title}</a></h6>
	                            <h5>${hobbyVo.user_nick}</h5>
	                        </div>
	                    </div>
	                </div>
            	</c:forEach>
            </div>
            <div class="myPagination" style="text-align: center;">
            <c:set var="prev" value="${materialSearch.endPage - materialSearch.PAGE_BLOCK}"/>
            <c:set var="next" value="${materialSearch.startPage + materialSearch.PAGE_BLOCK}"/>
            
            	<c:if test="${prev > 0}">
               		 <a href="search?m_no=${materialSearch.m_no}&sort=${materialSearch.sort}&page=${prev}"><i class="fa fa-long-arrow-left"></i></a>
                </c:if>
            	<c:forEach var="v" begin="${materialSearch.startPage}" end="${materialSearch.endPage}">
	                <a class="${v == materialSearch.page ? 'active' : '' }" 
	                	href="search?m_no=${materialSearch.m_no}&sort=${materialSearch.sort}&page=${v}">${v}</a>
				</c:forEach>
				<c:if test="${next <= materialSearch.totalPage}">
               		 <a href="search?m_no=${materialSearch.m_no}&sort=${materialSearch.sort}&page=${next}"><i class="fa fa-long-arrow-right"></i></a>
                </c:if>
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