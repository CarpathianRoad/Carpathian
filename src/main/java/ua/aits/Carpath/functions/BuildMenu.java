/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.functions;

import java.sql.SQLException;
import java.util.List;
import ua.aits.Carpath.model.MenuModel;

/**
 *
 * @author Kiwi
 */
public final class BuildMenu {
    
    public static String menuRowen = "";
    public static String menuRowua = "";
    
    Helpers helpers = new Helpers();
    MenuModel menu = new MenuModel();
    
    public String getMenuRowen() {
        return menuRowen;
    }
    public void setMenuRowen(String menuRowen) {
        BuildMenu.menuRowen = menuRowen;
    }
    public String getMenuRowua() {
        return menuRowua;
    }
    public void setMenuRowua(String menuRowua) {
        BuildMenu.menuRowua = menuRowua;
    }
    
    public BuildMenu() throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{
        this.setMenuRowen(this.getRowHtml("0"));
        this.setMenuRowua(this.getRowHtml("0"));
    }
    
    public String getRowHtml(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        List<MenuModel> tempMenu = menu.getMenuRow("en",id);
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
                    String tempUrl = "article/category/"+temp.id;
                    if(!"".equals(temp.url) && temp.url != null){
                        tempUrl = temp.url;
                    }
                    html = html + "<li><a href=\""+Constants.URL+tempUrl+"\">"+temp.titleEN+"<div class=\""+temp.caret+"\"></div><div id=\"leisureMenu\"></div></a>";
                    html = html + this.getRowHtml(temp.id.toString());
                    html = html + "</li>";
                }
                html = html + "</ul>";
        return html;
    }
}
