package com.nchu.software.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nchu.software.entity.PageContextEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nchu.software.entity.FirstMenuEntity;
import com.nchu.software.entity.SecondMenuEntity;
import com.nchu.software.service.FirstMenuService;
import com.nchu.software.service.PageContextService;
import com.nchu.software.service.SecondMenuService;

@Controller
@RequestMapping("/index")
public class IndexController {

	@Autowired
	private FirstMenuService firstMenuService;
	
	@Autowired
	private SecondMenuService secondMenuService;
	
	@Autowired
	private PageContextService pageContextService;
	
	/*@RequestMapping("/")
	@ResponseBody
	public ModelAndView InitIndex(){
		List<FirstMenuEntity> firstmenu = firstMenuService.getAll();
		List<SecondMenuEntity> secondmenu = secondMenuService.getAllSecondMneu();
		List<BigDecimal> list = new ArrayList<>();
		for(int i = 0; i < secondmenu.size(); i++){
			if(secondmenu.get(i).getFirstmenuid() == null){
				list.add(secondmenu.get(i).getSecondmenuid());
			}
		}
		List<PageContextEntity> pageContext = pageContextService.getPageByName(list);
		System.out.println(pageContext.size());
		ModelAndView mv = new ModelAndView("index");
		mv.addObject("firstmenu", firstmenu);
		mv.addObject("secondmenu", secondmenu);
		mv.addObject("pagecontext", pageContext);
		return mv;
	}*/
	
	@RequestMapping("/")
	@ResponseBody
	public Object InitIndex(){
		List<FirstMenuEntity> firstmenu = firstMenuService.getAll();
		List<SecondMenuEntity> secondmenu = secondMenuService.getAllSecondMneu();
		List<Long> list = new ArrayList<>();
		for(int i = 0; i < secondmenu.size(); i++){
			if(secondmenu.get(i).getFirstmenuid() == null){
				list.add(secondmenu.get(i).getSecondmenuid());
			}
		}
		List<PageContextEntity> pageContext = pageContextService.getPageByName(list);
		System.out.println(pageContext.size());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("firstmenu", firstmenu);
		System.out.println(firstmenu);
		map.put("secondmenu", secondmenu);
		map.put("pagecontext", pageContext);
		return map;
	}
}
