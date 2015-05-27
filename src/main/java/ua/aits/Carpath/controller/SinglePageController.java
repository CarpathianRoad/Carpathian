/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.controller;

import java.nio.charset.StandardCharsets;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ua.aits.Carpath.functions.Constants;
import ua.aits.Carpath.functions.Helpers;
import ua.aits.Carpath.model.ArticleModel;
import ua.aits.Carpath.model.MapModel;
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
    
    @RequestMapping(value = {"/404", "/Carpath/404"})
    public ModelAndView error404(HttpServletRequest request,
			HttpServletResponse response)  {
		ModelAndView model = new ModelAndView("/error/404");
		return model;
	}
    @RequestMapping(value = {"/500", "/Carpath/500"})
    public ModelAndView error500(HttpServletRequest request,
			HttpServletResponse response)  {
		ModelAndView model = new ModelAndView("/error/500");
		return model;
	}
    @RequestMapping(value = {"/{lan}/index", "/{lan}/main", "/{lan}/home"}, method = RequestMethod.GET)
    protected ModelAndView handleRequestInternal(@PathVariable("lan") String lan, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		 ArticleModel content = new ArticleModel();
                 ModelAndView modelAndView = new ModelAndView("Index");
                 modelAndView.addObject("lan", lan);
                 List<ArticleModel> articles = content.getArticleByCount(lan,"0","9");
                 List<MapModel> points = map.getPointsByCount(lan,"0","9");
                 for(ArticleModel temp: articles) {
                    if(!"".equals(temp.avatar) && temp.avatar != null){
                            temp.setImage(temp.avatar);
                    }
                    String[] img  = temp.image.split(",");
                    temp.setImage(img[0]);
                }
                 for(MapModel temp: points) {
                    if(!"".equals(temp.avatar) && temp.avatar != null){
                            temp.setImage(temp.avatar);
                    }
                    String[] img  = temp.image.split(",");
                    temp.setImage(img[0]);
                }
                 modelAndView.addObject("content", articles);
                 modelAndView.addObject("points", points);
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
    @RequestMapping(value = {"/{lan}/map/{pointer}","/{lan}/map/{pointer}/"})
    public ModelAndView mapCountry(@PathVariable("lan") String lan, @PathVariable("pointer") String pointer, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
                List<MapModel> maps = map.getAllPoints(lan);
		ModelAndView model = new ModelAndView("Map");
                if (StringUtils.isNumeric(pointer)) {
                    model.addObject("id", pointer);
                }
                else {
                    model.addObject("country",pointer);
                }
		model.addObject("markers", maps);
		return model;
	}
    @RequestMapping(value = {"/{lan}/map/","/{lan}/map"})
    public ModelAndView map(@PathVariable("lan") String lan, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
                List<MapModel> maps = map.getAllPoints(lan);
		ModelAndView model = new ModelAndView("Map");
                for(MapModel temp: maps) {
                    if(!"".equals(temp.avatar) && temp.avatar != null){
                        temp.setImage(temp.avatar);
                    }
                }
		model.addObject("markers", maps);
                model.addObject("lan", lan);
		return model;
	}
    @RequestMapping(value = {"/{lan}/map/markers/{id}","/{lan}/map/markers/{id}/"})
    public ModelAndView marker(@PathVariable("lan") String lan, @PathVariable("id") String id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
        MapModel ret  = map.getMarker(lan, id);
        if(ret.getMarkerIcon() == null || "".equals(ret.getMarkerIcon())) {
                            ret.setMarkerIcon("gardens");
                        }
                        if(ret.getTextEN() == null || "".equals(ret.getTextEN())) {
                            ret.setTextEN("Lorem ipsum dolor sit amet consectetur adipiscing elit Donec vitae pulvinar massa Cras urna enim, ornare vel mollis id, maximus quis tellus. Aliquam ac ante tristique lectus molestie auctor in id felis. Aliquam tempus nulla at interdum lobortis. Donec et suscipit nibh, vel consequat lectus.");
                        }
        String[] arrayMessage = ret.getImage().split(",");
        ModelAndView modelAndView = new ModelAndView("Markers");
        modelAndView.addObject("marker", ret);
        List<MapModel> points = map.getPointsByCount(lan,id,"3");
                 for(MapModel temp: points) {
                    if(!"".equals(temp.avatar) && temp.avatar != null){
                            temp.setImage(temp.avatar);
                    }
                    String[] img  = temp.image.split(",");
                    temp.setImage(img[0]);
                }
        modelAndView.addObject("articles", points);
        modelAndView.addObject("images", arrayMessage);
        return modelAndView;
    }
    
    @RequestMapping(value = {"/kiwi/test"})
    public ModelAndView kiwi(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView model = new ModelAndView("TestPage");
		return model;
	}
    @RequestMapping(value = {"/tools/fileManager","/tools/fileManager/"}, method = RequestMethod.GET)
        public ModelAndView fileManager (HttpServletRequest request,
		HttpServletResponse response) throws Exception {
                String path = request.getParameter("path");
                String type = request.getParameter("type");
                String ckeditor = request.getParameter("CKEditor");
                String num = request.getParameter("CKEditorFuncNum");
		ModelAndView model = new ModelAndView("/tools/FileManager");
                model.addObject("ckeditor", ckeditor);
                model.addObject("num", num);
                model.addObject("type", type);
                if("".equals(path)) {
                    model.addObject("path",path.replace(",", "/"));
                }
		return model;
    }
        
    
    @RequestMapping(value = {"/login","/login/","/Carpath/login","/Carpath/login/"})
    public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return new ModelAndView("redirect:" + "/en/login");
	}
    @RequestMapping(value = {"/en/login","/en/login/","/Carpath/en/login","/Carpath/en/login/"})
    public ModelAndView loginEN(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView model = new ModelAndView("LogIn");
		return model;
	}
    
    @RequestMapping(value = {"/{lan}/search","/{lan}/search/","/Carpath/{lan}/search","/Carpath/{lan}/search/"}, method = RequestMethod.GET)
        public ModelAndView searchResult (@PathVariable("lan") String lan, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
                String searchStr = request.getParameter("find");
                if(!"/Carpath/".equals(Constants.URL)){
                    byte[] bytes = searchStr.getBytes(StandardCharsets.ISO_8859_1);
                    searchStr = new String(bytes, StandardCharsets.UTF_8);
                }
		ModelAndView model = new ModelAndView("Search");
                List<ArticleModel> articles = news.getSearchResult(lan, searchStr);
                for(ArticleModel temp: articles) {
                    if(!"".equals(temp.avatar) && temp.avatar != null){
                        temp.setImage(temp.avatar);
                    }
                    String[] img  = temp.image.split(",");
                    temp.setImage(img[0]);
                }
                model.addObject("resultList", articles);
		return model;
    }
    
    @RequestMapping(value = {"/{lan}/sitemap/","/{lan}/sitemap"})
    public ModelAndView siteMap(@PathVariable("lan") String lan, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
                
		ModelAndView model = new ModelAndView("SiteMap");
		model.addObject("mapHTML", helpers.getRowHtml(lan, "0"));
		return model;
	}
}
