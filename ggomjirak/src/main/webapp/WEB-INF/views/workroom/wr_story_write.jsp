<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="../include/workroomSide.jsp"%>
<style>
.btn-cancle {
    padding: 9px 30px;
    font-size: 18px;
    /* line-height: 1.3333333; */
    /* border-radius: 3px; */
    margin: 0 4px;
    border: 1px solid #ccc;
}
</style>
<script>
$(document).ready(function() {	
	$("#frmStory").submit(function() {
		var st_content = $("#st_content").val();
		if (st_content.trim() == "" || st_content == null) {
			console.log("내용입력");
			$("#msg").text("스토리 내용을 입력해 주세요.");
			$("#st_content").focus();
			return false;
		}
		$(this).submit();
	});
});
</script>
<!-- 글작성 폼 -->
<div class="col-md-9">
	<div class="checkout__order contact-form">
		<form id="frmStory" action="/story/write_run" method="post">
			<div class="col-lg-12 text-center">
				<span id="msg"></span>
				<textarea placeholder="스토리를 작성해 주세요." name="st_content"
					id="st_content"></textarea>
				<div>
					<p style="text-align: left; font-size: 13px; margin-bottom: -10px">첨부파일을 드래그 해 주세요</p>
					<div class="checkout__order" id="fileDrop"></div>
				</div>
				<button type="submit" class="site-btn">등록</button>
				<a href="/story/list/${page_id}" class="btn-cancle">취소</a>
			</div>
		</form>
	</div>
</div>
<div class="col-md-2"></div>
</div>
</div>

<%@ include file="../include/footer.jsp"%>