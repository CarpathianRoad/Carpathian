/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import ua.aits.Carpath.functions.Constants;
import ua.aits.Carpath.functions.Helpers;
import ua.aits.Carpath.model.ArchiveArticleModel;
import ua.aits.Carpath.model.ArchiveUserModel;
import ua.aits.Carpath.model.ArticleModel;
import ua.aits.Carpath.model.FilterModel;

/**
 *
 * @author kiwi
 */
@Controller
public class ArchiveController {
    
    /* Classes init */
    ArchiveUserModel Users = new ArchiveUserModel();
    Helpers Helpers = new Helpers();
    ArchiveArticleModel Articles = new ArchiveArticleModel();
    FilterModel Filters = new FilterModel();
    ArticleModel MainArticles = new ArticleModel();
    
    @RequestMapping(value = {"/system/archive/login", "/system/archive/login"})
    public ModelAndView archiveLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/system/archive/Login");
        return modelAndView;
    }
    @RequestMapping(value = {"/system/archive/index", "/system/archive/index/"})
    public ModelAndView archiveIndex(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/system/archive/Index");
        modelAndView.addObject("menuList", Helpers.getRowHtmlList("en", "0"));
        return modelAndView;
    }
    @RequestMapping(value = {"/system/archive/articles/{id}", "/system/archive/articles/{id}/"}, method = RequestMethod.GET)
    public ModelAndView archiveArticles(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/system/archive/Articles");
        modelAndView.addObject("articles", Articles.getAllArticlesInCategory(id));
        modelAndView.addObject("category", id);
        return modelAndView;
    }
    @RequestMapping(value = {"/system/archive/add/{id}", "/system/archive/add/{id}/"}, method = RequestMethod.GET)
    public ModelAndView archiveAdd(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/system/archive/Add");
        String folder = Helpers.createTempDir();
        modelAndView.addObject("folder", folder);
        modelAndView.addObject("folder_str", folder.replace('/', '|'));
        modelAndView.addObject("category", id);
        return modelAndView;
    }
    @RequestMapping(value = {"/system/archive/edit/{id}", "/system/archive/edit/{id}/"}, method = RequestMethod.GET)
    public ModelAndView archiveEdit(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/system/archive/Edit");
        String folder = Articles.getOneArticleByID(id).article_dir;
        modelAndView.addObject("article", Articles.getOneArticleByID(id));
        modelAndView.addObject("filesHTML", Helpers.filesInFolderHTML(Constants.home + "archive_content/" + Articles.getOneArticleByID(id).article_dir + "/files/"));
        modelAndView.addObject("folder_str", folder.replace('/', '|'));
        return modelAndView;
    }
    @RequestMapping(value = {"/system/archive/delete/{id}", "/system/archive/delete/{id}/"}, method = RequestMethod.GET)
    public ModelAndView archiveDelete(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/system/archive/Delete");
        modelAndView.addObject("article", Articles.getOneArticleByID(id));
        return modelAndView;
    }
    @RequestMapping(value = {"/system/archive/publish/{id}", "/system/archive/publish/{id}/"})
    public ModelAndView archivePublish(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("/system/archive/Publish");
        modelAndView.addObject("article", Articles.getOneArticleByID(id));
        modelAndView.addObject("filters", Filters.FiltersHTML("0"));
        modelAndView.addObject("menuList", Helpers.getRowHtmlSelect("en", "0"));
        return modelAndView;
    }
    
    /* Ajax Controllers */
    
    @RequestMapping(value = {"/system/archive/ajax/checkUser", "/system/archive/ajax/checkUser/"}, method = RequestMethod.GET)
    public @ResponseBody String archiveCheckUser(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        return Users.isExitsUser(request.getParameter("user_name"), request.getParameter("user_password"));
    }
    
    /* Form Controllers */
    
    @RequestMapping(value = {"/system/archive/do/login.do","/archive/do/login.do/"}, method = RequestMethod.POST)
    public ModelAndView login(@RequestParam("user_id") String user_id, @RequestParam("user_name") String user_name, @RequestParam("user_password") String user_password, HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        ArchiveUserModel user = Users.getOneUserFull(user_id, user_name, user_password); 
        HttpSession session = request.getSession(true);
	session.setAttribute("user",  user);
        return new ModelAndView("redirect:" + "/system/archive/index");   
    }
    @RequestMapping(value = "/system/archive/do/insertdata.do", method = RequestMethod.POST)
    public ModelAndView addArticle(HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, UnsupportedEncodingException, IOException {
        request.setCharacterEncoding("UTF-8");
        String titleEN = request.getParameter("titleEN");
        String titleUA = request.getParameter("titleUA");
        String textEN = request.getParameter("textEN");
        String textUA = request.getParameter("textUA");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        String directory = request.getParameter("dir");
        Date date_format = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy HH:mm");
        String date = sdf.format(date_format);
        String dir = Helpers.moveAllFilesFromArchiveDir(Constants.home + directory, titleEN, category);
        Helpers.removeDir(Constants.home + directory);
        String replacedTextEN = textEN.replace(directory, dir);
        String replacedTextUA = textUA.replace(directory, dir);
        Articles.insertArticle(titleEN, titleUA, replacedTextEN, replacedTextUA, category, author, date, dir);
        return new ModelAndView("redirect:" + "/system/archive/articles/"+category);
    }
    @RequestMapping(value = "/system/archive/do/updatedata.do", method = RequestMethod.POST)
    public ModelAndView editArticle(HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String titleEN = request.getParameter("titleEN");
        String titleUA = request.getParameter("titleUA");
        String textEN = request.getParameter("textEN");
        String textUA = request.getParameter("textUA");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        Date date_format = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy HH:mm");
        String date = sdf.format(date_format);
        Articles.updateArticle(id, titleEN, titleUA, textEN, textUA, author, date);
        return new ModelAndView("redirect:" + "/system/archive/articles/"+category);
    }
    @RequestMapping(value = {"/system/archive/do/deletearticle/{id}","/archive/do/deletearticle/{id}/"})
    public ModelAndView deleteArticle(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        return new ModelAndView("redirect:" + "/system/archive/articles/" + Articles.deleteArticle(id)); 
    }
    @RequestMapping(value = "/system/archive/do/publishdata.do", method = RequestMethod.POST)
    public ModelAndView doPublishArticle(HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("article_id");
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
        String result = MainArticles.insertArticle(titleEN, titleUA, titleHU, titleSK, titlePL, titleRO, titleGE, titleCZ, titleSRB, date, actDate, type, author,
                avatar, img, panorama, x, y, public_country, country, region, district, town, markerType, filter, menuCat,
                textEN, textUA, textHU, textSK, textRO, textPL, textGE, textCZ, textSRB);
        Articles.publishArticle(id);
        return new ModelAndView("redirect:" + "/system/panel");
       
    }
    /* File Upload Controllers */
    
    @RequestMapping(value = {"/system/archive/do/uploadfile", "/system/archive/do/uploadfile/"}, method = RequestMethod.POST)
    public @ResponseBody
    String uploadFileHandler(@RequestParam("file") MultipartFile file, @RequestParam("path") String path,  HttpServletRequest request) {
        String name = file.getOriginalFilename();
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                File dir = new File(Constants.home+path);
                if (!dir.exists())
                    dir.mkdirs();
                File serverFile = new File(dir.getAbsolutePath() + File.separator + name);
                try (BufferedOutputStream stream = new BufferedOutputStream( new FileOutputStream(serverFile))) { 
                    stream.write(bytes); 
                }
                return "";
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload " + name + " because the file was empty.";
        }
    }
    @RequestMapping(value = "/system/archive/do/removefile", method = RequestMethod.GET)
    public @ResponseBody String removeFileOrDir(HttpServletRequest request) {
        String path = request.getParameter("path");
        File temp = new File(Constants.home + path);
        Boolean result = temp.delete();
        return result.toString();
    } 
    @RequestMapping(value = {"/system/archive/do/uploadimage", "/system/archive/do/uploadimage/"}, method = RequestMethod.POST)
    public @ResponseBody
    String uploadImageHandler(@RequestParam("file") MultipartFile file, @RequestParam("path") String path,  HttpServletRequest request) {
        String name = file.getOriginalFilename();
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                File dir = new File(Constants.home+path);
                if (!dir.exists())
                    dir.mkdirs();
                File serverFile = new File(dir.getAbsolutePath() + File.separator + name);
                try (BufferedOutputStream stream = new BufferedOutputStream( new FileOutputStream(serverFile))) { 
                    stream.write(bytes); 
                }
                return "";
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload " + name + " because the file was empty.";
        }
    }
}
