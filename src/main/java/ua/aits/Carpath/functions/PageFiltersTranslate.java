/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.functions;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Kiwi
 */
public class PageFiltersTranslate {
    public String countryUA;
    public String countrySK;
    public String countryPL;
    public String countryHU;
    public String countryRO;
    public String countryALL;
    
    public String routeWAL;
    public String routeSKI;
    public String routeHOR;
    public String routeBIC;
    public String routeWAT;
    public String routeALL;
    
    
    
    public String getCountryALL() {
        return countryALL;
    }
    public void setCountryALL(String countryALL) {
        this.countryALL = countryALL;
    }
    public String getCountryUA() {
        return countryUA;
    }
    public void setCountryUA(String countryUA) {
        this.countryUA = countryUA;
    }
    public String getCountrySK() {
        return countrySK;
    }
    public void setCountrySK(String countrySK) {
        this.countrySK = countrySK;
    }
    public String getCountryPL() {
        return countryPL;
    }
    public void setCountryPL(String countryPL) {
        this.countryPL = countryPL;
    }
    public String getCountryHU() {
        return countryHU;
    }
    public void setCountryHU(String countryHU) {
        this.countryHU = countryHU;
    }
    
    public String getCountryRO() {
        return countryRO;
    }
    public void setCountryRO(String countryRO) {
        this.countryRO = countryRO;
    }
    
    public String getRouteALL() {
        return routeALL;
    }
    public void setRouteALL(String routeALL) {
        this.routeALL = routeALL;
    }
    
    public String getRouteWAL() {
        return routeWAL;
    }
    public void setRouteWAL(String routeWAL) {
        this.routeWAL = routeWAL;
    }
    
    public String getRouteHOR() {
        return routeHOR;
    }
    public void setRouteHOR(String routeHOR) {
        this.routeHOR = routeHOR;
    }
    
    public String getRouteSKI() {
        return routeSKI;
    }
    public void setRouteSKI(String routeSKI) {
        this.routeSKI = routeSKI;
    }
    
    public String getRouteWAT() {
        return routeWAT;
    }
    public void setRouteWAT(String routeWAT) {
        this.routeWAT = routeWAT;
    }
    
    public String getRouteBIC() {
        return routeBIC;
    }
    public void setRouteBIC(String routeBIC) {
        this.routeBIC = routeBIC;
    }
    
    public PageFiltersTranslate getTranslateFilters(String lang) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException{
        lang = lang.toUpperCase();
        ResultSet result = DB.getResultSet("select name,"+lang+" from translate");
        PageFiltersTranslate titles = new PageFiltersTranslate();
        Map<String, String> myMap = new HashMap<>();
        int column1Pos = result.findColumn("name");
        int column2Pos = result.findColumn(lang);
        while (result.next()) {
            String column1 = result.getString(column1Pos);
            String column2 = result.getString(column2Pos);
            myMap.put(column1, column2);
        }
        
        titles.setCountryALL(myMap.get("setCountryALL"));
        titles.setCountryUA(myMap.get("setCountryUA"));
        titles.setCountryHU(myMap.get("setCountryHU"));
        titles.setCountryPL(myMap.get("setCountryPL"));
        titles.setCountrySK(myMap.get("setCountrySK"));
        titles.setCountryRO(myMap.get("setCountryRO"));

        titles.setRouteALL(myMap.get("setRouteALL"));
        titles.setRouteBIC(myMap.get("setRouteBIC"));
        titles.setRouteHOR(myMap.get("setRouteHOR"));
        titles.setRouteSKI(myMap.get("setRouteSKI"));
        titles.setRouteWAL(myMap.get("setRouteWAL"));
        titles.setRouteWAT(myMap.get("setRouteWAT"));
        
        DB.closeCon();
        return titles;
    }
    public String translateCountryByLan(String lan, String country) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        String translate;
        PageFiltersTranslate titles = this.getTranslateFilters(lan);
        if("Ukraine".equals(country) || "Украина".equals(country) || "Україна".equals(country)) {
            translate = titles.getCountryUA();
        }
        else if("Румыния".equals(country) || "Romania".equals(country) || "Румунія".equals(country)){
            translate = titles.getCountryRO();
        }
        else if("Словаччина".equals(country) || "Словакия".equals(country) || "Slovakia".equals(country)){
            translate = titles.getCountrySK();
        }
        else if("Венгрия".equals(country) || "Hungary".equals(country) || "Угорщина".equals(country)){
            translate = titles.getCountryHU();
        }
        else if("Польша".equals(country) || "Poland".equals(country) || "Польща".equals(country)){
            translate = titles.getCountryPL();
        }
        else {
            translate = titles.getCountryUA();
        }
        return translate;
    }
}



