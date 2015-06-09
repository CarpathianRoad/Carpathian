/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.functions;

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
    
    public PageFiltersTranslate getTranslateFilters(String lang) {
        PageFiltersTranslate titles = new PageFiltersTranslate();
        switch(lang.toUpperCase()) {
            case "UA" :
                titles.setCountryALL("ВСІ КРАЇНИ");
                titles.setCountryUA("УКРАЇНА");
                titles.setCountryHU("УГОРЩИНА");
                titles.setCountryPL("ПОЛЬЩА");
                titles.setCountrySK("СЛОВАЧЧИНА");
                titles.setCountryRO("РУМУНІЯ");
                
                titles.setRouteALL("ВСІ ВИДИ");
                titles.setRouteBIC("ВЕЛОСИПЕДНІ");
                titles.setRouteHOR("КІННІ");
                titles.setRouteSKI("ЛИЖНІ");
                titles.setRouteWAL("ПІШІ");
                titles.setRouteWAT("ВОДНІ");
                break;
            case "EN": 
                titles.setCountryALL("ALL COUNTRIES");
                titles.setCountryUA("UKRAINE");
                titles.setCountryHU("HUNGARY");
                titles.setCountryPL("POLAND");
                titles.setCountrySK("SLOVAKIA");
                titles.setCountryRO("ROMANIA");
                
                titles.setRouteALL("ALL METHODS");
                titles.setRouteBIC("BICYCLE");
                titles.setRouteHOR("HORSES");
                titles.setRouteSKI("SKI");
                titles.setRouteWAL("WALK");
                titles.setRouteWAT("WATER");
                break;
            case "SK": 
                titles.setCountryALL("VSE DR?AVE");
                titles.setCountryUA("UKRAJINA");
                titles.setCountryHU("MAD?ARSKA");
                titles.setCountryPL("POLJSKA");
                titles.setCountrySK("SLOVA?KA");
                titles.setCountryRO("ROMUNIJA");
                
                titles.setRouteALL("VSE METODE");
                titles.setRouteBIC("KOLO");
                titles.setRouteHOR("KONJI");
                titles.setRouteSKI("SMU?I");
                titles.setRouteWAL("HOJA");
                titles.setRouteWAT("VODA");
                break;
            case "HU": 
                titles.setCountryALL("?sszes orsz?g");
                titles.setCountryUA("UKRAJNA");
                titles.setCountryHU("MAGYARORSZ?G");
                titles.setCountryPL("LENGYELORSZ?G");
                titles.setCountrySK("SZLOV?KIA");
                titles.setCountryRO("ROM?NIA");
                
                titles.setRouteALL("Minden m?dszer");
                titles.setRouteBIC("KER?KP?R");
                titles.setRouteHOR("L?");
                titles.setRouteSKI("s?el");
                titles.setRouteWAL("S?TA");
                titles.setRouteWAT("V?Z");
                break;
            case "RO": 
                titles.setCountryALL("TOATE TARILE");
                titles.setCountryUA("UKRAINE");
                titles.setCountryHU("UNGARIA");
                titles.setCountryPL("POLONIA");
                titles.setCountrySK("SLOVACIA");
                titles.setCountryRO("ROM?NIA");
                
                titles.setRouteALL("Toate metodele");
                titles.setRouteBIC("BICICLETA");
                titles.setRouteHOR("CAI");
                titles.setRouteSKI("SKI");
                titles.setRouteWAL("plimbare");
                titles.setRouteWAT("APA");
                break;
            default:
                titles.setCountryALL("ALL COUNTRIES");
                titles.setCountryUA("UKRAINE");
                titles.setCountryHU("HUNGARY");
                titles.setCountryPL("POLAND");
                titles.setCountrySK("SLOVAKIA");
                titles.setCountryRO("ROMANIA");
                
                titles.setRouteALL("ALL METHODS");
                titles.setRouteBIC("BICYCLE");
                titles.setRouteHOR("HORSES");
                titles.setRouteSKI("SKI");
                titles.setRouteWAL("WALK");
                titles.setRouteWAT("WATER");
                break;
        }
        return titles;
    }
    public String translateCountryByLan(String lan, String country) {
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



