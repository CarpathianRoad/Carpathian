/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import ua.aits.Carpath.functions.DB;
import ua.aits.Carpath.functions.Helpers;

/**
 *
 * @author kiwi
 */
public class MapModel {
    Integer id;
    String x; 
    String y;
    String title;
    String textEN;
    String markerIcon;
    String country;
    String region;
    String district;
    String town;
    public String public_country;
    String image; 
    String date;
    Integer publish;
    
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getX() {
        return x;
    }
    public void setX(String x) {
        this.x = x;
    }
    
    public String getY() {
        return y;
    }
    public void setY(String y) {
        this.y = y;
    }
    
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getTextEN() {
        return textEN;
    }
    public void setTextEN(String textEN) {
        this.textEN = textEN;
    }
    
    public String getMarkerIcon() {
        return markerIcon;
    }
    public void setMarkerIcon(String markerIcon) {
        this.markerIcon = markerIcon;
    }
    
    
    public String getCountry() {
        return country;
    }
    public void setCountry(String country) {
        this.country = country;
    }
    
    
    public String getRegion() {
        return region;
    }
    public void setRegion(String region) {
        this.region = region;
    }
    
    
    public String getDistrict() {
        return district;
    }
    public void setDistrict(String district) {
        this.district = district;
    }
    
    
    public String getTown() {
        return town;
    }
    public void setTown(String town) {
        this.town = town;
    }
    
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    
    public String getPublic_country() {
        return public_country;
    }
    public void setPublic_country(String public_country) {
        this.public_country = public_country;
    }
    
    
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }
    
    private static List<MapModel> mapList;
    public List<MapModel> getAllPoints() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from content where type = 2 and publish = 1;");
        mapList = new LinkedList<>();
        while (result.next()) { 
            MapModel temp = new MapModel();
            String str  = result.getString("textEN").replaceAll("'\\<.*?>","");
            String str2 = str.replaceAll("[\\x00-\\x1F]", "");
            String str3 = str2.replaceAll("'", "\\\\'");
            if(str3.length() > 400){
                str3 = str3.substring(0,400);
            }
            
            temp.setId(result.getInt("id"));
            temp.setX(result.getString("x"));
            temp.setY(result.getString("y"));
            temp.setTitle(result.getString("titleEN"));
            temp.setTextEN(str3);
            temp.setMarkerIcon(result.getString("markerIcon")); 
            temp.setPublic_country(result.getString("public_country"));
            temp.setCountry(result.getString("country")); 
            temp.setRegion(result.getString("region")); 
            temp.setDistrict(result.getString("district")); 
            temp.setTown(result.getString("town")); 
            temp.setImage(result.getString("image")); 
            if(temp.getMarkerIcon() == null || "".equals(temp.getMarkerIcon())) {
                temp.setMarkerIcon("gardens");
            }
            if(temp.getImage() == null || "".equals(temp.getImage())) {
                temp.setImage("img/logo2.png");
            }
            if(temp.getTextEN() == null || "".equals(temp.getTextEN())) {
                temp.setTextEN("Lorem ipsum dolor sit amet consectetur adipiscing elit Donec vitae pulvinar massa Cras urna enim, ornare vel mollis id, maximus quis tellus. Aliquam ac ante tristique lectus molestie auctor in id felis. Aliquam tempus nulla at interdum lobortis. Donec et suscipit nibh, vel consequat lectus.");
            }            
            mapList.add(temp);
        } 
    return mapList;
    }
    public List<MapModel> getPointsByCount(String lan, String count) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from content where type = 2 and publish = 1 order by id desc limit "+count+";");
        List<MapModel> newsList = new LinkedList<>();
        while (result.next()) { 
            MapModel temp = new MapModel();
            String f_title = result.getString("title"+lan.toUpperCase());
            if("".equals(f_title) || f_title == null){
                f_title = result.getString("titleEN");
            }
            if(f_title.length() > 30){
                f_title = f_title.substring(0,30) + "...";
            }
            String text = Helpers.html2text(result.getString("text"+lan.toUpperCase()));
            if("".equals(text) || text == null){
                text = result.getString("textEN");
            }
            if(text.length() > 175){
                text = text.substring(0,175) + "...";
            }
            temp.setTextEN(text);
            temp.setId(result.getInt("id"));
            temp.setTitle(f_title);
            temp.setCountry(result.getString("country")); 
            temp.setDate(result.getString("date"));
            String [] arr = result.getString("image").split(",");
            if("".equals(arr[0])){
                arr[0] = "img/zak.png";
            }
            temp.setImage(arr[0]); 
            newsList.add(temp);
        } 
        DB.closeCon();
    return newsList;
    }
    public MapModel getMarker(String id) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException {
        ResultSet result = DB.getResultSet("select * from content where id = "+ id +";");
        MapModel temp = new MapModel();
        while (result.next()) { 
            temp.setId(result.getInt("id"));
            temp.setX(result.getString("x"));
            temp.setY(result.getString("y"));
            temp.setTitle(result.getString("titleEN"));
            temp.setTextEN(result.getString("textEN"));
            temp.setDate(result.getString("date"));
            temp.setPublic_country(result.getString("public_country"));
            temp.setMarkerIcon(result.getString("markerIcon")); 
            temp.setCountry(result.getString("country")); 
            temp.setRegion(result.getString("region")); 
            temp.setDistrict(result.getString("district")); 
            temp.setTown(result.getString("town"));
            temp.setImage(result.getString("image")); 
        }
        return temp;
    }
    private static List<MapModel> imageList;
    public List<MapModel> getImages() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select id, image from content;");
        imageList = new LinkedList<>();
        while (result.next()) {
            String[] arrayMessage = result.getString("image").split(",");
            for(String s: arrayMessage){
            MapModel temp = new MapModel();
                temp.setId(result.getInt("id"));
                temp.setImage(s);
                imageList.add(temp);
            }
        }
        Collections.shuffle(imageList);
        Set setItems = new LinkedHashSet(imageList);
        imageList.clear();
        imageList.addAll(setItems);
        List<MapModel> tempList = imageList.subList(0,8);
        return tempList;
    }
    public List<MapModel> getLastTenPoints() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from content where type = 2 and publish = 1 ORDER BY id DESC LIMIT 9;");
        mapList = new LinkedList<>();
        while (result.next()) { 
            MapModel temp = new MapModel();
            String f_title = result.getString("titleEN");
            if(f_title.length() > 30){
                f_title = f_title.substring(0,30) + "...";
            }
            String text = Helpers.html2text(result.getString("textEN"));
            if(text.length() > 175){
                text = text.substring(0,175) + "...";
            }
            temp.setTextEN(text);
            temp.setId(result.getInt("id"));
            temp.setX(result.getString("x"));
            temp.setY(result.getString("y"));
            temp.setPublic_country(result.getString("public_country"));
            temp.setDate(result.getString("date"));
            temp.setCountry(result.getString("country")); 
            temp.setTitle(f_title);
            String [] arr = result.getString("image").split(",");
            if("".equals(arr[0])){
                arr[0] = "img/zak.png";
            }
            temp.setImage(arr[0]); 
            mapList.add(temp);
        } 
    return mapList;
    }
}
