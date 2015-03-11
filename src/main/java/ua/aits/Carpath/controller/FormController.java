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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.apache.commons.lang.StringEscapeUtils;
import ua.aits.Carpath.functions.Constants;
import ua.aits.Carpath.model.ArticleModel;
import ua.aits.Carpath.model.FilterModel;
import ua.aits.Carpath.model.MarkerModel;
import ua.aits.Carpath.model.UserModel;

/**
 *
 * @author kiwi
 */
@Controller
public class FormController {
    @Autowired
    private JavaMailSender mailSender;
    ArticleModel article = new ArticleModel();
    UserModel users = new UserModel();
    MarkerModel markers = new MarkerModel();
    FilterModel filters = new FilterModel();
    
    private static final Logger logger = LoggerFactory.getLogger(FileUploadController.class);
    
    @RequestMapping(value = "/sendEmail.do", method = RequestMethod.POST)
    public String doSendEmail(HttpServletRequest request) {
        // takes input from e-mail form
        String recipientAddress = request.getParameter("email");
        String name = request.getParameter("name");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");
         
        // prints debug info
        System.out.println("To: " + recipientAddress);
        System.out.println("Subject: " + subject);
        System.out.println("Message: " + message);
         
        // creates a simple e-mail object
        SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(recipientAddress);
        email.setSubject(subject);
        email.setText(message);
         
        // sends the e-mail
        mailSender.send(email);
         System.out.println("send");
        // forwards to the view named "Result"
        return "Result";
    }
     @RequestMapping(value = "/system/insertdata.do", method = RequestMethod.POST)
    public ModelAndView doInsertData(HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String title = request.getParameter("title");
        String type = request.getParameter("type");
        String public_country = request.getParameter("public_country");
        String menuCat = request.getParameter("menuCat");
        String date = request.getParameter("date");
        String actDate = request.getParameter("act-date");
        String author = request.getParameter("author");
        String img = request.getParameter("real-img-path");
        String x = request.getParameter("x");
        String y = request.getParameter("y");
        String country = StringEscapeUtils.unescapeHtml(request.getParameter("country"));
        String region = StringEscapeUtils.unescapeHtml(request.getParameter("region"));
        String district = StringEscapeUtils.unescapeHtml(request.getParameter("district"));
        String town = StringEscapeUtils.unescapeHtml(request.getParameter("town"));
        String markerType = request.getParameter("marker-type-all");
        String filter = request.getParameter("filter-type-all");
        String textEN = StringEscapeUtils.unescapeHtml(request.getParameter("textEN"));
        String textUA = StringEscapeUtils.unescapeHtml(request.getParameter("textUA"));
        String textHU = StringEscapeUtils.unescapeHtml(request.getParameter("textHU"));
        String textSK = StringEscapeUtils.unescapeHtml(request.getParameter("textSK"));
        String textPL = StringEscapeUtils.unescapeHtml(request.getParameter("textPL"));
        String textRO = StringEscapeUtils.unescapeHtml(request.getParameter("textRO"));
        String textGE = StringEscapeUtils.unescapeHtml(request.getParameter("textGE"));
        String textCZ = StringEscapeUtils.unescapeHtml(request.getParameter("textCZ"));
        String textSRB = StringEscapeUtils.unescapeHtml(request.getParameter("textSRB"));
        String result = article.insertArticle(title, date, actDate, type, author, img, x, y, public_country, country, region, district, town, markerType, filter, menuCat,
                textEN, textUA, textHU, textSK, textRO, textPL, textGE, textCZ, textSRB);
        return new ModelAndView("redirect:" + "/system/panel");
       
    }
      @RequestMapping(value = "/system/updatedata.do", method = RequestMethod.POST)
    public ModelAndView doUpdateData(HttpServletRequest request,HttpServletResponse response) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String type = request.getParameter("type");
        String menuCat = request.getParameter("menuCat");
        String date = request.getParameter("date");
        String public_country = request.getParameter("public_country");
        String actDate = request.getParameter("act-date");
        String author = request.getParameter("author");
        String img = request.getParameter("real-img-path");
        String x = request.getParameter("x");
        String y = request.getParameter("y");
        String country = request.getParameter("country");
        String region = request.getParameter("region");
        String district = request.getParameter("district");
        String town = request.getParameter("town");
        String markerType = request.getParameter("marker-type-all");
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
        String result = article.updateArticle(id,title, date, actDate, type, author, img, x, y, public_country, country, region, district, town, markerType, filter, menuCat,
                textEN, textUA, textHU, textSK, textRO, textPL, textGE, textCZ, textSRB);
        return new ModelAndView("redirect:" + "/system/panel");
       
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
    public ModelAndView doAddFilter(HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        String short_title = request.getParameter("short_title");
        String full_title = request.getParameter("full_title");
        filters.addFilter(short_title, full_title);
        return new ModelAndView("redirect:" + "/system/filters");
    }
    @RequestMapping(value = "/system/addmarker.do", method = RequestMethod.POST)
    public ModelAndView doAddMarker(@RequestParam("marker_icon") MultipartFile file, @RequestParam("short_title") String short_title, @RequestParam("full_title") String full_title, HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
       
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
                logger.info( "You failed to upload " + name + " => " + e.getMessage());
            }
        } else {
            logger.info("You failed to upload " + name + " because the file was empty.");
        }
        markers.addMarker(short_title, full_title);
        return new ModelAndView("redirect:" + "/system/markers");
    }
    @RequestMapping(value = "/system/editmarker.do", method = RequestMethod.POST)
    public ModelAndView doEditMarker(@RequestParam("marker_icon") MultipartFile file, @RequestParam("short_title") String short_title, @RequestParam("full_title") String full_title, @RequestParam("id") String id, HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        String name = "";
        if (!file.isEmpty()) {
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
                logger.info( "You failed to upload " + name + " => " + e.getMessage());
            }
        } else {
            logger.info("You failed to upload " + name + " because the file was empty.");
        }
        markers.updateMarker(id, short_title, full_title);
        return new ModelAndView("redirect:" + "/system/markers");
    }
}
