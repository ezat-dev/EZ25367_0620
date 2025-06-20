<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스페어부품 관리</title>
<%@include file="../include/pluginpage.jsp" %>    
    <jsp:include page="../include/tabBar.jsp"/>
    <style>
        .container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            margin-left: 1008px;
            margin-top: 200px;
        }
        .view {
            display: flex;
            justify-content: center;
            margin-top: 1%;
        }
        .tab {
            width: 95%;
            margin-bottom: 37px;
            margin-top: 5px;
            height: 45px;
            border-radius: 6px 6px 0px 0px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .modal {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            transition: opacity 0.3s ease-in-out;
        }
	    .modal-content {
	        background: white;
	        width: 24%;
	        max-width: 500px;
	        height: 80vh; 
	        overflow-y: auto; 
	        margin: 6% auto 0;
	        padding: 20px;
	        border-radius: 10px;
	        position: relative;
	        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
	        transform: scale(0.8);
	        transition: transform 0.3s ease-in-out, opacity 0.3s ease-in-out;
	        opacity: 0;
	    }
        .modal.show {
            display: block;
            opacity: 1;
        }
        .modal.show .modal-content {
            transform: scale(1);
            opacity: 1;
        }
        .close {
            background-color:white;
            position: absolute;
            right: 15px;
            top: 10px;
            font-size: 24px;
            font-weight: bold;
            cursor: pointer;
        }
        .modal-content form {
            display: flex;
            flex-direction: column;
        }
        .modal-content label {
            font-weight: bold;
            margin: 10px 0 5px;
        }
        .modal-content input, .modal-content textarea {
            width: 97%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .modal-content button {
            background-color: #d3d3d3;
            color: black;
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .modal-content button:hover {
            background-color: #a9a9a9;
        }
        .button-container {
    		display: flex;
		    gap: 10px;
		    margin-left: auto;
		    margin-right: 10px;
		    margin-top: 40px;
		}
		.box1 {
		    display: flex;
		    justify-content: right;
		    align-items: center;
		    width: 800px;
		    margin-right: 20px;
		    margin-top:4px;
		}
        .dayselect {
            width: 20%;
            text-align: center;
            font-size: 15px;
        }
        .daySet {
        	width: 20%;
      		text-align: center;
            height: 16px;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
        }
        .daylabel {
            margin-right: 10px;
            margin-bottom: 13px;
            font-size: 18px;
            margin-left: 20px;
        }
        button-container.button{
        height: 16px;
        }
         .mid{
        margin-right: 9px;
	    font-size: 20px;
	    font-weight: bold;
	
	    height: 42px;
	    margin-left: 9px;
        }
        .row_select {
	    background-color: #ffeeba !important;
	    }
	    .excel-download-button,
		.excel-upload-button {
  		  height: 40px;
  		  background-color: white; 
   		 border: 1px solid black; 
   		 border-radius: 4px;
   		 padding: 4px 10px; 
   		 display: flex;
  		  align-items: center;
  		  gap: 5px;
  		  cursor: pointer;
}

.button-image {
    width: 16px; 
    height: 16px;
}

    </style>
</head>

<body>

    <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
               <div class="box1">
	          <!--  <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
	           <label class="daylabel">검색일자 :</label>
				<input type="text" autocomplete="off" class="daySet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
				
				<span class="mid"  style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>
	
				<input type="text"autocomplete="off" class="daySet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택"> -->
	
	            <label class="daylabel">설비 :</label>
	            <select class="dayselect">
	            <option value="ALL">전체</option>
           
                <option value="1">1</option>
                <option value="2">2</option>
 
            </select>
			</div>
                <button class="select-button">
                    <img src="/geomet/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
                <button class="insert-button">
                    <img src="/geomet/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
                </button>
                <button class="delete-button">
				    <img src="/geomet/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
				</button>
                
                
                <button class="excel-download-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀다운로드
                </button>
                
                <button class="excel-upload-button">
                    <img src="/geomet/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀업로드
                </button>
                <input type="file" id="fileInput" style="display: none;">
                
            </div>
        </div>

        <div class="view">
            <div id="dataTable"></div>
        </div>
    </main>
	
	  <div id="modalContainer" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <!-- 추가, 수정 -->
    <h2>부품교체 이력 등록</h2>
    <form id="corrForm" autocomplete="off">
      <label>설비</label>
      <select name="mch_name">
        <option value="G800">G800</option>
        <option value="G600">G600</option>
        <option value="K-BLACK">K-BLACK</option>
        <option value="공용설비">공용설비</option>
        <option value="방청">방청</option>
        <option value="이코팅1호기">이코팅1호기</option>
        <option value="이코팅2호기">이코팅2호기</option>
        <option value="세척 공통 (열병합)">세척 공통 (열병합)</option>
        <option value="세척 1호기">세척 1호기</option>
        <option value="세척 2호기">세척 2호기</option>
      </select>

      <label>부품명</label>
      <input type="text" name="mch_parts">

      <label>사용처</label>
      <input type="text"  name="a_usage"  style="text-align: left;" autocomplete="off">

      <label>규격</label>
      <input type="text" name="standard">

      <label>제작업체</label>
      <input type="text" name="producer">

      <label>교체 상기/정기</label>
      	<select name="replacement">
	     <option value="상기">상기</option>
	     <option value="정기">정기</option>           
	    </select>

      <label>구매주기 월/반기/년</label>
   		<select name="buy_cycle">
	     <option value="월">월</option>
	     <option value="반기">반기</option>    
	     <option value="년">년</option>
	     <option value="수시">수시</option>          
	    </select>

      <label>현재고</label>
      <input type="text" name="now_stock" placeholder="차기 교체일자 선택" style="text-align: left;" autocomplete="off">

      <label>안전재고</label>
      <input type="text" name="safe_stock" placeholder="차기 교체일자 선택" style="text-align: left;" autocomplete="off">

	  <label>부족재고</label>
      <input type="text" name="shortage_stock">
      
      <label>단위</label>
      <input type="text" name="unit">
      
      <label>보관위치</label>
      <input type="text" name="storage_location">
      
      <label>랙번호</label>
      <input type="text" name="rack_no">
      
      <label>구매신청</label>
      <input type="text" name="purchase_request">

      <label>비고</label>
      <textarea name="remark" rows="4"></textarea>

      <button type="submit" id="saveCorrStatus">저장</button>
      <button type="button" id="closeModal">닫기</button>
    </form>
  </div>
</div>



<script>
  let now_page_code = "h05";

  var dataTable;
  var selectedRowData = null;

  $(function() {

    dataTable = new Tabulator('#dataTable', {
      height: '500px',
      layout: 'fitDataFill',
      headerSort: false,
      reactiveData: true,
      columnHeaderVertAlign: "middle",
      rowVertAlign: "middle",
      headerHozAlign: 'center',
      ajaxConfig: { method: 'GET' },
      ajaxURL: "/geomet/machine/spareStatus/list",
      ajaxParams: { mch_name: "ALL" },
      
      ajaxResponse: function(url, params, response) {
    	    // 받아온 데이터에 NO 필드 추가
    	    return response.map(function(row, index) {
    	      row.NO1 = index + 1;
    	      return row;
    	    });
    	  },

      placeholder: "조회된 데이터가 없습니다.",
      columns: [
          //{ title: "no", field: "no", visible: false }, 
        { title: "NO", field: "NO1",  width: 70, hozAlign: "center" },
        { title: "설비",              field: "mch_name",       width: 150, hozAlign: "center" },
        { title: "부품명",               field: "mch_parts",    width: 150, hozAlign: "center" },
        { title: "사용처",               field: "a_usage",       width: 150, hozAlign: "center" },
        { title: "규격",    			field: "standard",         width: 150, hozAlign: "center" },
        { title: "제작업체",           field: "producer",  width: 150, hozAlign: "center" },
        { title: "교체<br>상시/정기",    field: "replacement",    width: 110, hozAlign: "center" },
        { title: "구매주기<br>월/반기/년", field: "buy_cycle",      width: 110, hozAlign: "center" },
        { title: "현재고",                field: "now_stock",   width: 110, hozAlign: "center" },
        { title: "안전재고",                field: "safe_stock",   width: 110, hozAlign: "center" },
        { title: "부족재고",                field: "shortage_stock",   width: 110, hozAlign: "center" },
        { title: "단위",                field: "unit",   width: 110, hozAlign: "center" },
        { title: "보관위치",                field: "storage_location",   width: 110, hozAlign: "center" },
        { title: "랙번호",                field: "rack_no",   width: 110, hozAlign: "center" },
        { title: "구매신청",                field: "purchase_request",   width: 110, hozAlign: "center" },
        { title: "비고",                  field: "remark",         width: 350, hozAlign: "center" },
        { title: "업로드 구분값",                     field: "no",    width: 100, hozAlign: "center",visible: false, download: true }
      ],

      rowClick: function(e, row) {
        $('#dataTable .tabulator-row').removeClass('row_select');
        row.getElement().classList.add('row_select');
        selectedRowData = row.getData();
        console.log("selectedRowData:" , selectedRowData);
      },

      //더블클릭 했을때 
      rowDblClick: function(e, row) {
    	  var d = row.getData();
    	  selectedRowData = d;
    	  $('#corrForm')[0].reset();

    	  //$('select[name="no"]').val(d.no);
    	  $('select[name="mch_name"]').val(d.mch_name);
    	  $('input[name="mch_parts"]').val(d.mch_parts);
    	  $('input[name="a_usage"]').val(d.a_usage);
    	  $('input[name="standard"]').val(d.standard);
    	  $('input[name="producer"]').val(d.producer);
    	  $('select[name="replacement"]').val(d.replacement);
    	  $('select[name="buy_cycle"]').val(d.buy_cycle);
    	  $('input[name="now_stock"]').val(d.now_stock);
    	  $('input[name="safe_stock"]').val(d.safe_stock);
    	  $('input[name="shortage_stock"]').val(d.shortage_stock);
    	  $('input[name="unit"]').val(d.unit);
    	  $('input[name="storage_location"]').val(d.storage_location);
    	  $('input[name="rack_no"]').val(d.rack_no);
    	  $('input[name="purchase_request"]').val(d.purchase_request);
    	  $('textarea[name="remark"]').val(d.remark);

    	  $('#modalContainer').show().addClass('show');
    	}

    });

    $('.select-button').click(function() {
      var sel = $('.dayselect').val();
      dataTable.setData("/geomet/machine/spareStatus/list", { mch_name: sel });
    });

    $('.insert-button').click(function() {
      selectedRowData = null;
      $('#corrForm')[0].reset();
      $('#modalContainer').show().addClass('show');
    });

    $('.delete-button').click(function() {
      if (!selectedRowData) {
        alert('삭제할 행을 먼저 클릭해 주세요.');
        return;
      }
      if (!confirm('선택된 항목을 정말 삭제하시겠습니까?')) return;

      $.ajax({
        url: "/geomet/machine/spareStatus/delete",
        type: "POST",
        contentType: "application/json",
        data: JSON.stringify({ no: selectedRowData.no }),
        success: function(res) {
        	if(res.result === true){
          alert('삭제되었습니다.');
          var currentFilter = $('.dayselect').val() || 'ALL';
          dataTable.setData("/geomet/machine/spareStatus/list", { mch_name: currentFilter });
          selectedRowData = null;
        	}else{
        		alert("삭제 실패했습니다.")
        	}
        },
        error: function() {
          alert('삭제 중 오류가 발생했습니다.');
        }
      });
    });

    $('.close, #closeModal').click(function() {
      $('#modalContainer').removeClass('show').hide();
    });

    $('#saveCorrStatus').click(function(event) {
      event.preventDefault();
      var formData = new FormData($('#corrForm')[0]);
      if (selectedRowData && selectedRowData.no) {
        formData.append('no', selectedRowData.no);
      }
      $.ajax({
        url: "/geomet/machine/spareStatus/insert",
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function(result) {
        	 if (result.result === true) {
        		 alert("저장되었습니다!");
                 $('#modalContainer').hide();
                 var currentFilter = $('.dayselect').val() || 'ALL';
                 dataTable.setData("/geomet/machine/spareStatus/list", { mch_name: currentFilter });
                 selectedRowData = null;
               }else {
            alert("저장에 실패했습니다.");
               }},
        error: function() {
          alert('저장 중 오류가 발생했습니다.');
        }
      });
    });


  });
  
  //엑셀 다운로드
   $('.excel-download-button').click(function() {
	    dataTable.download("xlsx", "스페어부품 관리.xlsx", {sheetName:"스페어부품 관리",
	    	 visibleColumnsOnly: false //숨겨진 데이터도 출력
	    	 });
	});
  
   $(".excel-upload-button").on("click", function () {
       $("#fileInput").click(); 
   });

   // 파일 선택 후 업로드 처리
   $("#fileInput").on("change", function () {
       var file = this.files[0];
       if (!file) return;

       var formData = new FormData();
       formData.append("file", file);

       $.ajax({
           url: "/geomet/machine/spare/uploadFile",
           type: "POST",
           data: formData,
           contentType: false,
           processData: false,
           success: function (response) {
        	   if(response.result === true){
               alert("엑셀 업로드가 완료되었습니다.");
               $('#modalContainer').hide();
               var currentFilter = $('.dayselect').val() || 'ALL';
               dataTable.setData("/geomet/machine/spareStatus/list", { mch_name: currentFilter });
               selectedRowData = null;
               console.log(response);
               getDataList();
        	   }else{
        		   alert("엑셀 업로드 실패했습니다.")
        	   }
           },
           error: function (xhr, status, error) {
               alert("엑셀 업로드 중 오류가 발생했습니다. 다시 시도해주세요.");
               console.error("Error:", error);
           }
       });
  
   });







  
</script>
<script type="text/javascript" src="https://oss.sheetjs.com/sheetjs/xlsx.full.min.js"></script>

</body>
</html>