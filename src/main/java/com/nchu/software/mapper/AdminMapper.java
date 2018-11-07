package com.nchu.software.mapper;


import com.nchu.software.entity.Admin;

public interface AdminMapper {
    
    Admin login(String a_name);

    void insert(Admin admin);

    Admin findByName(String a_name);
}
