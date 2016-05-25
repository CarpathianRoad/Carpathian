/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.controller;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ua.aits.Carpath.functions.Constants;
import ua.aits.Carpath.functions.Helpers;
import ua.aits.Carpath.functions.PageFiltersTranslate;
import ua.aits.Carpath.model.ArticleModel;
import ua.aits.Carpath.model.FilterModel;
import ua.aits.Carpath.model.MapModel;
import ua.aits.Carpath.model.MenuModel;
import ua.aits.Carpath.model.RouteModel;
import ua.aits.Carpath.model.SliderModel;

/**
 *
 * @author kiwi
 */
@Controller
@Scope("session")
public class SinglePageController {
    
	MenuModel menu = new MenuModel();
	MapModel map = new MapModel();
	ArticleModel news = new ArticleModel();
	Helpers helpers = new Helpers();
	SliderModel slider = new SliderModel();
	FilterModel filters = new FilterModel();
	PageFiltersTranslate translate = new PageFiltersTranslate();
    
	@RequestMapping(value = {"/404", "/Carpath/404"})
	public ModelAndView error404(HttpServletRequest request,
   		 HttpServletResponse response)  {
   	 ModelAndView model = new ModelAndView("/error/404");
             	model.addObject("lan", "en");
   	 return model;
    }
	@RequestMapping(value = {"/500", "/Carpath/500"})
	public ModelAndView error500(HttpServletRequest request,
   		 HttpServletResponse response)  {
            Throwable exception = (Throwable) request.getAttribute("javax.servlet.error.exception");
            String url = request.getRequestURL().toString() + "?" + request.getQueryString();
            StringWriter sw = new StringWriter();
            PrintWriter pw = new PrintWriter(sw);
            exception.printStackTrace(pw);
            //helpers.sendMail(url, sw.toString());
   	 ModelAndView model = new ModelAndView("/error/500");
             	model.addObject("lan", "en");
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
             	modelAndView.addObject("titles", translate.getTranslateFilters(lan));
             	modelAndView.addObject("slides", slider.getAllSlides(lan));
             	return modelAndView;
    }
	@RequestMapping(value = {"/{lan}/routes/{id}", "/{lan}/routes/{id}/"})
	public ModelAndView routes(@PathVariable("lan") String lan, @PathVariable("id") String id, HttpServletRequest request,
   		 HttpServletResponse response) throws Exception {

   	 RouteModel route = new RouteModel();
        	ModelAndView modelAndView = new ModelAndView("Routes");
        	modelAndView.addObject("route", route.getOneRoute(id, lan));
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
            	model.addObject("titles", translate.getTranslateFilters(lan));
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
             	for(MapModel temp: maps) {
                	if(!"".equals(temp.avatar) && temp.avatar != null){
                    	temp.setImage(temp.avatar);
                	}
            	}
            	model.addObject("htmlOnClick", filters.FiltersMain());
            	model.addObject("htmlFilters", filters.FiltersHTMLMap("0"));
   	 model.addObject("markers", maps);
            	model.addObject("lan", lan);
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
            	model.addObject("htmlOnClick", filters.FiltersMain());
            	model.addObject("htmlFilters", filters.FiltersHTMLMap("0"));
   	 model.addObject("markers", maps);
            	model.addObject("lan", lan);
   	 return model;
    }
	@RequestMapping(value = {"/{lan}/map/markers/{id}","/{lan}/map/markers/{id}/"})
	public ModelAndView marker(@PathVariable("lan") String lan, @PathVariable("id") String id, HttpServletRequest request,
   		 HttpServletResponse response) throws Exception {
    	MapModel ret  = map.getMarker(lan, id);
        if(ret.title == null) {
            ModelAndView model = new ModelAndView("/error/404");
            return model;
        }
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
    	String[] tempImg = ret.getImage().split(",");
        	if("".equals(ret.avatar) || ret.avatar == null) {
            	if("".equals(tempImg[0]) || tempImg[0] == null) {
                	ret.avatar = "img/slides/slider.png";
            	}
            	else {
                	ret.avatar = tempImg[0];
            	}
        	}
    	modelAndView.addObject("articles", points);
    	modelAndView.addObject("images", arrayMessage);
    	modelAndView.addObject("avatarvar", ret.avatar);
    	modelAndView.addObject("titlevar", ret.title);
    	modelAndView.addObject("descrvar", Helpers.html2text(ret.textEN));
    	return modelAndView;
	}
    
	@RequestMapping(value = {"/panorama/{id}"})
	public ModelAndView panorama(@PathVariable("id") String id, HttpServletRequest request,
   		 HttpServletResponse response) throws Exception {
   	 ModelAndView model = new ModelAndView("Panorama");
            	model.addObject("name",map.getPanoramaName(id));
   	 return model;
    }
	@RequestMapping(value = {"/tools/fileManager","/tools/fileManager/","/Carpath/tools/fileManager","/Carpath/tools/fileManager/"}, method = RequestMethod.GET)
    	public ModelAndView fileManager (HttpServletRequest request,
   	 HttpServletResponse response) throws Exception {
            	String path = request.getParameter("path");
            	String type = request.getParameter("type");
            	String path_main = request.getParameter("path_main");
            	String ckeditor = request.getParameter("CKEditor");
            	String num = request.getParameter("CKEditorFuncNum");
   	 ModelAndView model = new ModelAndView("/tools/FileManager");
            	model.addObject("ckeditor", ckeditor);
            	model.addObject("num", num);
            	model.addObject("type", type);
                if( !"".equals(path_main) && path_main != null) {
                    model.addObject("path_main", path_main.replace(",", "/"));
                }
                else {
                    model.addObject("path_main", "img/content/");
                }
            	if("".equals(path)) {
                	model.addObject("path",path.replace(",", "/"));
            	}
   	 return model;
	}
   	 
	@RequestMapping(value = {"/tools/imageupload/{folder}/","/tools/imageupload/{folder}","/Carpath/tools/imageupload/{folder}/","/Carpath/tools/imageupload/{folder}"}, method = RequestMethod.GET)
    	public ModelAndView fileManagerArchive (@PathVariable("folder") String folder,HttpServletRequest request,
   	 HttpServletResponse response) throws Exception {
            	String path = request.getParameter("path");
            	String type = request.getParameter("type");
            	String ckeditor = request.getParameter("CKEditor");
            	String num = request.getParameter("CKEditorFuncNum");
   	 ModelAndView model = new ModelAndView("/tools/FileDrag");
            	model.addObject("ckeditor", ckeditor);
            	model.addObject("num", num);
            	model.addObject("type", type);
            	if(folder.contains("archive_temp")){
            	model.addObject("folder", folder.replace('|', '/'));
            	}
            	else {
           	 
            	model.addObject("folder", "archive_content/"+folder.replace('|', '/'));
            	}
            	if("".equals(path)) {
                	model.addObject("path",path.replace(",", "/"));
            	}
   	 return model;
	}
   	 
	@RequestMapping(value = {"/tools/imageCrop/","/tools/imageCrop","/Carpath/tools/imageCrop/","/Carpath/tools/imageCrop"}, method = RequestMethod.GET)
    	public ModelAndView imageCrop (HttpServletRequest request,
   	HttpServletResponse response) throws Exception {
            	String file = request.getParameter("file");
                ModelAndView model = new ModelAndView("/tools/ImageCrop");
            	model.addObject("file", file.replace(',', '/'));
            	model.addObject("fileR", file);
                return model;
	}
  	 
    
	@RequestMapping(value = {"/login","/login/","/Carpath/login","/Carpath/login/"})
	public ModelAndView login(HttpServletRequest request,
   		 HttpServletResponse response) throws Exception {
    	String redir = "/Carpath/";
    	if("/".equals(Constants.URL)) {
        	redir = "/";
    	}
   	 return new ModelAndView("redirect:" + redir+"en/login");
    }
	@RequestMapping(value = {"/en/login","/en/login/","/Carpath/en/login","/Carpath/en/login/"})
	public ModelAndView loginEN(HttpServletRequest request,
   		 HttpServletResponse response) throws Exception {
                    	System.out.println(request.getHeader("referer"));
                   	 
   	 ModelAndView model = new ModelAndView("LogIn");
            	model.addObject("result", request.getHeader("referer"));
   	 return model;
    }
    
	@RequestMapping(value = {"/{lan}/search","/{lan}/search/","/Carpath/{lan}/search","/Carpath/{lan}/search/"}, method = RequestMethod.GET)
    	public ModelAndView searchResult (@PathVariable("lan") String lan, HttpServletRequest request,
   	 HttpServletResponse response) throws Exception {
            	String searchStr = request.getParameter("find");
   	 ModelAndView model = new ModelAndView("Search");
            	List<ArticleModel> articles = news.getSearchResult(lan, searchStr);
            	for(ArticleModel temp: articles) {
                	if(!"".equals(temp.avatar) && temp.avatar != null){
                    	temp.setImage(temp.avatar);
                	}
                	String[] img  = temp.image.split(",");
                	temp.setImage(img[0]);
            	}
            	model.addObject("find", searchStr);
            	model.addObject("resultList", articles);
            	model.addObject("lan", lan);
   	 return model;
	}
    
	@RequestMapping(value = {"/{lan}/sitemap/","/{lan}/sitemap"})
	public ModelAndView siteMap(@PathVariable("lan") String lan, HttpServletRequest request,
   		 HttpServletResponse response) throws Exception {
           	 
   	 ModelAndView model = new ModelAndView("SiteMap");
   	 model.addObject("mapHTML", helpers.getRowHtml(lan, "0"));
   	 return model;
    }
    
	@RequestMapping(value = {"/kiwi/test"})
	public ModelAndView kiwi(HttpServletRequest request,
   		 HttpServletResponse response) throws Exception {
   	 ModelAndView model = new ModelAndView("TestPage");
        	model.addObject("filters", filters.FiltersHTMLMap("0"));
   	 return model;
    }
}
