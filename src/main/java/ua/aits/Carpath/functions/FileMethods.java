/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.functions;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author kiwi
 */
public class FileMethods {
    
    public String createTempDir(){
        Date date_format = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy-HH-mm-SS");
        String folder = "archive_temp/temp-"+sdf.format(date_format);
        try {
            final boolean directory = new File(Constants.home + folder).mkdirs();
            return folder;
        } 
        catch(SecurityException se) {
            return se.toString();
        }  
    }
    
    public void removeDir(String path) throws IOException {
        File temp = new File(path);
        FileUtils.deleteDirectory(temp);
    } 
    
    public String moveAllFilesFromArchiveDir(String path, String title, String category) throws IOException {
        Date date_format = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy-HH-mm-SS");
        File temp = new File(path);
        String basePath = Constants.home + "archive_content/" + category + "/" + title.replaceAll("\\s","_") + "_" + sdf.format(date_format);
        final boolean directory = new File(basePath).mkdirs();
        File dest = new File(basePath);
        FileUtils.copyDirectory(temp, dest);
        return category + "/" + title.replaceAll("\\s","_") + "_" + sdf.format(date_format);
    }
    
    private long getFolderSize(File folder) {
        long length = 0;
        File[] files = folder.listFiles();
        for (File file : files) {
            if (file.isFile()) {
                length += file.length();
            }
            else {
                length += getFolderSize(file);
            }
        }
        return length;
    }
    public String getReadableSize(String path, Integer format) {
        File folder = new File(path);
        long size;
        if(folder.isFile()){
            size = folder.length();
        }
        else {
            size = getFolderSize(folder);
        }
        String[] units = new String[] { "B", "KB", "MB", "GB", "TB" };
        if(size == 0) {
            return "0 " + units[format];
        }
        int unitIndex = (int) (Math.log10(size) / format);
        double unitValue = 1 << (unitIndex * 10);
        String readableSize = new DecimalFormat("#,##0.#").format(size / unitValue) + " " + units[unitIndex];
        return readableSize;
    }
    public String filesInFolderHTML(String path){
        File folder = new File(path);
        File[] files = folder.listFiles();
        String returnHTML = "";
        for (File file : files) {
            if (file.isFile()) {
        System.out.println(path + file.getName());
                returnHTML +=
                        "<div class=\"dz-preview dz-file-preview dz-processing dz-success dz-complete\"> "
                            + "<div class=\"dz-image\"><img data-dz-thumbnail=\"\"></div>  "
                            + "<div class=\"dz-details\">"
                                + "<div class=\"dz-size\"><span data-dz-size=\"\">"+getReadableSize(path + file.getName(), 3)+"</span></div>"
                                + "<div class=\"dz-filename\"><span data-dz-name=\"\">"+file.getName()+"</span></div>"
                            + "</div>"
                            + "<div class=\"dz-error-message\"><span data-dz-errormessage=\"\"></span></div>"
                            + "<div class=\"dz-success-mark\"></div>"
                            + "<a class=\"dz-remove\" href=\"javascript:undefined;\" onclick=\"deleteFile(this)\" data-dz-remove=\"\">Remove file</a>"
                        + "</div>";
            }
        }
        return returnHTML;
    }
}
