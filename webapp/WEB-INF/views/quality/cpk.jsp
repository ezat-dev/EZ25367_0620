<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cpk</title>
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
	
	            <label class="daylabel">조회일자 :</label>
	            <input type="text" id="s_sdate" class="dayselect daySet"/>
	            <label for="">~</label>
	            <input type="text" id="s_edate" class="dayselect daySet"/>
			    <label>품번</label>
			      
				<input type="text" name="w_pnum" class="dayselect" readonly="readonly" 
				style="cursor:pointer; border-color:red; padding:8px; margin-bottom:10px;" onclick="pumbunSelect();">
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
        	<div id="standardTable"></div>
        </div>
        	<!-- 하이차트 - 1 -->
        	<div id="xBar"></div>
        	<!-- 하이차트 - 2 -->
        
        <div class="view">
            <div id="dataTable"></div>
             <div id="cpkCalcTable" style="margin-left:160px;"></div> 

	
		</div>
    </main>
    

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
let now_page_code = "d04";

var cpkListTable;
var selectedRowData = null;

$(function() {
	$("#s_sdate").val(yesterDate());
	$("#s_edate").val(todayDate());

	getStandardTable();	
	getCpkDataList();
	getCpkCalcList();
	getXbar();
});

//이벤트
  $('.select-button').click(function() {	  
	  dataSearch();
  });
  

  $(".closePumbunModal, .closePumbun").click(function(){
	  $('#pumbunModal').removeClass('show').hide();
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

function dataSearch(){
	$.ajax({
		url:"/chunil/quality/cpk/standard/list",
		type:"post",
		dataType:"json",
		data:{
			"h_pnum" : $("input[name='w_pnum']").val(),
			"h_sdate" : $("#s_sdate").val(),
			"h_edate" : $("#s_edate").val()
		},success:function(result){
			console.log(result);
			standardTable.setData(result.standardData);
			cpkListTable.setData(result.cpkValueData);
			
			cpkCalc = result.cpkValueCalcData;
//			console.log(cpkCalc);
			var objArray = new Array();
			var obj1 = {"value1":"관리도계수표 - n", "value2":cpkCalc.n};
			var obj2 = {"value1":"관리도계수표 - d2", "value2":cpkCalc.d2};
			var obj3 = {"value1":"관리도계수표 - a2", "value2":cpkCalc.a2};
			var obj4 = {"value1":"관리도계수표 - d4", "value2":cpkCalc.d4};
			var obj5 = {"value1":"X관리도 - 관리상한(UCL)", "value2":cpkCalc.ucl_x};
			var obj6 = {"value1":"X관리도 - 평균값(CL=X)", "value2":cpkCalc.cl_x};
			var obj7 = {"value1":"X관리도 - 관리하한(LCL)", "value2":cpkCalc.lcl_x};
			var obj8 = {"value1":"R관리도 - 관리상한(UCL)", "value2":cpkCalc.ucl_r};
			var obj9 = {"value1":"R관리도 - 평균값(CL=R)", "value2":cpkCalc.cl_r};
			var obj10 = {"value1":"R관리도 - 관리하한(LCL)", "value2":"-"};
			var obj11 = {"value1":"공정능력분석 - R/d2", "value2":cpkCalc.r_d2};
			var obj12 = {"value1":"공정능력분석 - CP", "value2":cpkCalc.cp};
			var obj13 = {"value1":"공정능력분석 - k", "value2":cpkCalc.k};
			var obj14 = {"value1":"공정능력분석 - CPk", "value2":cpkCalc.cpk};
			
			
			objArray.push(obj1);
			objArray.push(obj2);
			objArray.push(obj3);
			objArray.push(obj4);
			objArray.push(obj5);
			objArray.push(obj6);
			objArray.push(obj7);
			objArray.push(obj8);
			objArray.push(obj9);
			objArray.push(obj10);
			objArray.push(obj11);
			objArray.push(obj12);
			objArray.push(obj13);
			objArray.push(obj14);
			
			cpkCalcTable.setData(objArray);
			
			var trendData = result.trendData;
			
			var x_avgObj = new Object();
			var x_uclObj = new Object();
			var x_clObj = new Object();
			var x_lclObj = new Object();
			var x_maxObj = new Object();
			var x_minObj = new Object();
			var r_uclObj = new Object();
			var r_clObj = new Object();
			var r_rmObj = new Object();

			var x_avg_save = new Array();
			var x_ucl_save = new Array();
			var x_cl_save = new Array();
			var x_lcl_save = new Array();
			var x_max_save = new Array();
			var x_min_save = new Array();
			var r_ucl_save = new Array();
			var r_cl_save = new Array();
			var r_rm_save = new Array();

			
			trendData.forEach(function(data, i){
				console.log(data);
				var x_avg = new Array();
				var x_ucl = new Array();
				var x_cl = new Array();
				var x_lcl = new Array();
				var x_max = new Array();
				var x_min = new Array();
				var r_ucl = new Array();
				var r_cl = new Array();
				var r_rm = new Array();
				
				
				x_avg.push(i);
				x_avg.push(data.g_avg)
				
				x_ucl.push(i);
				x_ucl.push(data.g_ucl_x);
				
				x_cl.push(i);
				x_cl.push(data.g_cl_x);
				
				x_lcl.push(i);
				x_lcl.push(data.g_lcl_x);
				
				x_max.push(i);
				x_max.push(data.g_max);
				
				x_min.push(i);
				x_min.push(data.g_min);
				
				r_ucl.push(i);
				r_ucl.push(data.g_ucl_r);
				
				r_cl.push(i);
				r_cl.push(data.g_cl_r);
				
				r_rm.push(i);
				r_rm.push(data.g_range);
				
				x_avg_save.push(x_avg);
				x_ucl_save.push(x_ucl);
				x_cl_save.push(x_cl);
				x_lcl_save.push(x_lcl);
				x_max_save.push(x_max);
				x_min_save.push(x_min);
				r_ucl_save.push(r_ucl);
				r_cl_save.push(r_cl);
				r_rm_save.push(r_rm);
			});

			x_avgObj = {"name":"X_AVG", "data":x_avg_save};
			x_uclObj = {"name":"X_UCL", "data":x_ucl_save};
			x_clObj = {"name":"X_CL", "data":x_cl_save};
			x_lclObj = {"name":"X_LCL", "data":x_lcl_save};
			x_maxObj = {"name":"X_MAX", "data":x_max_save};
			x_minObj = {"name":"X_MIN", "data":x_min_save};
			r_uclObj = {"name":"R_UCL", "data":r_ucl_save};
			r_clObj = {"name":"R_CL", "data":r_cl_save};
			r_rmObj = {"name":"R_RANGE", "data":r_rm_save};
			
			
			seriesArray[0] = x_avgObj;
			seriesArray[1] = x_uclObj;
			seriesArray[2] = x_clObj;
			seriesArray[3] = x_lclObj;
			seriesArray[4] = x_maxObj;
			seriesArray[5] = x_minObj;
			seriesArray[6] = r_uclObj;
			seriesArray[7] = r_clObj;
			seriesArray[8] = r_rmObj;
			
			getXbar();
/*			
			var chart = $("#xBar").highcharts();
			
			if(typeof chart != "undefined"){
				chart.series[0].update(x_avgObj,false);
				chart.series[1].update(x_uclObj,false);
				chart.series[2].update(x_clObj,false);
				chart.series[3].update(x_lclObj,false);
				chart.series[4].update(x_maxObj,false);
				chart.series[5].update(x_minObj,false);
				
				chart.redraw();
			}
*/
			
//			transformedData = transposeData(result.cpkValueData);

//			getCpkDataList();
		}
	})
//	standardTable.setData("/chunil/quality/cpk/standard/list", { "h_pnum": $("input[name='w_pnum']").val() });	
}


var standardTable;
function getStandardTable(){
	standardTable = new Tabulator('#standardTable', {
		    height: '80px',
		    layout: 'fitDataFill',
		    headerSort: false,
		    reactiveData: true,
		    columnHeaderVertAlign: "middle",
		    rowVertAlign: "middle",
		    headerHozAlign: 'center',
		    ajaxConfig: { method: 'POST' },
//		    ajaxURL: "/chunil/quality/cpk/standard/list",
		    ajaxProgressiveLoad:"scroll",    
		    ajaxResponse:function(url, params, response){
				$("#standardTable .tabulator-col.tabulator-sortable").css("height","55px");
		        return response; //return the response data to tabulator
		    },
		    placeholder: "조회된 데이터가 없습니다.",
		    columns: [
		        //{ title: "no", field: "no", visible: false }, 
		      { title: "품번",field: "h_pnum",width: 300, hozAlign: "center" },		      
		      { title: "품명",field: "h_pname",width: 300, hozAlign: "center" },
		      { title: "강종",field: "h_gang",width: 200, hozAlign: "center" },
		      { title: "T급",field: "h_t_gb",width: 200, hozAlign: "center" },
		      { title: "상한",field: "h_hard_up",width: 200, hozAlign: "center" },
		      { title: "하한",field: "h_hard_dw",width: 200, hozAlign: "center" },
		    ],

		    rowClick: function(e, row) {
		      $('#standardTable .tabulator-row').removeClass('row_select');
		      row.getElement().classList.add('row_select');
		      selectedRowData = row.getData();
		    },
		  });
}

function getCpkDataList(){
	
	
	cpkListTable = new Tabulator('#dataTable', {
		    height: '400px',
		    layout: 'fitDataFill',	    
		    headerSort: false,
		    reactiveData: true,
		    columnHeaderVertAlign: "middle",
		    rowVertAlign: "middle",
		    headerHozAlign: 'center',
//		    data: transformedData, // 변환된 데이터 사용
//		    columns: tabulatorColumns, // 동적으로 생성된 컬럼 사용		    
//		    ajaxConfig: { method: 'POST' },		    
//		    ajaxURL: "/chunil/productionManagement/heatTreatment/list",
//		    ajaxProgressiveLoad:"scroll",
//		    ajaxParams: { w_date: $(".daySet").val() },		    
		    ajaxResponse:function(url, params, response){
				$("#dataTable .tabulator-col.tabulator-sortable").css("height","55px");
		        return response; //return the response data to tabulator
		    },
		    placeholder: "조회된 데이터가 없습니다.",
		    columns: [
		        //{ title: "no", field: "no", visible: false }, 
		      { title: "일자", field: "h_day",width: 100, hozAlign: "center" },
		      { title: "시간", field: "h_time",width: 100, hozAlign: "center" },
		      { title: "측정값-1",field: "h_x1",width: 100, hozAlign: "center" },		      
		      { title: "측정값-2",field: "h_x2",width: 100, hozAlign: "center" },
		      { title: "측정값-3",field: "h_x3",width: 100, hozAlign: "center" },
		      { title: "X 평균",field: "h_avg",width: 100, hozAlign: "center" },
		      { title: "Range",field: "h_range",width: 100, hozAlign: "center" },
		    ],

		    rowClick: function(e, row) {
		      $('#dataTable .tabulator-row').removeClass('row_select');
		      row.getElement().classList.add('row_select');
		    },
		  });
}


var cpkCalcTable;
function getCpkCalcList(){
	cpkCalcTable = new Tabulator('#cpkCalcTable', {
		    height: '400px',
		    layout: 'fitDataFill',
		    headerSort: false,
		    reactiveData: true,
		    columnHeaderVertAlign: "middle",
		    rowVertAlign: "middle",
		    headerHozAlign: 'center',
		    ajaxConfig: { method: 'POST' },
//		    ajaxURL: "/chunil/productionManagement/heatTreatment/list",
		    ajaxProgressiveLoad:"scroll",
//		    ajaxParams: { w_date: $(".daySet").val() },		    
		    ajaxResponse:function(url, params, response){
				$("#cpkCalcTable .tabulator-col.tabulator-sortable").css("height","55px");
		        return response; //return the response data to tabulator
		    },
		    placeholder: "조회된 데이터가 없습니다.",
		    columns: [
		        //{ title: "no", field: "no", visible: false }, 
		        
		      { title: "기준", field: "value1", width: 300, hozAlign: "center" },  	
		   		{ title: "값", field: "value2", width: 200, hozAlign: "center" }, 
		    ],

		    rowClick: function(e, row) {
		      $('#cpkCalcTable .tabulator-row').removeClass('row_select');
		      row.getElement().classList.add('row_select');
		    },
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
		      { title: "품번", field: "w_pnum",width: 120, hozAlign: "center" },
		      { title: "품명", field: "w_pname",width: 150, hozAlign: "center" },
		      { title: "강종",field: "w_gang",width: 80, hozAlign: "center" },
		      { title: "T급",field: "w_t_gb",width: 80, hozAlign: "center" },
		      { title: "소입온도(℃)",field: "w_qf",width: 110, hozAlign: "center" },
		      { title: "소려온도(℃)",field: "w_tf",width: 110, hozAlign: "center" },
		      { title: "CP(%)",field: "w_cp",width: 110, hozAlign: "center" },
		      { title: "장입기준량(kg)",field: "w_std_weight",width: 110, hozAlign: "center" },
		      { title: "요구경도",field: "w_hardness",width: 110, hozAlign: "center" },
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

//하이차트 설정
var seriesArray = new Array();
function getXbar(){
	
    const chart = Highcharts.chart('xBar', {    	
    	chart: {
    		type:"line",        		
    		panning:true,
            panKey:"shift",
            zoomType:"x",
			styleMode: true,
			height:400
    	},
    	title: {
    		text:null
    	},
    	time:{
    		timezone: "Asia/Seoul",
    		useUTC: false
    	},
        yAxis: [{
//        	className: 'highcharts-color-0',
        	crosshair:{
        		width:3,
        		color:'#5D5D5D',
        		zIndex:5
        	},
            title: {
                text: '값'
            },
            labels:{
            	style:{
            		fontSize:"10pt"
            	}
            }
        }],
        xAxis: {
        	crosshair:{
        		width:3,
        		color:'#5D5D5D',
        		zIndex:5
        	},
//			tickAmount:11,
        	labels:{
        		style:{
        			fontSize:"11pt"
        		}
        	},
        	allowDecimals:false
//        	tickmarkPlacement:'on',
//        	max:datetimeJson[datetimeJson.length-1],
//        	startOnTick:false
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle'
        },
        plotOptions: {
            series: {
            	selected:true,
            	marker:{
                	radius:1
            	}
            }
        },
/*
        tooltip:{
        	split:true,
			formatter:function(){
				var tool;

				tool = '<span style=color:'+this.points[0].color+'><b>time :</b></span> <b>' + this.points[0].y + '</b></br>'+
	            '<span style=color:'+this.points[1].color+'><b>temper :</b></span> <b>' + this.points[1].y + '</b></br>'+
	            '<span style=color:'+this.points[2].color+'><b>temperToleCont :</b></span> <b>' + this.points[2].y + '</b></br>'+
	            '<span style=color:'+this.points[3].color+'><b>temperToleHold :</span> <b>' + this.points[3].y + '</b></br>'+
	            '<span style=color:'+this.points[4].color+'><b>holdbackTimeoutHeating :</span> <b>' + this.points[4].y + '</b></br>'+
	            '<span style=color:'+this.points[5].color+'><b>pressureSetValue :</span> <b>' + this.points[5].y + '</b></br>'+
	            '<span style=color:'+this.points[6].color+'><b>pressingCapacityF1 :</span> <b>' + this.points[6].y + '</b></br>'+
	            '<span style=color:'+this.points[7].color+'><b>pressingCapacityF2 :</span> <b>' + this.points[7].y + '</b></br>'+
	            '<span style=color:'+this.points[8].color+'><b>foreceTolerance :</span> <b>' + this.points[8].y + '</b></br>'+
	            '<span style=color:'+this.points[9].color+'><b>positionAbs :</span> <b>' + this.points[9].y + '</b></br>'+
	            '<span style=color:'+this.points[10].color+'><b>positionRelative :</span> <b>' + this.points[10].y + '</b></br>'+
	            '<span style=color:'+this.points[11].color+'><b>distanceTolerance :</span> <b>' + this.points[11].y + '</b></br>'+
	            '<span style=color:'+this.points[12].color+'><b>holdingTime1 :</span> <b>' + this.points[12].y + '</b></br>'+
	            '<span style=color:'+this.points[13].color+'><b>holdingTime2 :</span> <b>' + this.points[13].y + '</b></br>'+
	            '<span style=color:'+this.points[14].color+'><b>numberOfLoops :</span> <b>' + this.points[14].y + '</b></br>'+
	            '<span style=color:'+this.points[15].color+'><b>speedOfPlunger :</span> <b>' + this.points[15].y + '</b></br>'+
	            '<span style=color:'+this.points[16].color+'><b>gradientOfForce :</span> <b>' + this.points[16].y + '</b></br>'+
                'Segment : <b>' + this.x + '</b>';   						
				
	            return tool;
                                    
			},
	        shared: true,
//	        crosshairs:true,
    		style:{
    			fontSize:"14pt"
    		}
        },
*/
        series: seriesArray,
        responsive: {
            rules: [{
                condition: {
                    maxWidth: 1200
                },
                chartOptions: {
                    legend: {
                        layout: 'horizontal',
                        align: 'center',
                        verticalAlign: 'bottom'
                    }
                }
            }]
        },
        exporting:{
            menuItemDefinitions: {
                // Custom definition
                label: {
                    onclick: function () {
                        this.renderer.label(
                            'You just clicked a custom menu item',
                            100,
                            100
                        )
                            .attr({
                                fill: '#a4edba',
                                r: 5,
                                padding: 10,
                                zIndex: 10
                            })
                            .css({
                                fontSize: '1.5em'
                            })
                            .add();
                    },
                    text: 'Show label'
                }
            },
            buttons: {
                contextButton: {
                    menuItems: ['downloadPNG', 'downloadPDF', 'downloadXLS', 'separator']
                }
            }
        },
        legend:{
            itemStyle:{
                fontSize: "11pt"
            }
		}
    });
    
}


</script>
</body>
</html>