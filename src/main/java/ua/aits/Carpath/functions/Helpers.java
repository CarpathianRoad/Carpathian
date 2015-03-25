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
    public String getRowHtml(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        List<MenuModel> tempMenu = menu.getMenuRow(id);
        String html = "<ul class=\"leisureMenu\">\n" +
"                                    <div class=\"menuLine\"></div>";
                for(MenuModel temp : tempMenu) {
                    html = html + "<li><a href=\""+Constants.URL+"article/category/"+temp.id+"\">"+temp.titleEN+"<div class=\"bottom-caret\"></div><div id=\"leisureMenu\"></div></a>";
                    html = html + this.getRowHtml(temp.id.toString());
                    html = html + "</li>";
                }
                html = html + "</ul>";
        return html;
    }
}
