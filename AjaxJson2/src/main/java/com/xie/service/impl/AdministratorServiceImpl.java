package com.xie.service.impl;

import com.xie.dao.IAdministratorDao;
import com.xie.domain.Administrator;
import com.xie.service.IAdministratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("AdministratorService")
public class AdministratorServiceImpl implements IAdministratorService {

    @Autowired
    private IAdministratorDao administratorDao;
    @Override
    public Administrator findByName(String admin_name) {
        Administrator administrator = administratorDao.findByName(admin_name);
        return administrator;
    }

    @Override
    public void updatePassword(String admin_name, String newPassword) {
        Administrator administrator = new Administrator();
        administrator.setAdmin_name(admin_name);
        administrator.setAdmin_password(newPassword);
        administratorDao.updateAdministrator(administrator);

    }
}
