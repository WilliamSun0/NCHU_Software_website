package com.nchu.software.entity;

import java.io.Serializable;

/**
 * @author TyCoding
 * @date 2018/5/15 下午4:44
 */
public class Reply implements Serializable {

    //回复信息编号
    private int lpagecontextid;
    //回复人
    private String lr_name;
    //回复时间
    private String luploadtime;
    //回复内容
    private String lr_content;
    //给谁回复
    private String lr_for_name;
    //哪条留下的回复言
    private String lr_for_words;
    //给哪条回复信息回复的
    private String lr_for_reply;
    //在哪篇文章下的回复
    private String lr_for_PageContextEntity_id;

    public int getLpagecontextid() {
        return lpagecontextid;
    }

    public void setLpagecontextid(int lpagecontextid) {
        this.lpagecontextid = lpagecontextid;
    }

    public String getLr_name() {
        return lr_name;
    }

    public void setLr_name(String lr_name) {
        this.lr_name = lr_name;
    }

    public String getLuploadtime() {
        return luploadtime;
    }

    public void setLuploadtime(String luploadtime) {
        this.luploadtime = luploadtime;
    }

    public String getLr_content() {
        return lr_content;
    }

    public void setLr_content(String lr_content) {
        this.lr_content = lr_content;
    }

    public String getLr_for_name() {
        return lr_for_name;
    }

    public void setLr_for_name(String lr_for_name) {
        this.lr_for_name = lr_for_name;
    }

    public String getLr_for_words() {
        return lr_for_words;
    }

    public void setLr_for_words(String lr_for_words) {
        this.lr_for_words = lr_for_words;
    }

    public String getLr_for_reply() {
        return lr_for_reply;
    }

    public void setLr_for_reply(String lr_for_reply) {
        this.lr_for_reply = lr_for_reply;
    }

    public String getLr_for_PageContextEntity_id() {
        return lr_for_PageContextEntity_id;
    }

    public void setLr_for_PageContextEntity_id(String lr_for_PageContextEntity_id) {
        this.lr_for_PageContextEntity_id = lr_for_PageContextEntity_id;
    }
}
