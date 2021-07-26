<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
<!-- 이벤트 -->

<div class="row">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
			
				<div class="container">
	
					<ul class="nav nav-tabs">
						
						<li class="nav-item"><a id="list" class="nav-link" href="/main/mainEvent">진행중인 이벤트</a></li>
						<li class="nav-item"><a id="listEnd" class="nav-link" href="/main/mainEventListEnd">종료된 이벤트</a></li>
						<li class="nav-item"><a id="listAll" class="nav-link active" href="/main/mainEventListAll">전체 이벤트</a></li>
					</ul>
				</div>
				
				<div style="padding: 20px; overflow: hidden;">
				
				<c:forEach var="event" items="${eventListAll}">
				<div class="col-lg-6 col-md-12 col-sm-12" style="float:left; padding: 30px">
					<div class="featured__item">
						<div>
							<a href="/main/mainEventContent">
								<img src="/resources/img/eximage.png" class="rounded mx-auto d-block" alt="..."
								width="700px" height="200px">
							</a>
						</div>
						<div class="featured__item__text">
							<h6><a href="/main/mainEventContent?e_no=${event.e_no}">${event.e_title}</a></h6>
							<h5>${event.start_date} ~ ${event.end_date}</h5>
						</div>
					</div>
				</div>
				</c:forEach>
				
				
				</div>
				
				<div class="product__pagination justify-content-center " style="display: flex">
                        <a href="#"><i class="fa fa-long-arrow-left"></i></a>
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                </div>
								
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>

<!-- 이벤트 끝 -->

<%@ include file="../include/footer.jsp" %>