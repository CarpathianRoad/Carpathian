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
import java.util.Arrays;
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
    public String getArticleName(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select article_title_EN, article_title_UA from archive_articles where article_dir= '"+id+"';");
        String coun = "";
        if(!result.first()) {
            coun = "Folder";
        }
        else {
            result.first();
            coun = result.getString("article_title_EN");
            if("".equals(coun) || coun == null){
                coun = result.getString("article_title_UA");
            }
        }
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
    public String checkNewArticles(String id, String user_id)throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, ParseException {
        ResultSet result = DB.getResultSet("SELECT users FROM `menu` WHERE id in (SELECT id from menu where parentID = "+id+");");
        while(result.next()) {
            String users = result.getString("users");
            if(users == null) {
            return "NEW";
            }
            List<String> user_list = Arrays.asList(users.split("|"));
            if(!user_list.contains(user_id)) {
                return "NEW";
            }
        }
        return "";
    }
    public String checkNewArticlesForChildren(String id, String user_id)throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, ParseException {
        ResultSet result = DB.getResultSet("SELECT `users` FROM `menu` WHERE `id` = "+id+";");
        result.first();
        String users = result.getString("users");
        DB.closeCon();
        if(users == null) {
        return "NEW";
        }
        List<String> user_list = Arrays.asList(users.split("|"));
        if(!user_list.contains(user_id)) {
            return "NEW";
        }
        return "";
    }
    public void updateCategoryUsers(String id, String user_id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("SELECT `users` FROM `menu` WHERE `id` = "+id+";");
        result.first();
        String users = result.getString("users");
        DB.closeCon();
        if(users != null) {
        List<String> user_list = Arrays.asList(users.split("|"));
        if(!user_list.contains(user_id)) {
            DB.runQuery("UPDATE `menu` SET `users`='"+users+"|"+user_id+"' WHERE id='"+id+"'");
            DB.closeCon();
        }
        }
        else {
            DB.runQuery("UPDATE `menu` SET `users`='|"+user_id+"' WHERE id='"+id+"'");DB.closeCon();
        }
    }
    
    public void cleanCategoryUsers(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DB.runQuery("UPDATE `menu` SET `users`='' WHERE id='"+id+"'");
        DB.closeCon();
    }
}
