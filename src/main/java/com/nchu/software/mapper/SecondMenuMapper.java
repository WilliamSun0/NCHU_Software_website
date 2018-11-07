package com.nchu.software.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.nchu.software.controller.SecondMneuController;
import com.nchu.software.entity.SecondMenuEntity;

public interface SecondMenuMapper {

	public List<SecondMenuEntity> findSecondMenuByFirId(@Param("firstmenuid") Long firstmenuid);
	
	public List<SecondMenuEntity> findList();
	
	public List<SecondMenuEntity> findSecondMenuBySecId(@Param("secondmenuid") Long secondmenuid);
	
	public List<SecondMenuEntity> getSecondMenu();
}
