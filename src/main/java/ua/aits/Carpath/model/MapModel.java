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
import ua.aits.Carpath.functions.Helpers;
import ua.aits.Carpath.functions.PageFiltersTranslate;

/**
 *
 * @author kiwi
 */
public class MapModel {
    public Integer id;
    public String x; 
    public String y;
    public String title;
    public String textEN;
    public String markerIcon;
    public String country;
    public String region;
    public String district;
    public String town;
    public String public_country;
    public String image; 
    public String panorama; 
    public String avatar;
    public String date;
    public Integer publish;
    
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
    
    public String getAvatar() {
        return avatar;
    }
    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    
    
    public String getPanorama() {
        return panorama;
    }
    public void setPanorama(String panorama) {
        this.panorama = panorama;
    }
    
    PageFiltersTranslate translate = new PageFiltersTranslate();
    
    private static List<MapModel> mapList;
    public List<MapModel> getAllPoints(String lan) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from content where type = 2 and publish = 1;");
        mapList = new LinkedList<>();
        while (result.next()) { 
            MapModel temp = new MapModel();
            String text  = result.getString("text"+lan.toUpperCase());
            String f_title = result.getString("title"+lan.toUpperCase());
            if("".equals(f_title) || f_title == null){
                f_title = result.getString("titleEN");
            }
            if("".equals(text) || text == null){
                text = result.getString("textEN");
            }
            text = Helpers.replaceChars(text);
            f_title = Helpers.replaceChars(f_title);
            if(text.length() > 400){
                text = text.substring(0,400);
            }
            
            temp.setId(result.getInt("id"));
            temp.setX(result.getString("x"));
            temp.setY(result.getString("y"));
            temp.setTitle(f_title);
            temp.setTextEN(text);
            temp.setMarkerIcon(result.getString("markerIcon")); 
            temp.setPublic_country(result.getString("public_country"));
            temp.setCountry(translate.translateCountryByLan(lan,result.getString("country"))); 
            temp.setRegion(result.getString("region")); 
            temp.setDistrict(result.getString("district")); 
            temp.setTown(result.getString("town")); 
            temp.setImage(result.getString("image")); 
            temp.setAvatar(result.getString("avatar")); 
            if(temp.getMarkerIcon() == null || "".equals(temp.getMarkerIcon())) {
                temp.setMarkerIcon("gardens");
            }
            if(temp.getTextEN() == null || "".equals(temp.getTextEN())) {
                temp.setTextEN("Lorem ipsum dolor sit amet consectetur adipiscing elit Donec vitae pulvinar massa Cras urna enim, ornare vel mollis id, maximus quis tellus. Aliquam ac ante tristique lectus molestie auctor in id felis. Aliquam tempus nulla at interdum lobortis. Donec et suscipit nibh, vel consequat lectus.");
            }            
            mapList.add(temp);
        } 
        DB.closeCon();
    return mapList;
    }
    public List<MapModel> getPointsByCount(String lan, String id, String count) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from content where type = 2 and id != "+id+" and publish = 1 and isDelete = 0 order by id desc limit "+count+";");
        List<MapModel> newsList = new LinkedList<>();
        while (result.next()) { 
            MapModel temp = new MapModel();
            String f_title = result.getString("title"+lan.toUpperCase());
            if("".equals(f_title) || f_title == null){
                f_title = result.getString("titleEN");
            }
            if(f_title.length() > 55){
                f_title = f_title.substring(0,55);
            }
            String text = Helpers.html2text(result.getString("text"+lan.toUpperCase()));
            if("".equals(text) || text == null){
                text = Helpers.html2text(result.getString("textEN"));
            }
            if(text.length() > 175){
                text = text.substring(0,175);
            }
            temp.setTextEN(text);
            temp.setId(result.getInt("id"));
            temp.setTitle(f_title);
            temp.setCountry(translate.translateCountryByLan(lan,result.getString("country"))); 
            temp.setDate(result.getString("date"));
            temp.setAvatar(result.getString("avatar")); 
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
    public MapModel getMarker(String lan, String id) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException {
        ResultSet result = DB.getResultSet("select * from content where id = "+ id +" and publish = 1;");
        MapModel temp = new MapModel();
        while (result.next()) { 
            temp.setId(result.getInt("id"));
            temp.setX(result.getString("x"));
            temp.setY(result.getString("y"));
            temp.setTitle(result.getString("title"+lan));
            temp.setTextEN(result.getString("text"+lan));
            if("".equals(temp.getTitle()) || temp.getTitle() == null){
                temp.setTitle(result.getString("titleEN"));
            }
            if("".equals(temp.getTextEN()) || temp.getTextEN() == null){
                temp.setTextEN(result.getString("textEN"));
            }
            temp.setDate(result.getString("date"));
            temp.setPublic_country(result.getString("public_country"));
            temp.setMarkerIcon(result.getString("markerIcon")); 
            temp.setCountry(translate.translateCountryByLan(lan,result.getString("country"))); 
            temp.setRegion(result.getString("region")); 
            temp.setAvatar(result.getString("avatar")); 
            temp.setDistrict(result.getString("district")); 
            temp.setTown(result.getString("town"));
            temp.setImage(result.getString("image")); 
            temp.setPanorama(result.getString("panorama")); 
        }
        DB.closeCon();
        return temp;
    }
    public String getPanoramaName(String id) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException {
        ResultSet result = DB.getResultSet("select panorama from content where id = "+ id +" and publish = 1;");
        result.first();
        return result.getString("panorama");
    }
}
