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

<!-- 순서이동 -->
<link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
<script defer>

	$(document).ready(function() {
		$("#stepBoxWrap").sortable({
			placeholder : "placeholder",
			start : function(event, ui) {
				ui.item.data('start_pos', ui.item.index());
			},
			stop : function(event, ui) {
				var spos = ui.item.data('start_pos');
				var epos = ui.item.index();
				reorder();
			}
		});

	});
	
	function reorder() {
	    $(".stepBox").each(function(i, box) {
	        $(box).find(".itemNum").html(i + 1);
	    });
	}

	function createItem() {
		$(createBox())
		.appendTo("#stepBoxWrap")
		.hover(
		function() {
			$(this).css('backgroundColor', '#f9f9f5');
			$(this).find('.deleteBox').show();
		},
		function() {
			$(this).css('background', 'none');
			$(this).find('.deleteBox').hide();
		}
		)
		.append("<div class='deleteBox'>[삭제]</div>")
		.find(".deleteBox").click(function() {
			var valueCheck = false;
			$(this).parent().find('input').each(function() {
				console.log("$(this).attr('name')", $(this).attr("name"));
				console.log("$(this).val()", $(this).val());
				if ($(this).attr("name") != "type" && $(this).val() != '') {
					valueCheck = true;
				}
			});

			if (valueCheck) {
				var delCheck = confirm('입력하신 내용이 있습니다.\n삭제하시겠습니까?');
			}

			if (!valueCheck || delCheck == true) {
				$(this).parent().remove();
				reorder();
			}

		});

		// 숫자를 다시 붙인다.
		reorder();
	}

	//아이템을 구성할 태그를 반환합니다.

	//itemBox 내에 번호를 표시할 itemNum 과 입력필드가 있습니다.

	function createBox() {
		var contents
		= "<div class='stepBox'>"
		+		"<div id='divStepItem_1' style='display:inline-block; overflow:hidden'>"
		+			"<label id='divStepNum_1' class='cont_tit2_1 ui-sortable-handle' style='cursor:pointer' >Step<span class='itemNum'></span></label>"
		+			"<div id='divStepText_1' style='display:inline-block'>"
		+				"<textarea name='step_text[]' id='step_text_1' class='form-control step_cont' placeholder='예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요.' style='height:160px; width:430px; resize:none;'></textarea>"
		+			"</div>"
		+			"<div id='divStepUpload_1'  style='display:inline-block; overflow:hidden'>"
		+				"<input type='hidden' name='step_no[]' id='step_no_1' value=''>"
		+				"<input type='hidden' name='step_photo[]' id='new_step_photo_1' value=''>"
		+				"<input type='hidden' name='new_step_photo[]' id='step_no_1' value=''>"
		+				"<input type='hidden' name='del_step_photo[]' id='del_step_photo_1' value=''>"
		+				"<div style='position:absolute;left:-3000px'><input type='file' name='q_step_file_1' id='q_step_file_1' file_gubun='step' accept='jpeg,png,gif' style='display:;width:0px;height:0px;font-size:0px;' text=''></div>"
		+				"<div id='divStepPhotoBox_1' is_over='0'  style='display:inline-block; overflow:hidden'>"
	    +    			"<img id='stepPhotoHolder_1' onclick='browseStepFile(1)' src='https://recipe1.ezmember.co.kr/img/pic_none2.gif' width='160' height='160' style='cursor:pointer'>"
		+				"</div>"
		+			"</div>"
		+		"</div>"
		+ "</div>"
		return contents;
	}
</script>



<title>글쓰기폼</title>
</head>
<body>
<style>

.itemBox {

    border:solid 1px black;

    width:400px;

    height:50px;

    padding:10px;

    margin-bottom:10px;

}

.placeholder {


}

.deleteBox {

    float:right;

    display:none;

    cursor:pointer;

}

</style>










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
					<div id="stepBoxWrap">
						<div>
							<div id="divStepItem_1" style="display:inline-block; overflow:hidden">
					            <label id="divStepNum_1" class="cont_tit2_1 ui-sortable-handle" style="cursor:pointer" >Step<span class="itemNum"></span></label>
					            <div id="divStepText_1" style="display:inline-block">
					                <textarea name="step_text[]" id="step_text_1" class="form-control step_cont" placeholder="예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요." style="height:160px; width:430px; resize:none;"></textarea>
					            </div>
					            <div id="divStepUpload_1"  style="display:inline-block; overflow:hidden">
					                <input type="hidden" name="step_no[]" id="step_no_1" value="">
					                <input type="hidden" name="step_photo[]" id="step_photo_1" value="">
					                <input type="hidden" name="new_step_photo[]" id="new_step_photo_1" value="">
					                <input type="hidden" name="del_step_photo[]" id="del_step_photo_1" value="">
					                <div style="position:absolute;left:-3000px"><input type="file" name="q_step_file_1" id="q_step_file_1" file_gubun="step" accept="jpeg,png,gif" style="display:;width:0px;height:0px;font-size:0px;" text=""></div>
					                <div id="divStepPhotoBox_1" is_over="0"  style="display:inline-block; overflow:hidden">
					                    <img id="stepPhotoHolder_1" onclick="browseStepFile(1)" src="https://recipe1.ezmember.co.kr/img/pic_none2.gif" width="160" height="160" style="cursor:pointer">
					                </div>
					            </div>
					         </div>
						</div>
					</div>
					<div>
					    <input type="button" id="addItem" value="추가" onclick="createItem();" />
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