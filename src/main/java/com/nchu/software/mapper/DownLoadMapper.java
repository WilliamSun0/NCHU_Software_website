package com.nchu.software.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.nchu.software.entity.DownLoadEntity;

public interface DownLoadMapper {

	public List<DownLoadEntity> findListFile();
	
	public List<DownLoadEntity> findFileByDownLoadId(@Param("downloadid")Long downloadid);
	
	public List<DownLoadEntity> downLoadByFileId(@Param("fileid")Long fileid);
}
