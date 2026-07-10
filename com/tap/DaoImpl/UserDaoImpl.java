package com.tap.DaoImpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.tap.Dao.UserDao;
import com.tap.Model.User;

public class UserDaoImpl implements UserDao {

    String url = "jdbc:mysql://localhost:3306/instant_food";
    String username = "root";
    String password = "root";

    @Override
    public int addUser(User user) {

        String query = "INSERT INTO user(name,password,email,address,role) VALUES(?,?,?,?,?)";

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(url, username, password);

            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getEmail());
            pstmt.setString(4, user.getAddress());
            pstmt.setString(5, user.getRole());

            int res = pstmt.executeUpdate();

            pstmt.close();
            con.close();

            return res;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public int updateUser(User user) {

        int result = 0;

        String sql = "UPDATE user SET name=?, email=?, address=?, role=? WHERE userId=?";

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(url, username, password);

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getAddress());
            ps.setString(4, user.getRole());
            ps.setInt(5, user.getUserId());

            result = ps.executeUpdate();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public int deleteUser(int userId) {

        int result = 0;

        String sql = "DELETE FROM user WHERE userId=?";

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(url, username, password);

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);

            result = ps.executeUpdate();

        } catch(Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Override
    public User getUser(int userId) {

        User user = null;

        String query = "SELECT * FROM user WHERE userId=?";

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(url, username, password);

            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setInt(1, userId);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {

                user = new User();

                user.setUserId(rs.getInt("userId"));
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getString("role"));
            }

            rs.close();
            pstmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public List<User> getAllUsers() {

        List<User> users = new ArrayList<>();

        String sql = "SELECT * FROM user";

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(url, username, password);

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                User user = new User();

                user.setUserId(rs.getInt("userId"));
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getString("role"));

                users.add(user);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    // Login Method

    public User getUserByUsername(String name) {

        User user = null;

        String query = "SELECT * FROM user WHERE name=?";

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(url, username, password);

            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1, name);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {

                user = new User();

                user.setUserId(rs.getInt("userId"));
                user.setName(rs.getString("name"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getString("role"));
            }

            rs.close();
            pstmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}