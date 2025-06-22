<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<!-- 제이쿼리홈페이지 js -->
<script type="text/javascript" src="/chunil/js/jquery-3.7.1.min.js"></script>

<!-- Tabulator 테이블 -->
<script type="text/javascript" src="/chunil/js/tabulator/tabulator.js"></script>
<link rel="stylesheet" href="/chunil/css/tabulator/tabulator_simple.css">

<!-- moment -->
<script type="text/javascript" src="/chunil/js/moment/moment.min.js"></script>

<!-- 화면캡쳐용 -->
<script type="text/javascript" src="/chunil/js/html2canvas.js"></script>


<!-- 하이차트 -->
<script type="text/javascript" src="/chunil/js/highchart/highcharts.js"></script>
<script type="text/javascript" src="/chunil/js/highchart/exporting.js"></script>
<script type="text/javascript" src="/chunil/js/highchart/export-data.js"></script>
<script type="text/javascript" src="/chunil/js/highchart/data.js"></script>


<!-- Air Datepicker -->
<script type="text/javascript" src="/chunil/js/airdatepicker/datepicker.min.js"></script>
<script type="text/javascript" src="/chunil/js/airdatepicker/datepicker.ko.js"></script>
<link rel="stylesheet" href="/chunil/css/airdatepicker/datepicker.min.css"> 


<style>


</style>
<script>

$(function(){


	rpImagePopup();






	

	//airDatePicker 설정
	//날짜 : 일
	 $(".daySet").datepicker({
    	language: 'ko',
    	autoClose: true,
    }); 


	 $(".datetimeSet").datepicker({
		    language: 'ko',
		    timepicker: true,            // 시분 선택 가능
		    dateFormat: 'yyyy-mm-dd',
		    timeFormat: 'hh:ii',         // 시:분 형식
		    autoClose: true
		});
	    
	//날짜 : 월
   $(".monthSet").datepicker({
	    language: 'ko',           // 한국어 설정
	    view: 'months',           // 월만 표시
	    minView: 'months',        // 월만 선택 가능
	    dateFormat: 'yyyy-mm',    // 연도-월 형식 지정
	    autoClose: true,          // 월 선택 후 자동 닫힘
	});
   

    //날짜 : 년
	 $(".yearSet").datepicker({
	  language: 'ko',
      view: 'years',          // 연도만 표시
      minView: 'years',       // 연도만 표시하여 날짜 선택 비활성화
      dateFormat: 'yyyy',     // 연도 형식 지정
      autoClose: true,        // 연도 선택 후 자동 닫힘
      language: 'ko'          // 한국어 설정
  });

	 $(".monthDaySet").datepicker({
		    language: 'ko',
		    autoClose: true,
		    dateFormat: 'mm-dd',     // 📌 "월-일" 형식만 표시
		    view: 'days',            // 기본 day 뷰 사용
		    minView: 'days',         // day까지만 표시
		    onShow: function(inst, animationCompleted){
		        // 연도, 월 선택 영역 숨김 (디자인적으로)
		        $('.datepicker--nav-title i, .datepicker--nav-title span').hide();
		    }
		});

/*
   // AirDatepicker 초기화
   new AirDatepicker('.datepicker', {
       autoClose: true,
       dateFormat: 'yyyy-MM-dd',
       locale: {
           days: ['일', '월', '화', '수', '목', '금', '토'],
           daysShort: ['일', '월', '화', '수', '목', '금', '토'],
           daysMin: ['일', '월', '화', '수', '목', '금', '토'],
           months: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           monthsShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
           today: '오늘',
           clear: '초기화',
           firstDay: 0
       },
       // 일, 월, 년을 선택할 수 있게 하기 위한 설정
       view: 'days',  // 일, 월, 년 선택을 가능하게 함
       minView: 'days', // 날짜만 선택 가능
   });
*/
		
});

//오늘날짜 년-월-일
function todayDate(){
	var now = new Date();
	var y = now.getFullYear();
	var m = paddingZero(now.getMonth()+1);
	var d = paddingZero(now.getDate());
		
	return y+"-"+m+"-"+d; 
}

//어제날짜 년-월-일
function yesterDate(){
	var now = new Date();
	var y = now.getFullYear();
	var m = paddingZero(now.getMonth()+1);
	var d = paddingZero(now.getDate()-1);
		
	return y+"-"+m+"-"+d; 	
}

//왼쪽 0채우기
function paddingZero(value){
	var rtn = "";

	if(value < 10){
		rtn = "0"+value;
	}else{
		rtn = value;
	}

	return rtn;
}

function rpImagePopup() {
    var img = document.createElement("img");
//    console.log(img);
    
    // $(img).attr("src", "imgs/noimage_01.gif");
    $(img).css("width", "600");
    $(img).css("height", "500");
    
    var div = document.createElement("div");
    $(div).css("position", "absolute");
    $(div).css("display", "none");
    $(div).css("z-index", "24999");
    $(div).append(img);
    $(div).hide();
    $("body").append(div);

    $(document).on("mouseover", ".rp-img-popup > img", function(){
            $(img).attr("src", $(this).attr("src"));
            $(div).show();
            var iHeight = (document.body.clientHeight / 2) - $(img).height() / 2 + document.body.scrollTop;   // 화면중앙
            var iWidth = (document.body.clientWidth / 2) - $(img).width() / 2 + document.body.scrollLeft;
            $(div).css("left", iWidth);
            $(div).css("top", 100);
        })
        .on("mouseout", ".rp-img-popup > img", function(){
            $(div).hide();
        });
    
    $(document).on("mouseover", ".rp-img-popup", function(){
        $(img).attr("src", $(this).attr("src"));
        $(div).show();
        var iHeight = (document.body.clientHeight / 2) - $(img).height() / 2 + document.body.scrollTop;   // 화면중앙
        var iWidth = (document.body.clientWidth / 2) - $(img).width() / 2 + document.body.scrollLeft;
        $(div).css("left", iWidth);
        $(div).css("top", 100);
    })
    .on("mouseout", ".rp-img-popup", function(){
        $(div).hide();
    });
}


function pageObject(paramKey){
	//console.log("받은 키값 : "+paramKey);
	var obj = {
			//모니터링
			"a01":["/chunil/monitoring/integrationMonitoring","통합 모니터링"],
			"a02":["/chunil/monitoring/trend","트랜드"],
			"a03":["/chunil/monitoring/alarm","알람현황"],
			"a04":"",
			"a05":"",
			"a06":"",
			"a07":"",
			//생산관리
			"b01":["/chunil/productionManagement/integrationProduction","종합 생산현황"],
			"b02":["/chunil/productionManagement/machineEfficiency","설비 효율현황"],
			"b03":["/chunil/productionManagement/alarmRecord","알람이력"],
			"b04":["/chunil/productionManagement/alarmFrequency","알람발생빈도"],
			"b05":["/chunil/machine/spareStatus","SPARE 관리"],
			"b06":["/chunil/productionManagement/heatTreatment","열처리 작업이력"],
			"b07":"",
			//조건관리
			"c01":["/chunil/condition/corrStatus","기준정보관리"],
			"c02":["/chunil/condition/machinePartTemp","열전대 교체이력"],
			"c03":["/chunil/condition/machineLiquidManage","온도조절계 보정현황"],
			"c04":["/chunil/condition/dailyCheck","일상점검일지"],
			"c05":["/chunil/condition/standardDoc","관리계획서 및 작업 표준서"],
			"c06":["/chunil/condition/inputProduct","낙하품 관리"],
			"c07":"",
			//품질관리
			"d01":["/chunil/quality/tempUniformity","온도균일성 조사보고서"],
			"d02":["/chunil/quality/heatTreatingOil","열처리유 성상분석"],
			"d03":["/chunil/quality/fProof","F/PROOF"],
			"d04":["/chunil/quality/cpk","Cpk"],
			"d05":["/chunil/quality/ppk","Ppk"],
			"d06":"",
			"d07":"",
			//기준관리
			"e01":["/chunil/standardManagement/notOperational","비가동현황"],
			"e02":["/chunil/user/userInsert","사용자등록"],
			"e03":["/chunil/user/userPermission","사용자 권한"],
			"e04":"",
			"e05":"",
			"e06":"",
			"e07":"",

			//======안씀 여분
			"f01":"",
			"f02":"",
			"f03":"",
			"f04":"",
			"f05":"",
			"f06":"",
			"f07":"",
			"g01":"",
			"g02":"",
			"g03":"",
			"g04":"",
			"g05":"",
			"g06":"",
			"g07":"",

			
	};
	
/*	
	console.log(obj);
	console.log(obj[paramKey][0]);*/
	
	return obj[paramKey];
}

/* $(window).on("load", function () {
    $.ajax({
        url: "/chunil/user/equipment_name_select",
        type: "POST",
        dataType: "json",
        success: function (response) {
      //      console.log("서버에서 받은 전체 데이터:", response); // 전체 응답 확인
      //      console.log("데이터 목록:", response.data); // data 배열만 확인
            
            const $select = $(".equipment_name_select");
            $select.empty();
            $select.append('<option value="">전체</option>');

            response.data.forEach(function (item) {
                if (item.facility_name) {
                    const $option = $('<option>' + item.facility_name + '</option>')
                        .attr('value', item.facility_mach_code);
                   
                     $select.append($option);
                }
            });
        },
        error: function (xhr, status, error) {
            console.error("장비명 조회 실패:", error);
        }
    });
});
 */



let userPermissions = {};

function userInfoList(now_page_code) {
    $.ajax({
        url: '/chunil/user/info',
        type: 'POST',
        contentType: 'application/json',
        dataType: 'json',
        success: function(response) {
            const loginUserPage = response.loginUserPage;
            userPermissions = loginUserPage || {};
            controlButtonPermissions(now_page_code);
        },
        error: function(xhr, status, error) {
            console.error("데이터 가져오기 실패:", error);
        }
    });
}

function controlButtonPermissions(now_page_code) {
    const permission = userPermissions?.[now_page_code];
  //  console.log("현재 페이지 권한(permission):", permission);

    const canRead = permission === "R" || permission === "C" || permission === "D";
    const canCreate = permission === "C" || permission === "D";
    const canDelete = permission === "D";

    if (!canRead) {
        $(".select-button").css("pointer-events", "none").css("background-color", "#ced4da");
    }

    if (!canCreate) {
        $(".insert-button").css("pointer-events", "none").css("background-color", "#ced4da");
        $("#corrForm").prop("disabled", true);
    }

    if (!canDelete) {
        $(".delete-button").css("pointer-events", "none").css("background-color", "#ced4da");
    }

    $(".select-button").on("click", function (e) {
        if (!canRead) {
            alert("당신의 권한이 없습니다. (조회)");
            e.preventDefault();
            e.stopImmediatePropagation();
        }
    });

    $(".insert-button").on("click", function (e) {
        if (!canCreate) {
            alert("당신의 권한이 없습니다. (추가)");
            e.preventDefault();
            e.stopImmediatePropagation();
        }
    });

    $(".delete-button").on("click", function (e) {
        if (!canDelete) {
            alert("당신의 권한이 없습니다. (삭제)");
            e.preventDefault();
            e.stopImmediatePropagation();
        }
    });
}


$(document).ready(function() {
    userInfoList(now_page_code);
    console.log("나우페이지코드",now_page_code)
});



</script>
