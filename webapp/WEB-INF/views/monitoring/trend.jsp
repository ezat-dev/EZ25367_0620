<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>트렌드</title>
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
		        width: 720px;
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
            padding: 11px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
        }
       .daylabel {
		    margin-right: 10px;
		    margin-bottom: 13px;
		    font-size: 20px;
		    margin-left: 20px;
		    margin-top: 3px;
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


    </style>
    </head>
<body>
     		<div class="button-container">
        		<label class="daylabel">검색 날짜 :</label>
			<div class="date_input" style="text-align: center; ">
			    <input type="text" autocomplete="off" class="datetimeSet" id="startDate"
			        style="font-size: 16px; margin: 5px; border-radius: 4px; border: 1px solid #ccc; text-align: center;    height: 30px;">

				<span class="mid" style="font-size: 20px; font-weight: bold; margin-bottom:10px;"> ~ </span>
				
			   <input type="text" autocomplete="off" class="datetimeSet" id="endDate"
			        style="font-size: 16px; margin: 5px; border-radius: 4px; border: 1px solid #ccc; text-align: center;    height: 30px;">
			</div>
				<button class="select-button">
                    <img src="/chunil/css/tabBar/search-icon.png" alt="select" class="button-image">조회
                </button>
			</div>
			<div id="container" style="width: 100%; height: 600px; margin-top:100px;"></div>

<script>
let now_page_code = "i01";

$(document).ready(function () {
    const now = new Date();
    const before3Hours = new Date(now.getTime() - (10 * 60 * 60 * 1000));

    $(".datetimeSet").datepicker({
        language: 'ko',
        timepicker: true,
        dateFormat: 'yyyy-mm-dd',
        timeFormat: 'hh:ii',
        autoClose: true
    });

    // 시간 셋팅
    $('#startDate').data('datepicker').selectDate(before3Hours);
    $('#endDate').data('datepicker').selectDate(now);

    // 조회 버튼 클릭 이벤트 정의
    function fetchData() {
        const startDate = $('#startDate').val();
        const endDate = $('#endDate').val();

        console.log("보내는 값 ⏩", { startDate, endDate });

        $.ajax({
            type: "POST",
            url: "/chunil/monitoring/trend/list",
            data: { startDate, endDate },
            success: function (result) {
                console.log(" result:", result);

                const categories = result.map(r => r.regtime);

                const qf1Pv = result.map(r => Number(r.qf1_pv));
                const qf2Pv = result.map(r => Number(r.qf2_pv));
                const qf3Pv = result.map(r => Number(r.qf3_pv));
                const qf4Pv = result.map(r => Number(r.qf4_pv));
                const qf5Pv = result.map(r => Number(r.qf5_pv));
                const tf1Pv = result.map(r => Number(r.tf1_pv));
                const tf2Pv = result.map(r => Number(r.tf2_pv));
                const tf3Pv = result.map(r => Number(r.tf3_pv));
                const tf4Pv = result.map(r => Number(r.tf4_pv));
                const tf5Pv = result.map(r => Number(r.tf5_pv));

                Highcharts.chart('container', {
                    chart: { type: 'line' },
                    title: { text: '온도 트렌드' },
                    xAxis: {
                        categories: categories,
                        title: { text: '시간' },
                        labels: { rotation: -45 }
                    },
                    yAxis: {
                        title: { text: '값' }
                    },
                    tooltip: {
                        shared: true,
                        crosshairs: true
                    },
                    series: [
                        { name: '소입로1존', data: qf1Pv },
                        { name: '소입로2존', data: qf2Pv },
                        { name: '소입로3존', data: qf3Pv },
                        { name: '소입로4존', data: qf4Pv },
                        { name: '소입로5존', data: qf5Pv },
                        { name: '소려로1존', data: tf1Pv },
                        { name: '소려로2존', data: tf2Pv },
                        { name: '소려로3존', data: tf3Pv },
                        { name: '소려로4존', data: tf4Pv },
                        { name: '소려로5존', data: tf5Pv }
                    ]
                });
            },
            error: function (xhr, status, error) {
                console.error("❌ 에러:", error);
                alert("데이터 조회 중 오류가 발생했습니다.");
            }
        });
    }

    $('.select-button').click(fetchData);
	

    fetchData();
});
</script>

</body>
</html>