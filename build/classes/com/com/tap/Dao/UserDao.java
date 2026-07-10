package com.tap.Dao;

import java.util.List;
import com.tap.Model.User;

public interface UserDao {

    int addUser(User user);

    int updateUser(User user);

   int deleteUser(int userId);

    User getUser(int userId);

    List<User> getAllUsers();
}