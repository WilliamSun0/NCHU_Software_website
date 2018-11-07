package com.nchu.software.entity;

import java.io.Serializable;

import java.util.Date;

/**
 * 下载文件
 * @author zy
 *
 */
public class DownLoadEntity implements Serializable{

	private Long fileid;
	private String downloadid;
	private String filename;
	private String provider;
	private Date uploadtime;
	private int downloadnum;
	private String filepath;
	private int status;
	public Long getFileid() {
		return fileid;
	}
	public void setFileid(Long fileid) {
		this.fileid = fileid;
	}
	public String getDownloadid() {
		return downloadid;
	}
	public void setDownloadid(String downloadid) {
		this.downloadid = downloadid;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getProvider() {
		return provider;
	}
	public void setProvider(String provider) {
		this.provider = provider;
	}
	public Date getUploadtime() {
		return uploadtime;
	}
	public void setUploadtime(Date uploadtime) {
		this.uploadtime = uploadtime;
	}
	public int getDownloadnum() {
		return downloadnum;
	}
	public void setDownloadnum(int downloadnum) {
		this.downloadnum = downloadnum;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
