package com.nchu.software.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nchu.software.entity.SecondMenuEntity;
import com.nchu.software.service.PageContextService;
import com.nchu.software.service.SecondMenuService;

@Controller
@RequestMapping("/secondMenu")
public class SecondMneuController {

	private String prefix = "secondMenu/";
	
	@Autowired
	private SecondMenuService secondMenuService;
	
	@Autowired
	private PageContextService pageContextService;
	
	/*@RequestMapping(value = "/getSecondMenu", method = RequestMethod.GET)
	public ModelAndView getSecondMenu(String secondmenuid){
		Long secondMenuId = new Long(secondmenuid);
		List<SecondMenuEntity> secList = secondMenuService.getSecondBySecId(secondMenuId);
		List<PageContextEntity> pageList = pageContextService.findBySecondMenuId(secondMenuId);
		ModelAndView mv = new ModelAndView();
		mv.addObject("second", secList);
		mv.addObject("page", pageList);
		return mv;
	}*/
	
	@RequestMapping(value = "/getSecondMenu", method = RequestMethod.GET)
	@ResponseBody
	public Object getSecondMenu(String secondmenuid){
		int secondid = Integer.parseInt(secondmenuid);
		List<SecondMenuEntity> secList;
		if(secondid == 91 || secondid == 92 || secondid == 93){
			System.out.println(111);
			secList = secondMenuService.getSecondMenu();
		}else{
			Long secondMenuId = new Long(secondmenuid);
			secList = secondMenuService.getSecondBySecId(secondMenuId);
		}
		return secList;
	}

	@RequestMapping(value = "/getSecondMenuByFirstId", method = RequestMethod.GET)
	@ResponseBody
	public List<SecondMenuEntity> getSecondMenuByFirstId(Long firstMenuId){

		List<SecondMenuEntity> list = secondMenuService.getSecondByFirstId(firstMenuId);
		return list;
	}
}
