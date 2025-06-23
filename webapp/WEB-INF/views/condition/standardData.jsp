<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>분할기준중량관리</title>
 
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
            width: 100%;
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
		    margin-right: 150px;
		    margin-top: 40px;
		}
		

		.box1 {
		    display: flex;
		    /* justify-content: right; */
		    margin-left: 20px;
		    align-items: center;
		    width: 800px;
		    margin-right: 20px;
		    margin-top: 4px;
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


     
        .mid{
        margin-right: 9px;
	    font-size: 20px;
	    font-weight: bold;
	
	    height: 42px;
	    margin-left: 9px;
        }

    .checkbox-group {
        display: flex;
        gap: 20px;
        margin-bottom: 10px;
    }
    .checkbox1{
    margin-top:20px;
    margin-right:10px;
    
    }

    .checkbox-group label {
        font-size: 16px;
    }

    .checkbox-group input[type="checkbox"] {
        transform: scale(1.7); 
    }
	.delete-button {
	    height: 40px;
	    padding: 0 11px;
	    border: 1px solid rgb(53, 53, 53);
	    border-radius: 4px;
	    background-color: #ffffff;
	    cursor: pointer;
	    display: flex;
	    align-items: center;
	}
	
	.delete-button:hover {
	    background-color: #f0f0f0;
	}
	
	.excel-import-button {
	    height: 40px;
	    padding: 0 11px;
	    border: 1px solid rgb(53, 53, 53);
	    border-radius: 4px;
	    background-color: #ffffff;
	    cursor: pointer;
	    display: flex;
	    align-items: center;
	}
	/* CSS */
.form-row {
  display: flex;
  align-items: center;
  gap: 16px;           /* 레이블–인풋 간격 */
  flex-wrap: wrap;     /* 화면 좁아지면 줄 바꿈 */
  margin-bottom: 12px; /* 각 행 간 간격 */
}

.form-label {
  white-space: nowrap;
  font-weight: 600;
  font-size: 14px;
  color: #333;
  margin-right: 4px;
}

	.form-input {
	    flex: 1;
	    width: 160px;
	    min-width: 100px;
	    padding: 8px 12px;
	    font-size: 14px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    transition: border-color 0.2s, box-shadow 0.2s;
	}
		
	.form-input:focus {
	  outline: none;
	  border-color: #409eff;    /* 블루 톤 */
	  box-shadow: 0 0 0 2px rgba(64, 158, 255, 0.2);
	}
	
	
	@media (max-width: 600px) {
	  .form-row {
	    flex-direction: column;
	    align-items: stretch;
	  }
	  .form-label {
	    margin-bottom: 4px;
	  }
	}
	
	.excel-import-button:hover {
	    background-color: #f0f0f0;
	}
	
	#excelOverlay {
	  display: none;
	  position: fixed;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background-color: rgba(0,0,0,0.4);
	  z-index: 9998;
	}
	
	/* 로딩 박스 */
	#excelLoading {
	  display: none;
	  position: fixed;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%, -50%);
	  background-color: white;
	  padding: 20px 30px;
	  border-radius: 10px;
	  box-shadow: 0 0 20px rgba(0,0,0,0.2);
	  font-size: 16px;
	  font-weight: bold;
	  z-index: 9999;
	  text-align: center;
	}
	
	/* 로딩 스피너 */
	#excelLoading::before {
	  content: "";
	  display: block;
	  margin: 0 auto 10px;
	  width: 30px;
	  height: 30px;
	  border: 4px solid #ccc;
	  border-top: 4px solid #4caf50;
	  border-radius: 50%;
	  animation: spin 1s linear infinite;
	}
	
	/* 애니메이션 */
	@keyframes spin {
	  0% { transform: rotate(0deg); }
	  100% { transform: rotate(360deg); }
	}

    </style>
</head>

<body>

    <main class="main">

        <div class="tab">
        

            <div class="button-container">
            
  			<div class="box1">
           <p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
        
        
				
			<div class="form-row">
			
		      <label for="group_id" class="form-label">품번 :</label>
			  <input type="text" id="item_no" class="form-input" placeholder="표면처리 사양" autocomplete="off">
			
			
			
			  <label for="group_id" class="form-label">강종 :</label>
			  <input type="text" id="steel_grade" class="form-input" placeholder="그룹ID" autocomplete="off">
			
			  <label for="item_cd" class="form-label">T급 :</label>
			  <input type="text" id="t_grade" class="form-input" placeholder="품번" autocomplete="off">
			
			</div>

			
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

                <button class="excel-button">
                    <img src="/chunil/css/tabBar/excel-icon.png" alt="excel" class="button-image" >Download
                </button>
                
                <button class="excel-import-button">
                    <img src="/chunil/css/tabBar/excel-icon.png" alt="excel" class="button-image" >Upload
                </button>
			<input type="file" id="fileInput" style="display: none;">
            </div>
        </div>

        <div class="view">
            <div id="dataList"></div>
        </div>
    </main>
	<div id="modalContainer" class="modal" >
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>열처리 연속로 기준 정보 등록</h2>
      <form id="corrForm" autocomplete="off">
    <input type="hidden" name="plac_cd" value="JH_KR_01">
    <input type="hidden" name="plnt_cd" value="02">

  <!--   <label for="equipment_name">설비명</label>
    <input type="text" id="equipment_name" name="equipment_name" value="열처리 연속로">
 -->
    <label for="item_no">품번</label>
    <input type="text" id="item_no" name="item_no" placeholder="예: ABC1234">

    <label for="item_name">품명</label>
    <input type="text" id="item_name" name="item_name" placeholder="예: 제품명">

    <label for="steel_grade">강종</label>
    <input type="text" id="steel_grade" name="steel_grade" placeholder="예: SCM420H">

    <label for="t_grade">T급</label>
    <input type="text" id="t_grade" name="t_grade" placeholder="예: T5">

    <label for="apply_temp1">소입온도</label>
    <input type="text" id="apply_temp1" name="apply_temp1" placeholder="예: 880°C">

    <label for="apply_temp2">소려온도</label>
    <input type="text" id="apply_temp2" name="apply_temp2" placeholder="예: 180°C">

    <label for="apply_cp">CP</label>
    <input type="text" id="apply_cp" name="apply_cp" placeholder="예: 1.2">

    <label for="std_load">기준 장입량</label>
    <input type="text" id="std_load" name="std_load" placeholder="예: 300" inputmode="numeric">

    <label for="hardness_req">요구경도</label>
    <input type="text" id="hardness_req" name="hardness_req" placeholder="예: HRC 60" inputmode="numeric">

    <button type="submit" id="saveCorrStatus">저장</button>
    <button type="button" id="closeModal">닫기</button>
</form>

    </div>
</div>


<div id="excelOverlay"></div>
<div id="excelLoading">엑셀 기능 진행 중 입니다.<br>잠시만 기다려주세요...</div>



  <script>
let now_page_code = "c01";
let dataTable;
let selectedRow = null;

$(document).ready(function () {
    // 초기 테이블만 생성
    initDataTable();

    // 최초 조회
    loadData();

    // 조회 버튼 클릭 시
    $(".select-button").click(function () {
        loadData(); // 데이터만 교체
    });

    // 모달 열기
    $(".insert-button").click(function () {
        const modal = $("#modalContainer");
        modal.find("input, textarea").val("");
        modal.show().addClass("show");
    });

    // 모달 닫기
    $(".close, #closeModal").click(function () {
        $("#modalContainer").removeClass("show").hide();
    });

    // 저장
    $("#saveCorrStatus").click(function (event) {
        event.preventDefault();

        const corrForm = new FormData($("#corrForm")[0]);

        $.ajax({
            url: "/chunil/condition/divisionWeight/insert",
            type: "POST",
            data: corrForm,
            dataType: "json",
            processData: false,
            contentType: false,
            success: function (response) {
                alert("기준정보가 성공적으로 저장되었습니다!");
                $("#modalContainer").hide();
                loadData(); // 데이터 리플레이스
            }
        });
    });

    // 삭제
    $(".delete-button").click(function (event) {
        event.preventDefault();

        if (!selectedRow) {
            alert("삭제할 행을 선택하세요.");
            return;
        }

        const item_no = selectedRow.getData().item_no;
        if (!item_no) {
            alert("삭제할 항목이 없습니다.");
            return;
        }

        $.ajax({
            url: "/chunil/condition/divisionWeight/del",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify({ item_no }),
            dataType: "json",
            success: function (response) {
                alert("기준정보가 성공적으로 삭제되었습니다!");
                selectedRow = null;
                loadData(); // 삭제 후 데이터 다시 로딩
            },
            error: function (xhr, status, error) {
                alert("삭제 중 오류 발생: " + error);
            }
        });
    });

    // 엑셀 다운로드
    $(".excel-button").on("click", function () {
        $("#excelOverlay").show();
        $("#excelLoading").show();

        $.ajax({
            url: "/chunil/condition/divisionWeight/excel",
            type: "post",
            dataType: "json",
            success: function (result) {
                if (!result.error) {
                    const a = document.createElement('a');
                    a.href = "/chunil/download_divisionWeight?filename=기준정보.xlsx";
                    a.style.display = 'none';
                    document.body.appendChild(a);
                    a.click();
                    document.body.removeChild(a);
                    alert("엑셀 저장 완료되었습니다.");
                } else {
                    alert("엑셀 생성 오류: " + result.error);
                }
            },
            error: function () {
                alert("엑셀 다운로드 오류 발생");
            },
            complete: function () {
                $("#excelOverlay").hide();
                $("#excelLoading").hide();
            }
        });
    });

    // 엑셀 업로드
    $(".excel-import-button").on("click", function () {
        $("#fileInput").val("").click();
    });

    $("#fileInput").on("change", function () {
        const file = this.files[0];
        if (!file) return;

        $("#excelOverlay").show();
        $("#excelLoading").show();

        const formData = new FormData();
        formData.append("file", file);

        $.ajax({
            url: "/chunil/condition/divisionWeight/excelFileInput",
            type: "POST",
            data: formData,
            contentType: false,
            processData: false,
            success: function (response) {
                if (response.success) {
                    alert(response.message || "엑셀 업로드 완료");
                    loadData(); // 업로드 후 데이터 갱신
                } else {
                    alert(response.error || "엑셀 업로드 실패");
                }
            },
            complete: function () {
                $("#excelOverlay").hide();
                $("#excelLoading").hide();
            }
        });
    });
});

// 초기 Tabulator 정의
function initDataTable() {
    dataTable = new Tabulator("#dataList", {
        height: "770px",
        layout: "fitColumns",
        reactiveData: true,
        selectable: 1,
        tooltips: true,
        ajaxLoader: false,
        paginationSize: 20,
        placeholder: "조회된 데이터가 없습니다.",
        columnHeaderVertAlign: "middle",
        rowVertAlign: "middle",
        headerHozAlign: "center",
        columns: [
        	 {title: "NO", formatter: "rownum", width: 70, hozAlign: "center" },
            //{ title: '설비명', formatter: 'equipment_name', width: 180, hozAlign: 'center' },
            { title: "품번", field: "item_no", sorter: "string", width: 200, hozAlign: "center" },
            { title: "품명", field: "item_name", sorter: "string", width: 200, hozAlign: "center" },
            { title: "강종", field: "steel_grade", sorter: "string", width: 150, hozAlign: "center", headerSort: false },
            { title: "T급", field: "t_grade", sorter: "string", width: 150, hozAlign: "center", headerSort: false },
            { title: "소입온도", field: "apply_temp1", sorter: "string", width: 150, hozAlign: "center", headerSort: false },
            { title: "소려온도", field: "apply_temp2", sorter: "string", width: 150, hozAlign: "center", headerSort: false },
            { title: "CP", field: "apply_cp", sorter: "string", width: 140, hozAlign: "center", headerSort: false },
            { title: "기준 장입량", field: "std_load", sorter: "string", width: 150, hozAlign: "center", headerSort: false },
            { title: "요구경도", field: "hardness_req", sorter: "string", width: 150, hozAlign: "center", headerSort: false },
            {
                title: "저장",
                field: "insert_date",
                width: 180,
                hozAlign: "center",
                headerSort: false,
                formatter: function (cell) {
                    const value = cell.getValue();
                    return value ? value.replace(/\.0$/, "") : "";
                }
            }

        ],
        rowClick: function (e, row) {
        	selectedRow = row;
        },
        rowDblClick: function (e, row) {
            const d = row.getData();
            const $f = $('#corrForm');
            $f[0].reset();

            // 필드에 값 넣기
            $f.find('input[name="equipment_name"]').val(d.equipment_name);
            $f.find('input[name="item_no"]').val(d.item_no);
            $f.find('input[name="item_name"]').val(d.item_name);
            $f.find('input[name="steel_grade"]').val(d.steel_grade);
            $f.find('input[name="t_grade"]').val(d.t_grade);
            $f.find('input[name="apply_temp1"]').val(d.apply_temp1);
            $f.find('input[name="apply_temp2"]').val(d.apply_temp2);
            $f.find('input[name="apply_cp"]').val(d.apply_cp);
            $f.find('input[name="std_load"]').val(d.std_load);
            $f.find('input[name="hardness_req"]').val(d.hardness_req);

            // 모달 열기
            $('#modalContainer').show().addClass('show');
        }

    });
}

// Ajax로 데이터만 교체
function loadData() {
    $.ajax({
        url: "/chunil/condition/divisionWeight/list",
        type: "POST",
        dataType: "json",
        data: {
        	steel_grade: $("#steel_grade").val() || "",
        	t_grade: $("#t_grade").val() || "",
        	item_no: $("#item_no").val() || "",
        },
        success: function (data) {
            if (data.status === "success") {
                dataTable.replaceData(data.data); // ✅ 배열만 넘김
            } else {
                alert("데이터 조회 실패: " + data.message);
            }
        },

        error: function () {
            alert("데이터 조회 실패");
        }
    });
}
</script>


</body>
</html>
