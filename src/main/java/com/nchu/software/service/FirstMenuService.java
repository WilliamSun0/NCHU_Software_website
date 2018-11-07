package com.nchu.software.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nchu.software.entity.FirstMenuEntity;
import com.nchu.software.mapper.FirstMenuMapper;

@Service
public class FirstMenuService {

	@Autowired
	private FirstMenuMapper firstMenuDao;
	
	public List<FirstMenuEntity> getAll(){
		return firstMenuDao.selectList();
	}
}
