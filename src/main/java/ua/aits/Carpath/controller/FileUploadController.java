/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.controller;

/**
 *
 * @author kiwi
 */
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import javax.servlet.http.HttpServletRequest;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import ua.aits.Carpath.functions.Constants;
 
/**
 * Handles requests for the application file upload requests
 */
@Controller
public class FileUploadController {
 
    private static final Logger logger = LoggerFactory
            .getLogger(FileUploadController.class);
 
    /**
     * Upload single file using Spring Controller
     * @param file
     * @param path
     * @param request
     * @return 
     */
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public @ResponseBody
    String uploadFileHandler(@RequestParam("upload") MultipartFile file, @RequestParam("path") String path,  HttpServletRequest request) {
        
                String name = file.getOriginalFilename();
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                // Creating the directory to store file
                File dir = new File(Constants.home+path);
                if (!dir.exists())
                    dir.mkdirs();
 
                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + name);
                try (BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile))) {
                    stream.write(bytes);
                }
                String link_path = serverFile.getAbsolutePath().replace(Constants.home,"");
                return "<a href=\"#\" class=\"returnImage\" data-url='"+Constants.URL+path + name + "'>"
                        + "<img src=\""+Constants.URL+link_path+"\" realpath='"+link_path+"'  alt='" + link_path+file.getName() + "'  /><img src='"+Constants.URL+"img/remove.png' class='remove-icon'/></a>";
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload " + name
                    + " because the file was empty.";
        }
    }
 
    @RequestMapping(value = "/uploadIcon", method = RequestMethod.POST)
    public @ResponseBody
    String uploadFileHandlerMarker(@RequestParam("upload") MultipartFile file, HttpServletRequest request) {
 
                String name = file.getOriginalFilename();
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                // Creating the directory to store file
                File dir = new File(Constants.FILE_URL_ICON);
                
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + name);
                try (BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile))) {
                    stream.write(bytes);
                }
                return "<a class=\"returnImage\" data-url='"+Constants.URL+"img/markerImages/" + name + "'>"
                        + "<img src='"+Constants.URL+"img/content/" + name + "' alt='" + name + "'  /><img src='"+Constants.URL+"img/remove.png' class='remove-icon'/></a>";
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload " + name
                    + " because the file was empty.";
        }
    }
    @RequestMapping(value = "/uploadRoute", method = RequestMethod.POST)
    public @ResponseBody
    String uploadFileHandlerRoute(@RequestParam("upload") MultipartFile file, HttpServletRequest request) {
 
                String name = file.getOriginalFilename();
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                // Creating the directory to store file
                File dir = new File(Constants.FILE_URL_ROUTES);
                
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + name);
                try (BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile))) {
                    stream.write(bytes);
                }
                return name;
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload " + name
                    + " because the file was empty.";
        }
    }
    @RequestMapping(value = "/system/deleteRouteFile", method = RequestMethod.GET)
    public @ResponseBody
    String removeRouteFile(HttpServletRequest request) {
        String name = request.getParameter("name");
            File temp = new File(Constants.FILE_URL_ROUTES+name);
            Boolean result = temp.delete();
        return result.toString();
    }
    
    @RequestMapping(value = "/uploadPanorama", method = RequestMethod.POST)
    public @ResponseBody
    String uploadFileHandlerPanorama(@RequestParam("upload") MultipartFile file, HttpServletRequest request) {
 
                String name = file.getOriginalFilename();
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                // Creating the directory to store file
                File dir = new File(Constants.home+"files/panoramas/");
                
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + name);
                try (BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile))) {
                    stream.write(bytes);
                }
                return name;
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        } else {
            return "You failed to upload " + name
                    + " because the file was empty.";
        }
    }
    @RequestMapping(value = "/system/deletePanoramaFile", method = RequestMethod.GET)
    public @ResponseBody
    String removePanoramaFile(HttpServletRequest request) {
        String name = request.getParameter("name");
            File temp = new File(Constants.home+"files/panoramas/"+name);
            Boolean result = temp.delete();
        return result.toString();
    }
    @RequestMapping(value = "/showImages", method = RequestMethod.GET)
    public @ResponseBody
    String showGalery(HttpServletRequest request) {
        String folder_name = request.getParameter("name");
        String parent = request.getParameter("parent");
        String curll = "";
        if("".equals(parent) && "".equals(folder_name)){
            curll = Constants.FILE_URL;
        }
        else if("".equals(folder_name) && !"".equals(parent)) {
            curll = parent;
        }
        else {
            curll = parent + folder_name+"/";
        }
        final File directory = new File(curll);
        File[] fList = directory.listFiles();
        String htmlImg = "";
        String htmlFolder = "";
        String link_path = curll.replace(Constants.home,"");
        for (File file : fList) {
            if (file.isFile()) {
                htmlImg = htmlImg + "<div class='galery-item'><img src='"+Constants.URL+"img/remove.png' class='remove-icon'/><img type=\"img\" realpath='"+link_path+"' parent='"+curll+"' name=\""+file.getName()+"\" src=\""+Constants.URL+link_path+file.getName()+"\"/></div>";
            } else if(file.isDirectory()){
                htmlFolder = htmlFolder + "<div class='galery-item'><img src='"+Constants.URL+"img/remove.png' class='remove-icon'/><img parent='"+curll+"' realpath='"+link_path+"' type=\"folder\" name=\""+file.getName()+"\" src=\""+Constants.URL+"img/folder-green-icon.png\"/><span>"+file.getName()+"</span></div>";
            }
        }
        return htmlFolder+htmlImg;
    }
    @RequestMapping(value = "/addFolder", method = RequestMethod.GET)
    public @ResponseBody
    String addfolder(HttpServletRequest request) {
        String folder_name = request.getParameter("name");
        String path = request.getParameter("path");
        
            boolean result = false;

            try{
                 final boolean directory = new File(path+folder_name).mkdirs();
                result = true;
             } catch(SecurityException se){
                //handle it
             }        
             if(result) {    
               System.out.println("DIR created");  
             }
        return "work";
    }
    @RequestMapping(value = "/removeFileOrDir", method = RequestMethod.GET)
    public @ResponseBody
    String removeFileOrDir(HttpServletRequest request) {
        String name = request.getParameter("name");
        String path = request.getParameter("path");
            File temp = new File(path+name);
            Boolean result = temp.delete();
            System.out.println(temp.getAbsolutePath());
        return result.toString();
    } 
}