package com.nchu.software.service;



import com.nchu.software.entity.*;

import java.util.List;
import java.util.Map;

/**
 * @author TyCoding
 * @date 2018/5/3 上午8:36
 */
public interface PageContextEntityService {

    void savePageContextEntity(PageContextEntity page);

    PageBean<PageContextEntity> findByPage(int pageCode, int pageSize, Map<String, Object> conMap);

    void delete(int pagecontextid);

    void update(PageContextEntity PageContextEntity);

    PageContextEntity findById(int pagecontextid);

    void clean(int pagecontextid);

    void restore(int pagecontextid);

}
