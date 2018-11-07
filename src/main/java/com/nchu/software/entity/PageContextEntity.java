package com.nchu.software.entity;

import java.io.Serializable;
import java.util.Date;

public class PageContextEntity implements Serializable{

	private Long pagecontextid;
	private Long secondmenuid;
	private String title;
	private String author;
	private String context;
	private String source;
	private Date uploadtime;
	private Integer count;
	private Integer status;
	private Integer verify;
	private Integer published;

	public PageContextEntity() {
	}

	public PageContextEntity(Long pagecontextid, Long secondmenuid, String title, String author, String context, String source, Date uploadtime, Integer count, Integer status, Integer verify, Integer published) {
		this.pagecontextid = pagecontextid;
		this.secondmenuid = secondmenuid;
		this.title = title;
		this.author = author;
		this.context = context;
		this.source = source;
		this.uploadtime = uploadtime;
		this.count = count;
		this.status = status;
		this.verify = verify;
		this.published = published;
	}

	public Long getPagecontextid() {
		return pagecontextid;
	}

	public void setPagecontextid(Long pagecontextid) {
		this.pagecontextid = pagecontextid;
	}

	public Long getSecondmenuid() {
		return secondmenuid;
	}

	public void setSecondmenuid(Long secondmenuid) {
		this.secondmenuid = secondmenuid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public Date getUploadtime() {
		return uploadtime;
	}

	public void setUploadtime(Date uploadtime) {
		this.uploadtime = uploadtime;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getVerify() {
		return verify;
	}

	public void setVerify(Integer verify) {
		this.verify = verify;
	}

	public Integer getPublished() {
		return published;
	}

	public void setPublished(Integer published) {
		this.published = published;
	}
}
