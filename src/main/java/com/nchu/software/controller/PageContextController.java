package com.nchu.software.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.nchu.software.entity.PageContextEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nchu.software.entity.SecondMenuEntity;
import com.nchu.software.service.PageContextService;
import com.nchu.software.service.SecondMenuService;

@Controller
@RequestMapping("/page")
public class PageContextController {

	private String prefix = "page/";
	@Autowired
	private PageContextService pageContextService;
	
	@Autowired
	private SecondMenuService secondMenuService;
	
	/*@RequestMapping(value = "/getPageBySecId", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getPageBySecId(String secondmenuid){
		Long secondId = new Long(secondmenuid);
		List<PageContextEntity> list = pageContextService.findBySecondMenuId(secondId);
		List<SecondMenuEntity> secList = secondMenuService.getSecondMenu();
		ModelAndView mv = new ModelAndView(prefix + "listDetail");
		mv.addObject("pageList", list);
		mv.addObject("secList", secList);
		return mv;
	}*/
	@RequestMapping(value = "/getPageBySecId", method = RequestMethod.GET)
	@ResponseBody
	public Object getPageBySecId(String secondmenuid){
		Long secondId = new Long(secondmenuid);
		List<PageContextEntity> list = pageContextService.findBySecondMenuId(secondId);
		/*List<SecondMenuEntity> secList = secondMenuService.getSecondMenu();*/
		/*Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageList", list);*/
		/*map.put("secList", secList);*/
		return list;
	}
	
	@RequestMapping(value = "{pageId}/getPageById", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getPageById(@PathVariable("pageId") Long pageId){

		PageContextEntity page = pageContextService.findByPageId(pageId);
		pageContextService.updateCount(pageId);
		//ModelAndView mv = new ModelAndView(prefix + "pageDetail");
		ModelAndView mv = new ModelAndView(prefix + "detail");
		mv.addObject("data", page);
		return mv;
	}
	
	@RequestMapping(value = "/getAll", method = RequestMethod.GET)
	@ResponseBody
	public Object getAll(){
		List<PageContextEntity> list = pageContextService.getAll();
		return list;
	}

	@RequestMapping("/pageDetail")
	public ModelAndView pageDetail(){
		return new ModelAndView(prefix + "pageDetail");
	}
	
	@RequestMapping(value = "{secondMenuId}/pageList",method=RequestMethod.GET)
	public String pageList(@PathVariable("secondMenuId") Long secondMenuId,Model model){
		List<PageContextEntity> list = pageContextService.findBySecondMenuId(secondMenuId);

		model.addAttribute("pageList",list);

		model.addAttribute("secondMenuId",secondMenuId);
		return prefix+"pageList";

	}

//	@RequestMapping(value = "{firstMenuId}/{secondMenuId}/pageList",method=RequestMethod.GET)
//	public String getpageListByFirstId(@PathVariable("firstMenuId") Long firstMenuId,@PathVariable("secondMenuId") Long secondMenuId,Model model){
//		List<PageContextEntity> list = pageContextService.findBySecondMenuId(secondMenuId);
//        List<SecondMenuEntity> secondMenuList = secondMenuService.getSecondByFirstId(firstMenuId);
//
//        model.addAttribute("secondMenuList",secondMenuList);
//		model.addAttribute("secondMenuId",secondMenuId);
//		return prefix+"pageList";
//
//	}

    @RequestMapping(value = "{firstMenuId}/secondList",method=RequestMethod.GET)

    public String showSecondList(@PathVariable("firstMenuId") Long firstMenuId,Model model){

        //List<SecondMenuEntity> secondMenuList = secondMenuService.getSecondByFirstId(firstMenuId);

        model.addAttribute("firstMenuId",firstMenuId);
		System.out.println("firstMenuId"+firstMenuId);
        return prefix+"pageList";

    }

    @RequestMapping(value = "/getSecondListValue",method=RequestMethod.GET)
	@ResponseBody
    public List<SecondMenuEntity> getPageListByFirstId(Long firstMenuId){

        List<SecondMenuEntity> secondMenuList = secondMenuService.getSecondByFirstId(firstMenuId);

        return secondMenuList;

    }



	@RequestMapping(value="/getlist",method=RequestMethod.GET)
	@ResponseBody
	public Map<String,Object> getListInfo(Long secondMenuId, int page)throws IOException {

		//PageHelper 后台分页插件

		PageHelper.startPage(page, 5);
		System.out.println("page："+page);

		Map<String,Object> modelMap = new HashMap<String,Object>();

		//从数据库中查询出数据

		List<PageContextEntity> list = pageContextService.findBySecondMenuId(secondMenuId);

		PageInfo pageInfo = new PageInfo(list);

		int totalPage = pageInfo.getPages();//总页数

		modelMap.put("page", page);

		modelMap.put("list", list);

		modelMap.put("totalPage", totalPage);

		modelMap.put("pageSize",5 );

		for (PageContextEntity x:list
			 ) {
			System.out.println("contextid："+x.getPagecontextid());
			System.out.println("title："+x.getTitle());
		}


		System.out.println("totalpage："+totalPage);

		return modelMap;

	}

	@RequestMapping("/listDetail")
	public ModelAndView listDatail(){
		return new ModelAndView(prefix + "listDetail");
	}

}
