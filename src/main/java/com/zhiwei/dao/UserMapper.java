package com.zhiwei.dao;

import com.zhiwei.po.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {


    User queryByName(String username);
    User queryById(Integer id);
    int  update(User user);
    int insert(User user);
    List<User> queryList();
    Integer updateById(User user);
    Integer delete(Integer id);

    User queryByNameAndState(User user);



}