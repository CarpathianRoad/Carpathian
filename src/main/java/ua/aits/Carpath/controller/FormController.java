/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import ua.aits.Carpath.functions.Constants;
import ua.aits.Carpath.model.ArticleModel;
import ua.aits.Carpath.model.FilterModel;
import ua.aits.Carpath.model.MarkerModel;
import ua.aits.Carpath.model.RouteModel;
import ua.aits.Carpath.model.SliderModel;
import ua.aits.Carpath.model.UserModel;

/**
 *
 * @author kiwi
 */
@Controller
public class FormController {
    ArticleModel article = new ArticleModel();
    UserModel users = new UserModel();
    MarkerModel markers = new MarkerModel();
    FilterModel filters = new FilterModel();
    RouteModel route = new RouteModel();
    SliderModel slider = new SliderModel();
    
     @RequestMapping(value = "/system/insertdata.do", method = RequestMethod.POST)
    public ModelAndView doInsertData(HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String titleEN = request.getParameter("titleEN");
        String titleUA = request.getParameter("titleUA");
        String titleHU = request.getParameter("titleHU");
        String titleSK = request.getParameter("titleSK");
        String titlePL = request.getParameter("titlePL");
        String titleRO = request.getParameter("titleRO");
        String titleGE = request.getParameter("titleGE");
        String titleCZ = request.getParameter("titleCZ");
        String titleSRB = request.getParameter("titleSRB");
        String type = request.getParameter("type");
        String public_country = request.getParameter("public_country");
        String menuCat = request.getParameter("menuCat");
        String date = request.getParameter("date");
        String actDate = request.getParameter("act-date");
        String author = request.getParameter("author");
        String avatar = request.getParameter("avatar-path");
        String img = request.getParameter("real-img-path");
        String panorama = request.getParameter("filename-panorama");
        String x = request.getParameter("x");
        String y = request.getParameter("y");
        String country = request.getParameter("country");
        String region = request.getParameter("region");
        String district = request.getParameter("district");
        String town = request.getParameter("town");
        String markerType = "";
        String filter = request.getParameter("filter-type-all");
        String textEN = request.getParameter("textEN");
        String textUA = request.getParameter("textUA");
        String textHU = request.getParameter("textHU");
        String textSK = request.getParameter("textSK");
        String textPL = request.getParameter("textPL");
        String textRO = request.getParameter("textRO");
        String textGE = request.getParameter("textGE");
        String textCZ = request.getParameter("textCZ");
        String textSRB = request.getParameter("textSRB");
        if( "0".equals(type) || "1".equals(type)){
            menuCat = "0";
        }
        String result = article.insertArticle(titleEN, titleUA, titleHU, titleSK, titlePL, titleRO, titleGE, titleCZ, titleSRB, date, actDate, type, author,
                avatar, img, panorama, x, y, public_country, country, region, district, town, markerType, filter, menuCat,
                textEN, textUA, textHU, textSK, textRO, textPL, textGE, textCZ, textSRB);
        return new ModelAndView("redirect:" + "/system/panel");
       
    }
      @RequestMapping(value = "/system/updatedata.do", method = RequestMethod.POST)
    public ModelAndView doUpdateData(HttpServletRequest request,HttpServletResponse response) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String titleEN = request.getParameter("titleEN");
        String titleUA = request.getParameter("titleUA");
        String titleHU = request.getParameter("titleHU");
        String titleSK = request.getParameter("titleSK");
        String titlePL = request.getParameter("titlePL");
        String titleRO = request.getParameter("titleRO");
        String titleGE = request.getParameter("titleGE");
        String titleCZ = request.getParameter("titleCZ");
        String titleSRB = request.getParameter("titleSRB");
        String type = request.getParameter("type");
        String menuCat = request.getParameter("menuCat");
        String date = request.getParameter("date");
        String public_country = request.getParameter("public_country");
        String actDate = request.getParameter("act-date");
        String author = request.getParameter("author");
        String avatar = request.getParameter("avatar-path");
        String img = request.getParameter("real-img-path");
        String panorama = request.getParameter("filename-panorama");
        String x = request.getParameter("x");
        String y = request.getParameter("y");
        String country = request.getParameter("country");
        String region = request.getParameter("region");
        String district = request.getParameter("district");
        String town = request.getParameter("town");
        String markerType = "";
        String filter = request.getParameter("filter-type-all");
        String textEN = request.getParameter("textEN");
        String textUA = request.getParameter("textUA");
        String textHU = request.getParameter("textHU");
        String textSK = request.getParameter("textSK");
        String textPL = request.getParameter("textPL");
        String textRO = request.getParameter("textRO");
        String textGE = request.getParameter("textGE");
        String textCZ = request.getParameter("textCZ");
        String textSRB = request.getParameter("textSRB");
        if( "0".equals(type) || "1".equals(type)){
            menuCat = "0";
        }
        String result = article.updateArticle(id,titleEN, titleUA, titleHU, titleSK, titlePL, titleRO, titleGE, titleCZ, titleSRB, date, actDate, type, author,
                avatar, img, panorama, x, y, public_country, country, region, district, town, markerType, filter, menuCat,
                textEN, textUA, textHU, textSK, textRO, textPL, textGE, textCZ, textSRB);
        return new ModelAndView("redirect:" + "/system/panel");
       
    }
     @RequestMapping(value = "/system/routes/insertdata.do", method = RequestMethod.POST)
    public ModelAndView doInsertRoute(HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String titleEN = request.getParameter("titleEN");
        String titleUA = request.getParameter("titleUA");
        String titleHU = request.getParameter("titleHU");
        String titleSK = request.getParameter("titleSK");
        String titlePL = request.getParameter("titlePL");
        String titleRO = request.getParameter("titleRO");
        String titleGE = request.getParameter("titleGE");
        String titleCZ = request.getParameter("titleCZ");
        String titleSRB = request.getParameter("titleSRB");
        String type = request.getParameter("type");
        String public_country = request.getParameter("public_country");
        String filename = request.getParameter("filename-route");
        String filter = request.getParameter("filter-type-all");
        String date = request.getParameter("date");
        String img = request.getParameter("real-img-path");
        String textEN = request.getParameter("textEN");
        String textUA = request.getParameter("textUA");
        String textHU = request.getParameter("textHU");
        String textSK = request.getParameter("textSK");
        String textPL = request.getParameter("textPL");
        String textRO = request.getParameter("textRO");
        String textGE = request.getParameter("textGE");
        String textCZ = request.getParameter("textCZ");
        String textSRB = request.getParameter("textSRB");
        String difficulty = request.getParameter("difficulty");
        String result = route.insertRoute(
                titleEN, titleUA, titleHU, titleSK, titlePL, titleRO, titleGE, titleCZ, titleSRB, 
                filename, img, date, type, public_country, filter, difficulty,
                textEN, textUA, textHU, textSK, textRO, textPL, textGE, textCZ, textSRB);
        return new ModelAndView("redirect:" + "/system/routes");
    }
     @RequestMapping(value = "/system/routes/updatedata.do", method = RequestMethod.POST)
    public ModelAndView doUpdateRoute(HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String titleEN = request.getParameter("titleEN");
        String titleUA = request.getParameter("titleUA");
        String titleHU = request.getParameter("titleHU");
        String titleSK = request.getParameter("titleSK");
        String titlePL = request.getParameter("titlePL");
        String titleRO = request.getParameter("titleRO");
        String titleGE = request.getParameter("titleGE");
        String titleCZ = request.getParameter("titleCZ");
        String titleSRB = request.getParameter("titleSRB");
        String img = request.getParameter("real-img-path");
        String type = request.getParameter("type");
        String public_country = request.getParameter("public_country");
        String filename = request.getParameter("filename-route");
        String filter = request.getParameter("filter-type-all");
        String date = request.getParameter("date");
        String textEN = request.getParameter("textEN");
        String textUA = request.getParameter("textUA");
        String textHU = request.getParameter("textHU");
        String textSK = request.getParameter("textSK");
        String textPL = request.getParameter("textPL");
        String textRO = request.getParameter("textRO");
        String textGE = request.getParameter("textGE");
        String textCZ = request.getParameter("textCZ");
        String textSRB = request.getParameter("textSRB");
        String difficulty = request.getParameter("difficulty");
        String result = route.updateRoute(id, 
                titleEN, titleUA, titleHU, titleSK, titlePL, titleRO, titleGE, titleCZ, titleSRB, 
                filename, img, date, type, public_country, filter, difficulty,
                textEN, textUA, textHU, textSK, textRO, textPL, textGE, textCZ, textSRB);
        return new ModelAndView("redirect:" + "/system/routes");
    }
    @RequestMapping(value = "/system/adduser.do", method = RequestMethod.POST)
    public ModelAndView doAddUser(HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String descr = request.getParameter("descr");
        String enabled = "1";
        String role = "0";
        String result = users.addUser(username, password, role, enabled, descr);
         return new ModelAndView("redirect:" + "/system/users");
    }
    @RequestMapping(value = "/system/addfilter.do", method = RequestMethod.POST)
    public ModelAndView doAddFilter(
            @RequestParam("filter_icon") MultipartFile file, @RequestParam("short_title") String short_title, 
            @RequestParam("full_title") String full_title, @RequestParam("group_id") String group_id, @RequestParam("sort_number") String sort_number, 
            HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        
        String name = file.getOriginalFilename();
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                File dir = new File(Constants.FILE_URL_ICON);
                
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + short_title+".png");
                try (BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile))) {
                    stream.write(bytes);
                }
                
            } catch (Exception e) {
                System.out.println("You failed to upload " + name + " => " + e.getMessage());
            }
        } else {
            System.out.println("You failed to upload " + name + " because the file was empty.");
        }
        
        if(group_id == null || "".equals(group_id)) {
            group_id = "0";
        }
        filters.addFilter(short_title, full_title, group_id, sort_number);
        return new ModelAndView("redirect:" + "/system/filters");
    }
    @RequestMapping(value = "/system/editfilter.do", method = RequestMethod.POST)
    public ModelAndView doUpdateFilter(
            @RequestParam("filter_icon") MultipartFile file, @RequestParam("id") String id,  
            @RequestParam("short_title") String short_title, @RequestParam("full_title") String full_title, 
            @RequestParam("group_id") String group_id, @RequestParam("sort_number") String sort_number, 
            HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        
        String name = file.getOriginalFilename();
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                File dir = new File(Constants.FILE_URL_ICON);
                
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + short_title+".png");
                try (BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile))) {
                    stream.write(bytes);
                }
                
            } catch (Exception e) {
                System.out.println("You failed to upload " + name + " => " + e.getMessage());
            }
        }
        if(group_id == null || "".equals(group_id)) {
            group_id = "0";
        }
        filters.updateFilter(id, short_title, full_title, group_id, sort_number);
        return new ModelAndView("redirect:" + "/system/filters");
    }
    @RequestMapping(value = "/system/addmarker.do", method = RequestMethod.POST)
    public ModelAndView doAddMarker(@RequestParam("marker_icon") MultipartFile file, @RequestParam("short_title") String short_title, HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
       
        String name = file.getOriginalFilename();
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                File dir = new File(Constants.FILE_URL_ICON);
                
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + short_title+".png");
                try (BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile))) {
                    stream.write(bytes);
                }
                
            } catch (Exception e) {
                System.out.println("You failed to upload " + name + " => " + e.getMessage());
            }
        } else {
            System.out.println("You failed to upload " + name + " because the file was empty.");
        }
        markers.addMarker(short_title);
        return new ModelAndView("redirect:" + "/system/markers");
    }
    @RequestMapping(value = "/system/editmarker.do", method = RequestMethod.POST)
    public ModelAndView doEditMarker(@RequestParam("marker_icon") MultipartFile file, @RequestParam("short_title") String short_title, @RequestParam("id") String id, HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        String name = "";
        if (!file.isEmpty()) {
            File temp = new File(Constants.FILE_URL_ROUTES+short_title+".png");
            Boolean result = temp.delete();
        name = file.getOriginalFilename();
            try {
                File files = new File(Constants.FILE_URL_ICON+short_title+".png");
                if(files.delete()){
    			System.out.println(files.getName() + " is deleted!");
    		}else{
    			System.out.println("Delete operation is failed.");
    		}
                byte[] bytes = file.getBytes();
                File dir = new File(Constants.FILE_URL_ICON);
                
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + short_title+".png");
                try (BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile))) {
                    stream.write(bytes);
                }
                
            } catch (Exception e) {
                System.out.println( "You failed to upload " + name + " => " + e.getMessage());
            }
        } else {
            System.out.println("You failed to upload " + name + " because the file was empty.");
        }
        markers.updateMarker(id, short_title);
        return new ModelAndView("redirect:" + "/system/markers");
    }
    @RequestMapping(value = "/system/slideredit.do", method = RequestMethod.POST)
    public ModelAndView doUpdateSlider(HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        
        String[] imgs = request.getParameter("real-img-path").split(",");
        slider.clearTable();
        for(String img: imgs) {
            slider.insertSlide(img, 
                    request.getParameter(img+"-urlEN"), 
                    request.getParameter(img+"-urlUA"), 
                    request.getParameter(img+"-urlHU"), 
                    request.getParameter(img+"-urlSK"), 
                    request.getParameter(img+"-urlRO"), 
                    request.getParameter(img+"-textEN"), 
                    request.getParameter(img+"-textUA"), 
                    request.getParameter(img+"-textHU"), 
                    request.getParameter(img+"-textSK"), 
                    request.getParameter(img+"-textRO")
            );
        }
        return new ModelAndView("redirect:" + "/system/slider");
    }
}