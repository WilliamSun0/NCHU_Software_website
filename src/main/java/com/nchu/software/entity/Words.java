package com.nchu.software.entity;

import java.io.Serializable;

/**
 * 留言信息
 * @author TyCoding
 * @date 2018/5/6 上午10:56
 */
public class Words implements Serializable {

    //编号
    private int lw_id;
    //留言人
    private String lw_name;
    //留言时间
    private String lw_date;
    //留言内容
    private String lw_content;
    //给谁留言
    private String lw_for_name;
    //在哪篇文章留言(id)
    private String lw_for_PageContextEntity_id;

    public int getLw_id() {
        return lw_id;
    }

    public void setLw_id(int lw_id) {
        this.lw_id = lw_id;
    }

    public String getLw_name() {
        return lw_name;
    }

    public void setLw_name(String lw_name) {
        this.lw_name = lw_name;
    }

    public String getLw_date() {
        return lw_date;
    }

    public void setLw_date(String lw_date) {
        this.lw_date = lw_date;
    }

    public String getLw_content() {
        return lw_content;
    }

    public void setLw_content(String lw_content) {
        this.lw_content = lw_content;
    }

    public String getLw_for_name() {
        return lw_for_name;
    }

    public void setLw_for_name(String lw_for_name) {
        this.lw_for_name = lw_for_name;
    }

    public String getLw_for_PageContextEntity_id() {
        return lw_for_PageContextEntity_id;
    }

    public void setLw_for_PageContextEntity_id(String lw_for_PageContextEntity_id) {
        this.lw_for_PageContextEntity_id = lw_for_PageContextEntity_id;
    }
}
