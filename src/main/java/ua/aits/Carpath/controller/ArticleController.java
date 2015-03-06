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

/**
 *
 * @author kiwi
 */
@Controller
public class ArticleController {
    
        @RequestMapping(value = {"/article/news", "/article/news/"})
        public ModelAndView showNews (HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            ArticleModel news = new ArticleModel();
            ModelAndView modelAndView = new ModelAndView("NewsPage");
            List<ArticleModel> articles = news.getAllNews();
            for(ArticleModel temp: articles) {
                String[] img  = temp.image.split(",");
                temp.setImage(img[0]);
            }
            modelAndView.addObject("newsList", articles);
            return modelAndView;
	}
    
        
        @RequestMapping(value = {"/article/advs", "/article/advs/"})
        public ModelAndView showAdv (HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            ArticleModel news = new ArticleModel();
            ModelAndView modelAndView = new ModelAndView("AdvsPage");
            modelAndView.addObject("advsList", news.getAllAdv());
            return modelAndView;
	}
        
        @RequestMapping(value = {"/article/category/{id}", "/article/category/{id}/"})
        public ModelAndView showCategory (@PathVariable("id") String id,HttpServletRequest request,
		HttpServletResponse response) throws Exception {
            ArticleModel news = new ArticleModel();
            ModelAndView modelAndView = new ModelAndView("CategoryPage");
            modelAndView.addObject("contentList", news.getByCategory(id));
            return modelAndView;
	}
        
        @RequestMapping(value = {"/article/full/{id}", "/article/full/{id}/"})
	public ModelAndView full(@PathVariable("id") String id, HttpServletRequest request,
		HttpServletResponse response) throws Exception {
 
            ArticleModel news = new ArticleModel();
            ModelAndView modelAndView = new ModelAndView("FullArticle");
            modelAndView.addObject("article", news.getOneArticle(id));
            return modelAndView;
 
	}
        
}
