<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리계획서 및 작업 표준서</title>
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
		    width: 1100px;
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
        
        
        
        /*모달css  */
		   .modal {
		    display: none;
		    position: fixed;
		    left: 0;
		    top: 0;
		    width: 100%;
		    height: 100%;
		    background-color: rgba(0, 0, 0, 0.5);
		    transition: opacity 0.3s ease-in-out;
		    overflow: auto;
		}
		.row_select {
		    background-color: #d0d0d0 !important;
		}
		
		.modal-content {
		    background: white;
		    width: 40%; /* 가로 길이를 50%로 설정 */
		    max-width: 400px; /* 최대 너비를 설정하여 너무 커지지 않도록 */
		    max-height: 800px; /* 화면 높이에 맞게 제한 */
		    overflow-y: auto;
		    margin: 2% auto; /* 수평 중앙 정렬 */
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
		    width: 100%;
		    padding: 8px;
		    margin-bottom: 10px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		}

		.modal-content select {
		    width: 104%;
		    height: 38px;
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
		 .mid{
        margin-right: 9px;
	    font-size: 20px;
	    font-weight: bold;
	
	    height: 42px;
	    margin-left: 9px;
        }
        
        .radio-group {
		  display: flex;
		  gap: 20px;
		  margin-bottom: 15px;
		  align-items: center;
		}
		
		.radio-group label {
		  display: flex;
		
		  gap: 5px;
		  font-size: 18px;
		  padding: 4px 8px;
		  border: 1px solid #ccc;
		  border-radius: 6px;
		  cursor: pointer;
		  transition: all 0.2s;
		}
		
		.radio-group input[type="radio"] {
		  accent-color: #007bff; /* 파란색 포인트 */
		  cursor: pointer;
		}
		
		.radio-group label:hover {
		  background-color: #f0f0f0;
		  border-color: #007bff;
		}
.legend {
  font-family: 'Arial', sans-serif;
  background: #f9f9f9;
  padding: 12px 20px;
  border-radius: 8px;
  max-width:1100px;
  margin: 20px auto;
  box-shadow: 0 2px 6px rgba(0,0,0,0.1);
}

.legend-items {
  display: flex;
  gap: 40px;
  flex-wrap: nowrap;
  justify-content: flex-start;
  align-items: center; /* 세로 정렬 */
}

.legend-item {
  white-space: nowrap;
  font-size: 15px;
}

.legend-item h3 {
  margin: 0;
  font-weight: 800;
  font-size: 18px;
  color: #333;
}
.legend-item strong {
  color: #222;
  margin-right: 6px;
  font-weight: 700;
}


    </style>
</head>
<body>

    <main class="main">
        <div class="tab">
        
        
        
        
        

            <div class="button-container">
            
             <div class="box1">
			<p class="tabP" style="font-size: 20px; margin-left: 40px; color: white; font-weight: 800;"></p>
			
			<input type="hidden" id="id" name="id">

			
			
			           <label class="daylabel">검색 날짜 :</label>
				<input type="text" autocomplete="off"class="daySet" id="startDate" style="font-size: 16px; margin-bottom:10px;" placeholder="시작 날짜 선택">
				
				<span class="mid" style="font-size: 20px; font-weight: bold; margin-botomm:10px;"> ~ </span>
	
				<input type="text"autocomplete="off" class="daySet" id="endDate" style="font-size: 16px; margin-bottom:10px;" placeholder="종료 날짜 선택">
			
			<label class="daylabel">설비명 :</label>
			<select name="mch_name"id="mch_name" class="dayselect" style="width: 20%; font-size: 15px; height: 34px; text-align: center; margin-bottom: 10px; border: 1px solid #ccc; border-radius: 5px;">
			    <option value="열처리 연속로">열처리 연속로</option>

			</select>


    
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
				
				
            </div>
        </div>

		





        <div class="view">
            <div id="dataList"></div>
        </div>
    </main>


<div id="modalContainer" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>관리게획서 및 작업표준서</h2>
       <form id="corrForm" autocomplete="off" enctype="multipart/form-data">

          <label>저장 날짜</label>
			  <input type="text"name="cr_date"  class="daySet" placeholder="일 선택" style="text-align: left;">
           
              <input type="hidden" id="idx" name="idx" />
            <label>설비</label>
			
			<select name="mch_name" class="daySet" style="text-align: left;">
			    <option value="열처리 연속로">열처리 연속로</option>
			</select>
            
  
  

	
			<label>관리계획서</label>
			<input type="file" name="box1" id="fileInput" placeholder="관리계획서">
			<span id="box1FileName"></span>
			<label>작업표준서</label>
			<input type="file" name="box2" id="fileInput" placeholder="작업표준서">
			<span id="box2FileName"></span>
			<label>설비점검일지</label>
			<input type="file" name="box3" id="fileInput" placeholder="설비점검일지">
			<span id="box3FileName"></span>
			
			
		<!-- 	<label>MSDS</label>
			<input type="file" name="box4" id="fileInput" placeholder="MSDS">
			 -->
			
			<span id="box4FileName"></span>
            <label>비고</label>
			 <input type="text"  name="memo" placeholder="비고 입력">
	

            <button type="submit" id="saveCorrStatus">저장</button>
            <button type="button" id="closeModal">닫기</button>
        </form>
    </div>
</div>


<div id="pdfViewerModal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; 
     background:rgba(0,0,0,0.7); z-index:1000; align-items:center; justify-content:center;">
  <div style="position:relative; width:80%; height:90%; background:#fff; border-radius:8px; overflow:hidden;">
    <button id="closePdfModal" 
            style="position:absolute; top:8px; right:8px; z-index:10; padding:4px 8px;">✕ 닫기</button>
    <iframe id="pdfFrame" 
            style="width:100%; height:100%; border:none;" 
            src=""></iframe>
  </div>
</div>

<script>
let now_page_code = "c05";
let dataTable;
let selectedRow;


function pdfLinkFormatter(cell) {
    var fn = cell.getValue();
    if (!fn) return "";
    // 1) 기본 인코딩
    var enc = encodeURIComponent(fn);
    // 2) 괄호까지 안전하게 인코딩
    enc = enc.replace(/\(/g, '%28').replace(/\)/g, '%29');
    return '<a href="javascript:void(0);" onclick="openPdf(\'' + enc + '\')">' + fn + '</a>';
}

// PDF 팝업 열기
function openPdf(encodedName) {
    console.log(">>> openPdf called with:", encodedName);
    if (!encodedName) {
        alert("파일명이 없습니다!");
        return;
    }
    // iframe src 세팅
    document.getElementById('pdfFrame').src = 
        '/chunil/download_standardDoc?filename=' + encodedName;
    document.getElementById('pdfViewerModal').style.display = 'flex';
}

// getDataList 함수 정의
function getDataList() {
    dataTable = new Tabulator("#dataList", {
        height: "760px",
        layout: "fitColumns",
        headerHozAlign: "center",
        columnHeaderVertAlign: "middle",
        rowVertAlign: "middle",
        ajaxConfig: "POST",
        ajaxLoader: false,
        ajaxURL: "/chunil/condition/standardDoc/list",
        ajaxParams: {
            mch_name: $("#mch_name").val() || "",
            startDate: $("#startDate").val() || "",
            endDate: $("#endDate").val() || ""
        },
        placeholder: "데이터 없음",
        ajaxResponse: function (url, params, response) {
            return response;
        },
        columns: [
            { title: "No", formatter: "rownum", hozAlign: "center", width: 70, headerSort: false },
            { title: "생성", field: "cr_date", hozAlign: "center", width: 120 },
            { title: "설비", field: "mch_name", hozAlign: "center", width: 120 },

            {
                title: "관리계획서", field: "box1", hozAlign: "center", width: 250,
                formatter: function (cell) {
                    var fn = cell.getValue();
                    if (!fn) return "";
                    return '<a href="javascript:void(0);" onclick="openPdf(\'' + encodeURIComponent(fn) + '\')">' + fn + '</a>';
                }
            },
            {
                title: "작업표준서", field: "box2", hozAlign: "center", width: 250,
                formatter: function (cell) {
                    var fn = cell.getValue();
                    if (!fn) return "";
                    return '<a href="javascript:void(0);" onclick="openPdf(\'' + encodeURIComponent(fn) + '\')">' + fn + '</a>';
                }
            },
            {
                title: "설비점검일지", field: "box3", hozAlign: "center", width: 250,
                formatter: function (cell) {
                    var fn = cell.getValue();
                    if (!fn) return "";
                    return '<a href="javascript:void(0);" onclick="openPdf(\'' + encodeURIComponent(fn) + '\')">' + fn + '</a>';
                }
            },
            {
                title: "MSDS", field: "box4", hozAlign: "center", width: 250,
                formatter: function (cell) {
                    var fn = cell.getValue();
                    if (!fn) return "";
                    return '<a href="javascript:void(0);" onclick="openPdf(\'' + encodeURIComponent(fn) + '\')">' + fn + '</a>';
                }
            },
            { title: "비고", field: "memo", hozAlign: "center", width: 300 }
        ],
        rowClick: function (e, row) {
            $("#dataList .tabulator-row").removeClass("row_select");
            row.getElement().classList.add("row_select");
            selectedRow = row;
        },
        rowDblClick: function (e, row) {
            var d = row.getData();
            $("input[name='idx']").val(d.idx);
            $("input[name='cr_date']").val(d.cr_date);
            $("select[name='mch_name']").val(d.mch_name);
            $("input[name='memo']").val(d.memo);
            $("#box1FileName").text(d.box1 ? "기존 관리계획서 : " + d.box1 : "");
            $("#box2FileName").text(d.box2 ? "기존 작업표준서 : " + d.box2 : "");
            $("#box3FileName").text(d.box3 ? "기존 설비점검일지 : " + d.box3 : "");
            $("#box4FileName").text(d.box4 ? "기존 MSDS : " + d.box4 : "");
            $("#modalContainer").show().addClass("show");
        }
    });
}

$(document).ready(function () {
    // 날짜 세팅
    var today = new Date(),
        yesterday = new Date(today);
    yesterday.setDate(today.getDate() - 1);

    function formatDate(date) {
        var y = date.getFullYear(),
            m = ("0" + (date.getMonth() + 1)).slice(-2),
            d = ("0" + date.getDate()).slice(-2);
        return y + "-" + m + "-" + d;
    }

    $("#startDate").val(formatDate(yesterday));
    $("#endDate").val(formatDate(today));

    getDataList();

    // 모달 닫기 (PDF 뷰어)
    $("#closePdfModal").click(function () {
        $("#pdfViewerModal").hide();
        $("#pdfFrame").attr("src", "");
    });

    // insert 버튼
    $(".insert-button").click(function () {
        $("#corrForm")[0].reset();
        $("#idx").val("");
        $("input[name='cr_date']").val(formatDate(today));
        $("#box1FileName, #box2FileName, #box3FileName, #box4FileName").text("");
        $("#modalContainer").show().addClass("show");
    });

    // modal close
    $(".close, #closeModal").click(function () {
        $("#modalContainer").removeClass("show").hide();
    });

    // 설비 변경 로그
    $("#mch_name").on("change", function () {
        console.log("선택된 설비명:", $(this).val());
    });

    // 조회 버튼
    $(".select-button").click(function () {
        dataTable.setData("/chunil/condition/standardDoc/list", {
            mch_name: $("#mch_name").val(),
            startDate: $("#startDate").val(),
            endDate: $("#endDate").val()
        });
    });

    // 저장 버튼 (PDF 검증)
    $("#saveCorrStatus").click(function (event) {
        event.preventDefault();
        const formElement = document.getElementById("corrForm"),
              formData = new FormData(formElement);

        if (!formData.get("idx") || !formData.get("idx").trim()) {
            formData.delete("idx");
        }

        function isPdfFile(f) {
            return f && f.name.toLowerCase().endsWith(".pdf");
        }
        for (let field of ["box1", "box2", "box3", "box4"]) {
            const f = formData.get(field);
            if (f && f.size > 0 && !isPdfFile(f)) {
                return alert(`[${field}] PDF 형식만 업로드 가능합니다.`);
            }
        }

        $.ajax({
            url: "/chunil/condition/standardDoc/insert",
            type: "POST",
            data: formData,
            dataType: "json",
            processData: false,
            contentType: false,
            success: function (res) {
                if (res.result === "success") {
                    alert("저장 완료");
                    $("#modalContainer").hide();
                    getDataList();
                } else {
                    alert("저장 실패: " + (res.message || "알 수 없는 오류"));
                }
            },
            error: function () {
                alert("서버 오류 발생!");
            }
        });
    });

    // 삭제 버튼
    $(".delete-button").click(function (event) {
        event.preventDefault();
        if (!selectedRow) return alert("삭제할 행을 선택하세요.");
        if (!confirm("정말 삭제하시겠습니까?")) return;

        $.ajax({
            url: "/chunil/condition/standardDoc/del",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify({ idx: selectedRow.getData().idx }),
            dataType: "json",
            success: function () {
                alert("삭제 완료");
                getDataList();
            },
            error: function (_, __, e) {
                alert("삭제 중 오류: " + e);
            }
        });
    });
});
</script>









</body>
</html>
