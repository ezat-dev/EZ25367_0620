<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>열전대교체이력</title>
<%@include file="../include/pluginpage.jsp" %>    
<jsp:include page="../include/tabBar.jsp"/>
<style>
.container {
	display: flex;
	justify-content: space-between;
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
	background-color: white;
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
	align-items: center;
	gap: 10px;
	margin-left: 20px;
	font-size: 14px;
}

.box1 label {
	font-weight: bold;
	margin-right: 5px;
}

.box1 select {
	padding: 4px 10px;
	font-size: 14px;
	height: 32px;
	border-radius: 4px;
	border: 1px solid #ccc;
}

.box1 .tabP {
	font-size: 16px;
	font-weight: bold;
	color: white;
	margin: 0 10px 0 0;
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

button-container.button {
	height: 16px;
}

.mid {
	margin-right: 9px;
	font-size: 20px;
	font-weight: bold;
	height: 42px;
	margin-left: 9px;
}

.row_select {
	background-color: #ffeeba !important;
}

.excel-download-button, .excel-upload-button {
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
    
    
<body>
	
	<div class="tab">
        

            <div class="button-container">
            
               <div class="box1">
				    <p class="tabP">조건관리 - 열전대교체이력</p>
				    <label for="sdate">년도 선택:</label>
				    <select id="sdate">
				        <option value="2025">2025</option>
				        <option value="2026">2026</option>
				        <option value="2027">2027</option>
				    </select>
				</div>
			   
			   
                <button class="select-button" onclick="getThermocoupleList();">
                    <img src="/chunil/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
                <!-- <button class="insert-button">
                    <img src="/chunil/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
                </button>
                <button class="delete-button">
				    <img src="/chunil/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
				</button> -->
                
                
                <button class="excel-download-button">
                    <img src="/chunil/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀다운로드
                </button>
                
                <button class="excel-upload-button">
                    <img src="/chunil/css/tabBar/excel-icon.png" alt="excel" class="button-image">엑셀업로드
                </button>
                <input type="file" id="fileInput" style="display: none;">
                
            </div>
        </div>
	<main class="main">
		<div class="container">
			<div id="tab1" class="tabulator"></div>
		</div>
	</main>
    	
    	
    	
    	
	<div id="modalContainer" class="modal">
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    <!-- 추가, 수정 -->
	    <h2>교체 이력 등록</h2>
	    <form id="corrForm" autocomplete="off">
	    	<input type="hidden" name="cnt" id="cnt">
	      <label>설비명</label>
	      <input type="text" name="seolbi" value="연속열처리로" readonly>
	
	      <label>존 구분</label>
	      <input type="text"  name="zone"  readonly>
	
	      <label>이전교체일자</label>
	      <input type="date" name="change_bdate" placeholder="이전 교체일자 선택">
	      
	      <label>교체일자</label>
	      <input type="date" name="change_date" placeholder="교체일자 선택">
	      
	      <label>차기교체일자</label>
	      <input type="date" name="change_ndate" placeholder="차기 교체일자 선택">
	
	      <label>비고</label>
	      <textarea name="bigo" rows="4"></textarea>
	
	      <button type="submit" id="saveCorrStatus" onclick="save();">저장</button>
	      <button type="button" id="closeModal">닫기</button>
	      
	    </form>
	  </div>
	</div>
    	
    	
   
		
	    
	    
<script>
	//전역변수
	  let now_page_code = "c02";

	//로드
	$(function(){
		$(".headerP").text("조건관리 - 열전대교체이력");
	});

	//로드
	$(function(){
		//전체 거래처목록 조회
		getThermocoupleList();
	});

	//이벤트
	//함수
	function getThermocoupleList() {
		userTable = new Tabulator("#tab1", {
			height: "750px",
			layout: "fitColumns",
			selectable: true,
			tooltips: true,
			selectableRangeMode: "click",
			reactiveData: true,
			headerHozAlign: "center",
			ajaxConfig: "POST",
			ajaxLoader: false,
			ajaxURL: "/chunil/condition/thermocoupleChange/getThermocoupleList",
			ajaxParams: {
				year: $("#sdate").val()
			},
			ajaxResponse: function (url, params, response) {
				$("#tab1 .tabulator-col.tabulator-sortable").css("height", "55px");
				return response.data;
			},
			placeholder: "조회된 데이터가 없습니다.",
			paginationSize: 20,
			columns: [
				{ title: "No.", field: "cnt", sorter: "int", width: 120, hozAlign: "center", headerFilter: "input" ,visible:false},
				{ title: "설비명", field: "hogi", sorter: "string", width: 320, hozAlign: "center", headerFilter: "input" },
				{ title: "존 구분", field: "zone", sorter: "string", width: 320, hozAlign: "center", headerFilter: "input" },
				{ title: "교체일자", field: "change_date", sorter: "string", width: 350, hozAlign: "center", headerFilter: "input" }
			],
			rowFormatter: function (row) {
				row.getElement().style.fontWeight = "700";
				row.getElement().style.backgroundColor = "#FFFFFF";
			},
			rowClick: function (e, row) {
				$("#tab1 .tabulator-tableHolder > .tabulator-table > .tabulator-row").removeClass("row_select");
				row.getElement().classList.add("row_select");
			},
			rowDblClick: function (e, row) {
				const data = row.getData();
				selectedRowData = data;
				$('#corrForm')[0].reset();
				$('#modalContainer').show().addClass('show');
	
				Object.keys(data).forEach(function (key) {
					const field = $('#corrForm [name="' + key + '"]');
					if (field.length) {
						field.val(data[key]);
					}
				});
				console.log('data', data);
				$('.delete').show();
			}
		});
	}


	function save() {
	    var formData = new FormData($("#corrForm")[0]);

	    
	    /* if (selectedRowData && selectedRowData.cnt) {
	        formData.append("cnt", selectedRowData.cnt);
	    } */

	    if (!confirm("수정하시겠습니까?")) {
	        return;
	    }

	    $.ajax({
	        url: "/chunil/condition/thermocoupleChange/thermocoupleSave", 
	        type: "POST",
	        data: formData,
	        contentType: false,
	        processData: false,
	        dataType: "json",
	        success: function(result) {
	            if (result.status === "success") {
	                alert("수정되었습니다.");
	                $("#modalContainer").hide(); 
	                getThermocoupleList(); 
	            } else {
	                alert("수정 실패: " + result.message);
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error("수정 오류:", error);
	            alert("수정 중 오류가 발생했습니다.");
	        }
	    });
	}




	/* $('.insert-button').click(function() {
	      selectedRowData = null;
	      $('#corrForm')[0].reset();
	      $('#modalContainer').show().addClass('show');
	    }); */

	$('.close, #closeModal').click(function() {
	      $('#modalContainer').removeClass('show').hide();
	    });

</script>

</body>
</html>
