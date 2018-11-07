package com.nchu.software.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nchu.software.entity.SecondMenuEntity;
import com.nchu.software.mapper.SecondMenuMapper;

@Service
public class SecondMenuService {

	@Autowired
	private SecondMenuMapper secondMenuMapper;
	
	public List<SecondMenuEntity> getAllSecondMneu(){
		return secondMenuMapper.findList();
	}
	
	public List<SecondMenuEntity> getSecondByFirstId(Long firstId){
		return secondMenuMapper.findSecondMenuByFirId(firstId);
	}
	
	public List<SecondMenuEntity> getSecondBySecId(Long secondId){
		return secondMenuMapper.findSecondMenuBySecId(secondId);
	}
	
	public List<SecondMenuEntity> getSecondMenu(){
		return secondMenuMapper.getSecondMenu();
	}
}
