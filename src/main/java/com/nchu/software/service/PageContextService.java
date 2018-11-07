package com.nchu.software.service;

import java.util.List;

import com.nchu.software.entity.PageContextEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nchu.software.mapper.PageContextMapper;

@Service
public class PageContextService {

	@Autowired
	private PageContextMapper pageContextMapper;
	
	public List<PageContextEntity> findBySecondMenuId(Long id){

		return pageContextMapper.findBySecondMenuId(id);
	}
	
	public PageContextEntity findByPageId(Long id){
		return pageContextMapper.findByPageId(id);
	}
	
	public void updateCount(Long pagecontextid){
		pageContextMapper.updateCount(pagecontextid);
	}
	
	public List<PageContextEntity> getAll(){
		return pageContextMapper.getAll();
	}
	
	public List<PageContextEntity> getPageByName(List<Long> secondmenuid){
		return pageContextMapper.getPageBySecondId(secondmenuid);
	}
}
