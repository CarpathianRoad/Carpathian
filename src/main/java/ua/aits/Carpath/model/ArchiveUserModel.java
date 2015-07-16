/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import ua.aits.Carpath.functions.DB;

/**
 *
 * @author kiwi
 */
public class ArchiveUserModel {
    public Integer user_id;
    public String user_name;
    public String user_password;
    public String user_firstname;
    public String user_lastname;
    public String user_avatar;
    public String user_contacts;
    public String user_descr;
    public Integer user_enabled;
    public Integer user_role;
    
    
    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_password() {
        return user_password;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public String getUser_firstname() {
        return user_firstname;
    }

    public void setUser_firstname(String user_firstname) {
        this.user_firstname = user_firstname;
    }

    public String getUser_lastname() {
        return user_lastname;
    }

    public void setUser_lastname(String user_lastname) {
        this.user_lastname = user_lastname;
    }

    public String getUser_avatar() {
        return user_avatar;
    }

    public void setUser_avatar(String user_avatar) {
        this.user_avatar = user_avatar;
    }

    public String getUser_contacts() {
        return user_contacts;
    }

    public void setUser_contacts(String user_contacts) {
        this.user_contacts = user_contacts;
    }

    public String getUser_descr() {
        return user_descr;
    }

    public void setUser_descr(String user_descr) {
        this.user_descr = user_descr;
    }

    public Integer getUser_enabled() {
        return user_enabled;
    }

    public void setUser_enabled(Integer user_enabled) {
        this.user_enabled = user_enabled;
    }

    public Integer getUser_role() {
        return user_role;
    }

    public void setUser_role(Integer user_role) {
        this.user_role = user_role;
    }
    
    
    public String isExitsUser(String user_name, String user_password) throws SQLException{
        ResultSet result = DB.getResultSet("SELECT * FROM archive_users WHERE user_name = '" + user_name +"' AND user_password = '" + user_password + "' AND user_enabled = 1;");
        if(result.next()) { return result.getString("user_id"); }
        return null;
    }
    
    public ArchiveUserModel getOneUserFull(String user_id, String user_name, String user_password)  throws SQLException{ 
        ResultSet result = DB.getResultSet("SELECT * FROM archive_users WHERE user_id = "+user_id+" AND user_name='"+user_name+"' AND user_password='"+user_password+"' AND user_enabled = 1;");
        ArchiveUserModel temp = new ArchiveUserModel();
        while (result.next()) { 
            temp.setUser_id(result.getInt("user_id"));
            temp.setUser_name(result.getString("user_name"));
            temp.setUser_password(result.getString("user_password"));
            temp.setUser_firstname(result.getString("user_firstname"));
            temp.setUser_lastname(result.getString("user_lastname"));
            temp.setUser_avatar(result.getString("user_avatar"));
            if(temp.getUser_avatar() == null || "".equals(temp.getUser_avatar())){
                temp.setUser_avatar("img/noavatar.png");
            }
            temp.setUser_contacts(result.getString("user_contacts"));
            temp.setUser_enabled(result.getInt("user_enabled"));
            temp.setUser_role(result.getInt("user_role"));
            temp.setUser_descr(result.getString("user_descr"));
        }
        return temp;
    }
    
    public List<ArchiveUserModel> getAllUsers() throws SQLException {
        ResultSet result = DB.getResultSet("SELECT * FROM archive_users;");
        List<ArchiveUserModel> userList = new LinkedList<>();
        while (result.next()) { 
            ArchiveUserModel temp = new ArchiveUserModel();
            temp.setUser_id(result.getInt("user_id"));
            temp.setUser_name(result.getString("user_name"));
            temp.setUser_password(result.getString("user_password"));
            temp.setUser_firstname(result.getString("user_firstname"));
            temp.setUser_lastname(result.getString("user_lastname"));
            temp.setUser_avatar(result.getString("user_avatar"));
            temp.setUser_contacts(result.getString("user_contacts"));
            temp.setUser_enabled(result.getInt("user_enabled"));
            temp.setUser_role(result.getInt("user_role"));
            temp.setUser_descr(result.getString("user_descr"));
            userList.add(temp);
        }
        return userList;
    }
}
