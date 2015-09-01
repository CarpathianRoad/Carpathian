/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import ua.aits.Carpath.functions.Helpers;
import ua.aits.Carpath.functions.PageFiltersTranslate;
import ua.aits.Carpath.model.ArticleModel;
import ua.aits.Carpath.model.MenuModel;

/**
 *
 * @author kiwi
 */
@Controller
public class ArticleController {
        
        ArticleModel news = new ArticleModel();
        MenuModel menu = new MenuModel();
        PageFiltersTranslate translate = new PageFiltersTranslate();
        
        @RequestMapping(value = {"/{lan}/article/news", "/{lan}/article/news/"})
        public ModelAndView showNews (@PathVariable("lan") String lan, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            ModelAndView modelAndView = new ModelAndView("NewsPage");
            List<ArticleModel> articles = news.getFirstNineNews(lan);
            for(ArticleModel temp: articles) {
                if(!"".equals(temp.avatar) && temp.avatar != null){
                        temp.setImage(temp.avatar);
                }
                String[] img  = temp.image.split(",");
                temp.setImage(img[0]);
            }
            modelAndView.addObject("newsList", articles);
            modelAndView.addObject("lan", lan);
            modelAndView.addObject("titles", translate.getTranslateFilters(lan));
            return modelAndView;
	}
    
        @RequestMapping(value = {"/{lan}/article/category/{id}", "/{lan}/article/category/{id}/"})
        public ModelAndView showCategory (@PathVariable("lan") String lan, @PathVariable("id") String id,HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            String page;
            Object content;
            if(!news.isHaveArticle(id)){
                page = "CategoryArticles";
                List<ArticleModel> articles = news.getByCategory(lan, id);
                for(ArticleModel temp: articles) {
                    if(!"".equals(temp.avatar) && temp.avatar != null){
                        temp.setImage(temp.avatar);
                    }
                    String[] img  = temp.image.split(",");
                    temp.setImage(img[0]);
                }
                content = articles;
            }
            else {
                page = "CategoryPage";
                content = menu.getSubCategories(lan, id);
            }
            ModelAndView modelAndView = new ModelAndView(page);
            modelAndView.addObject("contentList", content);
            modelAndView.addObject("menu_id", id);
            modelAndView.addObject("lan", lan);
            modelAndView.addObject("titles", translate.getTranslateFilters(lan));
            return modelAndView;
	}
        
        @RequestMapping(value = {"/{lan}/article/full/{id}", "/{lan}/article/full/{id}/"})
	public ModelAndView full(@PathVariable("lan") String lan, @PathVariable("id") String id, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            ModelAndView modelAndView = new ModelAndView("FullArticle");
            List<ArticleModel> articles = news.getArticleByCount(lan,id,"3");
                 for(ArticleModel temp: articles) {
                    if(!"".equals(temp.avatar) && temp.avatar != null){
                            temp.setImage(temp.avatar);
                    }
                    String[] img  = temp.image.split(",");
                    temp.setImage(img[0]);
                }
            modelAndView.addObject("articles", articles);
            ArticleModel tempArt  = news.getOneArticle(lan, id);
            if(tempArt == null) {
                 return new ModelAndView("redirect:" + "/404");
            }
            String[] tempImg = tempArt.getImage().split(",");
            if("".equals(tempArt.avatar) || tempArt.avatar == null) {
                if("".equals(tempImg[0]) || tempImg[0] == null) {
                    tempArt.avatar = "img/slides/slider.png";
                }
                else {
                    tempArt.avatar = tempImg[0];
                }
            }
            String face_text = Helpers.html2text(tempArt.textEN);
            if("".equals(Helpers.html2text(tempArt.textEN)) && !"".equals(tempArt.textEN)){
                    face_text = tempArt.title;
            }
            modelAndView.addObject("article", tempArt);
            modelAndView.addObject("main_image", tempImg[0]);
            modelAndView.addObject("images", tempImg);
            modelAndView.addObject("avatarvar", tempArt.avatar);
            modelAndView.addObject("titlevar", Helpers.replaceChars(tempArt.title));
            modelAndView.addObject("descrvar", Helpers.replaceChars(face_text));
            return modelAndView;
 
	}
        
}
