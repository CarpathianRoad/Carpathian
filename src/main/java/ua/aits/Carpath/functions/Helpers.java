/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.functions;

import java.io.File;
import java.sql.SQLException;
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
    public static String replaceChars(String text) {
        text = text.replaceAll("[\\x00-\\x1F]", "");
            text = text.replaceAll("'\\<.*?>","");
            text = text.replaceAll("'", "\\\\'");
            text = text.replaceAll("\\\"", "");
            return text;
    }
}