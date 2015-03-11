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
public class MarkerModel {
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
    
    public List<MarkerModel> getAllMarkers() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from markers;");
        List<MarkerModel> resultList = new LinkedList<>();
        while (result.next()) {
            MarkerModel temp = new MarkerModel();
            temp.setId(result.getInt("id"));
            temp.setShortTitle(result.getString("title"));
            temp.setFullTitle(result.getString("descr"));
            resultList.add(temp);
        } 
        return resultList;
    }
    public MarkerModel getOneMarker(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from markers where id="+id+";");
        MarkerModel temp = new MarkerModel();
        while (result.next()) {
            temp.setId(result.getInt("id"));
            temp.setShortTitle(result.getString("title"));
            temp.setFullTitle(result.getString("descr"));
        } 
        return temp;
    }
    public void addMarker(String title, String descr) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DB.runQuery("INSERT INTO `markers`(`title`, `descr`) VALUES ('"+title+"','"+descr+"');");
    }
    public void updateMarker(String id, String title, String descr) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DB.runQuery("UPDATE `markers` SET title='"+title+"', descr='"+descr+"' WHERE id="+id+";");
    }
    
    public void deleteMarker(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DB.runQuery("DELETE FROM `markers` WHERE id="+id);
    }
}
