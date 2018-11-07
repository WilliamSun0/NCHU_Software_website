package com.nchu.software.service;


import com.nchu.software.entity.Admin;

public interface AdminService {

    Admin login(String a_name);

    void insert(Admin admin);

    Admin findByName(String a_name);
}
