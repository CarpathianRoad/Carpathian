/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import ua.aits.Carpath.functions.DB;

/**
 *
 * @author kiwi
 */
public class PanoramaModel {
    public Integer id; 
    public String url;
    
    
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    
    
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    
    public String getUrlByID(String id) throws SQLException { 
        ResultSet result = DB.getResultSet("SELECT * FROM panoramas where id = "+id+";");
        result.first();
        return result.getString("url");
    }
    
    public PanoramaModel getRandomPanorama() throws SQLException {
        ResultSet result = DB.getResultSet("SELECT * FROM panoramas ORDER BY RAND() LIMIT 1");
        result.first();
        PanoramaModel panorama = new PanoramaModel();
        panorama.setId(result.getInt("id"));
        panorama.setUrl(result.getString("url"));
        return panorama; 
    }
}
