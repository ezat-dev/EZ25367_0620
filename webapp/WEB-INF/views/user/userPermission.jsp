<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사용자 권한부여</title>
<%@include file="../include/pluginpage.jsp" %>

    
    <style>
	
    body { font-family: Arial, sans-serif; margin: 20px; }
    .permission-container { margin-top: 20px; display: grid; grid-template-columns: repeat(5, 1fr); gap: 16px; }
    .section { background: #f9f9f9; padding: 12px; border-radius: 8px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
    .section h3 { margin: 0 0 8px; font-size: 16px; color: #333; }
    .section .control { display: flex; align-items: center; margin-bottom: 6px; }
    .section .control label { width: 160px; font-weight: bold; color: #555; }
    .section .control select,
    .section .control input[type=number] { flex: 1; padding: 4px 8px; border: 1px solid #ccc; border-radius: 4px; }
    .actions { grid-column: span 2; text-align: right; margin-top: 12px; }
    .actions button { margin-left: 8px; padding: 6px 12px; border: none; border-radius: 4px; background: #007bff; color: #fff; cursor: pointer; }
    .actions button.clearAut { background: #6c757d; }
     .row_select {
	    background-color: #ffeeba !important;
	    }     
   .actions button {
    margin-bottom: 8px; 
  	}
    
	.actions button:hover {
    background-color: #2980b9;
 	 }
    </style>
 
    


    <body>
	<div class="section">
	  <div class="actions">
	    <button type="button" class="allNo">전체없음</button>
	    <button type="button" class="allUpdate">최고권한</button>
	    <button type="button" class="saveAut">저장</button>
	    <button type="button" class="clearAut">초기화</button>
	
	    <div class="view">
	      <div id="dataList" class="tabulator"></div>
	    </div>
	  </div>
	</div>
	
 <form id="permissionForm" class="permission-container">
  <input type="text" style="display:none;" id="user_code" name="user_code" />

  <!-- 모니터링 -->
  <div class="section">
    <h3>모니터링</h3>
    <div class="control">
      <label for="a01">통합 모니터링</label>
      <select id="a01" name="a01">
        <option value="N">없음</option>
        <option value="R">조회</option>
      </select>
    </div>
    <div class="control">
      <label for="a02">트랜드</label>
      <select id="a02" name="a02">
        <option value="N">없음</option>
        <option value="R">조회</option>
        <option value="I">저장</option>
        <option value="U">수정</option>
        <option value="D">삭제</option>
      </select>
    </div>
    <div class="control">
      <label for="a03">알람현황</label>
      <select id="a03" name="a03">
        <option value="N">없음</option>
        <option value="R">조회</option>
      </select>
    </div>
  </div>

  <!-- 생산관리 -->
  <div class="section">
    <h3>생산관리</h3>
    <div class="control">
      <label for="b01">종합 생산현황</label>
      <select id="b01" name="b01">
        <option value="N">없음</option>
        <option value="R">조회</option>
      </select>
    </div>
    <div class="control">
      <label for="b02">설비 효율현황</label>
      <select id="b02" name="b02">
        <option value="N">없음</option>
        <option value="R">조회</option>
      </select>
    </div>
    <div class="control">
      <label for="b03">알람이력</label>
      <select id="b03" name="b03">
        <option value="N">없음</option>
        <option value="R">조회</option>
      </select>
    </div>
    <div class="control">
      <label for="b04">알람발생빈도</label>
      <select id="b04" name="b04">
        <option value="N">없음</option>
        <option value="R">조회</option>
      </select>
    </div>
    <div class="control">
      <label for="b05">SPARE 관리</label>
      <select id="b05" name="b05">
        <option value="N">없음</option>
        <option value="R">조회</option>
        <option value="I">저장</option>
        <option value="U">수정</option>
        <option value="D">삭제</option>
      </select>
    </div>
    <div class="control">
      <label for="b06">열처리 작업이력</label>
      <select id="b06" name="b06">
        <option value="N">없음</option>
        <option value="R">조회</option>
      </select>
    </div>
  </div>

  <!-- 조건관리 -->
  <div class="section">
    <h3>조건관리</h3>
    <div class="control">
      <label for="c01">기준정보관리</label>
      <select id="c01" name="c01">
        <option value="N">없음</option>
        <option value="R">조회</option>
        <option value="I">저장</option>
        <option value="U">수정</option>
        <option value="D">삭제</option>
      </select>
    </div>
    <div class="control">
      <label for="c02">열전대 교체이력</label>
      <select id="c02" name="c02">
        <option value="N">없음</option>
        <option value="R">조회</option>
        <option value="I">저장</option>
        <option value="U">수정</option>
        <option value="D">삭제</option>
      </select>
    </div>
    <div class="control">
      <label for="c03">온도조절계 보정현황</label>
      <select id="c03" name="c03">
        <option value="N">없음</option>
        <option value="R">조회</option>
        <option value="I">저장</option>
        <option value="U">수정</option>
        <option value="D">삭제</option>
      </select>
    </div>
    <div class="control">
      <label for="c04">일상점검일지</label>
      <select id="c04" name="c04">
        <option value="N">없음</option>
        <option value="R">조회</option>
        <option value="I">저장</option>
        <option value="U">수정</option>
        <option value="D">삭제</option>
      </select>
    </div>
    <div class="control">
      <label for="c05">관리계획서 및 작업 표준서</label>
      <select id="c05" name="c05">
        <option value="N">없음</option>
        <option value="R">조회</option>
        <option value="I">저장</option>
        <option value="U">수정</option>
        <option value="D">삭제</option>
      </select>
    </div>
    <div class="control">
      <label for="c06">낙하품 관리</label>
      <select id="c06" name="c06">
        <option value="N">없음</option>
        <option value="R">조회</option>
        <option value="I">저장</option>
        <option value="U">수정</option>
        <option value="D">삭제</option>
      </select>
    </div>
  </div>

  <!-- 품질관리 -->
  <div class="section">
    <h3>품질관리</h3>
    <div class="control">
      <label for="d01">온도균일성 조사보고서</label>
      <select id="d01" name="d01">
        <option value="N">없음</option>
        <option value="R">조회</option>
        <option value="I">저장</option>
        <option value="U">수정</option>
        <option value="D">삭제</option>
      </select>
    </div>
    <div class="control">
      <label for="d02">열처리유 성상분석</label>
      <select id="d02" name="d02">
        <option value="N">없음</option>
        <option value="R">조회</option>
        <option value="I">저장</option>
        <option value="U">수정</option>
        <option value="D">삭제</option>
      </select>
    </div>
    <div class="control">
      <label for="d03">F/PROOF</label>
      <select id="d03" name="d03">
        <option value="N">없음</option>
        <option value="R">조회</option>
        <option value="I">저장</option>
        <option value="U">수정</option>
        <option value="D">삭제</option>
      </select>
    </div>
    <div class="control">
      <label for="d04">Cpk</label>
      <select id="d04" name="d04">
        <option value="N">없음</option>
        <option value="R">조회</option>
        <option value="I">저장</option>
        <option value="U">수정</option>
        <option value="D">삭제</option>
      </select>
    </div>
    <div class="control">
      <label for="d05">Ppk</label>
      <select id="d05" name="d05">
        <option value="N">없음</option>
        <option value="R">조회</option>
        <option value="I">저장</option>
        <option value="U">수정</option>
        <option value="D">삭제</option>
      </select>
    </div>
  </div>

  <!-- 기준관리 -->
  <div class="section">
    <h3>기준관리</h3>
    <div class="control">
      <label for="e01">비가동현황</label>
      <select id="e01" name="e01">
        <option value="N">없음</option>
        <option value="R">조회</option>
        <option value="I">저장</option>
        <option value="U">수정</option>
        <option value="D">삭제</option>
      </select>
    </div>
    <div class="control">
      <label for="e02">사용자등록</label>
      <select id="e02" name="e02">
        <option value="N">없음</option>
        <option value="R">조회</option>
        <option value="I">저장</option>
        <option value="U">수정</option>
        <option value="D">삭제</option>
      </select>
    </div>
    <div class="control">
      <label for="e03">사용자 권한</label>
      <select id="e03" name="e03">
        <option value="N">없음</option>
        <option value="R">조회</option>
        <option value="I">저장</option>
        <option value="U">수정</option>
        <option value="D">삭제</option>
      </select>
    </div>
  </div>
</form>



<script>
$(function(){
  var userTable;
  var user_code = 0;

  $('.headerP').text('인원 및 안전관리 - 사용자 권한부여');
  getAllUserList();

  // 전체 없음
  $(document).on('click', '.allNo', function(){
    $('select').val('N');
  });


  $(document).on('click', '.allUpdate', function () {
	
	    $('select').each(function () {
	        if ($(this).find('option[value="D"]').length > 0) {
	            $(this).val('D');
	        } else if ($(this).find('option[value="R"]').length > 0) {
	            $(this).val('R');
	        }
	    });


	    var formData = new FormData($('#permissionForm')[0]);


	    console.log('📤 FormData 전송 시작');
	    for (let pair of formData.entries()) {
	        console.log(`${pair[0]}: ${pair[1]}`);
	    }

	    $.ajax({
	        url: '/chunil/user/userPermission/update',
	        type: 'POST',
	        data: formData,
	        processData: false,
	        contentType: false,
	        success: function () {
	            alert('권한이 수정되었습니다.');
	        },
	        error: function (xhr, status, error) {
	            alert('수정 중 오류가 발생했습니다.');
	            console.error('❌ AJAX 오류:', status, error);
	            console.error('응답 내용:', xhr.responseText);
	        }
	    });
	});


  // 행 더블클릭 시 권한 로드
  function getAllUserList(){
	  userTable = new Tabulator('#dataList', {
		  height: '250px',
          columnHeaderVertAlign: "middle",
          rowVertAlign: "middle",
		  layout: 'fitColumns',
		  reactiveData: true,
		  ajaxConfig: { method: 'POST' },
		  ajaxLoader: false,
		  ajaxURL: '/chunil/user/userPermission/userSelect',
		  ajaxResponse: function(url, params, response){
			  console.log('✅ ajaxResponse 응답:', response.data);
		    return response.data;
		  },
		  placeholder: '조회된 데이터가 없습니다.',
		  paginationSize: 20,
		  columns: [
		    { title: 'NO', field: 'idx', hozAlign: 'center',  visible: true },
		    { title: '아이디', field: 'user_id', hozAlign: 'center'  },
		    { title: '성명', field: 'user_name', hozAlign: 'center'  },
		    { title: '부서', field: 'user_busu', hozAlign: 'center' },
		    { title: '직책', field: 'user_jick', hozAlign: 'center' },
		    { title: 'user_code', field: 'user_code', hozAlign: 'center', visible: false }
		  ],
		  rowClick: function(e, row){
			  var data = row.getData();
			  console.log('클릭된 행 데이터:', data);

			  user_code = data.user_code;
			  $('#user_code').val(user_code);
			  $('.userName').text(data.user_name);
			  getPermissionUserSelectPermission();
			
			  userTable.getRows().forEach(r => r.getElement().classList.remove('row_select'));			  
			  row.getElement().classList.add('row_select');
			}

		    });
		  }

  function getPermissionUserSelectPermission() {
	  var code = $('#user_code').val();
	  console.log('user_code 전송 값:', code); 

	  $.post(
	    '/chunil/user/userPermission/userSelectPermission',
	    { user_code: code },
	    function(result) {
	      var data = result.data || {};
	      for (var key in data) {
	        var val = data[key];

	        // 만약 val이 'D'인데 옵션에 'D'가 없으면 'R'로 강제 변경
	        var $select = $('[name="' + key + '"]');
	        if (val === 'D' && $select.find('option[value="D"]').length === 0) {
	          val = 'R';  
	        }

	        $select.val(val);
	      }
	    },
	    'json'
	  );
	}


  // 저장
// 저장
$(document).on('click', '.saveAut', function(){
  var formData = new FormData($('#permissionForm')[0]);

  // 콘솔 확인용 로그 출력
  console.log('📤 FormData 전송 시작');
  for (let pair of formData.entries()) {
    console.log(`${pair[0]}: ${pair[1]}`);
  }

  $.ajax({
    url: '/chunil/user/userPermission/update',
    type: 'POST',
    data: formData,
    processData: false,
    contentType: false,
    success: function(){
      alert('권한이 수정되었습니다.');
    },
    error: function(xhr, status, error){
      alert('수정 중 오류가 발생했습니다.');
      console.error('❌ AJAX 오류:', status, error);
      console.error('응답 내용:', xhr.responseText);
    }
  });
});

  // 초기화
  $(document).on('click', '.clearAut', function(){
    $('#permissionForm')[0].reset();
  });
});
</script>


	</body>
</html>
