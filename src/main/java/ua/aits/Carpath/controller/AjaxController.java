/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import ua.aits.Carpath.functions.Constants;
import ua.aits.Carpath.model.ArticleModel;
import ua.aits.Carpath.model.MenuModel;
import ua.aits.Carpath.model.RouteModel;
import ua.aits.Carpath.model.UserModel;

/**
 *
 * @author kiwi
 */
@Controller
public class AjaxController {
    
    ArticleModel content =  new ArticleModel();
    RouteModel routes =  new RouteModel();
    @RequestMapping(value = {"/system/checkLoginPass/", "/system/checkLoginPass"}, method = RequestMethod.GET)
    public @ResponseBody
    String checkLoginPass(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        UserModel user = new UserModel();
        if(user.isExitsUser(request.getParameter("login"), request.getParameter("password"))) {
        return "true";
        }
        else {
            return "false";
        }
    }
    @RequestMapping(value = {"/system/returnCatTitle/", "/system/returnCatTitle"}, method = RequestMethod.GET)
    public @ResponseBody
    String returnCatTitle(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        MenuModel menu = new MenuModel();
        String temp = menu.getCatTitle(request.getParameter("id"));
        return temp;
    }
    
    @RequestMapping(value = {"/system/changePublish/", "/system/changePublish"}, method = RequestMethod.GET)
    public @ResponseBody
    String changePublish(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String status = request.getParameter("status");
        if(content.publishArticle(id, status)) {return "true";}
        else {return "false";}
    }
    @RequestMapping(value = {"/system/contentByType/", "/system/contentByType"}, method = RequestMethod.GET)
    public @ResponseBody
    ResponseEntity<String> contentByType(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        String username = request.getParameter("username");
        String type = request.getParameter("type");
        String value = request.getParameter("value");
        int countPage = Integer.parseInt(request.getParameter("count"));
        int page = Integer.parseInt(request.getParameter("page"));
        List<ArticleModel> tempC = content.getAllContentByType(username, type, value);
        
        String returnHTML = "";
        String pagination = "<tr><td colspan=\"10\" class=\"pagination\">";
        int first = (countPage*page)-countPage;
        int second = countPage*page;
        if(countPage*page > tempC.size()){
            first = (page-1)*countPage;
            second = tempC.size();
        }
        
        Integer count = tempC.size()-(first);
        List<ArticleModel> tempS = tempC.subList(first, second);
        for (ArticleModel temp : tempS) {
        String check = "checked";
        String is_publish = "publish";
        if(temp.publish == 0){ check = ""; is_publish = "";}
        returnHTML = returnHTML + "<tr><td class=\"admin-table-count\">"+count.toString()+"</td>" +
"      <td class=\"admin-table-cell date-cell\">"+temp.date+"</td>" +
"      <td class=\"admin-table-cell-title\"><a href=\""+Constants.URL+"article/full/"+temp.id+"\" target=\"_blank\">"+temp.title+"</a></td>" +
"      <td class=\"admin-table-cell\">"+temp.public_country+"</td>" +
"      <td class=\"article-type admin-table-cell\">"+temp.textType+"</td>" +
"      <td class=\"catID admin-table-cell\">"+temp.menuText+"</td>" +
"      <td class=\"admin-table-cell\">"+temp.author+"</td>" +
"      <td class=\"article-publish "+is_publish+"\"><input type=\"checkbox\" data-size=\"mini\" class=\"publish-checkbox\" data-id=\""+temp.id+"\" name=\"my-checkbox\" "+check+"></td>"
                + "<td class=\""+is_publish+"\">" +
"          <a class=\"edit-button\" href=\""+Constants.URL+"system/edit/"+temp.id+"\"><img class=\"edit-delete\" src=\""+Constants.URL+"img/edit.png\" /></a>" +
"      </td>" +
"      <td class=\""+is_publish+"\">" +
"          <a href=\""+Constants.URL+"system/delete/"+temp.id+"\"><img class=\"edit-delete\" src=\""+Constants.URL+"img/delete.png\" /></a>" +
"      </td>"+
"    </tr>";
        count--;
        }
        Double x = Math.ceil((double)tempC.size() / countPage);
        int pages = x.intValue();
        System.out.println(x + "///" + count/countPage + "///" + pages + "///" + count + "////" + countPage);
        for(int i = 1; i <= pages; i++){
            pagination = pagination + "<a>"+i+"</a>";
        }
        returnHTML = returnHTML + pagination+"</td></tr>";
        HttpHeaders responseHeaders = new HttpHeaders(); 
        responseHeaders.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<>(returnHTML, responseHeaders, HttpStatus.CREATED);
    
    }
    @RequestMapping(value = {"/system/changePublishRoute/", "/system/changePublishRoute"}, method = RequestMethod.GET)
    public @ResponseBody
    String changePublishRoute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String status = request.getParameter("status");
        if(routes.publishRoute(id, status)) {return "true";}
        else {return "false";}
    }
    @RequestMapping(value = {"/system/routesByType/", "/system/routesByType"}, method = RequestMethod.GET)
    public @ResponseBody
    ResponseEntity<String> routesByType(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        String type = request.getParameter("type");
        String value = request.getParameter("value");
        int countPage = Integer.parseInt(request.getParameter("count"));
        int page = Integer.parseInt(request.getParameter("page"));
        List<RouteModel> tempRoutes = routes.getAllRoutesSystem(type, value);
        String returnHTML = "";
        String pagination = "<tr><td colspan=\"10\" class=\"pagination\">";
        int first = (countPage*page)-countPage;
        int second = countPage*page;
        if(countPage*page > tempRoutes.size()){
            first = (page-1)*countPage;
            second = tempRoutes.size();
        }
        Integer count = tempRoutes.size()-(first);
        List<RouteModel> tempS = tempRoutes.subList(first, second);
        for (RouteModel temp : tempS) {
        String check = "checked";
        String is_publish = "publish";
        System.out.println(temp.id);
        if(temp.publish == 0){ check = ""; is_publish = "";}
        returnHTML = returnHTML + "<tr><td class=\"admin-table-count\">"+count.toString()+"</td>" +
"      <td class=\"admin-table-cell-title\"><a href=\""+Constants.URL+"routes/"+temp.id+"\" target=\"_blank\">"+temp.title+"</a></td>" +
"      <td class=\"admin-table-cell\">"+temp.country+"</td>" +
"      <td class=\"article-type admin-table-cell\">"+temp.textType+"</td>" +
"      <td class=\"article-publish "+is_publish+"\"><input type=\"checkbox\" data-size=\"mini\" class=\"publish-checkbox\" data-id=\""+temp.id+"\" name=\"my-checkbox\" "+check+"></td>"
                + "<td class=\""+is_publish+"\">" +
"          <a class=\"edit-button\" href=\""+Constants.URL+"system/routes/edit/"+temp.id+"\"><img class=\"edit-delete\" src=\""+Constants.URL+"img/edit.png\" /></a>" +
"      </td>" +
"      <td class=\""+is_publish+"\">" +
"          <a href=\""+Constants.URL+"system/routes/delete/"+temp.id+"\"><img class=\"edit-delete\" src=\""+Constants.URL+"img/delete.png\" /></a>" +
"      </td>"+
"    </tr>";
        count--;
        }
        Double x = Math.ceil((double)tempRoutes.size() / countPage);
        int pages = x.intValue();
        System.out.println(x + "///" + count/countPage + "///" + pages + "///" + count + "////" + countPage);
        for(int i = 1; i <= pages; i++){
            pagination = pagination + "<a>"+i+"</a>";
        }
        returnHTML = returnHTML + pagination+"</td></tr>";
        HttpHeaders responseHeaders = new HttpHeaders(); 
        responseHeaders.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<>(returnHTML, responseHeaders, HttpStatus.CREATED);
    }
    @RequestMapping(value = {"/upload/type/image/", "/upload/type/image"}, method = RequestMethod.POST)
    public @ResponseBody String handleFileUpload(@RequestParam("name") String name,
            @RequestParam("file") MultipartFile file){
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                try (BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(name)))) {
                    stream.write(bytes);
                }
                return "You successfully uploaded " + name + "!";
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload " + name + " because the file was empty.";
        }
    }
}
