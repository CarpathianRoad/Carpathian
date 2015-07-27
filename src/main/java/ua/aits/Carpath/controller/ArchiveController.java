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
    
    @RequestMapping(value = {"/archive/login", "/archive/login"})
    public ModelAndView archiveLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/archive/Login");
        return modelAndView;
    }
    @RequestMapping(value = {"/archive/index", "/archive/index/"})
    public ModelAndView archiveIndex(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/archive/Index");
        modelAndView.addObject("menuList", Helpers.getRowHtmlList("en", "0"));
        return modelAndView;
    }
    @RequestMapping(value = {"/archive/articles/{id}", "/archive/articles/{id}/"}, method = RequestMethod.GET)
    public ModelAndView archiveArticles(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/archive/Articles");
        modelAndView.addObject("articles", Articles.getAllArticlesInCategory(id));
        modelAndView.addObject("category", id);
        return modelAndView;
    }
    @RequestMapping(value = {"/archive/add/{id}", "/archive/add/{id}/"}, method = RequestMethod.GET)
    public ModelAndView archiveAdd(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/archive/Add");
        modelAndView.addObject("folder", Helpers.createTempDir());
        modelAndView.addObject("category", id);
        return modelAndView;
    }
    @RequestMapping(value = {"/archive/edit/{id}", "/archive/edit/{id}/"}, method = RequestMethod.GET)
    public ModelAndView archiveEdit(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/archive/Edit");
        modelAndView.addObject("article", Articles.getOneArticleByID(id));
        modelAndView.addObject("filesHTML", Helpers.filesInFolderHTML(Constants.home + "archive_content/" + Articles.getOneArticleByID(id).article_dir + "/files/"));
        return modelAndView;
    }
    @RequestMapping(value = {"/archive/delete/{id}", "/archive/delete/{id}/"}, method = RequestMethod.GET)
    public ModelAndView archiveDelete(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/archive/Delete");
        modelAndView.addObject("article", Articles.getOneArticleByID(id));
        return modelAndView;
    }
    @RequestMapping(value = {"/archive/publish/{id}", "/archive/publish/{id}/"})
    public ModelAndView archivePublish(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        ModelAndView modelAndView = new ModelAndView("/archive/Publish");
        modelAndView.addObject("article", Articles.getOneArticleByID(id));
        modelAndView.addObject("filters", Filters.FiltersHTML("0"));
        modelAndView.addObject("menuList", Helpers.getRowHtmlSelect("en", "0"));
        return modelAndView;
    }
    
    /* Ajax Controllers */
    
    @RequestMapping(value = {"/archive/ajax/checkUser", "/archive/ajax/checkUser/"}, method = RequestMethod.GET)
    public @ResponseBody String archiveCheckUser(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        return Users.isExitsUser(request.getParameter("user_name"), request.getParameter("user_password"));
    }
    
    /* Form Controllers */
    
    @RequestMapping(value = {"/archive/do/login.do","/archive/do/login.do/"}, method = RequestMethod.POST)
    public ModelAndView login(@RequestParam("user_id") String user_id, @RequestParam("user_name") String user_name, @RequestParam("user_password") String user_password, HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        ArchiveUserModel user = Users.getOneUserFull(user_id, user_name, user_password); 
        HttpSession session = request.getSession(true);
	session.setAttribute("user",  user);
        return new ModelAndView("redirect:" + "/archive/index");   
    }
    @RequestMapping(value = {"/archive/do/logout.do","/archive/do/logout.do/"})
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);
        if (session != null) { session.invalidate(); }
        return new ModelAndView("redirect:" + "/archive/login"); 
    } 
    @RequestMapping(value = "/archive/do/insertdata.do", method = RequestMethod.POST)
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
        Articles.insertArticle(titleEN, titleUA, textEN, textUA, category, author, date, dir);
        return new ModelAndView("redirect:" + "/archive/articles/"+category);
    }
    @RequestMapping(value = "/archive/do/updatedata.do", method = RequestMethod.POST)
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
        return new ModelAndView("redirect:" + "/archive/articles/"+category);
    }
    @RequestMapping(value = {"/archive/do/deletearticle/{id}","/archive/do/deletearticle/{id}/"})
    public ModelAndView deleteArticle(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        return new ModelAndView("redirect:" + "/archive/articles/" + Articles.deleteArticle(id)); 
    }
    
    /* File Upload Controllers */
    
    @RequestMapping(value = {"/archive/do/uploadfile", "/archive/do/uploadfile/"}, method = RequestMethod.POST)
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
    @RequestMapping(value = "/archive/do/removefile", method = RequestMethod.GET)
    public @ResponseBody String removeFileOrDir(HttpServletRequest request) {
        String path = request.getParameter("path");
        File temp = new File(Constants.home + path);
        Boolean result = temp.delete();
        return result.toString();
    } 
}
