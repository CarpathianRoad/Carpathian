/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.functions;

import java.io.File;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import org.jsoup.Jsoup;
import ua.aits.Carpath.model.MenuModel;

/**
 *
 * @author kiwi
 */
public class Helpers {
    
    
    
    MenuModel menu = new MenuModel();
    public static String html2text(String html) {
        return Jsoup.parse(html).text();
    }
    
    public static List<String> listFilesForFolder(final File folder) {
        List<String> imageList = new LinkedList<>();
        for (final File fileEntry : folder.listFiles()) {
            if (fileEntry.isDirectory()) {
                listFilesForFolder(fileEntry);
            } else {
                imageList.add(fileEntry.getName());
                System.out.println(fileEntry.getName());
            }
        }
        return imageList;
    }
    public String getRowHtml(String lang, String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        List<MenuModel> tempMenu = menu.getMenuRow(lang, id);
        String clas = "";
        String clas2 ="";
        if("0".equals(id)){
            clas2 = "DropDownMenu";
        }
        if(tempMenu.size() > 0){
        
        MenuModel first = tempMenu.get(0);
        if(first.level == 2){
            clas = "menuLine";
        }
        }
        String html = "<ul class=\""+clas2+"\">\n<div class=\""+clas+"\"></div>" ;
                for(MenuModel temp : tempMenu) {
                    String idhtml = "";
                    String disableClass = "";
                    String tempUrl = "article/category/"+temp.id;
                    if(!"".equals(temp.url) && temp.url != null){
                        tempUrl = temp.url;
                    }
                    if("disable".equals(temp.url)) {
                        disableClass = "disable-menu-link";
                    }
                    if("0".equals(id)){
                        idhtml = "<div id=\""+temp.htmlID+"\"></div>";
                    }
                    html = html + "<li><a href=\""+Constants.URL+tempUrl+"\" class=\"" + disableClass + "\"><div class=\""+temp.caret+ " " + disableClass + "\"></div>"+temp.titleEN+idhtml+"</a>";
                    html = html + this.getRowHtml(lang, temp.id.toString());
                    html = html + "</li>";
                }
                html = html + "</ul>";
        return html;
    }
    public String getRowHtmlSelect(String lang, String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        List<MenuModel> tempMenu = menu.getMenuRowSelect(lang, id);
        String html = null;
        if("0".equals(id)) {
            html = "<label id=\"sel3-label\" for=\"sel3\">Category (menu)<span class=\"red-star\">*</span></label><select class=\"form-control\" name=\"menuCat\" id=\"sel3\"><option value=\"option\" disabled selected>Select option</option>";
            for(MenuModel temp : tempMenu) {
                    html = html + "<optgroup label=\""+temp.titleEN.toUpperCase()+"\">";
                    html = html + this.getRowHtmlSelect(lang, temp.id.toString());
                    html = html + "</optgroup>";
                }
            html += "</select>";
        }
        else if("2".equals(id) || "3".equals(id)) {
            for(MenuModel temp : tempMenu) {
                    if(temp.id == 92 || temp.id == 17 || temp.id == 95) {
                             html = html + "<option value=\""+temp.id+"\">&nbsp;&nbsp"+temp.titleEN.toUpperCase();
                                html = html + "</option>"; 
                         }
                    else {
                        html = html + "<optgroup label=\"&nbsp;&nbsp;"+temp.titleEN.toUpperCase()+"\">";
                        html = html + this.getRowHtmlSelect(lang, temp.id.toString());
                        html = html + "</optgroup>";
                    }
                }
        }
        else {
             for(MenuModel temp : tempMenu) {
                 if(temp.parentID == 2 || temp.parentID == 3) {
                     if(temp.id == 92 || temp.id == 17 || temp.id == 95) {
                         html = html + "<option value=\""+temp.id+"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+temp.titleEN.toUpperCase();
                            html = html + "</option>"; 
                     }
                     else {
                    html = html + "<optgroup label=\"&nbsp;&nbsp;&nbsp;&nbsp;"+temp.titleEN.toUpperCase()+"\">";
                    html = html + this.getRowHtmlSelect(lang, temp.id.toString());
                    html = html + "</optgroup>";
                     }
                 }
                 else {
                    html = html + "<option value=\""+temp.id+"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+temp.titleEN.toUpperCase();
                    html = html + "</option>";
                 }
                }
            
        }
        return html;
    }
    
    public String getRowHtmlSelectSmall(String lang, String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        List<MenuModel> tempMenu = menu.getMenuRowSelect(lang, id);
        String html = null;
        if("0".equals(id)) {
            html = "<label for=\"sel1\">Menu</label><select class=\"filter-select\" name=\"type\" id=\"menuCat\"><option value=\"all\">All</option>";
            for(MenuModel temp : tempMenu) {
                    html = html + "<optgroup label=\""+temp.titleEN.toUpperCase()+"\">";
                    html = html + this.getRowHtmlSelectSmall(lang, temp.id.toString());
                    html = html + "</optgroup>";
                }
            html += "</select>";
        }
        else if("2".equals(id) || "3".equals(id)) {
            for(MenuModel temp : tempMenu) {
                if(temp.id == 92 || temp.id == 17 || temp.id == 95) {
                         html = html + "<option value=\""+temp.id+"\"><&nbsp;&nbsp"+temp.titleEN.toUpperCase();
                            html = html + "</option>"; 
                     }
                else {
                    html = html + "<optgroup label=\"&nbsp;&nbsp;"+temp.titleEN.toUpperCase()+"\">";
                    html = html + this.getRowHtmlSelectSmall(lang, temp.id.toString());
                    html = html + "</optgroup>";
                }
                }
        }
        else {
             for(MenuModel temp : tempMenu) {
                 if(temp.parentID == 2 || temp.parentID == 3) {
                     if(temp.id == 92 || temp.id == 17 || temp.id == 95) {
                         html = html + "<option value=\""+temp.id+"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+temp.titleEN.toUpperCase();
                            html = html + "</option>"; 
                     }
                     else {
                    html = html + "<optgroup label=\"&nbsp;&nbsp;&nbsp;&nbsp;"+temp.titleEN.toUpperCase()+"\">";
                    html = html + this.getRowHtmlSelectSmall(lang, temp.id.toString());
                    html = html + "</optgroup>";
                     }
                 }
                 else {
                    html = html + "<option value=\""+temp.id+"\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+temp.titleEN.toUpperCase();
                    html = html + "</option>";
                 }
                }
            
        }
        return html;
    }
    public static String replaceChars(String text) {
        text = text.replaceAll("[\\x00-\\x1F]", "");
            text = text.replaceAll("'\\<.*?>","");
            text = text.replaceAll("'", "\\\\'");
            text = text.replaceAll("\\\"", "");
            return text;
    }
    public static Boolean checkOldArticle(String actual_date) throws ParseException{
                String date_str = actual_date.replace("/", ".");
                DateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
                Date actual = dateFormat.parse(date_str);
                Date today = new Date();
                return actual.before(today);
    }
}