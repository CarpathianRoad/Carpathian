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
        
        @RequestMapping(value = {"/{lan}/article/news", "/{lan}/article/news/"})
        public ModelAndView showNews (@PathVariable("lan") String lan, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            ModelAndView modelAndView = new ModelAndView("NewsPage");
            List<ArticleModel> articles = news.getAllNews(lan);
            for(ArticleModel temp: articles) {
                String[] img  = temp.image.split(",");
                temp.setImage(img[0]);
            }
            modelAndView.addObject("newsList", articles);
            modelAndView.addObject("lan", lan);
            return modelAndView;
	}
    
        
        @RequestMapping(value = {"/{lan}/article/advs", "/{lan}/article/advs/"})
        public ModelAndView showAdv (@PathVariable("lan") String lan, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            ModelAndView modelAndView = new ModelAndView("AdvsPage");
            modelAndView.addObject("advsList", news.getAllAdv());
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
            return modelAndView;
	}
        
        @RequestMapping(value = {"/{lan}/article/full/{id}", "/{lan}/article/full/{id}/"})
	public ModelAndView full(@PathVariable("lan") String lan, @PathVariable("id") String id, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            ModelAndView modelAndView = new ModelAndView("FullArticle");
            modelAndView.addObject("articles", news.getArticleByCount(lan,"3"));
            ArticleModel tempArt  = news.getOneArticle(lan, id);
            String[] tempImg = tempArt.getImage().split(",");
            modelAndView.addObject("main_image", tempImg[0]);
            modelAndView.addObject("article", news.getOneArticle(lan,id));
            modelAndView.addObject("images", tempImg);
            return modelAndView;
 
	}
        
}
