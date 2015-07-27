/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.model;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import org.apache.commons.lang.StringEscapeUtils;
import ua.aits.Carpath.functions.Constants;
import ua.aits.Carpath.functions.DB;
import ua.aits.Carpath.functions.Helpers;

/**
 *
 * @author kiwi
 */
public class ArchiveArticleModel {
    public Integer article_id;
    public String article_title_en;
    public String article_title_ua;
    public String article_title_hu;
    public String article_title_sk;
    public String article_title_ro;
    public String article_text_en;
    public String article_text_ua;
    public String article_text_hu;
    public String article_text_sk;
    public String article_text_ro;
    public Integer article_category;
    public String article_author;
    public String article_editor;
    public String article_add_date;
    public String article_edit_date;
    public Integer article_is_edit;
    public Integer article_is_delete;
    public Integer article_is_publish;
    public String article_dir;
    public String article_file_size;

    public Integer getArticle_id() {
        return article_id;
    }

    public void setArticle_id(Integer article_id) {
        this.article_id = article_id;
    }

    public String getArticle_title_en() {
        return article_title_en;
    }

    public void setArticle_title_en(String article_title_en) {
        this.article_title_en = article_title_en;
    }

    public String getArticle_title_ua() {
        return article_title_ua;
    }

    public void setArticle_title_ua(String article_title_ua) {
        this.article_title_ua = article_title_ua;
    }

    public String getArticle_title_hu() {
        return article_title_hu;
    }

    public void setArticle_title_hu(String article_title_hu) {
        this.article_title_hu = article_title_hu;
    }

    public String getArticle_title_sk() {
        return article_title_sk;
    }

    public void setArticle_title_sk(String article_title_sk) {
        this.article_title_sk = article_title_sk;
    }

    public String getArticle_title_ro() {
        return article_title_ro;
    }

    public void setArticle_title_ro(String article_title_ro) {
        this.article_title_ro = article_title_ro;
    }

    public String getArticle_text_en() {
        return article_text_en;
    }

    public void setArticle_text_en(String article_text_en) {
        this.article_text_en = article_text_en;
    }

    public String getArticle_text_ua() {
        return article_text_ua;
    }

    public void setArticle_text_ua(String article_text_ua) {
        this.article_text_ua = article_text_ua;
    }

    public String getArticle_text_hu() {
        return article_text_hu;
    }

    public void setArticle_text_hu(String article_text_hu) {
        this.article_text_hu = article_text_hu;
    }

    public String getArticle_text_sk() {
        return article_text_sk;
    }

    public void setArticle_text_sk(String article_text_sk) {
        this.article_text_sk = article_text_sk;
    }

    public String getArticle_text_ro() {
        return article_text_ro;
    }

    public void setArticle_text_ro(String article_text_ro) {
        this.article_text_ro = article_text_ro;
    }

    public Integer getArticle_category() {
        return article_category;
    }

    public void setArticle_category(Integer article_category) {
        this.article_category = article_category;
    }

    public String getArticle_author() {
        return article_author;
    }

    public void setArticle_author(String article_author) {
        this.article_author = article_author;
    }

    public String getArticle_editor() {
        return article_editor;
    }

    public void setArticle_editor(String article_editor) {
        this.article_editor = article_editor;
    }

    public String getArticle_add_date() {
        return article_add_date;
    }

    public void setArticle_add_date(String article_add_date) {
        this.article_add_date = article_add_date;
    }

    public String getArticle_edit_date() {
        return article_edit_date;
    }

    public void setArticle_edit_date(String article_edit_date) {
        this.article_edit_date = article_edit_date;
    }

    public Integer getArticle_is_edit() {
        return article_is_edit;
    }

    public void setArticle_is_edit(Integer article_is_edit) {
        this.article_is_edit = article_is_edit;
    }

    public Integer getArticle_is_delete() {
        return article_is_delete;
    }

    public void setArticle_is_delete(Integer article_is_delete) {
        this.article_is_delete = article_is_delete;
    }

    public Integer getArticle_is_publish() {
        return article_is_publish;
    }

    public void setArticle_is_publish(Integer article_is_publish) {
        this.article_is_publish = article_is_publish;
    }

    public String getArticle_dir() {
        return article_dir;
    }

    public void setArticle_dir(String article_dir) {
        this.article_dir = article_dir;
    }

    public String getArticle_file_size() {
        return article_file_size;
    }

    public void setArticle_file_size(String article_file_size) {
        this.article_file_size = article_file_size;
    }
    
    Helpers Helpers = new Helpers();
    
    public List<ArchiveArticleModel> getAllArticlesInCategory(String catID) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, ParseException {
        ResultSet result = DB.getResultSet("SELECT * FROM archive_articles WHERE archive_articles.article_category = " + catID + " AND archive_articles.article_is_delete = 0 ORDER BY archive_articles.article_id");
        List<ArchiveArticleModel> articleList = new LinkedList<>();
        while (result.next()) { 
            ArchiveArticleModel temp = new ArchiveArticleModel();
            temp.setArticle_id(result.getInt("article_id"));
            temp.setArticle_title_en(result.getString("article_title_en"));
            temp.setArticle_title_ua(result.getString("article_title_ua"));
            temp.setArticle_text_en(result.getString("article_text_en"));
            temp.setArticle_text_ua(result.getString("article_text_ua"));
            temp.setArticle_category(result.getInt("article_category"));
            temp.setArticle_author(result.getString("article_author"));
            temp.setArticle_editor(result.getString("article_editor"));
            temp.setArticle_add_date(result.getString("article_add_date"));
            temp.setArticle_edit_date(result.getString("article_edit_date"));
            temp.setArticle_is_edit(result.getInt("article_is_edit"));
            temp.setArticle_is_delete(result.getInt("article_is_delete"));
            temp.setArticle_is_publish(result.getInt("article_is_publish"));
            temp.setArticle_dir(result.getString("article_dir"));
            temp.setArticle_file_size(Helpers.getReadableSize(Constants.home + "archive_content/" + temp.article_dir + "/files", 2));
            articleList.add(temp);
        }
        DB.closeCon();
        return articleList;
    }
    
    public ArchiveArticleModel getOneArticleByID(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, ParseException {
        ResultSet result = DB.getResultSet("SELECT * FROM archive_articles WHERE archive_articles.article_id = " + id + " AND archive_articles.article_is_delete = 0");
        result.first();
        ArchiveArticleModel temp = new ArchiveArticleModel();
        temp.setArticle_id(result.getInt("article_id"));
        temp.setArticle_title_en(result.getString("article_title_en"));
        temp.setArticle_title_ua(result.getString("article_title_ua"));
        temp.setArticle_text_en(result.getString("article_text_en"));
        temp.setArticle_text_ua(result.getString("article_text_ua"));
        temp.setArticle_category(result.getInt("article_category"));
        temp.setArticle_author(result.getString("article_author"));
        temp.setArticle_editor(result.getString("article_editor"));
        temp.setArticle_add_date(result.getString("article_add_date"));
        temp.setArticle_edit_date(result.getString("article_edit_date"));
        temp.setArticle_is_edit(result.getInt("article_is_edit"));
        temp.setArticle_is_delete(result.getInt("article_is_delete"));
        temp.setArticle_is_publish(result.getInt("article_is_publish"));
        temp.setArticle_dir(result.getString("article_dir"));
        DB.closeCon();
        return temp;
    }
    
    public void insertArticle(String titleEN, String titleUA, String textEN, String textUA, String category, String author, String date, String dir) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DB.runQuery("INSERT INTO `archive_articles`(`article_title_EN`, `article_title_UA`, `article_text_EN`, `article_text_UA`, "
                + "`article_category`, `article_author`, `article_editor`, `article_add_date`, `article_edit_date`, `article_is_edit`, `article_is_delete`, `article_is_publish`, `article_dir`) VALUES ("
                + "'"+StringEscapeUtils.escapeSql(titleEN)+"','"+StringEscapeUtils.escapeSql(titleUA)+"','"+StringEscapeUtils.escapeSql(textEN)+"','"+StringEscapeUtils.escapeSql(textUA)+
                "','"+category+"','"+author+"','"+author+"','"+date+"','"+date+"',1,0,0,'"+dir+"');");
    } 
    
    public void updateArticle(String id, String titleEN, String titleUA, String textEN, String textUA, String author, String date) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        DB.runQuery("UPDATE `archive_articles` SET" +
                "`article_title_EN`='"+StringEscapeUtils.escapeSql(titleEN)+"',`article_title_UA`='"+StringEscapeUtils.escapeSql(titleUA)+"'," +
                "`article_text_EN`='"+StringEscapeUtils.escapeSql(textEN)+"',`article_text_UA`='"+StringEscapeUtils.escapeSql(textUA)+"'," +
                "`article_editor`='"+author+"',`article_edit_date`='"+date+"' WHERE article_id = "+id+";");
    }
    
    public String deleteArticle(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, IOException {
        ResultSet result = DB.getResultSet("SELECT archive_articles.article_id, archive_articles.article_category, archive_articles.article_dir FROM archive_articles WHERE archive_articles.article_id = " + id + ";");
        result.first();
        Helpers.removeDir(Constants.home + "archive_content/" + result.getString("article_dir"));
        DB.runQuery("UPDATE `archive_articles` SET `article_is_delete`= 1 WHERE article_id = "+id+";");
        String category = result.getString("article_category");
        DB.closeCon();
        return category;
    }
}
