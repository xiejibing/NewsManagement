package com.xie.dao;

import com.xie.domain.Administrator;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository("administratorDao")  //注入spring容器中
public interface IAdministratorDao {
    //通过名字查询管理员登录信息
    @Select("select * from t_administrator where admin_name = #{admin_name}")
    Administrator findByName(String admin_name);

    //修改密码：更新管理员信息
    @Update("update t_administrator set admin_password=#{admin_password} where admin_name = #{admin_name}")
    void updateAdministrator(Administrator administrator);
}
