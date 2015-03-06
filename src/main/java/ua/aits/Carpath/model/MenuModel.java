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
public class MenuModel {
    public Integer id;
    public Integer parentID;
    public String titleEN;
    public String add;
    
    
    
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    
    public Integer getParentID() {
        return parentID;
    }
    public void setParentID(Integer parentID) {
        this.parentID = parentID;
    }
    
    public String getTitleEN() {
        return titleEN;
    }
    public void setTitleEN(String titleEN) {
        this.titleEN = titleEN;
    }
    
    public String getAdd() {
        return add;
    }
    public void setAdd(String add) {
        this.add = add;
    }
    
    public List<MenuModel> getMenuRow(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from category where parentID = "+id+" ;");
        List<MenuModel> menuList = new LinkedList<>();
        while (result.next()) { 
            MenuModel temp = new MenuModel();
            temp.setId(result.getInt("id"));
            temp.setParentID(result.getInt("parentID"));
            temp.setTitleEN(result.getString("titleen"));
            temp.setAdd(result.getString("add"));
            menuList.add(temp);
        } 
        DB.closeCon();
    return menuList;
    }
    
    public List<MenuModel> getAllCat() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from category;");
        List<MenuModel> menuList = new LinkedList<>();
        while (result.next()) { 
            MenuModel temp = new MenuModel();
            temp.setId(result.getInt("id"));
            temp.setParentID(result.getInt("parentID"));
            temp.setTitleEN(result.getString("titleen"));
            temp.setAdd(result.getString("add"));
            menuList.add(temp);
        } 
        DB.closeCon();
    return menuList;
    }
    public String getCatTitle(String id)  throws SQLException{ 
        ResultSet result = DB.getResultSet("select * from category where id = '" + id + "';");
        String temp = "";
        while (result.next()) { 
            temp = result.getString("titleEN");
        }
        return temp;
    }
}
