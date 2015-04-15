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
public class FilterModel {
    public Integer id;
    public String shortTitle;
    public String fullTitle;
    
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    
    public String getShortTitle() {
        return shortTitle;
    }
    public void setShortTitle(String shortTitle) {
        this.shortTitle = shortTitle;
    }
    
    public String getFullTitle() {
        return fullTitle;
    }
    public void setFullTitle(String fullTitle) {
        this.fullTitle = fullTitle;
    }
    
    
    
    public List<FilterModel> getAllFilters() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from filters order by id asc;");
        List<FilterModel> resultList = new LinkedList<>();
        while (result.next()) {
            FilterModel temp = new FilterModel();
            temp.setId(result.getInt("id"));
            temp.setShortTitle(result.getString("title"));
            temp.setFullTitle(result.getString("descr"));
            resultList.add(temp);
        } 
        return resultList;
    }
    
    public void addFilter(String title, String descr) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DB.runQuery("INSERT INTO `filters`(`title`, `descr`) VALUES ('"+title+"','"+descr+"');");
    }
    
    public void deleteFilter(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DB.runQuery("DELETE FROM `filters` WHERE id="+id);
    }
}
