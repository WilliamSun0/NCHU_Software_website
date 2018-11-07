package com.nchu.software.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class FirstMenuEntity implements Serializable{

	private BigDecimal firstmenuid;
	private String firstmenuname;
	private String firstmenuurl;
	
	public FirstMenuEntity(BigDecimal firstmenuid, String firstmenuname,
			String firstmenuurl) {
		this.firstmenuid = firstmenuid;
		this.firstmenuname = firstmenuname;
		this.firstmenuurl = firstmenuurl;
	}
	
	public FirstMenuEntity() {
	}
	
	public BigDecimal getFirstmenuid() {
		return firstmenuid;
	}
	
	public void setFirstmenuid(BigDecimal firstmenuid) {
		this.firstmenuid = firstmenuid;
	}
	
	public String getFirstmenuname() {
		return firstmenuname;
	}
	
	public void setFirstmenuname(String firstmenuname) {
		this.firstmenuname = firstmenuname;
	}
	
	public String getFirstmenuurl() {
		return firstmenuurl;
	}
	
	public void setFirstmenuurl(String firstmenuurl) {
		this.firstmenuurl = firstmenuurl;
	}
}
