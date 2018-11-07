package com.nchu.software.mapper;

import java.util.List;

import com.nchu.software.entity.PageContextEntity;
import org.apache.ibatis.annotations.Param;

public interface PageContextMapper {

	public List<PageContextEntity> findBySecondMenuId(Long secondMenuId);
	
	public PageContextEntity findByPageId(@Param("pageContextId")Long id);
	
	public void updateCount(@Param("pagecontextid") Long pagecontextid);
	
	
	public List<PageContextEntity> getAll();
	
	public List<PageContextEntity> getPageBySecondId(List<Long> secondmenuid);
}
