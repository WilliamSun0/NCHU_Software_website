package com.nchu.software.service.impl;


import com.nchu.software.entity.*;
import com.nchu.software.mapper.PageContextEntityMapper;
import com.nchu.software.service.PageContextEntityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author TyCoding
 * @date 2018/5/3 上午8:36
 */
@Service
public class PageContextEntityServiceImpl implements PageContextEntityService {

    /**
     * 注入Mapper层
     */
    @Autowired
    private PageContextEntityMapper PageContextEntityMapper;

    /**
     * 添加文章信息
     *
     */
    public void savePageContextEntity(PageContextEntity page) {
        PageContextEntityMapper.savePageContextEntity(page);
    }

    /**
     * 分页查询的方法
     * @param pageCode 当前页
     * @param pageSize 每页显示的记录条数
     * @param conMap 分页查询的数据
     * @return 分页查询的结果
     */
    public PageBean<PageContextEntity> findByPage(int pageCode, int pageSize, Map<String, Object> conMap) {
        HashMap<String,Object> map = new HashMap<String,Object>();
        PageBean<PageContextEntity> pageBean = new PageBean<PageContextEntity>();

        //获取Controller层封装的状态码
        Integer goId = (Integer)conMap.get("goId");

        //封装数据
        pageBean.setPageCode(pageCode);
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = 0;
        if(goId == 0){
            //访问的是文章列表页面
            totalCount = PageContextEntityMapper.selectCount();
        }else if(goId == 1){
            //访问的是回收站页面
            totalCount = PageContextEntityMapper.selectCount2();
        }
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num = Math.ceil(tc / pageSize);
        //根据“ceil”的字面意思“天花板”去理解；
        //例如：
        //Math.ceil(11.46)=Math.ceil(11.68)=Math.ceil(11.5)=12
        //Math.ceil(-11.46)=Math.ceil(-11.68)=Math.ceil(-11.5)=-11
        pageBean.setTotalPage(num.intValue());

        //设置limit起始位置和终止位置
        map.put("start",(pageCode - 1) * pageSize);
        map.put("size",pageBean.getPageSize());

        //封装每页显示的数据
        List<PageContextEntity> list = PageContextEntityMapper.findByPage(map);
        pageBean.setBeanList(list);

        for(Object obj : list){
            System.out.println(obj);
        }

        //条件查询的封装
        conMap.put("start",(pageCode - 1) * pageSize);
        conMap.put("size",pageBean.getPageSize());

        List<PageContextEntity> conList = PageContextEntityMapper.findConByPage(conMap);
        pageBean.setBeanList(conList);
        return pageBean;
    }

    /**
     * 删除功能
     * @param pagecontextid 要删除字段的ID值
     */
    public void delete(int pagecontextid) {
        PageContextEntityMapper.delete(pagecontextid);
    }

    /**
     * 更新用户信息的功能
     * @param PageContextEntity 需要更新的数据
     */
    public void update(PageContextEntity PageContextEntity) {
        PageContextEntityMapper.update(PageContextEntity);
    }

    /**
     * 根据ID查询信息
     * @param pagecontextid 要查询的ID
     * @return 返回查询到的数据
     */
    public PageContextEntity findById(int pagecontextid) {
        return PageContextEntityMapper.findById(pagecontextid);
    }

    /**
     * 删除文章的功能（仅把文章放入到回收站中）
     * @param pagecontextid 需要删除的文章的ID值
     */
    public void clean(int pagecontextid) {
        PageContextEntityMapper.clean(pagecontextid);
    }

    /**
     * 恢复文章的功能（即将文章从回收站中移除）
     * @param pagecontextid 要恢复的文章的ID值
     */
    public void restore(int pagecontextid) {
        PageContextEntityMapper.restore(pagecontextid);
    }

    /**
     * 保存留言信息功能
     * @param words 保存的信息
     */


}
