package com.bgs.examinationbackstage.mapper;

import com.bgs.examinationbackstage.pojo.Permission;
import com.bgs.examinationbackstage.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    User userLogin(@Param("name") String name, @Param("password") String password);

    List<Permission> showLeftList(Integer id);

    User selUserInfoByName(String name);
}
