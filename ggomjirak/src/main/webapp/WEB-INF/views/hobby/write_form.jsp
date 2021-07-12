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
<title>글쓰기폼</title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
			
		</div>
		<div class="col-md-8">
		<style>
			.cont_box {padding:26px 30px; margin:0 -1px; border-radius:10px; background-color:gray}
		</style>
			<div>취미 작성(title부분)</div>
			<div class="cont_box">
				<div>
					<label>취미 제목</label>
					<input type="text"/>
				</div>
				<div>
					<label>취미 소개</label>
					<textarea></textarea>
				</div>
				<div>
					<label>동영상</label>
					<textarea></textarea>
				</div>
				<div>
					<label>카테고리</label>
					<select>
						<option>대분류</option>
					</select>
					<select>
						<option>중분류</option>
					</select>
					<select>
						<option>소분류</option>
					</select>
				</div>
				<div>
					<label>취미 정보</label>
					<span>시간</span>
					<select>
						<option>시간</option>
					</select>
					<span>난이도</span>
					<select>
						<option>난이도</option>
					</select>
				</div>
             </div>
             <div class="cont_box">
					<div>
						재료
					</div>
			 </div>
			 <div class="cont_box">
					<div>
						만들기 순서
					</div>
			 </div>
			 <div class="cont_box">
					<div>
						만들기 팁
					</div>
			 </div>
			 <div class="cont_box">
					<div>
						태그
					</div>
			 </div>
			 <div class="cont_box">
					<div>
						<button type="submit">완료</button>
						<button type="button">닫기</button>
					</div>
			 </div>
		</div>
		<div class="col-md-2">
		</div>
	</div>
</div>
</body>
</html>