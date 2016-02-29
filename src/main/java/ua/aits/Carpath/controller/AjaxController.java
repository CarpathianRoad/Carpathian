/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.ArrayUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import ua.aits.Carpath.functions.Constants;
import ua.aits.Carpath.functions.Helpers;
import ua.aits.Carpath.model.ArticleModel;
import ua.aits.Carpath.model.MenuModel;
import ua.aits.Carpath.model.RouteModel;
import ua.aits.Carpath.model.UserModel;
import java.io.ByteArrayInputStream;
import javax.imageio.ImageIO;
import sun.misc.BASE64Decoder;
/**
 *
 * @author kiwi
 */
@Controller
public class AjaxController {
    
    ArticleModel content =  new ArticleModel();
    RouteModel routes =  new RouteModel();
    Helpers helpers = new Helpers();
    MenuModel menu = new MenuModel();
    
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
            String ur = "article/full/";
            if(temp.type == 2) {
                ur = "map/markers/";
            }
        String check = "checked";
        String is_publish = "publish";
        String temp_title = temp.title;
        if(temp.title.length() > 36) {
        temp_title = temp.title.substring(0,36) + "...";
        }
        if(temp.publish == 0){ check = ""; is_publish = "";}
        returnHTML = returnHTML + "<tr><td>"+count.toString()+"</td>" +
"      <td class=\"admin-table-cell date-cell\">"+temp.date+"</td>" +
"      <td class=\"admin-table-cell-title\"><a href=\"http://www.carpathianroad.com/ua/"+ur+temp.id+"\" target=\"_blank\">"+temp_title+"</a></td>" +
"      <td class=\"admin-table-cell\">"+temp.public_country+"</td>" +
"      <td class=\"article-type admin-table-cell\">"+temp.textType+"</td>" +
"      <td class=\"catID admin-table-cell\">"+temp.menuText+"</td>" +
"      <td class=\"admin-table-cell\">"+temp.author+"</td>" +
"      <td class=\"article-publish "+is_publish+"\"><input type=\"checkbox\" data-size=\"mini\" class=\"publish-checkbox\" data-id=\""+temp.id+"\" name=\"my-checkbox\" "+check+"></td>"
                + "<td class=\""+is_publish+"\">" +
"          <a class=\"edit-button\" href=\""+Constants.URL+"system/articles/edit/"+temp.id+"\"><img class=\"edit-delete\" src=\""+Constants.URL+"img/edit.png\" /></a>" +
"      </td>" +
"      <td class=\""+is_publish+"\">" +
"          <a href=\""+Constants.URL+"system/articles/delete/"+temp.id+"\"><img class=\"edit-delete\" src=\""+Constants.URL+"img/delete.png\" /></a>" +
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
"      <td class=\"admin-table-cell-title\"><a href=\"http://www.carpathianroad.com/en/routes/"+temp.id+"\" target=\"_blank\">"+temp.title+"</a></td>" +
"      <td class=\"admin-table-cell\">"+temp.public_country+"</td>" +
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
    @RequestMapping(value = {"/build/menu/", "/build/menu"}, method = RequestMethod.GET)
    public @ResponseBody
    ResponseEntity<String> returnMenuHtml(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        HttpHeaders responseHeaders = new HttpHeaders(); 
        responseHeaders.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<>(helpers.getRowHtml(request.getParameter("lang"), "0"), responseHeaders, HttpStatus.CREATED);
    }
    @RequestMapping(value = {"/articles/loadcontent"}, method = RequestMethod.GET)
    public @ResponseBody
    ResponseEntity<String> load_content(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        HttpHeaders responseHeaders = new HttpHeaders(); 
        responseHeaders.add("Content-Type", "application/json; charset=utf-8");
        String lan = request.getParameter("lan");
        String country = request.getParameter("country");
        String type = request.getParameter("type");
        String menuCat = request.getParameter("menuCat");
        int countPage = Integer.parseInt(request.getParameter("count"));
        int countNeed = countPage + 9;
        List<ArticleModel> tempw =  content.getArticleByFilters(lan, country, type, menuCat);
        if(tempw == null) { 
        return new ResponseEntity<>("", responseHeaders, HttpStatus.CREATED);
        }
        String styleForMore = "";
        if(tempw.size() < countNeed) { 
            countNeed = tempw.size();
            styleForMore = "doNotShow";
        }
        List<ArticleModel> tempC = tempw.subList(countPage, countNeed);
        String returnHTML = "";
        for (ArticleModel temp : tempC) 
            {
                String lanURL = Constants.URL + lan + "/";
                if(countPage == 0) {
                    lanURL = Constants.URL;
                }
                if(temp.type == 2 || temp.type == 3) {
                    lanURL +="map/markers/";
                }
                else {
                    lanURL += "article/full/";
                }
                if(!"".equals(temp.avatar) && temp.avatar != null){
                        temp.setImage(temp.avatar);
                }
                String[] tempImg = temp.image.split(",");
                returnHTML = returnHTML + "<div class=\"s-cell\">\n" +
"                        <div class=\"s-block newsHeight\">\n" +
"                            <div class=\"newsImage\">\n" +
"                                <a href=\""+lanURL+temp.id+"\">\n" +
"                                    <div class=\"imageHover\">\n" +
"                                        <div class=\"imageHoverDate\">\n" +
"                                            "+temp.date+"\n" +
"                                        </div>\n" +
"                                        <div class=\"imageHoverCountry\">\n" +
"                                            <div class=\"newsCountryText\">"+temp.country+"</div><img src=\""+Constants.URL+"img/newsImageHover.png\">\n" +
"                                        </div>\n" +
"                                    </div>\n" +
"                                    <img src=\""+Constants.URL+tempImg[0]+"\" />\n" +
"                                </a>\n" +
"                            </div>\n" +
"\n" +
"                            <img class=\"newsImageUnderline\" src=\""+Constants.URL+"img/newsLine.png\">\n" +
"                            <div class=\"news_text_box\">\n" +
"                                <div class=\"news_title\"><a href=\""+lanURL+temp.id+"\">"+temp.title+"</a></div>\n" +
"                                <a href=\""+lanURL+temp.id+"\">\n" +
"                                <div class=\"news_text\">"+temp.textEN+"</div></a>\n" +
"                            </div>\n" +
"                        </div>\n" +
"                    </div> ";
            }
        returnHTML += "<div class=\"load-more-content "+styleForMore+"\"><a count=\""+countNeed+"\" class=\"btn btn-theme detailsButton\"> "
                + "<span class=\"glyphicon glyphicon-refresh\" aria-hidden=\"true\"></span>"
                + "<span class=\"load-text\">LOAD MORE</span>"
                + "</a></div>";
        return new ResponseEntity<>(returnHTML, responseHeaders, HttpStatus.CREATED);
        //return returnHTML;
    }
    @RequestMapping(value = {"/articles/loadсontentforsearch"}, method = RequestMethod.GET)
    public @ResponseBody
    ResponseEntity<String> load_content_for_search(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        HttpHeaders responseHeaders = new HttpHeaders(); 
        responseHeaders.add("Content-Type", "application/json; charset=utf-8");
        String lan = request.getParameter("lan");
        String find = request.getParameter("find");
        int countPage = Integer.parseInt(request.getParameter("count"));
        int countNeed = countPage + 9;
        String lang = lan + "/";
        if(countPage == 0) {
            lang = "";
        }
        List<ArticleModel> tempw =  content.getSearchResult(lan, find);
        if(tempw == null) { 
        return new ResponseEntity<>("", responseHeaders, HttpStatus.CREATED);
        }
        String styleForMore = "";
        if(tempw.size() < countNeed) { 
            countNeed = tempw.size();
            styleForMore = "doNotShow";
        }
        List<ArticleModel> tempC = tempw.subList(countPage, countNeed);
        String returnHTML = "";
        for (ArticleModel temp : tempC) 
            {
            String lanURL = Constants.URL + lang + "article/full/";   
        if(temp.type == 2) {
            lanURL = Constants.URL + lang + "map/markers/";
        }
        else {
            
        }
                if(!"".equals(temp.avatar) && temp.avatar != null){
                        temp.setImage(temp.avatar);
                }
                String[] tempImg = temp.image.split(",");
                returnHTML = returnHTML + "<div class=\"s-cell\">\n" +
"                        <div class=\"s-block newsHeight\">\n" +
"                            <div class=\"newsImage\">\n" +
"                                <a href=\""+lanURL+temp.id+"\">\n" +
"                                    <div class=\"imageHover\">\n" +
"                                        <div class=\"imageHoverDate\">\n" +
"                                            "+temp.date+"\n" +
"                                        </div>\n" +
"                                        <div class=\"imageHoverCountry\">\n" +
"                                            <div class=\"newsCountryText\">"+temp.country+"</div><img src=\""+Constants.URL+"img/newsImageHover.png\">\n" +
"                                        </div>\n" +
"                                    </div>\n" +
"                                    <img src=\""+Constants.URL+tempImg[0]+"\" />\n" +
"                                </a>\n" +
"                            </div>\n" +
"\n" +
"                            <img class=\"newsImageUnderline\" src=\""+Constants.URL+"img/newsLine.png\">\n" +
"                            <div class=\"news_text_box\">\n" +
"                                <div class=\"news_title\"><a href=\""+lanURL+temp.id+"\">"+temp.title+"</a></div>\n" +
"                                <a href=\""+lanURL+temp.id+"\">\n" +
"                                <div class=\"news_text\">"+temp.textEN+"</div></a>\n" +
"                            </div>\n" +
"                        </div>\n" +
"                    </div> ";
            }
        returnHTML += "<div class=\"load-more-content "+styleForMore+"\"><a count=\""+countNeed+"\" class=\"btn btn-theme detailsButton\"> "
                + "<span class=\"glyphicon glyphicon-refresh\" aria-hidden=\"true\"></span>"
                + "<span class=\"load-text\">LOAD MORE</span>"
                + "</a></div>";
        return new ResponseEntity<>(returnHTML, responseHeaders, HttpStatus.CREATED);
        //return returnHTML;
    }
    @RequestMapping(value = {"/filter_by_country_routes"}, method = RequestMethod.GET)
    public @ResponseBody
    ResponseEntity<String> routes_content_filter(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        String lan = request.getParameter("lan");
        String country = request.getParameter("country");
        String page_type = request.getParameter("page_type");
        String menu_id = request.getParameter("menu_id");
        String type = request.getParameter("type");
        System.out.println("lan = " + lan);
        System.out.println("country = " + country);
        List<RouteModel> tempR = routes.get_routes_by_country_filter(lan, country, type);
        Integer items_count = routes.get_count_routes_by_country_filter(lan, country, type);
        String returnHTML = "";
        Integer loop = 0;
        String files_array= "";
        //files_array = "[";
        System.out.println("items_count = "+ items_count);
        for (RouteModel route : tempR) 
            {
                returnHTML = returnHTML + "<div class=\"s-cell\">\n" +
        "                        <div class=\"s-block newsHeight\">\n" +
        "                            <div class=\"newsImage\">\n" +
        "                                <a href=\""+Constants.URL+lan+"/routes/"+route.id+"\">\n" +
        "                                    <div class=\"imageHover\">\n" +
        "                                        <div class=\"imageHoverDate\">\n" +
        "                                            "+route.date+"\n" +
        "                                        </div>\n" +
        "                                        <div class=\"imageHoverCountry\">\n" +
        "                                            <div class=\"newsCountryText\">"+route.public_country+"</div><img src=\""+Constants.URL+"img/newsImageHover.png\">\n" +
        "                                        </div>\n" +
        "                                        <div class=\"routeType\" id=\"type"+loop+"\"></div>\n" +
        "                                        <div class=\"routeType\" id=\"category"+loop+"\"></div>\n" +
        "                                    </div>\n" +
        "                                    <div class=\"routesListMap\" id=\"map"+loop+"\"></div>\n" +
        "                                </a>\n" +
        "                            </div>\n" +
        "                            <img class=\"newsImageUnderline\" src=\""+Constants.URL+"img/newsLine.png\">\n" +
        "                            <div class=\"news_text_box\">\n" +
        "                                <div class=\"news_title\"><a href=\""+Constants.URL+"routes/"+route.id+"\">"+route.title+"</a></div>\n" +
        "                                <a href=\""+Constants.URL+"routes/"+route.id+"\">\n" +
        "                                    <div class=\"news_text\">"+route.textUA+"</div>\n" +
        "                                </a>\n" +
        "                            </div>\n" +
        "                        </div>\n" +
        "                    </div> ";
                            files_array = files_array +route.file;
                            if(items_count-1 > loop)
                                {
                                    files_array = files_array + ",";
                                }
                            System.out.println("loop = "+ loop );
                            loop++;
                            
                    } 
        //files_array = files_array + "]";
        System.out.println(files_array);
        returnHTML = returnHTML + "<input type=\"hidden\" id=\"file_array\" value=\""+files_array+"\"/> ";
        //System.out.println("========================================"+returnHTML+"========================================");
        HttpHeaders responseHeaders = new HttpHeaders(); 
        responseHeaders.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<>(returnHTML, responseHeaders, HttpStatus.CREATED);
        //return returnHTML;
    }
    
    
    @RequestMapping(value = {"/filter_by_type_routes"}, method = RequestMethod.GET)
    public @ResponseBody
    ResponseEntity<String> routes_type_filter(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        String lan = request.getParameter("lan");
        String country = request.getParameter("country");
        String page_type = request.getParameter("page_type");
        String menu_id = request.getParameter("menu_id");
        String type = request.getParameter("type");
        System.out.println("lan = " + lan);
        System.out.println("country = " + country);
        List<RouteModel> tempR = routes.get_routes_by_country_filter(lan, country, type);
        Integer items_count = routes.get_count_routes_by_country_filter(lan, country, type);
        String returnHTML = "";
        Integer loop = 0;
        String files_array= "";
        //files_array = "[";
        System.out.println("items_count = "+ items_count);
        for (RouteModel route : tempR) 
            {
                returnHTML = returnHTML + "<div class=\"s-cell\">\n" +
        "                        <div class=\"s-block newsHeight\">\n" +
        "                            <div class=\"newsImage\">\n" +
        "                                <a href=\""+Constants.URL+lan+"routes/"+route.id+"\">\n" +
        "                                    <div class=\"imageHover\">\n" +
        "                                        <div class=\"imageHoverDate\">\n" +
        "                                            "+route.date+"\n" +
        "                                        </div>\n" +
        "                                        <div class=\"imageHoverCountry\">\n" +
        "                                            <div class=\"newsCountryText\">"+route.public_country+"</div><img src=\""+Constants.URL+"img/newsImageHover.png\">\n" +
        "                                        </div>\n" +
        "                                        <div class=\"routeType\" id=\"type"+loop+"\"></div>\n" +
        "                                        <div class=\"routeType\" id=\"category"+loop+"\"></div>\n" +
        "                                    </div>\n" +
        "                                    <div class=\"routesListMap\" id=\"map"+loop+"\"></div>\n" +
        "                                </a>\n" +
        "                            </div>\n" +
        "                            <img class=\"newsImageUnderline\" src=\""+Constants.URL+"img/newsLine.png\">\n" +
        "                            <div class=\"news_text_box\">\n" +
        "                                <div class=\"news_title\"><a href=\""+Constants.URL+lan+"/routes/"+route.id+"\">"+route.title+"</a></div>\n" +
        "                                <a href=\""+Constants.URL+lan+"/routes/"+route.id+"\">\n" +
        "                                    <div class=\"news_text\">"+route.textUA+"</div>\n" +
        "                                </a>\n" +
        "                            </div>\n" +
        "                        </div>\n" +
        "                    </div> ";
                            files_array = files_array +route.file;
                            if(items_count-1 > loop)
                                {
                                    files_array = files_array + ",";
                                }
                            System.out.println("loop = "+ loop );
                            loop++;
                            
                    } 
        //files_array = files_array + "]";
        System.out.println(files_array);
        returnHTML = returnHTML + "<input type=\"hidden\" id=\"file_array\" value=\""+files_array+"\"/> ";
        //System.out.println("========================================"+returnHTML+"========================================");
        HttpHeaders responseHeaders = new HttpHeaders(); 
        responseHeaders.add("Content-Type", "application/json; charset=utf-8");
        return new ResponseEntity<>(returnHTML, responseHeaders, HttpStatus.CREATED);
        //return returnHTML;
    }
    
    @RequestMapping(value = {"/system/downloadimage/", "/system/downloadimage"}, method = RequestMethod.POST)
    public @ResponseBody
    String downloadimage(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        String imageString = request.getParameter("url").substring(request.getParameter("url").indexOf(",")+1);
BufferedImage image = null;
byte[] imageByte;

BASE64Decoder decoder = new BASE64Decoder();
imageByte = decoder.decodeBuffer(imageString);
ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
image = ImageIO.read(bis);
bis.close();

        String ur = request.getParameter("url");
        String[] path = request.getParameter("path").split(",");
        String filename = path[path.length-1].split("\\.")[0];
        String[] newPath = (String[]) ArrayUtils.remove(path, path.length-1);
        String pathW = "";
        for(String temp : newPath) {
            pathW += temp + "/";
        }
        File outputfile = new File(Constants.home + pathW + "cropped-"+filename+".png");
        ImageIO.write(image, "png", outputfile);
        return pathW + "cropped-"+filename+".png";
    }
}
