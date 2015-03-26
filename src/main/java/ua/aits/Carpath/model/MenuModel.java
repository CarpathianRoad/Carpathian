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
    public String caret;
    public String url;
    public Integer level;
    
    
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
    
    public String getCaret() {
        return caret;
    }
    public void setCaret(String caret) {
        this.caret = caret;
    }
    
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    
    public Integer getLevel() {
        return level;
    }
    public void setLevel(Integer level) {
        this.level = level;
    }
    
    public List<MenuModel> getMenuRow(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from menu where parentId = "+id+" ;");
        List<MenuModel> menuList = new LinkedList<>();
        while (result.next()) { 
            MenuModel temp = new MenuModel();
            temp.setId(result.getInt("id"));
            temp.setParentID(result.getInt("parentId"));
            temp.setTitleEN(result.getString("titleEN"));
            temp.setCaret(result.getString("caret"));
            temp.setUrl(result.getString("url"));
            temp.setLevel(result.getInt("level"));
            menuList.add(temp);
        } 
        DB.closeCon();
    return menuList;
    }
    
    public List<MenuModel> getAllCat() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from menu;");
        List<MenuModel> menuList = new LinkedList<>();
        while (result.next()) { 
            MenuModel temp = new MenuModel();
            temp.setId(result.getInt("id"));
            temp.setParentID(result.getInt("parentId"));
            temp.setTitleEN(result.getString("titleen"));
            menuList.add(temp);
        } 
        DB.closeCon();
    return menuList;
    }
    public String getCatTitle(String id)  throws SQLException{ 
        ResultSet result = DB.getResultSet("select * from menu where id = '" + id + "';");
        String temp = "";
        while (result.next()) { 
            temp = result.getString("titleEN");
        }
        return temp;
    }
}
