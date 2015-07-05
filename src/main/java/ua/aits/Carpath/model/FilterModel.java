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
    public Integer groupID;
    
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
    
    public Integer getGroupID() {
        return groupID;
    }
    public void setGroupID(Integer groupID) {
        this.groupID = groupID;
    }
    
    
    
    public List<FilterModel> getAllFilters() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from filters order by groupID;");
        List<FilterModel> resultList = new LinkedList<>();
        while (result.next()) {
            FilterModel temp = new FilterModel();
            temp.setId(result.getInt("id"));
            temp.setShortTitle(result.getString("title"));
            temp.setFullTitle(result.getString("descr"));
            temp.setGroupID(result.getInt("groupID"));
            resultList.add(temp);
        } 
        return resultList;
    }
    
    public String FiltersHTML(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{
        String resultHTML = "";
        for(FilterModel temp : getOneRowFilters(id)){
            if(temp.groupID > 0) {
                resultHTML += "<li>\n" +
"                            <div class=\"checkbox\">  \n" +
"                                <label class=\"\" >\n" +
"                                    <input type=\"checkbox\" value=\""+temp.shortTitle+"\">"+temp.fullTitle+"\n" +
"                                </label>\n" +
"                            </div>\n" +
"                        </li> ";
            }
            else if(temp.groupID == -1) {
                
            }
            else if(temp.groupID == 0) {
                resultHTML += "<li>\n" +
"                            <div class=\"checkbox\">  \n" +
"                                <label class=\"double-point-filter\" >\n" +
"                                    <input type=\"checkbox\" value=\""+temp.shortTitle+"\">"+temp.fullTitle+"\n" +
"                                </label>\n" +
"                            </div>\n" +
"                        </li> ";
                    resultHTML += FiltersHTML(temp.id.toString());
            }
        }
        return resultHTML;
    }
    
    public List<FilterModel> getOneRowFilters(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from filters where groupID = "+id+" order by id asc;");
        List<FilterModel> resultList = new LinkedList<>();
        while (result.next()) {
            FilterModel temp = new FilterModel();
            temp.setId(result.getInt("id"));
            temp.setShortTitle(result.getString("title"));
            temp.setFullTitle(result.getString("descr"));
            temp.setGroupID(result.getInt("groupID"));
            resultList.add(temp);
        } 
        return resultList;
    }
    
    
    public void addFilter(String title, String descr, String group_id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DB.runQuery("INSERT INTO `filters`(`title`, `descr`, `groupID`) VALUES ('"+title+"','"+descr+"',"+group_id+");");
    }
    
    public void deleteFilter(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DB.runQuery("DELETE FROM `filters` WHERE id="+id);
    }
}
