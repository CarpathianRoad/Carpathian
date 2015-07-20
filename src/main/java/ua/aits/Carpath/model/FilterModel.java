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
import ua.aits.Carpath.functions.Constants;
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
    public Integer sortNumber;
    
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
    
    public Integer getSortNumber() {
        return sortNumber;
    }
    public void setSortNumber(Integer sortNumber) {
        this.sortNumber = sortNumber;
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
            temp.setSortNumber(result.getInt("sortNumber"));
            resultList.add(temp);
        } 
        DB.closeCon();
        return resultList;
    }
    
    public FilterModel getOneFilter(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from filters where id="+id+";");
        result.first();
            FilterModel temp = new FilterModel();
            temp.setId(result.getInt("id"));
            temp.setShortTitle(result.getString("title"));
            temp.setFullTitle(result.getString("descr"));
            temp.setGroupID(result.getInt("groupID"));
            temp.setSortNumber(result.getInt("sortNumber"));
        return temp;
    }
    
    public String FiltersHTML(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{
        String resultHTML = "";
        for(FilterModel temp : getOneRowFilters(id)){
            if(temp.groupID > 0) {
                resultHTML += "<li>\n" +
"                            <div class=\"checkbox\">  \n" +
"                                <label class=\"\" >\n" +
"                                    <img src=\""+Constants.URL+"img/markers/"+temp.shortTitle+".png\"><input type=\"checkbox\" value=\""+temp.shortTitle+"\">"+temp.fullTitle+"\n" +
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
        DB.closeCon();
        return resultHTML;
    }
    
    public List<FilterModel> getOneRowFilters(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from filters where groupID = "+id+" ORDER BY `sortNumber` ASC;");
        List<FilterModel> resultList = new LinkedList<>();
        while (result.next()) {
            FilterModel temp = new FilterModel();
            temp.setId(result.getInt("id"));
            temp.setShortTitle(result.getString("title"));
            temp.setFullTitle(result.getString("descr"));
            temp.setGroupID(result.getInt("groupID"));
            resultList.add(temp);
        } 
        DB.closeCon();
        return resultList;
    }
    
    
    public void addFilter(String title, String descr, String group_id, String sort_number) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DB.runQuery("INSERT INTO `filters`(`title`, `descr`, `groupID`, `sortNumber`) VALUES ('"+title+"','"+descr+"',"+group_id+", "+sort_number+");");
    }
    
    public void updateFilter(String id, String title, String descr, String group_id, String sort_number) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DB.runQuery("UPDATE `filters` SET title='"+title+"', descr='"+descr+"', groupID="+group_id+", sortNumber="+sort_number+" WHERE id="+id+";");
    }
    
    public String deleteFilter(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from filters where groupID = "+id+";");
        result.first();
        String ret = result.getString("title");
        DB.runQuery("DELETE FROM `filters` WHERE id="+id);
        return ret;
    }
    
    public String FiltersOnClick(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{
        ResultSet result = DB.getResultSet("select * from filters where groupID = "+id+";");
        String resultStr = "";
        while (result.next()) {
            resultStr +=",'"+result.getString("title")+"'";
        }
        DB.closeCon();
        return resultStr;
    }
    public String FiltersMain() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{
        ResultSet result = DB.getResultSet("select * from filters where groupID = 0;");
        String resultStr = "";
        while (result.next()) {
            resultStr +=",'"+result.getString("title")+"'";
            resultStr += this.FiltersOnClick(result.getString("id"));
        }
        DB.closeCon();
        return resultStr;
    }
    public String FiltersHTMLMap(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{
        String resultHTML = "";
        
        if("0".equals(id)){
            resultHTML = "<ul class='filtersMainContainer'>";
                Integer count = 1;
                for(FilterModel temp : getOneRowFilters(id)){
                    if(temp.id == 89) {
                        resultHTML += "<div class=\"filtersGreenIntend\"></div>";
                    }
                    resultHTML += "<li class=\"filterMap\"><input type=\"checkbox\" id=\""+temp.shortTitle+"\" class=\"css-checkbox\" checked=\"checked\" />\n" +
"                        <label for=\""+temp.shortTitle+"\" class=\"css-label\"\n" +
"                               onclick=\"Markers(['"+temp.shortTitle+"'"+this.FiltersOnClick(temp.id.toString())+"])\">"+temp.fullTitle+"</label>"
                            + "<a><div class=\"filterClickIntend\" onclick=\"rotateCaret('"+count+"')\"><div id=\"filtersCaret"+count+"\" class=\"bottom-caret\"></div></div></a>\n" +
"                    <ul>";
                    resultHTML += this.FiltersHTMLMap(temp.id.toString());
                    resultHTML += "</ul></li>";
                    count++;
                }
            resultHTML += "</ul>";
        }
        else {
            for(FilterModel temp : getOneRowFilters(id)){
                resultHTML += "<li class=\"subFilterMap\">\n" +
"                            <input type=\"checkbox\" id=\""+temp.shortTitle+"\" onclick=\"Markers(['"+temp.shortTitle+"'])\" class=\"css-checkbox\" checked=\"checked\" />"
                        + "<label for=\""+temp.shortTitle+"\" class=\"css-label\">"+temp.fullTitle+"</label>\n" +
"                        </li>";
            }
        }
        
        DB.closeCon();
        return resultHTML;
    }
    
}