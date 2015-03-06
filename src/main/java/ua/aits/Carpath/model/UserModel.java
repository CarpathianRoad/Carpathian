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
public class UserModel {
    public String username;
    public String password; 
    public Integer enabled;
    public Integer role;
    public String enabledText;
    public String roleText;
    public String descr;
    
    
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    
    public Integer getEnabled() {
        return enabled;
    }
    public void setEnabled(Integer enabled) {
        this.enabled = enabled;
    }
    
    public Integer getRole() {
        return role;
    }
    public void setRole(Integer role) {
        this.role = role;
    }
    
    public String getEnabledText() {
        return enabledText;
    }
    public void setEnabledText(String enabledText) {
        this.enabledText = enabledText;
    }
    
    public String getRoleText() {
        return roleText;
    }
    public void setRoleText(String roleText) {
        this.roleText = roleText;
    }
    
    public String getDescr() {
        return descr;
    }
    public void setDescr(String descr) {
        this.descr = descr;
    }
    
    public Boolean isExitsUser(String login, String password) throws SQLException{
        ResultSet result = DB.getResultSet("select * from users where username = '" + login +"' and password = '" + password + "';");
        return result.isBeforeFirst();
    }
    public UserModel getUser(String login, String password)  throws SQLException{ 
        ResultSet result = DB.getResultSet("select * from users where username = '" + login +"' and password = '" + password + "';");
        UserModel temp = new UserModel();
        while (result.next()) { 
            temp.setUsername(result.getString("username"));
            temp.setPassword(result.getString("password"));
            temp.setEnabled(result.getInt("enabled"));
            temp.setRole(result.getInt("role"));
            temp.setDescr(result.getString("descr"));
        }
        return temp;
    }
    public List<UserModel> getAllUsers() throws SQLException {
        ResultSet result = DB.getResultSet("select * from users;");
        List<UserModel> userList = new LinkedList<>();
        while (result.next()) { 
            UserModel temp = new UserModel();
            temp.setUsername(result.getString("username"));
            temp.setPassword(result.getString("password"));
            temp.setEnabled(result.getInt("enabled"));
            temp.setRole(result.getInt("role"));
            temp.setRole(result.getInt("role"));
            temp.setDescr(result.getString("descr"));
            temp.setRoleText("Admin");
            temp.setEnabledText("Active");
            if(result.getInt("role") == 0) { temp.setRoleText("Editor"); }
            if(result.getInt("enabled") == 0) { temp.setEnabledText("Not active"); }
            userList.add(temp);
        }
        return userList;
    }
    public String addUser(String username, String password, String role, String enabled, String descr) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
         DB.runQuery("INSERT INTO users (username, password, enabled, role, descr) values ('"+username+"', '"+password+"', "+enabled+", "+role+", '"+descr+"');");
         return "done";
    }
    public void deleteUser(String username) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DB.runQuery("DELETE FROM `users` WHERE username='"+username+"'");
    }
}
