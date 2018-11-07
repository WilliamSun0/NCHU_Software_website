package com.nchu.software.controller;


import com.nchu.software.entity.PageContextEntity;
import com.nchu.software.entity.Reply;
import com.nchu.software.entity.Words;
import com.nchu.software.service.PageContextEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author TyCoding
 * @date 18-4-30上午9:49
 */
@Controller
@RequestMapping(value = "/PageContextEntity")
public class PageContextEntityController {

    /**
     * 声明一个变量用于区别我访问的是文章管理页面，还是回收站页面
     * 0：访问的是文章管理页面     1：表示访问的是回收站页面
     */
    private int goId = 0;

    /**
     * 注入Service
     */
    @Autowired
    private PageContextEntityService PageContextEntityService;

    /**
     * 跳转到文章编辑页面
     */
    @RequestMapping(value = "/toPageContextEntityWrite")
    public String toPageContextEntityWrite() {
        return "view/PageContextEntity/PageContextEntityWrite";
    }

    /**
     * 跳转到文章管理页面
     */
    @RequestMapping(value = "/toPageContextEntityManage")
    public String toPageContextEntityManage() {
        //设置我区别访问页面的状态码
        goId = 0;
        return "redirect:findByPage";
    }

    /**
     * 跳转到回收站页面
     */
    @RequestMapping(value = "/toPageContextEntityTrash")
    public String toPageContextEntityTrash() {
        //设置这个状态码为1表示我访问的是回收站页面
        goId = 1;
        return "redirect:findByPage";
    }

    /**
     * 保存文章
     */
    @RequestMapping(value = "/savePageContextEntity")
    public String savePageContextEntity(PageContextEntity page, Model model) {
        try {
            PageContextEntityService.savePageContextEntity(page);
            model.addAttribute("message", "文章添加成功");
            return "view/info/message";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 分页查询
     */
    @RequestMapping(value = "/findByPage")
    public String findByPage(@RequestParam(value = "pageCode", defaultValue = "1", required = false) int pageCode,
                             @RequestParam(value = "pageSize", defaultValue = "3", required = false) int pageSize,
                             HttpServletRequest request,
                             Model model) {
        // 封装分页数据
        String verify = request.getParameter("verify");
        String publish = request.getParameter("publish");
        String status = request.getParameter("status");
        int v = 0, p = 0, s = 0;
        if (verify != null) {
            if (verify.equals("已审核")) {
                v = 1;
            } else if (verify.equals("未审核")) {
                v = 0;
            }
        }
        if (publish != null) {
            if (publish.equals("已发布")) {
                p = 1;
            } else if (verify.equals("未发布")) {
                p = 0;
            }
        }
        if (status != null) {
            if (status.equals("存在")) {
                s = 0;
            } else if (status.equals("已删除")) {
                s = 1;
            }
        }
        Map<String, Object> conMap = new HashMap<String, Object>();
        conMap.put("verify", v);
        conMap.put("publish", p);
        conMap.put("status", s);

        //把状态码也放入Map集合中
        conMap.put("goId", goId);

        //回显数据
        model.addAttribute("page", PageContextEntityService.findByPage(pageCode, pageSize, conMap));
        if (goId == 1) {
            return "/view/PageContextEntity/PageContextEntityTrash";
        }
        return "view/PageContextEntity/PageContextEntityManage";
    }

    /**
     * 删除功能
     */
    @RequestMapping(value = "/delete")
    public String delete(@RequestParam int pagecontextid) {
        PageContextEntityService.delete(pagecontextid);
        return "redirect:findByPage.do";
    }

    /**
     * 跳转到更新文章信息页面
     */

    @RequestMapping(value = "/toEditPage")
    public String editPage(@RequestParam int pagecontextid, Model model) {
        //先去查询
        PageContextEntity PageContextEntity = PageContextEntityService.findById(pagecontextid);
        if (PageContextEntity != null) {
            model.addAttribute("PageContextEntity", PageContextEntity);
            return "view/PageContextEntity/PageContextEntityUpdate";
        } else {
            return null;
        }
    }

    /**
     * 文章删除（仅放入回收站，即仅仅改变status的值）
     */
    @RequestMapping(value = "/clean")
    public String clean(@RequestParam int pagecontextid) {
        PageContextEntityService.clean(pagecontextid);
        return "redirect:findByPage";
    }

    /**
     * 恢复文章信息功能（即将文章从回收站中取出，改变status值）
     */
    @RequestMapping(value = "/restore")
    public String restore(@RequestParam int pagecontextid) {
        PageContextEntityService.restore(pagecontextid);
        return "redirect:findByPage";
    }

    /**
     * 更新文章信息的方法
     */
    @RequestMapping(value="/update")
    public String update(PageContextEntity PageContextEntity,Model model){
        if(PageContextEntity != null){
            PageContextEntityService.update(PageContextEntity);
            return "redirect:toPageContextEntityManage";
        }else{
            model.addAttribute("message","文章信息获取失败");
            return "view/info/message";
        }
    }

    /**
     * 保存留言信息
     */

    private List<Words> lw_list;
    private List<Reply> lr_list;
    @RequestMapping(value="/toPageContextEntityView")
    public String toPageContextEntityView(@RequestParam int pagecontextid, Model model){


        //查询文章信息
        PageContextEntity PageContextEntity = PageContextEntityService.findById(pagecontextid);
        System.out.println("查询到当前文章的ID值："+PageContextEntity.getPagecontextid());
        if (PageContextEntity != null) {
            model.addAttribute("PageContextEntity", PageContextEntity);
            return "view/PageContextEntity/PageContextEntityView";
        } else {
            return null;
        }
    }

}
