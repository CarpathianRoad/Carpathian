/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.controller;

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
import ua.aits.Carpath.model.ArchiveUserModel;

/**
 *
 * @author kiwi
 */
@Controller
public class ArchiveController {
    
    /* Classes init */
    ArchiveUserModel users = new ArchiveUserModel();
    Helpers helpers = new Helpers();
    
    
    @RequestMapping(value = {"/archive/login", "/archive/login"})
    public ModelAndView archiveLogin(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/archive/Login");
        return modelAndView;
    }
    @RequestMapping(value = {"/archive/index", "/archive/index/"})
    public ModelAndView archiveIndex(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/archive/Index");
        modelAndView.addObject("menuList", helpers.getRowHtmlList("en", "0"));
        return modelAndView;
    }
    @RequestMapping(value = {"/archive/articles/{id}", "/archive/articles/{id}/"}, method = RequestMethod.GET)
    public ModelAndView archiveArticles(@PathVariable("id") String id, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/archive/Articles");
        return modelAndView;
    }
    
    /* Ajax Controllers */
    
    @RequestMapping(value = {"/archive/ajax/checkUser", "/archive/ajax/checkUser/"}, method = RequestMethod.GET)
    public @ResponseBody String archiveCheckUser(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        return users.isExitsUser(request.getParameter("user_name"), request.getParameter("user_password"));
    }
    
    /* Form Controllers */
    
    @RequestMapping(value = {"/archive/do/login.do","/archive/do/login.do/"}, method = RequestMethod.POST)
    public ModelAndView login(@RequestParam("user_id") String user_id, @RequestParam("user_name") String user_name, @RequestParam("user_password") String user_password, HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        ArchiveUserModel user = users.getOneUserFull(user_id, user_name, user_password); 
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
}
