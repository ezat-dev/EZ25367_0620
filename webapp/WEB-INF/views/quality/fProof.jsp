<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>온도균일성 테스트</title>
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

		select {
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

			
			
			<label class="daylabel">검색일자 :</label>
			<input type="text" class="monthSet" id="y_m"
			       placeholder="시작 연도 선택"
			       style="width: 30%; font-size: 16px; height: 30px; text-align: center; margin-bottom: 10px; border: 1px solid #ccc; border-radius: 5px;">
			
		<!-- 	<label class="daylabel">설비명 :</label>
			<select name="mch_name"id="mch_name" class="dayselect" style="width: 30%; font-size: 15px; height: 34px; text-align: center; margin-bottom: 10px; border: 1px solid #ccc; border-radius: 5px;">
			    <option value="G-600">G-600</option>
			    <option value="G-800">G-800</option>
			    <option value="공용설비">공용설비</option>
			    <option value="K-BLACK">K-BLACK</option>
			</select> -->


    
			</div>
                <button class="select-button">
                    <img src="/chunil/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
                <!-- <button class="insert-button">
                    <img src="/chunil/css/tabBar/add-outline.png" alt="insert" class="button-image">추가
                </button>
 -->
           <!--      <button class="delete-button">
				    <img src="/chunil/css/tabBar/xDel3.png" alt="delete" class="button-image"> 삭제
				</button> -->
				
				<button class="excel-button">
                    <img src="/chunil/css/tabBar/excel-icon.png" alt="excel" class="button-image" >Download
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
        <h2>F/Proof</h2>
       <form id="corrForm" autocomplete="off" enctype="multipart/form-data">
            
 			<input type="hidden" name="id" id="id">
 			<input type="hidden" name="year" id="year">
	
	      <label>년/월</label>
	      <input type="text"  class="monthSet" name="y_month" placeholder="예: 2024/06" style="text-align: left;">
	

	
	
            <button type="submit" id="saveCorrStatus">저장</button>
            <button type="button" id="closeModal">닫기</button>
        </form>
    </div>
</div>

<script>

let now_page_code = "d03";

$(document).ready(function () {
    // 페이지 로딩 시 데이터 불러오기
 

    const currentYear  = new Date().getFullYear();
  	const currentMonth = String(new Date().getMonth() + 1).padStart(2, '0');  // 1~12 → "01"~"12"
  	$('#y_m').val(currentYear + '/' + currentMonth);
    getDataList();

    
    $(".insert-button").click(function () {
        const y_m = $("#y_m").val() || ""; 
  

        // 폼 초기화
        $("#corrForm")[0].reset(); 
        $("#id").val(""); // 숨겨진 id 필드도 비워주기

        let modal = $("#modalContainer");
        modal.show();
        modal.addClass("show");
    });



    $(".close, #closeModal").click(function () {
        $("#modalContainer").removeClass("show").hide();
    });


/*     $("#mch_name").on("change", function () {
        console.log("선택된 설비명:", $(this).val());
    }); */


    $(".select-button").click(function () {
   /*      const equipmentName = $("#mch_name").val() || ""; */
        const y_m = $("#y_m").val() || "";


        console.log("검색 요청 값 =>", {
      /*       mch_name: equipmentName, */
            y_m: y_m
        });

        dataTable.setData("/chunil/quality/fProof/list", {
         /*    mch_name: equipmentName, */
            y_m: y_m
        });
    });

$("#saveCorrStatus").click(function (event) {
    event.preventDefault();

    const formElement = document.getElementById("corrForm");
    const formData = new FormData(formElement);

    // id 값이 비어 있으면 제거
    if (!formData.get("id") || formData.get("id").trim() === "") {
        formData.delete("id");
    }

    // 디버깅 로그
    for (let pair of formData.entries()) {
        console.log(pair[0] + ": " + pair[1]);
    }

    $.ajax({
        url: "/chunil/quality/fProof/insert",
        type: "POST",
        data: formData, 
        dataType: "json",
        processData: false,
        contentType: false,
        success: function (response) {
            if (response.result === "success") {
                alert("온도 균일성 테스트 성공적으로 저장되었습니다!");
                $("#modalContainer").hide();
                getDataList(); 
            } else {
                alert("저장 실패: " + (response.message || "알 수 없는 오류"));
            }
        },
        error: function () {
            alert("서버 오류 발생!");
        }
    });
});



function getDataList() {
    // 1) 명시적으로 나열한 컬럼 정의
    const columns = [
        { title: "NO2",      field: "id",        visible: false },
        { title: "No",       formatter: "rownum", hozAlign: "center", width: 40, headerSort: false },
        { title: "년/월",     field: "y_m",       hozAlign: "center", width: 120 },
        { title: "설비",      field: "mch_name",  hozAlign: "center", width: 100, visible: false },
        { title: "점검 항목",  field: "standard",  hozAlign: "center", width: 120 },

        // 1일 ~ 31일
        { title: "1일",  field: "m_1",  hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "2일",  field: "m_2",  hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "3일",  field: "m_3",  hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "4일",  field: "m_4",  hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "5일",  field: "m_5",  hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "6일",  field: "m_6",  hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "7일",  field: "m_7",  hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "8일",  field: "m_8",  hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "9일",  field: "m_9",  hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "10일", field: "m_10", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "11일", field: "m_11", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "12일", field: "m_12", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "13일", field: "m_13", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "14일", field: "m_14", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "15일", field: "m_15", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "16일", field: "m_16", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "17일", field: "m_17", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "18일", field: "m_18", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "19일", field: "m_19", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "20일", field: "m_20", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "21일", field: "m_21", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "22일", field: "m_22", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "23일", field: "m_23", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "24일", field: "m_24", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "25일", field: "m_25", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "26일", field: "m_26", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "27일", field: "m_27", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "28일", field: "m_28", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "29일", field: "m_29", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "30일", field: "m_30", hozAlign: "center", width: 76, editor: "input", headerSort: false },
        { title: "31일", field: "m_31", hozAlign: "center", width: 76, editor: "input", headerSort: false },
    ];

    // 2) Tabulator 생성
    dataTable = new Tabulator("#dataList", {
        height: "810px",
        layout: "fitColumns",
        headerHozAlign: "center",
        columnHeaderVertAlign: "middle",
        rowVertAlign: "middle",

        ajaxConfig: "POST",
        ajaxURL: "/chunil/quality/fProof/list",
        ajaxParams: {
            y_m: $("#y_m").val() || ""
        },
        placeholder: "데이터가 없습니다.",

        ajaxResponse: function (url, params, response) {
            console.log("서버 응답:", response);
            return response;
        },

        columns: columns,

        // 셀 수정 후 즉시 업데이트
        cellEdited: function (cell) {
            const id     = cell.getRow().getData().id;
            const column = cell.getField();
            const value  = cell.getValue();

            console.log("수정된 셀 →", { id, column, value });

            $.ajax({
                url: "/chunil/quality/fProof/insert",
                type: "POST",
                contentType: "application/json",
                data: JSON.stringify({ id, column, value }),
                success: function (res) {
                    if (res.result === "success") {
                        console.log("업데이트 성공");
                    } else {
                        alert("업데이트 실패: " + res.message);
                        cell.restoreOldValue();
                    }
                },
                error: function () {
                    alert("서버 오류");
                    cell.restoreOldValue();
                }
            });
        },

        // 행 더블클릭 모달 팝업
        rowDblClick: function (e, row) {
/*             const d = row.getData();
            $("[name='id']"      ).val(d.id);
            $("[name='y_month']" ).val(d.y_m);
            $("[name='standard']").val(d.standard);
            $("#modalContainer").show().addClass("show"); */
        }
    });
}





  $(".delete-button").click(function(event) {
	    event.preventDefault();

	    if (!selectedRow) {
	        alert("삭제할 행을 선택하세요.");
	        return;
	    }

	    var id = selectedRow.getData().id;

	    if (!id) {
	        alert("삭제할 항목이 없습니다.");
	        return;
	    }

	    if (!confirm("정말 삭제하시겠습니까?")) {
	        return;
	    }

	    var requestData = JSON.stringify({ "id": id });

	    $.ajax({
	        url: "/chunil/quality/fProof/del",
	        type: "POST",
	        contentType: "application/json",
	        data: requestData,
	        dataType: "json",
	        success: function(response) {
	            alert("삭제가 완료되었습니다.");
	            dataTable.replaceData();
	        },
	        error: function(xhr, status, error) {
	            alert("삭제 중 오류가 발생했습니다: " + error);
	        }
	    });
	});


    $(".excel-button").on("click", function () {
  	  console.log("엑셀 다운로드 버튼 클릭됨"); 

  	 /*  const equipmentName = $("#mch_name").val() || ""; */
      const y_m = $("#y_m").val() || "";
   

      console.log("엑셀 다운로드 요청 값 =>", {
 /*          mch_name: equipmentName, */
          y_m: y_m
       
      });
    	  
        
      $.ajax({
          url: "/chunil/quality/fProof/excel",
          type: "post",
          data: {
         /*      mch_name: equipmentName, */
              y_m: y_m
          },
          dataType: "json",
          success: function (result) {
              console.log(result);
              alert("D:\\chunil_양식\\열처리유 저장 완료되었습니다.");
          },
          error: function (xhr, status, error) {
              alert("엑셀 다운로드 중 오류가 발생했습니다. 다시 시도해주세요.");
              console.error("Error:", error);
          }
      });
  });
    
});
</script>

</body>
</html>
