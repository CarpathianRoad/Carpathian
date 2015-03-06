/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.functions;

import java.io.File;
import java.util.LinkedList;
import java.util.List;
import org.jsoup.Jsoup;

/**
 *
 * @author kiwi
 */
public class Helpers {
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
}
