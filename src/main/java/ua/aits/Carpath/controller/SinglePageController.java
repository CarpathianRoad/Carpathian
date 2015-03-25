/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.Scope;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ua.aits.Carpath.functions.Helpers;
import ua.aits.Carpath.model.ArticleModel;
import ua.aits.Carpath.model.MapModel;
import ua.aits.Carpath.model.MenuModel;
import ua.aits.Carpath.model.RouteModel;

/**
 *
 * @author kiwi
 */
@Controller
@Scope("session")
public class SinglePageController {
    
    MapModel map = new MapModel();
    ArticleModel news = new ArticleModel();
    Helpers helpers = new Helpers();
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {
 
	  ModelAndView model = new ModelAndView();
 
	  //check if user is login
	  Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	  if (!(auth instanceof AnonymousAuthenticationToken)) {
		UserDetails userDetail = (UserDetails) auth.getPrincipal();	
		model.addObject("username", userDetail.getUsername());
	  }
 
	  model.setViewName("403");
	  return model;
 
	}
    
    
    @RequestMapping(value = {"/{lan}/index", "/{lan}/main", "/{lan}/home"}, method = RequestMethod.GET)
    protected ModelAndView handleRequestInternal(@PathVariable("lan") String lan, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		 ArticleModel content = new ArticleModel();
                 ModelAndView modelAndView = new ModelAndView("Index");
                 modelAndView.addObject("lan", lan);
                 modelAndView.addObject("content", content.getArticleByCount(lan,"9"));
                 modelAndView.addObject("points", map.getPointsByCount(lan,"9"));
                 modelAndView.addObject("images", map.getImages());
                 return modelAndView;
	}
    @RequestMapping(value = {"/{lan}/routes/{id}", "/{lan}/routes/{id}/"})
    public ModelAndView routes(@PathVariable("lan") String lan, @PathVariable("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		RouteModel route = new RouteModel();
            ModelAndView modelAndView = new ModelAndView("Routes");
            modelAndView.addObject("route", route.getOneRoute(id));
            modelAndView.addObject("imagesRoute", route.getRouteImages(id));
            return modelAndView;
	}
    @RequestMapping(value = {"/{lan}/routesList","/{lan}/routesList/"})
    public ModelAndView routesList(@PathVariable("lan") String lan, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		RouteModel route = new RouteModel();
                List<RouteModel> routes = route.getAllRoutes();
                
		for (RouteModel temp : routes) {
                        if(temp.getImages() == null || "".equals(temp.getImages())) {
                            temp.setImages("img/logo2.png");
                        }
                        if(temp.getTextUA() == null || "".equals(temp.getTextUA())) {
                            temp.setTextUA("Lorem ipsum dolor sit amet consectetur adipiscing elit Donec vitae pulvinar massa Cras urna enim, ornare vel mollis id, maximus quis tellus. Aliquam ac ante tristique lectus molestie auctor in id felis. Aliquam tempus nulla at interdum lobortis. Donec et suscipit nibh, vel consequat lectus.");
                        }
		}    
                
		ModelAndView model = new ModelAndView("RoutesList");
		model.addObject("routesList", routes);
		
		return model;
	}
    @RequestMapping(value = {"/{lan}/contact","/{lan}/contact/"})
    public ModelAndView contact(@PathVariable("lan") String lan, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ModelAndView model = new ModelAndView("Contact");
		model.addObject("msg", "WelcomeController");
		
		return model;
	}
    @RequestMapping(value = {"/{lan}/partners","/{lan}/partners/"})
    public ModelAndView partners(@PathVariable("lan") String lan, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ModelAndView model = new ModelAndView("Partners");
		model.addObject("msg", "WelcomeController");
		
		return model;
	}
    @RequestMapping(value = {"/{lan}/map/{country}","/{lan}/map/{country}/"})
    public ModelAndView mapCountry(@PathVariable("lan") String lan, @PathVariable("country") String country, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
                List<MapModel> maps = map.getAllPoints();
		ModelAndView model = new ModelAndView("Map");
                model.addObject("country",country);
		model.addObject("markers", maps);
		return model;
	}
    @RequestMapping(value = {"/{lan}/map/","/{lan}/map"})
    public ModelAndView map(@PathVariable("lan") String lan, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
                List<MapModel> maps = map.getAllPoints();
		ModelAndView model = new ModelAndView("Map");
		model.addObject("markers", maps);
                model.addObject("lan", lan);
		return model;
	}
    @RequestMapping(value = {"/{lan}/map/markers/{id}","/{lan}/map/markers/{id}/"})
    public ModelAndView marker(@PathVariable("lan") String lan, @PathVariable("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
        MapModel ret  = map.getMarker(id);
        if(ret.getMarkerIcon() == null || "".equals(ret.getMarkerIcon())) {
                            ret.setMarkerIcon("gardens");
                        }
                        if(ret.getImage() == null || "".equals(ret.getImage())) {
                            ret.setImage("img/logo2.png");
                        }
                        if(ret.getTextEN() == null || "".equals(ret.getTextEN())) {
                            ret.setTextEN("Lorem ipsum dolor sit amet consectetur adipiscing elit Donec vitae pulvinar massa Cras urna enim, ornare vel mollis id, maximus quis tellus. Aliquam ac ante tristique lectus molestie auctor in id felis. Aliquam tempus nulla at interdum lobortis. Donec et suscipit nibh, vel consequat lectus.");
                        }
        String[] arrayMessage = ret.getImage().split(",");
        ModelAndView modelAndView = new ModelAndView("Markers");
        modelAndView.addObject("marker", ret);
        modelAndView.addObject("articles", map.getPointsByCount(lan,"3"));
        modelAndView.addObject("images", arrayMessage);
        return modelAndView;
    }
    
    @RequestMapping(value = {"/kiwi/test"})
    public ModelAndView kiwi(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
                String html = helpers.getRowHtml("0");
		ModelAndView model = new ModelAndView("TestPage");
		model.addObject("menu", html);
		return model;
	}
    @RequestMapping(value = {"/login","/login/","/Carpath/login","/Carpath/login/"})
    public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView model = new ModelAndView("LogIn");
		return model;
	}
}
