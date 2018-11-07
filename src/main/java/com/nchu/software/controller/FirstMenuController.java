package com.nchu.software.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nchu.software.entity.SecondMenuEntity;
import com.nchu.software.service.FirstMenuService;
import com.nchu.software.service.SecondMenuService;

@Controller
@RequestMapping("/menu")
public class FirstMenuController {

	private String prefix = "menu/";
	@Autowired
	private FirstMenuService firstMenuService;
	
	@Autowired
	private SecondMenuService secondMenuService;
	
	@RequestMapping("/getMenu")
	@ResponseBody
	public Map<String, Object> getAll(){
		Map<String, Object> map = new HashMap<>();
		map.put("firstmenu", firstMenuService.getAll());
		map.put("secondmenu", secondMenuService.getAllSecondMneu());
		return map;
	}
	
	/*@RequestMapping(value = "/getSecond/{firstId}")
	@ResponseBody
	public ModelAndView getSecondByFirstMenu(@PathVariable(value = "firstId") String firstId){
		BigDecimal firstmenuId = new BigDecimal(firstId);
		List<SecondMenuEntity> list = secondMenuService.getSecondByFirstId(firstmenuId);
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", list);
		return mv;
	}*/
	/*@RequestMapping(value = "/get/{firstId}.html")
	public String fanhui(@PathVariable String firstId){
		System.out.println(firstId);
		return "index";
	}*/
	
	/*@RequestMapping(value = "/news")
	public ModelAndView mov(String newsId){
		System.out.println(newsId);
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", newsId);
		return mv;
	}*/
}
