package com.nchu.software.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class DownLoadTypeEntity implements Serializable{

	private BigDecimal downloadid;
	private String downloadtypename;
	private int status;
	public BigDecimal getDownloadid() {
		return downloadid;
	}
	public void setDownloadid(BigDecimal downloadid) {
		this.downloadid = downloadid;
	}
	public String getDownloadtypename() {
		return downloadtypename;
	}
	public void setDownloadtypename(String downloadtypename) {
		this.downloadtypename = downloadtypename;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
