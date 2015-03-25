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
import org.springframework.web.servlet.ModelAndView;
import ua.aits.Carpath.model.ArticleModel;
import ua.aits.Carpath.model.FilterModel;
import ua.aits.Carpath.model.MarkerModel;
import ua.aits.Carpath.model.MenuModel;
import ua.aits.Carpath.model.RouteModel;
import ua.aits.Carpath.model.UserModel;

/**
 *
 * @author kiwi
 */
@Controller
public class SystemController {
    
    ArticleModel article = new ArticleModel();
    MenuModel menu = new MenuModel();
    UserModel users = new UserModel();
    MarkerModel markers = new MarkerModel();
    FilterModel filters = new FilterModel();
    RouteModel routes = new RouteModel();
    
    @RequestMapping(value = {"/system/add", "/system/add/","/Carpath/system/add", "/Carpath/system/add/"})
        public ModelAndView addArticle (HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            request.setCharacterEncoding("UTF-8");
            ModelAndView modelAndView = new ModelAndView("/system/AddArticle");
            modelAndView.addObject("menuList", menu.getAllCat());
            modelAndView.addObject("markers", markers.getAllMarkers());
            modelAndView.addObject("filters", filters.getAllFilters());
            return modelAndView;
	}
    @RequestMapping(value = {"/system/edit/{id}", "/system/edit/{id}/","/Carpath/system/edit/{id}", "/Carpath/system/edit/{id}/"})
        public ModelAndView editArticle (@PathVariable("id") String id, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            request.setCharacterEncoding("UTF-8");
            ModelAndView modelAndView = new ModelAndView("/system/EditArticle");
            modelAndView.addObject("menuList", menu.getAllCat());
            modelAndView.addObject("article",article.getOneArticle("en",id));
            modelAndView.addObject("markers", markers.getAllMarkers());
            modelAndView.addObject("filters", filters.getAllFilters());
            return modelAndView;
	}
    
    @RequestMapping(value = {"/system/delete/{id}/","/system/delete/{id}","/Carpath/system/delete/{id}/","/Carpath/system/delete/{id}"})
    public ModelAndView deleteArticle(@PathVariable("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
        Boolean result = article.deleteArticle(id);
        
        return new ModelAndView("redirect:" + "/system/panel");
    }
    @RequestMapping(value = {"/system/panel", "/system/panel/", "/system/index/", "/system/index","/Carpath/system/panel", "/Carpath/system/panel/", "/Carpath/system/index/", "/Carpath/system/index"})
    public ModelAndView systemPanel(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
            ModelAndView modelAndView = new ModelAndView("/system/Panel");
            modelAndView.addObject("users", users.getAllUsers());
            modelAndView.addObject("menuList", menu.getAllCat());
            return modelAndView;
    }
    @RequestMapping(value = {"/system/login.do","/system/login.do/"}, method = RequestMethod.POST)
    public ModelAndView login(@RequestParam("username") String login, @RequestParam("password") String passwd, 
            HttpServletRequest request,
		HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
                UserModel user = users.getUser(login, passwd); 
                HttpSession session = request.getSession(true);
		session.setAttribute("user",  user);
                return new ModelAndView("redirect:" + "/system/panel");
                
	}
    @RequestMapping(value = {"/system/logout","/system/logout/","/Carpath/system/logout","/Carpath/system/logout/"})
    public ModelAndView logout(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
                if (session != null) {
                    session.invalidate();
                }
                
                return new ModelAndView("redirect:" + "/login");
	}
    @RequestMapping(value = {"/system/users", "/system/users/", "/Carpath/system/users", "/Carpath/system/users/"})
    public ModelAndView showUsers(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            request.setCharacterEncoding("UTF-8");
            ModelAndView modelAndView = new ModelAndView("/system/Users");
            modelAndView.addObject("users", users.getAllUsers());
            return modelAndView;
    }
    @RequestMapping(value = {"/system/users/delete/{username}", "/system/users/delete/{username}/","/Carpath/system/users/delete/{username}", "/Carpath/system/users/delete{username}/"})
    public ModelAndView deleteUser (@PathVariable("username") String username, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
                if(!"admin".equals(username)){
            users.deleteUser(username);
                }
            return new ModelAndView("redirect:" + "/system/users");
    }
    @RequestMapping(value = {"/system/routes", "/system/routes/", "/Carpath/system/routes", "/Carpath/system/routes/"})
    public ModelAndView showRoutes(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            ModelAndView modelAndView = new ModelAndView("/system/Routes");
            return modelAndView;
    }
    @RequestMapping(value = {"/system/routes/add", "/system/routes/add/","/Carpath/system/routes/add", "/Carpath/system/routes/add/"})
        public ModelAndView addRoute (HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            request.setCharacterEncoding("UTF-8");
            ModelAndView modelAndView = new ModelAndView("/system/AddRoute");
            return modelAndView;
	}
    @RequestMapping(value = {"/system/routes/delete/{id}/","/system/routes/delete/{id}","/Carpath/system/routes/delete/{id}/","/Carpath/system/routes/delete/{id}"})
    public ModelAndView deleteRoute(@PathVariable("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
        Boolean result = routes.deleteRoute(id);
        
        return new ModelAndView("redirect:" + "/system/routes");
    }
    @RequestMapping(value = {"/system/routes/edit/{id}", "/system/routes/edit/{id}/","/Carpath/system/routes/edit/{id}", "/Carpath/system/routes/edit/{id}/"})
        public ModelAndView editRoute(@PathVariable("id") String id, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            request.setCharacterEncoding("UTF-8");
            ModelAndView modelAndView = new ModelAndView("/system/EditRoute");
            modelAndView.addObject("route",routes.getOneRoute(id));
            return modelAndView;
	}
    @RequestMapping(value = {"/system/markers", "/system/markers/", "/Carpath/system/markers", "/Carpath/system/markers/"})
    public ModelAndView showMarkers(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            ModelAndView modelAndView = new ModelAndView("/system/Markers");
            modelAndView.addObject("markers", markers.getAllMarkers());
            return modelAndView;
    }
    @RequestMapping(value = {"/system/markers/edit/{id}", "/system/markers/edit/{id}", "/Carpath/system/markers/edit/{id}", "/Carpath/system/markers/edit/{id}"})
    public ModelAndView editMarkers(@PathVariable("id") String id,HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            ModelAndView modelAndView = new ModelAndView("/system/MarkerEdit");
            modelAndView.addObject("marker", markers.getOneMarker(id));
            return modelAndView;
    }
    @RequestMapping(value = {"/system/filters", "/system/filters/", "/Carpath/system/filters", "/Carpath/system/filters/"})
    public ModelAndView showFilters(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            ModelAndView modelAndView = new ModelAndView("/system/Filters");
            modelAndView.addObject("filters", filters.getAllFilters());
            return modelAndView;
    }
    @RequestMapping(value = {"/system/markers/delete/{id}", "/system/markers/delete/{id}/","/Carpath/system/markers/delete/{id}", "/Carpath/system/markers/delete{id}/"})
    public ModelAndView deleteMarkers (@PathVariable("id") String id, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            markers.deleteMarker(id);
            return new ModelAndView("redirect:" + "/system/markers");
    }
    @RequestMapping(value = {"/system/filters/delete/{id}", "/system/filters/delete/{id}/","/Carpath/system/filters/delete/{id}", "/Carpath/system/filters/delete{id}/"})
    public ModelAndView deleteFilters (@PathVariable("id") String id, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            filters.deleteFilter(id);
            return new ModelAndView("redirect:" + "/system/filters");
    }
}
