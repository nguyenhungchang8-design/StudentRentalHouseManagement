package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Users;

public class UserDAO extends DBContext {

    public List<Users> getAllUsers() {
        List<Users> list = new ArrayList<>();

        String sql = "SELECT * FROM Users";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

             while (rs.next()) {

                Users u = new Users();

                u.setUserId(rs.getInt("user_id"));
                u.setFullName(rs.getString("full_name"));
                u.setEmail(rs.getString("email"));
                u.setPhone(rs.getString("phone"));
                u.setPassword(rs.getString("password"));
                u.setRole(rs.getString("role"));
                u.setNationalId(rs.getString("national_id"));
                u.setUniversity(rs.getString("university"));
                u.setActive(rs.getBoolean("is_active"));

                list.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public Users getUserById(int id) {

    String sql = "SELECT * FROM Users WHERE user_id = ?";

    try {
        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            Users u = new Users();

            u.setUserId(rs.getInt("user_id"));
            u.setFullName(rs.getString("full_name"));
            u.setEmail(rs.getString("email"));
            u.setPhone(rs.getString("phone"));
            u.setPassword(rs.getString("password"));
            u.setRole(rs.getString("role"));
            u.setNationalId(rs.getString("national_id"));
            u.setUniversity(rs.getString("university"));
            u.setActive(rs.getBoolean("is_active"));

            return u;
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return null;
}
    public boolean createUser(Users u) {

    String sql = "INSERT INTO Users (full_name, email, phone, password, role, national_id, university, is_active) "
               + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    try {
        PreparedStatement ps = connection.prepareStatement(sql);

        ps.setString(1, u.getFullName());
        ps.setString(2, u.getEmail());
        ps.setString(3, u.getPhone());
        ps.setString(4, u.getPassword());
        ps.setString(5, u.getRole());
        ps.setString(6, u.getNationalId());
        ps.setString(7, u.getUniversity());
        ps.setBoolean(8, u.isActive());

        int rows = ps.executeUpdate();

        return rows > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }

    return false;
}
    public Users getUserByEmail(String email) {

    String sql = "SELECT * FROM Users WHERE email = ?";

    try {

        PreparedStatement ps = connection.prepareStatement(sql);
        ps.setString(1, email);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            Users u = new Users();

            u.setUserId(rs.getInt("user_id"));
            u.setFullName(rs.getString("full_name"));
            u.setEmail(rs.getString("email"));
            u.setPhone(rs.getString("phone"));
            u.setPassword(rs.getString("password"));
            u.setRole(rs.getString("role"));
            u.setNationalId(rs.getString("national_id"));
            u.setUniversity(rs.getString("university"));
            u.setActive(rs.getBoolean("is_active"));

            return u;
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return null;
}
     public static void main(String[] args) {
        UserDAO user = new UserDAO();
        if(user.getAllUsers() != null)
        {
            System.out.println(user.getAllUsers());
        }
        else{
            return;
        }
        Users us = user.getUserById(1);
                System.out.println(us.toString());
                
        Users u = user.getUserByEmail("admin@boardinghouse.com");
                System.out.println(u.toString());
    }
}
    
