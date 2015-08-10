/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import ua.aits.Carpath.functions.Constants;
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
    public String htmlID;
    public String img;
    
    
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
    
    public String getHtmlID() {
        return htmlID;
    }
    public void setHtmlID(String htmlID) {
        this.htmlID = htmlID;
    }
    
    public String getImg() {
        return img;
    }
    public void setImg(String img) {
        this.img = img;
    }
   
    
    public List<MenuModel> getMenuRow(String lan, String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from menu where parentId = "+id+" ORDER BY `menu`.`sort` ASC;");
        List<MenuModel> menuList = new LinkedList<>();
        while (result.next()) { 
            MenuModel temp = new MenuModel();
            temp.setId(result.getInt("id"));
            temp.setParentID(result.getInt("parentID"));
            temp.setTitleEN(result.getString("title"+lan.toUpperCase()));
            if("".equals(temp.getTitleEN()) || temp.getTitleEN() == null ){
               temp.setTitleEN(result.getString("titleEN")); 
            }
            temp.setCaret(result.getString("caret"));
            temp.setUrl(result.getString("url"));
            temp.setLevel(result.getInt("level"));
            temp.setHtmlID(result.getString("htmlId"));
            menuList.add(temp);
        } 
        DB.closeCon();
    return menuList;
    }
    public List<MenuModel> getMenuRowSelect(String lan, String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from menu where parentId = "+id+" ORDER BY `menu`.`sort` ASC;");
        List<MenuModel> menuList = new LinkedList<>();
        while (result.next()) { 
            if(result.getInt("id") != 1 && result.getInt("id") != 4 && result.getInt("id") != 5 && result.getInt("id") != 6 ) {
            
            MenuModel temp = new MenuModel();
            temp.setId(result.getInt("id"));
            temp.setParentID(result.getInt("parentID"));
            temp.setTitleEN(result.getString("title"+lan.toUpperCase()));
            if("".equals(temp.getTitleEN()) || temp.getTitleEN() == null ){
               temp.setTitleEN(result.getString("titleEN")); 
            }
            temp.setCaret(result.getString("caret"));
            temp.setUrl(result.getString("url"));
            temp.setLevel(result.getInt("level"));
            temp.setHtmlID(result.getString("htmlId"));
            menuList.add(temp);
            }
        } 
        DB.closeCon();
    return menuList;
    }
    
    public List<MenuModel> getAllCat() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from menu ORDER BY `menu`.`sort` ASC;");
        List<MenuModel> menuList = new LinkedList<>();
        while (result.next()) { 
            MenuModel temp = new MenuModel();
            temp.setId(result.getInt("id"));
            temp.setParentID(result.getInt("parentId"));
            temp.setTitleEN(result.getString("titleEN"));
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
        
        DB.closeCon();
        return temp;
    } 
    public List<MenuModel> getSubCategories(String lan, String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from menu where parentId="+id+" ORDER BY `menu`.`sort` ASC;");
        List<MenuModel> contentList = new LinkedList<>();
        while (result.next()) { 
            MenuModel temp = new MenuModel();
            temp.setId(result.getInt("id"));
            temp.setTitleEN(result.getString("title"+lan.toUpperCase()));
            temp.setImg(result.getString("img"));
            if(temp.img == null || "".equals(temp.img)) {
                temp.img = "img/dog.png";
            }
            if("".equals(temp.getTitleEN()) || temp.getTitleEN() == null ){
               temp.setTitleEN(result.getString("titleEN")); 
            }
            contentList.add(temp);
        } 
        DB.closeCon();
        return contentList;
    }
    public Boolean isHaveSubs(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from menu where parentId="+id+" ORDER BY `menu`.`sort` ASC;");
        Boolean ret = result.isBeforeFirst();
        DB.closeCon();
        return ret;
    }
    public Integer countSubs(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select count(*) as cnt from menu where menu.parentID = "+id+";");
        result.first();
        Integer coun = result.getInt("cnt");
        DB.closeCon();
        return coun;
    }
    
    public Integer countArticles(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select count(*) as cnt from archive_articles where article_category = "+id+" and article_is_delete = 0;");
        result.first();
        Integer coun = result.getInt("cnt");
        DB.closeCon();
        return coun;
    }
    
    public Integer countArticlesInSubs(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select count(*) as cnt from archive_articles where article_category IN (SELECT id FROM menu WHERE parentID = "+id+") AND article_is_delete = 0;");
        result.first();
        Integer coun = result.getInt("cnt");
        DB.closeCon();
        return coun;
    }
    
    public Integer countPublish(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select count(*) as cnt from archive_articles where article_category = "+id+" and article_is_publish = 1 AND article_is_delete = 0;");
        result.first();
        Integer coun = result.getInt("cnt");
        DB.closeCon();
        return coun;
    }
    
    public Integer countPublishInSubs(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select count(*) as cnt from archive_articles where article_category IN (SELECT id FROM menu WHERE parentID = "+id+") and article_is_publish = 1 AND article_is_delete = 0;");
        result.first();
        Integer coun = result.getInt("cnt");
        DB.closeCon();
        return coun;
    }
    public String getCategoryName(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        if("666".equals(id)) {
            return "NEWS";
        }
        ResultSet result = DB.getResultSet("select titleEN from menu where id = "+id+";");
        result.first();
        String coun = result.getString("titleEN");
        DB.closeCon();
        return coun;
    }
    
    public String getSubsId(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select id from menu where menu.parentID = "+id+";");
        String result_str = "";
        while (result.next()) { 
            if("".equals(result_str)) {
                result_str = result.getString("id");
            }
            else {
                result_str += ","+result.getString("id");
            }
        }
        DB.closeCon();
        return result_str;
    }
    public String checkNewArticles(String id, String time)throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, ParseException {
        ResultSet result = DB.getResultSet("SELECT `article_add_date` FROM archive_articles WHERE archive_articles.article_category IN (" + this.getSubsId(id) + ") ORDER BY archive_articles.article_id desc");
        if(time == null || "".equals(time)){
            
        DB.closeCon();
        return "";
        }
        while (result.next()) { 
            SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy HH:mm");
            Date date1 = sdf.parse(result.getString("article_add_date"));
            Date date2 = sdf.parse(time);
            if(date1.after(date2)){
                
        DB.closeCon();
                return "NEW";
            }
        }
        
        DB.closeCon();
        return "";
    }
    public String checkNewArticlesForChildren(String id, String time)throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, ParseException {
        ResultSet result = DB.getResultSet("SELECT `article_add_date` FROM archive_articles WHERE archive_articles.article_category = " + id + " ORDER BY archive_articles.article_id desc");
        if(time == null || "".equals(time)){
        DB.closeCon();
        return "";
        }
        while (result.next()) { 
            SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy HH:mm");
            Date date1 = sdf.parse(result.getString("article_add_date"));
            Date date2 = sdf.parse(time);
            if(date1.after(date2)){
        DB.closeCon();
                return "NEW";
            }
        }
        DB.closeCon();
        return "";
    }
}
