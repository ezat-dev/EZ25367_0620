package com.chunil.domain;

public class Thermocouple {
	
	
	private String sdate;
	private String edate;
	
	
	private String hogi; // 설비명
	private String year; // 년도
	private String zone; // 존 구분
	private String change_date; // 교체일자
	private String change_bdate; // 이전 교체일자
	private String change_ndate; // 차기 교체일자
	private String filename; // 파일명
	private String file_yn; // 파일 yn
	private int cnt; // index
	private String bigo; // 비고
	
	
	
	
	
	
	
	
	
	
	
	
	

	public String getHogi() {
		return hogi;
	}

	public void setHogi(String hogi) {
		this.hogi = hogi;
	}

	public String getChange_bdate() {
		return change_bdate;
	}

	public void setChange_bdate(String change_bdate) {
		this.change_bdate = change_bdate;
	}

	public String getChange_ndate() {
		return change_ndate;
	}

	public void setChange_ndate(String change_ndate) {
		this.change_ndate = change_ndate;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFile_yn() {
		return file_yn;
	}

	public void setFile_yn(String file_yn) {
		this.file_yn = file_yn;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getBigo() {
		return bigo;
	}

	public void setBigo(String bigo) {
		this.bigo = bigo;
	}

	public String getChange_date() {
		return change_date;
	}

	public void setChange_date(String change_date) {
		this.change_date = change_date;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}
	
	

}
