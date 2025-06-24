package com.chunil.domain;

public class ProductManage {

	//열처리 작업이력
	private String w_machine;		//설비코드
	private String w_date;			//작업일자
	private String w_pnum;			//품번
	private String w_sdatetime;		//투입시작시간
	private String w_in_edatetime;	//투입완료시간
	private String w_edatetime;		//작업완료시간
	private String w_lot;			//천일 열처리LOT
	private int w_idx;				//화면표현 idx값
	private float w_weight;			//작업중량
	
	//쿼리로 생성한 컬럼
	private int w_intime;			//투입시간
	private int w_incnt;			//투입통수
	private int w_std_weight;		//장입기준량
	
	//기준정보
	private String w_pname;			//품명
	private String w_gang;			//강종
	private String w_t_gb;			//T급
	private float w_cp;				//CP
	private int w_qf;				//소입온도
	private int w_tf;				//소려온도
	private String w_hardness;		//요구경도
	
	//경도정보
	private float h_val1;				//경도값 - 1
	private float h_val2;				//경도값 - 2
	private float h_val3;				//경도값 - 3
	
	private String page_code;		//페이지번호
	private int user_code;			//사용자 고유키
	private String work_url;		//접속 URL
	
	//알람이력
	private String a_stime;			//알람 발생시간
	private String a_etime;			//알람 해제시간
	private String a_hogi;			//알람 호기
	private String a_addr;			//알람 주소
	private String a_desc;			//알람 코멘트
	private int a_value;			//알람 현재 값
	private int a_cnt;				//알람 발생 수
	private String a_sdate;			//알람 조회시작일자
	private String a_edate;			//알람 조회종료일자
	
	//종합생산현황
	private String m_machine;
	private String m_pnum;
	private String m_pname;
	private int m_intime;
	private int m_incnt;
	private float m_weight;
	private int m_std_weight;
	private float m_weight_percent;
	
	
	public String getW_machine() {
		return w_machine;
	}
	public void setW_machine(String w_machine) {
		this.w_machine = w_machine;
	}
	public String getW_date() {
		return w_date;
	}
	public void setW_date(String w_date) {
		this.w_date = w_date;
	}
	public String getW_pnum() {
		return w_pnum;
	}
	public void setW_pnum(String w_pnum) {
		this.w_pnum = w_pnum;
	}
	public String getW_sdatetime() {
		return w_sdatetime;
	}
	public void setW_sdatetime(String w_sdatetime) {
		this.w_sdatetime = w_sdatetime;
	}
	public String getW_edatetime() {
		return w_edatetime;
	}
	public void setW_edatetime(String w_edatetime) {
		this.w_edatetime = w_edatetime;
	}
	public String getW_lot() {
		return w_lot;
	}
	public void setW_lot(String w_lot) {
		this.w_lot = w_lot;
	}
	public int getW_intime() {
		return w_intime;
	}
	public void setW_intime(int w_intime) {
		this.w_intime = w_intime;
	}
	public int getW_incnt() {
		return w_incnt;
	}
	public void setW_incnt(int w_incnt) {
		this.w_incnt = w_incnt;
	}
	public int getW_std_weight() {
		return w_std_weight;
	}
	public void setW_std_weight(int w_std_weight) {
		this.w_std_weight = w_std_weight;
	}
	public float getW_weight() {
		return w_weight;
	}
	public void setW_weight(float w_weight) {
		this.w_weight = w_weight;
	}
	public String getW_pname() {
		return w_pname;
	}
	public void setW_pname(String w_pname) {
		this.w_pname = w_pname;
	}
	public String getW_gang() {
		return w_gang;
	}
	public void setW_gang(String w_gang) {
		this.w_gang = w_gang;
	}
	public String getW_t_gb() {
		return w_t_gb;
	}
	public void setW_t_gb(String w_t_gb) {
		this.w_t_gb = w_t_gb;
	}
	public float getW_cp() {
		return w_cp;
	}
	public void setW_cp(float w_cp) {
		this.w_cp = w_cp;
	}
	public int getW_qf() {
		return w_qf;
	}
	public void setW_qf(int w_qf) {
		this.w_qf = w_qf;
	}
	public int getW_tf() {
		return w_tf;
	}
	public void setW_tf(int w_tf) {
		this.w_tf = w_tf;
	}
	public float getH_val1() {
		return h_val1;
	}
	public void setH_val1(float h_val1) {
		this.h_val1 = h_val1;
	}
	public float getH_val2() {
		return h_val2;
	}
	public void setH_val2(float h_val2) {
		this.h_val2 = h_val2;
	}
	public float getH_val3() {
		return h_val3;
	}
	public void setH_val3(float h_val3) {
		this.h_val3 = h_val3;
	}
	public int getW_idx() {
		return w_idx;
	}
	public void setW_idx(int w_idx) {
		this.w_idx = w_idx;
	}
	public String getW_in_edatetime() {
		return w_in_edatetime;
	}
	public void setW_in_edatetime(String w_in_edatetime) {
		this.w_in_edatetime = w_in_edatetime;
	}
	public String getW_hardness() {
		return w_hardness;
	}
	public void setW_hardness(String w_hardness) {
		this.w_hardness = w_hardness;
	}
	public String getPage_code() {
		return page_code;
	}
	public void setPage_code(String page_code) {
		this.page_code = page_code;
	}
	public int getUser_code() {
		return user_code;
	}
	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}
	public String getWork_url() {
		return work_url;
	}
	public void setWork_url(String work_url) {
		this.work_url = work_url;
	}
	public String getA_stime() {
		return a_stime;
	}
	public void setA_stime(String a_stime) {
		this.a_stime = a_stime;
	}
	public String getA_etime() {
		return a_etime;
	}
	public void setA_etime(String a_etime) {
		this.a_etime = a_etime;
	}
	public String getA_hogi() {
		return a_hogi;
	}
	public void setA_hogi(String a_hogi) {
		this.a_hogi = a_hogi;
	}
	public String getA_addr() {
		return a_addr;
	}
	public void setA_addr(String a_addr) {
		this.a_addr = a_addr;
	}
	public String getA_desc() {
		return a_desc;
	}
	public void setA_desc(String a_desc) {
		this.a_desc = a_desc;
	}
	public int getA_value() {
		return a_value;
	}
	public void setA_value(int a_value) {
		this.a_value = a_value;
	}
	public int getA_cnt() {
		return a_cnt;
	}
	public void setA_cnt(int a_cnt) {
		this.a_cnt = a_cnt;
	}
	public String getA_sdate() {
		return a_sdate;
	}
	public void setA_sdate(String a_sdate) {
		this.a_sdate = a_sdate;
	}
	public String getA_edate() {
		return a_edate;
	}
	public void setA_edate(String a_edate) {
		this.a_edate = a_edate;
	}
	public String getM_machine() {
		return m_machine;
	}
	public void setM_machine(String m_machine) {
		this.m_machine = m_machine;
	}
	public String getM_pnum() {
		return m_pnum;
	}
	public void setM_pnum(String m_pnum) {
		this.m_pnum = m_pnum;
	}
	public String getM_pname() {
		return m_pname;
	}
	public void setM_pname(String m_pname) {
		this.m_pname = m_pname;
	}
	public int getM_intime() {
		return m_intime;
	}
	public void setM_intime(int m_intime) {
		this.m_intime = m_intime;
	}
	public int getM_incnt() {
		return m_incnt;
	}
	public void setM_incnt(int m_incnt) {
		this.m_incnt = m_incnt;
	}
	public float getM_weight() {
		return m_weight;
	}
	public void setM_weight(float m_weight) {
		this.m_weight = m_weight;
	}
	public int getM_std_weight() {
		return m_std_weight;
	}
	public void setM_std_weight(int m_std_weight) {
		this.m_std_weight = m_std_weight;
	}
	public float getM_weight_percent() {
		return m_weight_percent;
	}
	public void setM_weight_percent(float m_weight_percent) {
		this.m_weight_percent = m_weight_percent;
	}
	
}
