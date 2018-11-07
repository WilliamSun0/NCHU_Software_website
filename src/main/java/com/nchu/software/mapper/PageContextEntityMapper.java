package com.nchu.software.mapper;

import com.nchu.software.entity.PageContextEntity;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author TyCoding
 * @date 18-4-30上午9:50
 */
public interface PageContextEntityMapper {

    void savePageContextEntity(PageContextEntity page);

    int selectCount();

    List<PageContextEntity> findByPage(HashMap<String, Object> map);

    List<PageContextEntity> findConByPage(Map<String, Object> conMap);

    void delete(int pagecontextid);

    void update(PageContextEntity PageContextEntity);

    PageContextEntity findById(int pagecontextid);

    void clean(int pagecontextid);

    int selectCount2();

    void restore(int pagecontextid);

}
