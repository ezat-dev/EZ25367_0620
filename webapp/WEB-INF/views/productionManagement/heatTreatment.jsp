<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>열처리 작업이력</title>
	<%@include file="../include/pluginpage.jsp" %>    
    <jsp:include page="../include/tabBar.jsp"/>
</head>
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
        .closePumbun {
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

/*품번모달*/
        .pumbunModal {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            transition: opacity 0.3s ease-in-out;
        }
	    .pumbun-modal-content {
	        background: white;
	        width: 60%;
	        max-width: 1200px;
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
        .pumbunModal.show {
            display: block;
            opacity: 1;
        }
        .pumbunModal.show .pumbun-modal-content {
            transform: scale(1);
            opacity: 1;
        }


        .pumbun-modal-content button {
            background-color: #d3d3d3;
            color: black;
            padding: 10px;
            border: none;
            border-radius: 5px;
            margin-top: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .pumbun-modal-content button:hover {
            background-color: #a9a9a9;
        }
        .pumbun-modal-content form {
            display: flex;
            flex-direction: column;
        }
        .pumbun-modal-content label {
            font-weight: bold;
            margin: 10px 0 5px;
        }
        .pumbun-modal-content input, .pumbun-modal-content textarea {
            width: 97%;
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }


    </style>

<body>
    <main class="main">
        <div class="tab">
        

            <div class="button-container">
            
               <div class="box1">
	
	            <label class="daylabel">작업일자 :</label>
	            <input type="text" class="dayselect daySet"/>
			</div>
                <button class="select-button">
                    <img src="/chunil/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
                <button class="insert-button">
                    <img src="/chunil/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
                </button>
                <button class="delete-button">
				    <img src="/chunil/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
				</button>
                
                
                <button class="excel-download-button">
                    <img src="/chunil/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀다운로드
                </button>
                
                
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
    <h2>열처리 작업이력 등록</h2>
    <hr />
    <form id="corrForm" autocomplete="off">
      <label>작업일</label>
      <input type="text" name="w_date" class="daySet" style="text-align:left;">

      <label>품번</label>
      <input type="text" name="w_pnum" readonly="readonly" style="cursor:pointer; border-color:red;" onclick="pumbunSelect();">

      <label>투입시작시간</label>
      <input type="text"  name="w_sdatetime" class="datetimeSet">

      <label>투입통수</label>
	  <input type="text" name="w_incnt">

      <label>투입중량</label>
	  <input type="text" name="w_weight">

      <label>투입종료시간</label>
      <input type="text" name="w_in_edatetime" class="datetimeSet">

      <label>작업완료시간</label>
      <input type="text" name="w_edatetime" class="datetimeSet">

      <label>경도값 - X1</label>
	  <input type="text" name="h_val1">

      <label>경도값 - X2</label>
	  <input type="text" name="h_val2">

      <label>경도값 - X3</label>
	  <input type="text" name="h_val3">
	  <input type="text" name="w_lot" style="display:none;" />
		<hr />
		
      <button type="submit" id="saveCorrStatus">저장</button>
      <button type="button" id="closeModal">닫기</button>
    </form>
  </div>
</div>


<div id="pumbunModal" class="pumbunModal">
  <div class="pumbun-modal-content">
    <span class="closePumbun">&times;</span>
    <!-- 추가, 수정 -->
    <h2>품번선택</h2>
    	<hr />
    	<div style="display:inline-block;">
			<label style="display:inline-block; width:40px;">품번</label>
			<input type="text" id="s_pnum" class="pumModalEnter" style="text-align:left; display:inline-block; width:100px;">    	
			<label style="display:inline-block; width:40px;">강종</label>
			<input type="text" id="s_gang" class="pumModalEnter" style="text-align:left; display:inline-block; width:50px;">    	
			<label style="display:inline-block; width:40px;">T급</label>
			<input type="text" id="s_t_gb" class="pumModalEnter" style="text-align:left; display:inline-block; width:50px;">
			<button type="button" onclick="getPumbunList();">조회</button>			    	
    	</div>
    	<hr />
    
    <div id="pumbunTabu"></div>
    <hr />
	<button type="button" class="closePumbunModal">닫기</button>
  </div>
</div>


    
<script>
let now_page_code = "b06";

var dataTable;
var selectedRowData = null;

$(function() {
	$(".dayselect").val(todayDate());
	getHeatList();

});

//이벤트
  $('.select-button').click(function() {
	  getHeatList();
//    dataTable.setData("/chunil/machine/spareStatus/list", { mch_name: sel });
  });

  $('.insert-button').click(function() {
    selectedRowData = null;
    $('#corrForm')[0].reset();
    $("input[name='w_date']").val(todayDate());    
    $("input[name='w_sdatetime']").val(todayDate()+" "+nowTime());    
//    $("input[name='w_edatetime']").val(todayDate()+" "+nowTimeAftertwo());    
  
	$("input[name='w_in_edatetime']").attr("disabled",true).css("background-color","lightgray");
	$("input[name='w_edatetime']").attr("disabled",true).css("background-color","lightgray");
	$("input[name='h_val1']").attr("disabled",true).css("background-color","lightgray");
	$("input[name='h_val2']").attr("disabled",true).css("background-color","lightgray");
	$("input[name='h_val3']").attr("disabled",true).css("background-color","lightgray");

    $('#modalContainer').show().addClass('show');
  });

  $('.delete-button').click(function() {
    if (!selectedRowData) {
      alert('삭제할 행을 먼저 클릭해 주세요.');
      return;
    }
    if (!confirm('선택된 항목을 정말 삭제하시겠습니까?')) return;
  
    $.ajax({
      url: "/chunil/productionManagement/heatTreatment/delete",
      type: "POST",
      dataType:"json",
      data: { "w_lot": selectedRowData.w_lot },
      success: function(res) {
        alert('삭제되었습니다.');
        
        getHeatList();
        selectedRowData = null;
      },
      error: function() {
        alert('삭제 중 오류가 발생했습니다.');
      }
    });

  });

  $('.close, #closeModal').click(function() {
	  $('#corrForm')[0].reset();
    $('#modalContainer').removeClass('show').hide();
  });
  
  $(".closePumbunModal, .closePumbun").click(function(){
	  $('#pumbunModal').removeClass('show').hide();
  });

  $('#saveCorrStatus').click(function(event) {
    event.preventDefault();
    var formData = new FormData($('#corrForm')[0]);
/*    if (selectedRowData && selectedRowData.no) {
      formData.append('no', selectedRowData.no);
    }*/
    $.ajax({
      url: "/chunil/productionManagement/heatTreatment/save",
      type: "POST",
      data: formData,
      processData: false,
      contentType: false,
      success: function(result) {
      	 
      		 alert("저장되었습니다!");
               $('#modalContainer').hide();
               var currentFilter = $('.dayselect').val() || 'ALL';
               getHeatList();               
               selectedRowData = null;
      },
      error: function() {
        alert('저장 중 오류가 발생했습니다.');
      }
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


//함수


function getHeatList(){
	  dataTable = new Tabulator('#dataTable', {
		    height: '700px',
		    layout: 'fitDataFill',
		    headerSort: false,
		    reactiveData: true,
		    columnHeaderVertAlign: "middle",
		    rowVertAlign: "middle",
		    headerHozAlign: 'center',
		    ajaxConfig: { method: 'POST' },
		    renderHorizontal:"virtual",
		    ajaxURL: "/chunil/productionManagement/heatTreatment/list",
		    ajaxProgressiveLoad:"scroll",
		    ajaxParams: { w_date: $(".daySet").val() },		    
		    ajaxResponse:function(url, params, response){
				$("#dataTable .tabulator-col.tabulator-sortable").css("height","55px");
		        return response; //return the response data to tabulator
		    },
		    placeholder: "조회된 데이터가 없습니다.",
		    columns: [
		        //{ title: "no", field: "no", visible: false }, 
		      { title: "작업일자", field: "w_date",  width: 120, hozAlign: "center" },
		      { title: "작업LOT",    			field: "w_lot",         width: 140, hozAlign: "center" },
//		      { title: "순번", field: "w_idx",       width: 80, hozAlign: "center" },
		      { title: "품번",    field: "w_pnum",    width: 110, hozAlign: "center" },		      
		      { title: "품명", field: "w_pname",      width: 110, hozAlign: "center" },
		      { title: "투입시작시간",               field: "w_sdatetime",    width: 180, hozAlign: "center" },
		      { title: "투입종료시간",               field: "w_in_edatetime",       width: 180, hozAlign: "center" },
		      { title: "투입시간(분)",    			field: "w_intime",         width: 100, hozAlign: "center" },
		      { title: "투입통수(통)",           field: "w_incnt",  width: 100, hozAlign: "center" },
		      { title: "투입중량(kg)",           field: "w_weight",  width: 100, hozAlign: "center" },
		      { title: "강종",                field: "w_gang",   width: 110, hozAlign: "center" },
		      { title: "T급",                field: "w_t_gb",   width: 110, hozAlign: "center" },
		      { title: "소입온도(℃)",                field: "w_qf",   width: 110, hozAlign: "center" },
		      { title: "소려온도(℃)",                field: "w_tf",   width: 110, hozAlign: "center" },
		      { title: "CP(%)",                field: "w_cp",   width: 110, hozAlign: "center" },
		      { title: "경도값-1",    			field: "h_val1",         width: 100, hozAlign: "center" },
		      { title: "경도값-2",    			field: "h_val2",         width: 100, hozAlign: "center" },
		      { title: "경도값-3",    			field: "h_val3",         width: 100, hozAlign: "center" },
		      { title: "작업완료시간",               field: "w_edatetime",       width: 180, hozAlign: "center" },
		    ],

		    rowClick: function(e, row) {
		      $('#dataTable .tabulator-row').removeClass('row_select');
		      row.getElement().classList.add('row_select');
		      selectedRowData = row.getData();
		    },
		    //더블클릭 했을때 
		    rowDblClick: function(e, row) {
		  	  var d = row.getData();
		  	  selectedRowData = d;
		  	  $('#corrForm')[0].reset();
		  	  $("input[name='w_in_edatetime']").attr("disabled",false).css("background-color","white");
		  	  $("input[name='w_edatetime']").attr("disabled",false).css("background-color","white");
			  $("input[name='h_val1']").attr("disabled",false).css("background-color","white");
			  $("input[name='h_val2']").attr("disabled",false).css("background-color","white");
			  $("input[name='h_val3']").attr("disabled",false).css("background-color","white");
			  
		  	  //$('select[name="no"]').val(d.no);
		  	  $('input[name="w_date"]').val(d.w_date);
		  	  $('input[name="w_sdatetime"]').val(d.w_sdatetime);
		  	  $('input[name="w_in_edatetime"]').val(d.w_in_edatetime);
		  	  $('input[name="w_edatetime"]').val(d.w_edatetime);
		  	  $('input[name="w_pnum"]').val(d.w_pnum);
		  	  $('input[name="w_incnt"]').val(d.w_incnt);
		  	  $('input[name="w_weight"]').val(d.w_weight);
		  	  $('input[name="h_val1"]').val(d.h_val1);
		  	  $('input[name="h_val2"]').val(d.h_val2);
		  	  $('input[name="h_val3"]').val(d.h_val3);
		  	  $('input[name="w_lot"]').val(d.w_lot);

		  	  $('#modalContainer').show().addClass('show');
		  	}

		  });
}

function pumbunSelect(){
//	alert("품번선택");
	$("#pumbunModal").show().addClass('show');
	getPumbunList();
}
var pumbunTabu;
function getPumbunList(){
	pumbunTabu = new Tabulator('#pumbunTabu', {
		    height: '300px',
		    layout: 'fitDataFill',
		    headerSort: false,
		    reactiveData: true,
		    columnHeaderVertAlign: "middle",
		    rowVertAlign: "middle",
		    headerHozAlign: 'center',
		    ajaxConfig: { method: 'POST' },
		    ajaxURL: "/chunil/productionManagement/heatTreatment/pumbun/list",
		    ajaxProgressiveLoad:"scroll",
		    ajaxParams: { 
		    	"w_pnum": $("#s_pnum").val(),
		    	"w_gang": $("#s_gang").val(),		    	
		    	"w_t_gb": $("#s_t_gb").val()	    	
		    },		    
		    ajaxResponse:function(url, params, response){
				$("#pumbunTabu .tabulator-col.tabulator-sortable").css("height","55px");
		        return response; //return the response data to tabulator
		    },
		    placeholder: "조회된 데이터가 없습니다.",
		    columns: [
		        //{ title: "no", field: "no", visible: false }, 
		      { title: "품번", field: "w_pnum",  width: 120, hozAlign: "center" },
		      { title: "품명", field: "w_pname",       width: 150, hozAlign: "center" },
		      { title: "강종",               field: "w_gang",    width: 80, hozAlign: "center" },
		      { title: "T급",               field: "w_t_gb",       width: 80, hozAlign: "center" },
		      { title: "소입온도(℃)",                field: "w_qf",   width: 110, hozAlign: "center" },
		      { title: "소려온도(℃)",                field: "w_tf",   width: 110, hozAlign: "center" },
		      { title: "CP(%)",                field: "w_cp",   width: 110, hozAlign: "center" },
		      { title: "장입기준량(kg)",               field: "w_std_weight",       width: 110, hozAlign: "center" },
		      { title: "요구경도",               field: "w_hardness",       width: 110, hozAlign: "center" },
		    ],

		    rowClick: function(e, row) {
		      $('#pumbunTabu .tabulator-row').removeClass('row_select');
		      row.getElement().classList.add('row_select');
		      selectedRowData = row.getData();
		    },

		    //더블클릭 했을때 
		    rowDblClick: function(e, row) {
		  	  var d = row.getData();
		  	  $("input[name='w_pnum']").val(d.w_pnum);
		  		$('#pumbunModal').removeClass('show').hide();
		  			  
		  	}

		  });
}



</script>
</body>
</html>