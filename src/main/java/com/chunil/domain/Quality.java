package com.chunil.domain;

public class Quality {

		private String column;
		private String value;
		
	
	
		private String no;
	    private String startDate;
	    private String Equipment_name;
	    private String endDate;
	    private String defect_date;
	    private String defect_type;
	    private String equipment;
	    private String product_no;
	    private String product_name;
	    private String defect_lot;
	    private String worker;
	    private String action;
	    private String selection_method;
	    private String action_date;
	    private String defect_quantity;
	    private String cause;
	    private String improvement;
	    
	    private String yn_a;
	    private String yn_b;
	    private String start_date;
	    
	    private String id;
	    private String mch_name;
	    private String t_year;
	    private String t_month;
	    private String t_url;
	    private String t_ok;
	    private String t_gb;
	    private String t_day;
	    private String t_min;
	    private String t_result;
	    
	    private String y_month;
	    private String year;
	    private String tx1;
	    private String tx2;
	    private String tx3;
	    private String tx4;
	   
	 
	    
	    private String y_m;
	   
	    private String up_down;
	    private String standard;

	    private String m_1;
	    private String m_2;
	    private String m_3;
	    private String m_4;
	    private String m_5;
	    private String m_6;
	    private String m_7;
	    private String m_8;
	    private String m_9;
	    private String m_10;
	    private String m_11;
	    private String m_12;
	    private String m_13;
	    private String m_14;
	    private String m_15;
	    private String m_16;
	    private String m_17;
	    private String m_18;
	    private String m_19;
	    private String m_20;
	    private String m_21;
	    private String m_22;
	    private String m_23;
	    private String m_24;
	    private String m_25;
	    private String m_26;
	    private String m_27;
	    private String m_28;
	    private String m_29;
	    private String m_30;
	    private String m_31;
	    
	    
	    //Cpk 조회조건, 기준정보 리스트
	    private String h_regdate;		//측정일
	    private String h_regtime;		//측정시간
	    private String h_sdate;			//조회시작일
	    private String h_edate;			//조회종료일
	    private String h_pnum;			//품번
	    private String h_pname;			//품명
	    private String h_gang;			//강종
	    private String h_t_gb;			//T급
	    private String h_hard_up;		//상한경도값
	    private String h_hard_dw;		//하한경도값
	    
	    //Cpk 측정값 리스트
	    private String h_day;			//일자
	    private String h_time;			//시간
	    private float h_x1;				//측정값 -1
	    private float h_x2;				//측정값 -2
	    private float h_x3;				//측정값 -3
	    private float h_avg;			//평균값
	    private float h_range;			//값 범위
	    
	    //Cpk 계산값 
	    private int n;					//관리도계수표 n
	    private double d2;				//관리도계수표 d2
	    private double a2;				//관리도계수표 a2
	    private double d4;				//관리도계수표 d4
	    
	    private String ucl_x;			//관리상한(UCL - X)
	    private String cl_x;				//평균값(CL - X)
	    private String lcl_x;			//관리하한(LCL - X)
	    private String ucl_r;			//관리상한(UCL - R)
	    private String cl_r;				//평균값(UCL - R)
	    private String lcl_r;			//관리하한(UCL - R)
	    
	    private String r_d2;				//공정능력분석 R/d2
	    private String cp;				//공정능력분석 CP
	    private String k;				//공정능력분석 k
	    private String cpk;				//공정능력분석 CPk
	    
	    //Cpk 트렌드용
	    private double g_ucl_x;
	    private double g_cl_x;
	    private double g_lcl_x;
	    private double g_ucl_r;
	    private double g_cl_r;
	    private double g_max;
	    private double g_min;
	    private double g_avg;
	    private double g_range;
	    private String g_tdatetime;
	    private int g_idx;
	    
	    
		public String getH_regdate() {
			return h_regdate;
		}
		public void setH_regdate(String h_regdate) {
			this.h_regdate = h_regdate;
		}
		public String getH_regtime() {
			return h_regtime;
		}
		public void setH_regtime(String h_regtime) {
			this.h_regtime = h_regtime;
		}
		public String getH_sdate() {
			return h_sdate;
		}
		public void setH_sdate(String h_sdate) {
			this.h_sdate = h_sdate;
		}
		public String getH_edate() {
			return h_edate;
		}
		public void setH_edate(String h_edate) {
			this.h_edate = h_edate;
		}
		public String getH_pnum() {
			return h_pnum;
		}
		public void setH_pnum(String h_pnum) {
			this.h_pnum = h_pnum;
		}
		public String getH_pname() {
			return h_pname;
		}
		public void setH_pname(String h_pname) {
			this.h_pname = h_pname;
		}
		public String getH_gang() {
			return h_gang;
		}
		public void setH_gang(String h_gang) {
			this.h_gang = h_gang;
		}
		public String getH_t_gb() {
			return h_t_gb;
		}
		public void setH_t_gb(String h_t_gb) {
			this.h_t_gb = h_t_gb;
		}
		public String getH_hard_up() {
			return h_hard_up;
		}
		public void setH_hard_up(String h_hard_up) {
			this.h_hard_up = h_hard_up;
		}
		public String getH_hard_dw() {
			return h_hard_dw;
		}
		public void setH_hard_dw(String h_hard_dw) {
			this.h_hard_dw = h_hard_dw;
		}
		public String getH_day() {
			return h_day;
		}
		public void setH_day(String h_day) {
			this.h_day = h_day;
		}
		public String getH_time() {
			return h_time;
		}
		public void setH_time(String h_time) {
			this.h_time = h_time;
		}
		public float getH_x1() {
			return h_x1;
		}
		public void setH_x1(float h_x1) {
			this.h_x1 = h_x1;
		}
		public float getH_x2() {
			return h_x2;
		}
		public void setH_x2(float h_x2) {
			this.h_x2 = h_x2;
		}
		public float getH_x3() {
			return h_x3;
		}
		public void setH_x3(float h_x3) {
			this.h_x3 = h_x3;
		}
		public float getH_avg() {
			return h_avg;
		}
		public void setH_avg(float h_avg) {
			this.h_avg = h_avg;
		}
		public float getH_range() {
			return h_range;
		}
		public void setH_range(float h_range) {
			this.h_range = h_range;
		}
		public int getN() {
			return n;
		}
		public void setN(int n) {
			this.n = n;
		}
		public double getD2() {
			return d2;
		}
		public void setD2(double d2) {
			this.d2 = d2;
		}
		public double getA2() {
			return a2;
		}
		public void setA2(double a2) {
			this.a2 = a2;
		}
		public double getD4() {
			return d4;
		}
		public void setD4(double d4) {
			this.d4 = d4;
		}
		public String getUcl_x() {
			return ucl_x;
		}
		public void setUcl_x(String ucl_x) {
			this.ucl_x = ucl_x;
		}
		public String getCl_x() {
			return cl_x;
		}
		public void setCl_x(String cl_x) {
			this.cl_x = cl_x;
		}
		public String getLcl_x() {
			return lcl_x;
		}
		public void setLcl_x(String lcl_x) {
			this.lcl_x = lcl_x;
		}
		public String getUcl_r() {
			return ucl_r;
		}
		public void setUcl_r(String ucl_r) {
			this.ucl_r = ucl_r;
		}
		public String getCl_r() {
			return cl_r;
		}
		public void setCl_r(String cl_r) {
			this.cl_r = cl_r;
		}
		public String getLcl_r() {
			return lcl_r;
		}
		public void setLcl_r(String lcl_r) {
			this.lcl_r = lcl_r;
		}
		public String getR_d2() {
			return r_d2;
		}
		public void setR_d2(String r_d2) {
			this.r_d2 = r_d2;
		}
		public String getCp() {
			return cp;
		}
		public void setCp(String cp) {
			this.cp = cp;
		}
		public String getK() {
			return k;
		}
		public void setK(String k) {
			this.k = k;
		}
		public String getCpk() {
			return cpk;
		}
		public void setCpk(String cpk) {
			this.cpk = cpk;
		}
		public double getG_ucl_x() {
			return g_ucl_x;
		}
		public void setG_ucl_x(double g_ucl_x) {
			this.g_ucl_x = g_ucl_x;
		}
		public double getG_cl_x() {
			return g_cl_x;
		}
		public void setG_cl_x(double g_cl_x) {
			this.g_cl_x = g_cl_x;
		}
		public double getG_lcl_x() {
			return g_lcl_x;
		}
		public void setG_lcl_x(double g_lcl_x) {
			this.g_lcl_x = g_lcl_x;
		}
		public double getG_ucl_r() {
			return g_ucl_r;
		}
		public void setG_ucl_r(double g_ucl_r) {
			this.g_ucl_r = g_ucl_r;
		}
		public double getG_cl_r() {
			return g_cl_r;
		}
		public void setG_cl_r(double g_cl_r) {
			this.g_cl_r = g_cl_r;
		}
		public double getG_max() {
			return g_max;
		}
		public void setG_max(double g_max) {
			this.g_max = g_max;
		}
		public double getG_min() {
			return g_min;
		}
		public void setG_min(double g_min) {
			this.g_min = g_min;
		}
		public double getG_avg() {
			return g_avg;
		}
		public void setG_avg(double g_avg) {
			this.g_avg = g_avg;
		}
		public double getG_range() {
			return g_range;
		}
		public void setG_range(double g_range) {
			this.g_range = g_range;
		}
		public String getG_tdatetime() {
			return g_tdatetime;
		}
		public void setG_tdatetime(String g_tdatetime) {
			this.g_tdatetime = g_tdatetime;
		}
		public int getG_idx() {
			return g_idx;
		}
		public void setG_idx(int g_idx) {
			this.g_idx = g_idx;
		}
		public String getColumn() {
			return column;
		}
		public void setColumn(String column) {
			this.column = column;
		}
		public String getValue() {
			return value;
		}
		public void setValue(String value) {
			this.value = value;
		}
		public String getY_m() {
			return y_m;
		}
		public void setY_m(String y_m) {
			this.y_m = y_m;
		}
		public String getUp_down() {
			return up_down;
		}
		public void setUp_down(String up_down) {
			this.up_down = up_down;
		}
		public String getStandard() {
			return standard;
		}
		public void setStandard(String standard) {
			this.standard = standard;
		}
		public String getM_1() {
			return m_1;
		}
		public void setM_1(String m_1) {
			this.m_1 = m_1;
		}
		public String getM_2() {
			return m_2;
		}
		public void setM_2(String m_2) {
			this.m_2 = m_2;
		}
		public String getM_3() {
			return m_3;
		}
		public void setM_3(String m_3) {
			this.m_3 = m_3;
		}
		public String getM_4() {
			return m_4;
		}
		public void setM_4(String m_4) {
			this.m_4 = m_4;
		}
		public String getM_5() {
			return m_5;
		}
		public void setM_5(String m_5) {
			this.m_5 = m_5;
		}
		public String getM_6() {
			return m_6;
		}
		public void setM_6(String m_6) {
			this.m_6 = m_6;
		}
		public String getM_7() {
			return m_7;
		}
		public void setM_7(String m_7) {
			this.m_7 = m_7;
		}
		public String getM_8() {
			return m_8;
		}
		public void setM_8(String m_8) {
			this.m_8 = m_8;
		}
		public String getM_9() {
			return m_9;
		}
		public void setM_9(String m_9) {
			this.m_9 = m_9;
		}
		public String getM_10() {
			return m_10;
		}
		public void setM_10(String m_10) {
			this.m_10 = m_10;
		}
		public String getM_11() {
			return m_11;
		}
		public void setM_11(String m_11) {
			this.m_11 = m_11;
		}
		public String getM_12() {
			return m_12;
		}
		public void setM_12(String m_12) {
			this.m_12 = m_12;
		}
		public String getM_13() {
			return m_13;
		}
		public void setM_13(String m_13) {
			this.m_13 = m_13;
		}
		public String getM_14() {
			return m_14;
		}
		public void setM_14(String m_14) {
			this.m_14 = m_14;
		}
		public String getM_15() {
			return m_15;
		}
		public void setM_15(String m_15) {
			this.m_15 = m_15;
		}
		public String getM_16() {
			return m_16;
		}
		public void setM_16(String m_16) {
			this.m_16 = m_16;
		}
		public String getM_17() {
			return m_17;
		}
		public void setM_17(String m_17) {
			this.m_17 = m_17;
		}
		public String getM_18() {
			return m_18;
		}
		public void setM_18(String m_18) {
			this.m_18 = m_18;
		}
		public String getM_19() {
			return m_19;
		}
		public void setM_19(String m_19) {
			this.m_19 = m_19;
		}
		public String getM_20() {
			return m_20;
		}
		public void setM_20(String m_20) {
			this.m_20 = m_20;
		}
		public String getM_21() {
			return m_21;
		}
		public void setM_21(String m_21) {
			this.m_21 = m_21;
		}
		public String getM_22() {
			return m_22;
		}
		public void setM_22(String m_22) {
			this.m_22 = m_22;
		}
		public String getM_23() {
			return m_23;
		}
		public void setM_23(String m_23) {
			this.m_23 = m_23;
		}
		public String getM_24() {
			return m_24;
		}
		public void setM_24(String m_24) {
			this.m_24 = m_24;
		}
		public String getM_25() {
			return m_25;
		}
		public void setM_25(String m_25) {
			this.m_25 = m_25;
		}
		public String getM_26() {
			return m_26;
		}
		public void setM_26(String m_26) {
			this.m_26 = m_26;
		}
		public String getM_27() {
			return m_27;
		}
		public void setM_27(String m_27) {
			this.m_27 = m_27;
		}
		public String getM_28() {
			return m_28;
		}
		public void setM_28(String m_28) {
			this.m_28 = m_28;
		}
		public String getM_29() {
			return m_29;
		}
		public void setM_29(String m_29) {
			this.m_29 = m_29;
		}
		public String getM_30() {
			return m_30;
		}
		public void setM_30(String m_30) {
			this.m_30 = m_30;
		}
		public String getM_31() {
			return m_31;
		}
		public void setM_31(String m_31) {
			this.m_31 = m_31;
		}
		public String getY_month() {
			return y_month;
		}
		public void setY_month(String y_month) {
			this.y_month = y_month;
		}
		public String getYear() {
			return year;
		}
		public void setYear(String year) {
			this.year = year;
		}
		public String getTx1() {
			return tx1;
		}
		public void setTx1(String tx1) {
			this.tx1 = tx1;
		}
		public String getTx2() {
			return tx2;
		}
		public void setTx2(String tx2) {
			this.tx2 = tx2;
		}
		public String getTx3() {
			return tx3;
		}
		public void setTx3(String tx3) {
			this.tx3 = tx3;
		}
		public String getTx4() {
			return tx4;
		}
		public void setTx4(String tx4) {
			this.tx4 = tx4;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getMch_name() {
			return mch_name;
		}
		public void setMch_name(String mch_name) {
			this.mch_name = mch_name;
		}
		public String getT_year() {
			return t_year;
		}
		public void setT_year(String t_year) {
			this.t_year = t_year;
		}
		public String getT_month() {
			return t_month;
		}
		public void setT_month(String t_month) {
			this.t_month = t_month;
		}
		public String getT_url() {
			return t_url;
		}
		public void setT_url(String t_url) {
			this.t_url = t_url;
		}
		public String getT_ok() {
			return t_ok;
		}
		public void setT_ok(String t_ok) {
			this.t_ok = t_ok;
		}
		public String getT_gb() {
			return t_gb;
		}
		public void setT_gb(String t_gb) {
			this.t_gb = t_gb;
		}
		public String getT_day() {
			return t_day;
		}
		public void setT_day(String t_day) {
			this.t_day = t_day;
		}
		public String getT_min() {
			return t_min;
		}
		public void setT_min(String t_min) {
			this.t_min = t_min;
		}
		public String getT_result() {
			return t_result;
		}
		public void setT_result(String t_result) {
			this.t_result = t_result;
		}
		public String getYn_a() {
			return yn_a;
		}
		public void setYn_a(String yn_a) {
			this.yn_a = yn_a;
		}
		public String getYn_b() {
			return yn_b;
		}
		public void setYn_b(String yn_b) {
			this.yn_b = yn_b;
		}
		public String getStart_date() {
			return start_date;
		}
		public void setStart_date(String start_date) {
			this.start_date = start_date;
		}
		public String getNo() {
			return no;
		}
		public void setNo(String no) {
			this.no = no;
		}
		public String getStartDate() {
			return startDate;
		}
		public void setStartDate(String startDate) {
			this.startDate = startDate;
		}
		public String getEquipment_name() {
			return Equipment_name;
		}
		public void setEquipment_name(String equipment_name) {
			Equipment_name = equipment_name;
		}
		public String getEndDate() {
			return endDate;
		}
		public void setEndDate(String endDate) {
			this.endDate = endDate;
		}
		public String getDefect_date() {
			return defect_date;
		}
		public void setDefect_date(String defect_date) {
			this.defect_date = defect_date;
		}
		public String getDefect_type() {
			return defect_type;
		}
		public void setDefect_type(String defect_type) {
			this.defect_type = defect_type;
		}
		public String getEquipment() {
			return equipment;
		}
		public void setEquipment(String equipment) {
			this.equipment = equipment;
		}
		public String getProduct_no() {
			return product_no;
		}
		public void setProduct_no(String product_no) {
			this.product_no = product_no;
		}
		public String getProduct_name() {
			return product_name;
		}
		public void setProduct_name(String product_name) {
			this.product_name = product_name;
		}
		public String getDefect_lot() {
			return defect_lot;
		}
		public void setDefect_lot(String defect_lot) {
			this.defect_lot = defect_lot;
		}
		public String getWorker() {
			return worker;
		}
		public void setWorker(String worker) {
			this.worker = worker;
		}
		public String getAction() {
			return action;
		}
		public void setAction(String action) {
			this.action = action;
		}
		public String getSelection_method() {
			return selection_method;
		}
		public void setSelection_method(String selection_method) {
			this.selection_method = selection_method;
		}
		public String getAction_date() {
			return action_date;
		}
		public void setAction_date(String action_date) {
			this.action_date = action_date;
		}
		public String getDefect_quantity() {
			return defect_quantity;
		}
		public void setDefect_quantity(String defect_quantity) {
			this.defect_quantity = defect_quantity;
		}
		public String getCause() {
			return cause;
		}
		public void setCause(String cause) {
			this.cause = cause;
		}
		public String getImprovement() {
			return improvement;
		}
		public void setImprovement(String improvement) {
			this.improvement = improvement;
		}
	    
	    
	 
}
