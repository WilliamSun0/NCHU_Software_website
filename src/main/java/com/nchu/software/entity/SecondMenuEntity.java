package com.nchu.software.entity;

import java.io.Serializable;


public class SecondMenuEntity implements Serializable{

	private Long secondmenuid;
	private String firstmenuid;
	private String secondmenuname;
	private String secondmenuurl;
	
	public SecondMenuEntity(Long secondmenuid, String firstmenuid,
			String secondmenuname, String secondmenuurl) {
		this.secondmenuid = secondmenuid;
		this.firstmenuid = firstmenuid;
		this.secondmenuname = secondmenuname;
		this.secondmenuurl = secondmenuurl;
	}
	
	public String getFirstmenuid() {
		return firstmenuid;
	}

	public void setFirstmenuid(String firstmenuid) {
		this.firstmenuid = firstmenuid;
	}
	
	public SecondMenuEntity() {
	}
	
	public Long getSecondmenuid() {
		return secondmenuid;
	}
	
	public void setSecondmenuid(Long secondmenuid) {
		this.secondmenuid = secondmenuid;
	}
	
	public String getSecondmenuname() {
		return secondmenuname;
	}
	
	public void setSecondmenuname(String secondmenuname) {
		this.secondmenuname = secondmenuname;
	}
	
	public String getSecondmenuurl() {
		return secondmenuurl;
	}
	
	public void setSecondmenuurl(String secondmenuurl) {
		this.secondmenuurl = secondmenuurl;
	}
}
