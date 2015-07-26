/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.controller;

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
import org.springframework.web.servlet.ModelAndView;
import ua.aits.Carpath.functions.Helpers;
import ua.aits.Carpath.model.ArchiveArticleModel;
import ua.aits.Carpath.model.ArchiveUserModel;

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
        modelAndView.addObject("category", id);
        return modelAndView;
    }
    @RequestMapping(value = {"/archive/edit/{id}", "/archive/edit/{id}/"}, method = RequestMethod.GET)
    public ModelAndView archiveEdit(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/archive/Edit");
        modelAndView.addObject("article", Articles.getOneArticleByID(id));
        return modelAndView;
    }
    @RequestMapping(value = {"/archive/publish/{id}", "/archive/publish/{id}/"}, method = RequestMethod.GET)
    public ModelAndView archivePublish(@PathVariable("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/archive/Publish");
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
    public ModelAndView addArticle(HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String titleEN = request.getParameter("titleEN");
        String titleUA = request.getParameter("titleUA");
        String textEN = request.getParameter("textEN");
        String textUA = request.getParameter("textUA");
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        Date date_format = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("dd.MM.yyyy HH:mm");
        String date = sdf.format(date_format);
        Articles.insertArticle(titleEN, titleUA, textEN, textUA, category, author, date);
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
    
}
