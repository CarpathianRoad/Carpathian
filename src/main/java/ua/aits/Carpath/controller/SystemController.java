/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ua.aits.Carpath.functions.Constants;
import ua.aits.Carpath.functions.Helpers;
import ua.aits.Carpath.model.ArchiveUserModel;
import ua.aits.Carpath.model.ArticleModel;
import ua.aits.Carpath.model.FilterModel;
import ua.aits.Carpath.model.MarkerModel;
import ua.aits.Carpath.model.MenuModel;
import ua.aits.Carpath.model.RouteModel;
import ua.aits.Carpath.model.SliderModel;

/**
 *
 * @author kiwi
 */
@Controller
public class SystemController {
    
    ArticleModel article = new ArticleModel();
    MenuModel menu = new MenuModel();
    ArchiveUserModel Users = new ArchiveUserModel();
    MarkerModel markers = new MarkerModel();
    FilterModel filters = new FilterModel();
    RouteModel routes = new RouteModel();
    Helpers helpers = new Helpers();
    SliderModel slider = new SliderModel();
    
    @RequestMapping(value = {"/system/articles/add", "/system/articles/add/","/Carpath/system/articles/add", "/Carpath/system/articles/add/"})
        public ModelAndView addArticle (HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            request.setCharacterEncoding("UTF-8");
            ModelAndView modelAndView = new ModelAndView("/system/ArticleAdd");
            modelAndView.addObject("markers", markers.getAllMarkers());
            modelAndView.addObject("filters", filters.FiltersHTML("0"));
            modelAndView.addObject("menuList", helpers.getRowHtmlSelect("en", "0"));
            return modelAndView;
	}
    @RequestMapping(value = {"/system/articles/edit/{id}", "/system/articles/edit/{id}/","/Carpath/system/articles/edit/{id}", "/Carpath/system/articles/edit/{id}/"})
        public ModelAndView editArticle (@PathVariable("id") String id, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            request.setCharacterEncoding("UTF-8");
            ModelAndView modelAndView = new ModelAndView("/system/ArticleEdit");
            modelAndView.addObject("menuList", helpers.getRowHtmlSelect("en", "0"));
            modelAndView.addObject("article",article.getOneArticleForEdit(id));
            modelAndView.addObject("markers", markers.getAllMarkers());
            modelAndView.addObject("filters", filters.FiltersHTML("0"));
            return modelAndView;
	}
    
    @RequestMapping(value = {"/system/articles/delete/{id}/","/system/articles/delete/{id}","/Carpath/system/articles/delete/{id}/","/Carpath/system/articles/delete/{id}"})
    public ModelAndView deleteArticle(@PathVariable("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
            ModelAndView modelAndView = new ModelAndView("/system/ArticleDelete");
            modelAndView.addObject("article",article.getOneArticleForEdit(id));
            return modelAndView;
    }
    @RequestMapping(value = {"/system/panel", "/system/panel/", "/system/articles", "/system/articles/", "/system/index/", "/system/index","/Carpath/system/panel", "/Carpath/system/panel/", "/Carpath/system/index/", "/Carpath/system/index"})
    public ModelAndView systemPanel(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
            ModelAndView modelAndView = new ModelAndView("/system/Panel");
            //modelAndView.addObject("users", users.getAllUsers());
            modelAndView.addObject("menuList", helpers.getRowHtmlSelectSmall("en", "0"));
            return modelAndView;
    }
    @RequestMapping(value = {"/system/login.do","/system/login.do/"}, method = RequestMethod.POST)
    public ModelAndView login(@RequestParam("user_id") String user_id, @RequestParam("user_name") String user_name, @RequestParam("user_password") String user_password, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ArchiveUserModel user = Users.getOneUserFull(user_id, user_name, user_password); 
        HttpSession session = request.getSession(true);
	session.setAttribute("user",  user);
        if(user.user_role == 1) {  
            return new ModelAndView("redirect:" + "/system/panel");   
        }
        else {
            return new ModelAndView("redirect:" + "/system/archive/index");   
        }
    }
    @RequestMapping(value = {"/system/users", "/system/users/", "/Carpath/system/users", "/Carpath/system/users/"})
    public ModelAndView showUsers(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            request.setCharacterEncoding("UTF-8");
            ModelAndView modelAndView = new ModelAndView("/system/Users");
            modelAndView.addObject("users", Users.getAllUsers());
            return modelAndView;
    }
    @RequestMapping(value = {"/system/users/add", "/system/users/add/"})
    public ModelAndView addUser(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            request.setCharacterEncoding("UTF-8");
            ModelAndView modelAndView = new ModelAndView("/system/UserAdd");
            return modelAndView;
    }
    @RequestMapping(value = {"/system/users/edit/{id}", "/system/users/edit/{id}/","/Carpath/system/users/edit/{id}", "/Carpath/system/users/edit/{id}/"})
    public ModelAndView editUser (@PathVariable("id") String id, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
                ModelAndView modelAndView = new ModelAndView("/system/UserEdit");
                modelAndView.addObject("user", Users.getOneUserFullById(id));
            return modelAndView;
    }
    @RequestMapping(value = {"/system/users/settings/{id}", "/system/users/settings/{id}/","/Carpath/system/users/settings/{id}", "/Carpath/system/users/settings/{id}/"})
    public ModelAndView settingsUser (@PathVariable("id") String id, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
                ModelAndView modelAndView = new ModelAndView("/system/UserSettings");
                modelAndView.addObject("user", Users.getOneUserFullById(id));
            return modelAndView;
    }
    @RequestMapping(value = {"/system/users/delete/{id}", "/system/users/delete/{id}/","/Carpath/system/users/delete/{id}", "/Carpath/system/users/delete{id}/"})
    public ModelAndView deleteUser (@PathVariable("id") String id, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
                ModelAndView modelAndView = new ModelAndView("/system/UserDelete");
                modelAndView.addObject("user", Users.getOneUserFullById(id));
            return modelAndView;
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
            ModelAndView modelAndView = new ModelAndView("/system/RouteAdd");
            return modelAndView;
	}
    @RequestMapping(value = {"/system/routes/delete/{id}/","/system/routes/delete/{id}","/Carpath/system/routes/delete/{id}/","/Carpath/system/routes/delete/{id}"})
    public ModelAndView deleteRoute(@PathVariable("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
       ModelAndView modelAndView = new ModelAndView("/system/RouteDelete");
            modelAndView.addObject("route",routes.getOneRouteForEdit(id));
            return modelAndView;
    }
    @RequestMapping(value = {"/system/routes/edit/{id}", "/system/routes/edit/{id}/","/Carpath/system/routes/edit/{id}", "/Carpath/system/routes/edit/{id}/"})
        public ModelAndView editRoute(@PathVariable("id") String id, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            request.setCharacterEncoding("UTF-8");
            ModelAndView modelAndView = new ModelAndView("/system/RouteEdit");
            modelAndView.addObject("route",routes.getOneRouteForEdit(id));
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
    @RequestMapping(value = {"/system/filters/add", "/system/filters/add", "/Carpath/system/filters/add", "/Carpath/system/filters/add"})
    public ModelAndView addFilters(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            ModelAndView modelAndView = new ModelAndView("/system/FilterAdd");
            return modelAndView;
    }
    @RequestMapping(value = {"/system/filters/edit/{id}", "/system/filters/edit/{id}", "/Carpath/system/filters/edit/{id}", "/Carpath/system/filters/edit/{id}"})
    public ModelAndView editFilters(@PathVariable("id") String id,HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            ModelAndView modelAndView = new ModelAndView("/system/FilterEdit");
            modelAndView.addObject("filter", filters.getOneFilter(id));
            return modelAndView;
    }
    @RequestMapping(value = {"/system/filters/delete/{id}", "/system/filters/delete/{id}", "/Carpath/system/filters/delete/{id}", "/Carpath/system/filters/delete/{id}"})
    public ModelAndView deleteFilters(@PathVariable("id") String id,HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            ModelAndView modelAndView = new ModelAndView("/system/FilterDelete");
            modelAndView.addObject("filter", filters.getOneFilter(id));
            return modelAndView;
    }
    @RequestMapping(value = {"/system/markers/delete/{id}", "/system/markers/delete/{id}/","/Carpath/system/markers/delete/{id}", "/Carpath/system/markers/delete{id}/"})
    public ModelAndView deleteMarkers (@PathVariable("id") String id, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            markers.deleteMarker(id);
            return new ModelAndView("redirect:" + "/system/markers");
    }
    
    @RequestMapping(value = {"/system/slider", "/system/slider/","/Carpath/system/slider", "/Carpath/system/slider/"})
        public ModelAndView slider(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            request.setCharacterEncoding("UTF-8");
            ModelAndView modelAndView = new ModelAndView("/system/Slider");
            modelAndView.addObject("slides", slider.getAllSlidesForEdit());
            return modelAndView;
    }
        
    @RequestMapping(value = "/system/user/do/insertdata.do", method = RequestMethod.POST)
    public ModelAndView doAddUser(HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String user_name = request.getParameter("user_name");
        String user_password = request.getParameter("user_password");
        String user_role = request.getParameter("user_role");
        String user_enabled = request.getParameter("user_enabled");
        String user_firstname = request.getParameter("user_firstname");
        String user_lastname = request.getParameter("user_lastname");
        String user_descr = request.getParameter("user_descr");
        String user_contacts = request.getParameter("user_contacts");
        Users.addUser(user_name, user_password, user_firstname, user_lastname, user_contacts, user_role, user_enabled, user_descr);
        return new ModelAndView("redirect:" + "/system/users");
    } 
        
    @RequestMapping(value = "/system/user/do/updatedata.do", method = RequestMethod.POST)
    public ModelAndView doEditUser(HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String user_id = request.getParameter("user_id");
        String user_name = request.getParameter("user_name");
        String user_password = request.getParameter("user_password");
        String user_role = request.getParameter("user_role");
        String user_enabled = request.getParameter("user_enabled");
        String user_firstname = request.getParameter("user_firstname");
        String user_lastname = request.getParameter("user_lastname");
        String user_descr = request.getParameter("user_descr");
        String user_contacts = request.getParameter("user_contacts");
        Users.editUser(user_id, user_name, user_password, user_firstname, user_lastname, user_contacts, user_role, user_enabled, user_descr, "");
        return new ModelAndView("redirect:" + "/system/users");
    }   
        
    @RequestMapping(value = "/system/user/do/deletedata.do", method = RequestMethod.POST)
    public ModelAndView doDeleteUser(HttpServletRequest request) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, UnsupportedEncodingException {
        request.setCharacterEncoding("UTF-8");
        String user_id = request.getParameter("user_id");
        Users.deleteUser(user_id);
        return new ModelAndView("redirect:" + "/system/users");
    }
    
    @RequestMapping(value = {"/system/do/logout.do","/archive/do/logout.do/"})
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);
        if (session != null) { session.invalidate(); }
        return new ModelAndView("redirect:" + "/en/login"); 
    } 
    
    
    @RequestMapping(value = {"/system/filters/do/deletedata.do"})
    public ModelAndView doDeleteFilters ( HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            String id = request.getParameter("id");
            String short_title = filters.deleteFilter(id);
            File temp = new File(Constants.FILE_URL_ROUTES+short_title+".png");
            return new ModelAndView("redirect:" + "/system/filters");
    }
    
    
    @RequestMapping(value = {"/system/article/do/deletedata.do"})
    public ModelAndView doDeleteArticles( HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            String id = request.getParameter("article_id");
            ArticleModel art = article.getOneArticleForEdit(id);
        if(!"".equals(art.panorama) && art.panorama != null) {
            File temp = new File(Constants.home+"files/panoramas/"+art.panorama);
            Boolean result = temp.delete();
        }
        Boolean result = article.deleteArticle(id);
        
        return new ModelAndView("redirect:" + "/system/panel");
    }
    
    
    @RequestMapping(value = {"/system/route/do/deletedata.do"})
    public ModelAndView doDeleteRoutes( HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            String id = request.getParameter("route_id");
         RouteModel rout = routes.getOneRouteForEdit(id);
        if(!"".equals(rout.file) && rout.file != null) {
            File temp = new File(Constants.FILE_URL_ROUTES+rout.file);
            Boolean result = temp.delete();
        }
        Boolean result = routes.deleteRoute(id);
        
        return new ModelAndView("redirect:" + "/system/routes");
    }
}
