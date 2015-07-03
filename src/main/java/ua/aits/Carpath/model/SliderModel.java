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
public class SliderModel {
    public Integer id;
    public String image;
    public String url;
    public String text;
    
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }
    
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    
    public String getText() {
        return text;
    }
    public void setText(String text) {
        this.text = text;
    }
    
    public List<SliderModel> getAllSlides() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from slider order by id asc;");
        List<SliderModel> resultList = new LinkedList<>();
        while (result.next()) {
            SliderModel temp = new SliderModel();
            temp.setId(result.getInt("id"));
            temp.setImage(result.getString("image"));
            temp.setUrl(result.getString("url"));
            temp.setText(result.getString("text"));
            resultList.add(temp);
        } 
        return resultList;
    }
    
    public void insertSlide(String image, String url, String text)throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DB.runQuery("INSERT INTO `slider`(`image`, `url`, `text`) VALUES ('"+image+"','"+url+"','"+text+"');");
    }
    
    public void clearTable()throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DB.runQuery("DELETE FROM `slider` WHERE id > 0;");
    }
}
