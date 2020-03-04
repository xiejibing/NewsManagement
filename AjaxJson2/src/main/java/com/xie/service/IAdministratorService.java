package com.xie.service;

import com.xie.domain.Administrator;

public interface IAdministratorService {
    //根据管理员用户名查找
    Administrator findByName(String admin_name);

    //修改密码
    void updatePassword(String admin_name, String newPassword);
}
