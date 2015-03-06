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
import java.util.LinkedList;
import java.util.List;
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
import ua.aits.Carpath.functions.Helpers;
 
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
     * @param request
     * @return 
     */
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public @ResponseBody
    String uploadFileHandler(@RequestParam("upload") MultipartFile file, HttpServletRequest request) {
 
                String name = file.getOriginalFilename();
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                // Creating the directory to store file
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(Constants.FILE_URL);
                if (!dir.exists())
                    dir.mkdirs();
 
                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + name);
                try (BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile))) {
                    stream.write(bytes);
                }
 
                logger.info("Server File Location="
                        + serverFile.getAbsolutePath());
 
                return "<a href=\"#\" class=\"returnImage\" data-url='"+Constants.URL+"img/markerImages/" + name + "'>"
                        + "<img src='"+Constants.URL+"img/content/" + name + "' alt='" + name + "'  /><img src='"+Constants.URL+"img/remove.png' class='remove-icon'/></a>";
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
    @RequestMapping(value = "/showImages")
    public @ResponseBody
    String showGalery(HttpServletRequest request) {
        final File folder = new File(Constants.FILE_URL);
        List<String> imgName = Helpers.listFilesForFolder(folder);
        String htmlText = "";
        for (String temp : imgName) {
            htmlText = htmlText + "<img name=\""+temp+"\" src=\""+Constants.URL+"img/content/"+temp+"\"/>";
        }
        return htmlText;
    }
    
}