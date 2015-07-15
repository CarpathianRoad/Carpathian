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
    public String urlEN;
    public String urlUA;
    public String urlHU;
    public String urlSK;
    public String urlRO;
    public String textEN;
    public String textUA;
    public String textHU;
    public String textSK;
    public String textRO;
    
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
    
    public String getUrlEN() {
        return urlEN;
    }
    public void setUrlEN(String urlEN) {
        this.urlEN = urlEN;
    }
    
    public String getUrlUA() {
        return urlUA;
    }
    public void setUrlUA(String urlUA) {
        this.urlUA = urlUA;
    }
    
    public String getUrlHU() {
        return urlHU;
    }
    public void setUrlHU(String urlHU) {
        this.urlHU = urlHU;
    }
    
    public String getUrlSK() {
        return urlSK;
    }
    public void setUrlSK(String urlSK) {
        this.urlSK = urlSK;
    }
    
    public String getUrlRO() {
        return urlRO;
    }
    public void setUrlRO(String urlRO) {
        this.urlRO = urlRO;
    }
    
    public String getTextEN() {
        return textEN;
    }
    public void setTextEN(String textEN) {
        this.textEN = textEN;
    }
    
    public String getTextUA() {
        return textUA;
    }
    public void setTextUA(String textUA) {
        this.textUA = textUA;
    }
    
    public String getTextHU() {
        return textHU;
    }
    public void setTextHU(String textHU) {
        this.textHU = textHU;
    }
    
    public String getTextSK() {
        return textSK;
    }
    public void setTextSK(String textSK) {
        this.textSK = textSK;
    }
    
    public String getTextRO() {
        return textRO;
    }
    public void setTextRO(String textRO) {
        this.textRO = textRO;
    }
    
    public List<SliderModel> getAllSlides(String lan) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from slider order by id asc;");
        List<SliderModel> resultList = new LinkedList<>();
        while (result.next()) {
            SliderModel temp = new SliderModel();
            temp.setId(result.getInt("id"));
            temp.setImage(result.getString("image"));
            temp.setUrlEN(result.getString("url"+lan.toUpperCase()));
            temp.setTextEN(result.getString("text"+lan.toUpperCase()));
            if("".equals(temp.getTextEN()) || temp.getTextEN() == null ){
               temp.setTextEN(result.getString("textEN")); 
            }
            if("".equals(temp.getUrlEN()) || temp.getUrlEN() == null ){
               temp.setUrlEN(result.getString("urlEN")); 
            }
            resultList.add(temp);
        } 
        return resultList;
    }
    
    public List<SliderModel> getAllSlidesForEdit() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from slider order by id asc;");
        List<SliderModel> resultList = new LinkedList<>();
        while (result.next()) {
            SliderModel temp = new SliderModel();
            temp.setId(result.getInt("id"));
            temp.setImage(result.getString("image"));
            temp.setUrlEN(result.getString("urlEN"));
            temp.setUrlUA(result.getString("urlUA"));
            temp.setUrlHU(result.getString("urlHU"));
            temp.setUrlSK(result.getString("urlSK"));
            temp.setUrlRO(result.getString("urlRO"));
            temp.setTextEN(result.getString("textEN"));
            temp.setTextUA(result.getString("textUA"));
            temp.setTextHU(result.getString("textHU"));
            temp.setTextSK(result.getString("textSK"));
            temp.setTextRO(result.getString("textRO"));
            resultList.add(temp);
        } 
        return resultList;
    }
    
    public void insertSlide(String image, 
            String urlEN, String urlUA, String urlHU, String urlSK, String urlRO, 
            String textEN, String textUA, String textHU, String textSK, String textRO)throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DB.runQuery("INSERT INTO `slider`(`image`, `urlEN`, `urlUA`, `urlHU`, `urlSK`, `urlRO`,"
                + " `textEN`, `textUA`, `textHU`, `textSK`, `textRO`) VALUES ("
                + "'"+image+"','"+urlEN+"','"+urlUA+"','"+urlHU+"','"+urlSK+"','"+urlRO+"',"
                + "'"+textEN+"','"+textUA+"','"+textHU+"','"+textSK+"','"+textRO+"');");
    }
    
    public void clearTable()throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DB.runQuery("DELETE FROM `slider` WHERE id > 0;");
    }
}
