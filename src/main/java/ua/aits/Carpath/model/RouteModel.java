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
public class RouteModel {
    public Integer id;
    public String title;
    public String textUA;
    public String file;
    public Integer type;
    public Integer dificult;
    public String images; 
    public Integer publish;
    
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    
    public Integer getType() {
        return type;
    }
    public void setType(Integer type) {
        this.type = type;
    }
    
    public Integer getPublish() {
        return publish;
    }
    public void setPublish(Integer publish) {
        this.publish = publish;
    }
    
    
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getTextUA() {
        return textUA;
    }
    public void setTextUA(String textUA) {
        this.textUA = textUA;
    }
    
    public String getImages() {
        return images;
    }
    public void setImages(String images) {
        this.images = images;
    }
    
    public String getFile() {
        return file;
    }
    public void setFile(String file) {
        this.file = file;
    }
    
     private static List<RouteModel> routeList;
     public List<RouteModel> getAllRoutes() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        ResultSet result = DB.getResultSet("select * from routes where publish = 1 order by id desc;;");
        routeList = new LinkedList<>();
        while (result.next()) { 
            RouteModel temp = new RouteModel();
            temp.setId(result.getInt("id"));
            temp.setTitle(result.getString("title"));
            temp.setTextUA(result.getString("textUA"));
            temp.setFile(result.getString("file"));
            temp.setImages(result.getString("images")); 
            routeList.add(temp);
        } 
    return routeList;
    }
     
     public RouteModel getOneRoute(String id) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException {
        ResultSet result = DB.getResultSet("select * from routes where id = "+ id +";");
        RouteModel temp = new RouteModel();
        while (result.next()) { 
            temp.setId(result.getInt("id"));
            temp.setTitle(result.getString("title"));
            temp.setTextUA(result.getString("textUA"));
            temp.setFile(result.getString("file"));
            temp.setImages(result.getString("images")); 
        }
        return temp;
    }
     public List<RouteImage> getRouteImages(String id)throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException { 
        ResultSet result = DB.getResultSet("select * from routeimages where route = "+id+";");
        LinkedList<RouteImage> imageRoute = new LinkedList<>();
        while (result.next()) { 
            RouteImage temp = new RouteImage();
            temp.setId(result.getInt("id"));
            temp.setRouteID(result.getInt("route"));
            temp.setName(result.getString("name"));
            temp.setX(result.getString("x"));
            temp.setY(result.getString("y"));
            temp.setImg(result.getString("img"));
            imageRoute.add(temp);
        }
        return imageRoute;
     }
    public class RouteImage {
         public Integer id;
         public Integer routeID; 
         public String name;
         public String x;
         public String y;
         public String img;
         
    
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getRouteID() {
        return routeID;
    }
    public void setRouteID(Integer routeID) {
        this.routeID = routeID;
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
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getImg() {
        return img;
    }
    public void setImg(String img) {
        this.img = img;
    }
    }
}
