<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>

<!-- 배너 -->
<div class="row">
	<div class="col-md-12 green_background" style="padding-bottom: 20px">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="carousel slide" id="carousel-313760">
					<ol class="carousel-indicators">
						<li data-slide-to="0" data-target="#carousel-313760"
							class="active"></li>
						<li data-slide-to="1" data-target="#carousel-313760"></li>
						<li data-slide-to="2" data-target="#carousel-313760"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" alt="Carousel Bootstrap First"
								src="https://www.layoutit.com/img/sports-q-c-1600-500-1.jpg" />
							<div class="carousel-caption">
								<h4>First Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Second"
								src="https://www.layoutit.com/img/sports-q-c-1600-500-2.jpg" />
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" alt="Carousel Bootstrap Third"
								src="https://www.layoutit.com/img/sports-q-c-1600-500-3.jpg" />
							<div class="carousel-caption">
								<h4>Third Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carousel-313760"
						data-slide="prev"><span class="carousel-control-prev-icon"></span>
						<span class="sr-only">Previous</span></a> <a
						class="carousel-control-next" href="#carousel-313760"
						data-slide="next"><span class="carousel-control-next-icon"></span>
						<span class="sr-only">Next</span></a>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>

<!-- 배너 끝 -->

<!-- 추천취미 -->

<div class="row">
	<div class="col-md-12"  style="padding-top: 50px">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
			
				<div class="row">
					<div class="col-md-2">
						<div style="margin-right: 40px">
						<h5>추천취미</h5>
						<p>
						${cateStrVo.cate_no1} <br/>
						${cateStrVo.cate_no2} <br/>
						${cateStrVo.cate_no3} <br/>
						</p>
						<button type="button" class="btn green_background white_color">더보기</button>
						</div>
						
					</div>
					<div class="col-md-10">
						<!-- Categories Section Begin -->
				<section class="categories">

					<div class="container">
						<div class="row">
							<div class="categories__slider owl-carousel">

								<c:forEach var="suggestHobby" items="${suggestHobby}">
								<div class="featured__item">
									<div class="featured__item__pic set-bg" data-setbg="/resources/img/featured/feature-1.jpg"
										style="margin-left: 10px; margin-right: 10px">
										<ul class="featured__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
										<div class="featured__item__text">
										<h6><a href="#">${suggestHobby.hobby_title}</a></h6>
										<h5>${suggestHobby.user_nick}</h5>
									</div>
								</div>
								</c:forEach>

							</div>
						</div>
					</div>
				</section>
				<!-- Categories Section End -->
					</div>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>
<!-- 추천취미 끝 -->

<!-- 인기취미 -->
<div class="row">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">


				<!-- Categories Section Begin -->
				<section class="categories" style="margin-top: 50px">

					<div class="container">
						<div class="row">
							<div class="section-title">
								<h5>인기 취미
								<a href="/main/mainHobby" type="button" class="btn green_background white_color">더보기</a>
								</h5>
							</div>

							<div class="categories__slider owl-carousel">

								<c:forEach var="popular" items="${popularHobby}">
								<div class="featured__item">
									<div class="featured__item__pic set-bg" data-setbg="/resources/img/featured/feature-1.jpg"
										style="margin-left: 10px; margin-right: 10px">
										<ul class="featured__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
										<div class="featured__item__text">
										<h6><a href="#">${popular.hobby_title}</a></h6>
										<h5>${popular.user_nick}</h5>
									</div>
								</div>
								</c:forEach>
								

								
						</div>
					</div>
					</div>
				</section>
				<!-- Categories Section End -->
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>
<!-- 인기취미 끝 -->

<!-- 작가어워드 -->
<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
				
				 <!-- Featured Section Begin -->
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>작가 어워드</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">전체</li>
                            <li data-filter=".grade4">금손</li>
                            <li data-filter=".grade3">은손</li>
                            <li data-filter=".grade2">곰손</li>
                            <li data-filter=".grade1">맨손</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row featured__filter">
            
            <c:forEach var="member1" items="${popularMember1}">
                <div class="col-lg-2 col-md-4 col-sm-6 mix grade${member1.user_grade}">
                    <div class="featured__item">
                    
                        <div class="featured__item__pic set-bg h-50" style="padding: 10px">
                        <img src="/resources/img/featured/feature-1.jpg" class="rounded-circle" alt="..."/>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">${member1.user_nick}</a></h6>
                            <h5>${member1.name}</h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
            <c:forEach var="member2" items="${popularMember2}">
                <div class="col-lg-2 col-md-4 col-sm-6 mix grade${member2.user_grade}">
                    <div class="featured__item">
                    
                        <div class="featured__item__pic set-bg h-50" style="padding: 10px">
                        <img src="/resources/img/featured/feature-1.jpg" class="rounded-circle" alt="..."/>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">${member2.user_nick}</a></h6>
                            <h5>${member2.name}</h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
            <c:forEach var="member3" items="${popularMember3}">
                <div class="col-lg-2 col-md-4 col-sm-6 mix grade${member3.user_grade}">
                    <div class="featured__item">
                    
                        <div class="featured__item__pic set-bg h-50" style="padding: 10px">
                        <img src="/resources/img/featured/feature-1.jpg" class="rounded-circle" alt="..."/>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">${member3.user_nick}</a></h6>
                            <h5>${member3.name}</h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
            <c:forEach var="member4" items="${popularMember4}">
                <div class="col-lg-2 col-md-4 col-sm-6 mix grade${member4.user_grade}">
                    <div class="featured__item">
                    
                        <div class="featured__item__pic set-bg h-50" style="padding: 10px">
                        <img src="/resources/img/featured/feature-1.jpg" class="rounded-circle" alt="..."/>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="#">${member4.user_nick}</a></h6>
                            <h5>${member4.name}</h5>
                        </div>
                    </div>
                </div>
                </c:forEach>
                
               
                
            </div>
        </div>
    </section>
    <!-- Featured Section End -->
				
				
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
<!-- 작가 어워드 끝 -->

<!-- 인기 키워드 -->

<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-2"> </div>
				<div class="col-md-8">
				
					<div><h5>인기 키워드<button type="button" class="btn green_background white_color">더보기</button></div></h5>
					
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row green_background">
				<div class="col-md-12">
					<div class="row" style="padding: 20px">
						<div class="col-md-2"></div>
						<div class="col-md-8">
						
						<div>
							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1키워드1</button>
							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button>
							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button>
							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1키워드1</button>
							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1키워드1</button>
							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button>
							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1키워드1</button>
							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button>
							
							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button>
							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button>
							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1키워드1</button>
							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1키워드1</button>
							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button>
							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1키워드1</button>
							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button>
							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1키워드1</button>
							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button>
							<button type="button" class="rounded-pill btn-light btn green_color" style="margin: 10px">키워드1</button>
						</div>
						
						</div>
						<div class="col-md-2">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- 인기 키워드 끝 -->

<!-- 이달의 취미 -->
<div class="row">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">


				<!-- Categories Section Begin -->
				<section class="categories" style="margin-top: 50px">

					<div class="container">
						<div class="row">
							<div class="section-title">
								<h5>이달의 취미<button type="button" class="btn green_background white_color">더보기</button></h5>
							</div>

							<div class="categories__slider owl-carousel">

								<c:forEach var="month" items="${monthHobby}">
								<div class="featured__item">
									<div class="featured__item__pic set-bg" data-setbg="/resources/img/featured/feature-1.jpg"
										style="margin-left: 10px; margin-right: 10px">
										<ul class="featured__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
										<div class="featured__item__text">
										<h6><a href="#">${month.hobby_title}</a></h6>
										<h5>${month.user_nick}</h5>
									</div>
								</div>
								</c:forEach>

								
							</div>
						</div>
					</div>
				</section>
				<!-- Categories Section End -->
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>
<!-- 이달의 취미 끝 -->

<!-- 베스트 메이드 -->
<div class="row">
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">


				<!-- Categories Section Begin -->
				<section class="categories" style="margin-top: 50px">

					<div class="container">
						<div class="row">
							<div class="section-title">
								<h5>베스트 메이드<button type="button" class="btn green_background white_color">더보기</button></h5>
							</div>

							<div class="categories__slider owl-carousel">

								<div class="featured__item">
									<div class="featured__item__pic set-bg" data-setbg="/resources/img/featured/feature-1.jpg"
										style="margin-left: 10px; margin-right: 10px">
										<ul class="featured__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
										<div class="featured__item__text">
										<h6><a href="#">제목1</a></h6>
										<h5>작가1</h5>
									</div>
								</div>

								<div class="featured__item">
									<div class="featured__item__pic set-bg" data-setbg="/resources/img/featured/feature-2.jpg"
										style="margin-left: 10px; margin-right: 10px">
										<ul class="featured__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
										<div class="featured__item__text">
										<h6><a href="#">제목2</a></h6>
										<h5>작가2</h5>
									</div>
								</div>

								<div class="featured__item">
									<div class="featured__item__pic set-bg" data-setbg="/resources/img/featured/feature-3.jpg"
										style="margin-left: 10px; margin-right: 10px">
										<ul class="featured__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
										<div class="featured__item__text">
										<h6><a href="#">제목3</a></h6>
										<h5>작가3</h5>
									</div>
								</div>

								<div class="featured__item">
									<div class="featured__item__pic set-bg" data-setbg="/resources/img/featured/feature-4.jpg"
										style="margin-left: 10px; margin-right: 10px">
										<ul class="featured__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
										<div class="featured__item__text">
										<h6><a href="#">제목4</a></h6>
										<h5>작가4</h5>
									</div>
								</div>

								<div class="featured__item">
									<div class="featured__item__pic set-bg" data-setbg="/resources/img/featured/feature-5.jpg"
										style="margin-left: 10px; margin-right: 10px">
										<ul class="featured__item__pic__hover">
											<li><a href="#"><i class="fa fa-heart"></i></a></li>
											<li><a href="#"><i class="fa fa-retweet"></i></a></li>
											<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
										</ul>
									</div>
										<div class="featured__item__text">
										<h6><a href="#">제목5</a></h6>
										<h5>작가5</h5>
									</div>
								</div>
							</div>
						</div>
					</div>
				</section>
				<!-- Categories Section End -->
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
</div>
<!-- 베스트 메이드 끝 -->

    
<%@ include file="../include/footer.jsp" %>