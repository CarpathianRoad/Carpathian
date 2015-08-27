
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
	public String article_category_text;
	public String article_author;
	public String article_editor;
	public String article_add_date;
	public String article_edit_date;
	public Integer article_is_edit;
	public Integer article_is_delete;
	public Integer article_is_publish;
	public String article_dir;
	public String article_file_size;
	public String article_image_size;
	public String article_lang;
	public String article_country;
	public String article_region;
	public String article_district;
	public String article_town;
	public Double article_x;
	public Double article_y;

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

	public String getArticle_category_text() {
    	return article_category_text;
	}

	public void setArticle_category_text(String article_category_text) {
    	this.article_category_text = article_category_text;
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
    
	public String getArticle_image_size() {
    	return article_image_size;
	}

	public void setArticle_image_size(String article_image_size) {
    	this.article_image_size = article_image_size;
	}

	public String getArticle_lang() {
    	return article_lang;
	}

	public void setArticle_lang(String article_lang) {
    	this.article_lang = article_lang;
	}

	public String getArticle_country() {
    	return article_country;
	}

	public void setArticle_country(String article_country) {
    	this.article_country = article_country;
	}

	public String getArticle_region() {
    	return article_region;
	}

	public void setArticle_region(String article_region) {
    	this.article_region = article_region;
	}

	public String getArticle_district() {
    	return article_district;
	}

	public void setArticle_district(String article_district) {
    	this.article_district = article_district;
	}

	public String getArticle_town() {
    	return article_town;
	}

	public void setArticle_town(String article_town) {
    	this.article_town = article_town;
	}

	public Double getArticle_x() {
    	return article_x;
	}

	public void setArticle_x(Double article_x) {
    	this.article_x = article_x;
	}

	public Double getArticle_y() {
    	return article_y;
	}

	public void setArticle_y(Double article_y) {
    	this.article_y = article_y;
	}
    
    
	Helpers Helpers = new Helpers();
	MenuModel Menu = new MenuModel();
    
	public List<ArchiveArticleModel> getAllArticlesInCategory(String catID) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, ParseException {
    	ResultSet result = DB.getResultSet("SELECT * FROM archive_articles WHERE archive_articles.article_category = " + catID + " ORDER BY archive_articles.article_is_delete ASC");
    	List<ArchiveArticleModel> articleList = new LinkedList<>();
    	while (result.next()) {
        	ArchiveArticleModel temp = new ArchiveArticleModel();
        	temp.setArticle_id(result.getInt("article_id"));
                temp.setArticle_title_en(result.getString("article_title_en").replace("\"","&quot;"));
                temp.setArticle_title_ua(result.getString("article_title_ua").replace("\"","&quot;"));
                temp.setArticle_title_hu(result.getString("article_title_hu").replace("\"","&quot;"));
                temp.setArticle_title_sk(result.getString("article_title_SK").replace("\"","&quot;"));
                temp.setArticle_title_ro(result.getString("article_title_RO").replace("\"","&quot;"));
        	temp.setArticle_text_en(result.getString("article_text_EN"));
                temp.setArticle_text_ua(result.getString("article_text_UA"));
                temp.setArticle_text_hu(result.getString("article_text_HU"));
                temp.setArticle_text_sk(result.getString("article_text_SK"));
                temp.setArticle_text_ro(result.getString("article_text_RO"));
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
        	String[] size = temp.article_file_size.split("\\s+");
        	if("0".equals(size[0])) {
            	temp.setArticle_file_size(Helpers.getReadableSize(Constants.home + "archive_content/" + temp.article_dir + "/files", 3));
            	if("0".equals(temp.article_file_size.split("\\s+")[0])) {
                	temp.setArticle_file_size("");
            	}
        	}
        	temp.setArticle_image_size(Helpers.getReadableSize(Constants.home + "archive_content/" + temp.article_dir + "/images", 2));
        	String[] sizeimage = temp.article_image_size.split("\\s+");
        	if("0".equals(sizeimage[0])) {
            	temp.setArticle_image_size(Helpers.getReadableSize(Constants.home + "archive_content/" + temp.article_dir + "/images", 3));
            	if("0".equals(temp.article_image_size.split("\\s+")[0])) {
                	temp.setArticle_image_size("");
            	}
        	}
        	String lang = "";
        	if(!"".equals(temp.article_text_en) && temp.article_text_en != null) {
            	lang += "EN,";
        	}
        	if(!"".equals(temp.article_text_ua) && temp.article_text_ua != null) {
            	lang += "UA,";
        	}
        	if(!"".equals(temp.article_text_sk) && temp.article_text_sk != null) {
            	lang += "SK,";
        	}
        	if(!"".equals(temp.article_text_hu) && temp.article_text_hu != null) {
            	lang += "HU,";
        	}
        	if(!"".equals(temp.article_text_ro) && temp.article_text_ro != null) {
            	lang += "RO,";
        	}
        	if(lang.length() > 0) {
           	 
        	temp.setArticle_lang(lang.substring(0, lang.length()-1));
        	}
        	if("".equals(temp.article_title_en) || temp.article_title_en == null) {
            	temp.article_title_en = temp.article_title_ua;
        	}
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
        temp.setArticle_title_en(result.getString("article_title_EN").replace("\"","&quot;"));
        temp.setArticle_title_ua(result.getString("article_title_UA").replace("\"","&quot;"));
        temp.setArticle_title_hu(result.getString("article_title_HU").replace("\"","&quot;"));
        temp.setArticle_title_sk(result.getString("article_title_SK").replace("\"","&quot;"));
        temp.setArticle_title_ro(result.getString("article_title_RO").replace("\"","&quot;"));
        temp.setArticle_text_en(result.getString("article_text_EN"));
        temp.setArticle_text_ua(result.getString("article_text_UA"));
        temp.setArticle_text_hu(result.getString("article_text_HU"));
        temp.setArticle_text_sk(result.getString("article_text_SK"));
        temp.setArticle_text_ro(result.getString("article_text_RO"));
    	temp.setArticle_category(result.getInt("article_category"));
    	temp.setArticle_author(result.getString("article_author"));
    	temp.setArticle_editor(result.getString("article_editor"));
    	temp.setArticle_add_date(result.getString("article_add_date"));
    	temp.setArticle_edit_date(result.getString("article_edit_date"));
    	temp.setArticle_is_edit(result.getInt("article_is_edit"));
    	temp.setArticle_is_delete(result.getInt("article_is_delete"));
    	temp.setArticle_is_publish(result.getInt("article_is_publish"));
    	temp.setArticle_dir(result.getString("article_dir"));
    	temp.setArticle_country(result.getString("article_country"));
    	temp.setArticle_region(result.getString("article_region"));
    	temp.setArticle_district(result.getString("article_district"));
    	temp.setArticle_town(result.getString("article_town"));
    	temp.setArticle_x(result.getDouble("article_x"));
    	temp.setArticle_y(result.getDouble("article_y"));
    	if(temp.article_x == 0) {
       	temp.setArticle_x(50.4501);
       	temp.setArticle_y(30.523400000000038);
    	}
    	DB.closeCon();
    	return temp;
	}
    
	public void insertArticle(String titleEN, String titleUA, String titleHU, String titleSK, String titleRO, String textEN, String textUA, String textHU, String textSK, String textRO, String category, String author, String date, String dir, String country, String region, String district, String town, String x, String y) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
    	if("".equals(x)){ x = "0";}if("".equals(y)){ y = "0";}
    	DB.runQuery("INSERT INTO `archive_articles`(`article_title_EN`, `article_title_UA`, `article_title_HU`, `article_title_SK`, `article_title_RO`, `article_text_EN`, `article_text_UA`, `article_text_HU`, `article_text_SK`, `article_text_RO`, "
            	+ "`article_category`, `article_author`, `article_editor`, `article_add_date`, `article_edit_date`, `article_is_edit`, `article_is_delete`, `article_is_publish`, `article_dir`, `article_country`, `article_region`, `article_district`, `article_town`, `article_x`, `article_y`) VALUES ("
            	+ "'"+StringEscapeUtils.escapeSql(titleEN)+"','"+StringEscapeUtils.escapeSql(titleUA)+"','"+StringEscapeUtils.escapeSql(titleHU)+"','"+StringEscapeUtils.escapeSql(titleSK)+"','"+StringEscapeUtils.escapeSql(titleRO)+"','"+StringEscapeUtils.escapeSql(textEN)+"','"+StringEscapeUtils.escapeSql(textUA)+"','"+StringEscapeUtils.escapeSql(textHU) + "','"+StringEscapeUtils.escapeSql(textSK) + "','"+StringEscapeUtils.escapeSql(textRO) +
            	"','"+category+"','"+author+"','"+author+"','"+date+"','"+date+"',1,0,0,'"+dir+"','"+StringEscapeUtils.escapeSql(country)+"','"+StringEscapeUtils.escapeSql(region)+"','"+StringEscapeUtils.escapeSql(district)+"','"+StringEscapeUtils.escapeSql(town)+"', "+x+", "+y+");");
    	DB.closeCon();
	}
    
	public void updateArticle(String id, String titleEN, String titleUA, String titleHU, String titleSK, String titleRO, String textEN, String textUA, String textHU, String textSK, String textRO, String author, String date, String country, String region, String district, String town, String x, String y) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
    	DB.runQuery("UPDATE `archive_articles` SET" +
            	"`article_title_EN`='"+StringEscapeUtils.escapeSql(titleEN)+"',`article_title_UA`='"+StringEscapeUtils.escapeSql(titleUA)+"'," +
            	"`article_title_HU`='"+StringEscapeUtils.escapeSql(titleHU)+"',`article_title_SK`='"+StringEscapeUtils.escapeSql(titleSK)+"',`article_title_RO`='"+StringEscapeUtils.escapeSql(titleRO)+"'," +
            	"`article_text_EN`='"+StringEscapeUtils.escapeSql(textEN)+"',`article_text_UA`='"+StringEscapeUtils.escapeSql(textUA)+"',`article_text_SK`='"+StringEscapeUtils.escapeSql(textSK)+"',`article_text_HU`='"+StringEscapeUtils.escapeSql(textHU)+"',`article_text_RO`='"+StringEscapeUtils.escapeSql(textRO)+"'," +
            	"`article_x` = "+  x +", `article_y` = "+  y +", `article_country` = '"+ StringEscapeUtils.escapeSql(country) +"', `article_region` = '"+  StringEscapeUtils.escapeSql(region) +"', `article_district` = '"+ StringEscapeUtils.escapeSql(district) +"', `article_town` = '"+  StringEscapeUtils.escapeSql(town) + "'," +
            	"`article_editor`='"+author+"',`article_edit_date`='"+date+"' WHERE article_id = "+id+";");
    	DB.closeCon();
	}
    
	public String deleteArticle(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, IOException {
    	ResultSet result = DB.getResultSet("SELECT archive_articles.article_id, archive_articles.article_category, archive_articles.article_dir FROM archive_articles WHERE archive_articles.article_id = " + id + ";");
    	result.first();
    	DB.runQuery("UPDATE `archive_articles` SET `article_is_delete`= 1 WHERE article_id = "+id+";");
    	String category = result.getString("article_category");
    	DB.closeCon();
    	return category;
	}
	public String undeleteArticle(String id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, IOException {
    	ResultSet result = DB.getResultSet("SELECT archive_articles.article_id, archive_articles.article_category, archive_articles.article_dir FROM archive_articles WHERE archive_articles.article_id = " + id + ";");
    	result.first();
    	DB.runQuery("UPDATE `archive_articles` SET `article_is_delete`= 0 WHERE article_id = "+id+";");
    	String category = result.getString("article_category");
    	DB.closeCon();
    	return category;
	}
	public void publishArticle(String article_id) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
    	DB.runQuery("UPDATE `archive_articles` SET `article_is_publish` = 1 WHERE article_id = "+article_id+";");
    	DB.closeCon();
	}
    
	public List<ArchiveArticleModel> getAllArticlesForSearch(String str) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException, ParseException {
    	ResultSet result = DB.getResultSet("select * from archive_articles where  ("
            	+ "article_title_EN LIKE '%"+str+"%' OR "
            	+ "article_title_UA LIKE '%"+str+"%' OR "
            	+ "article_title_HU LIKE '%"+str+"%' OR "
            	+ "article_title_SK LIKE '%"+str+"%' OR "
            	+ "article_title_RO LIKE '%"+str+"%' OR "
            	+ "article_text_EN LIKE '%"+str+"%' OR "
            	+ "article_text_UA LIKE '%"+str+"%' OR "
            	+ "article_text_HU LIKE '%"+str+"%' OR "
            	+ "article_text_SK LIKE '%"+str+"%' OR "
            	+ "article_text_RO LIKE '%"+str+"%' OR "
            	+ "article_author LIKE '%"+str+"%' OR "
            	+ "article_editor LIKE '%"+str+"%'"
            	+ ") order by article_id desc;");
    	List<ArchiveArticleModel> articleList = new LinkedList<>();
    	while (result.next()) {
        	ArchiveArticleModel temp = new ArchiveArticleModel();
        	temp.setArticle_id(result.getInt("article_id"));
                temp.setArticle_title_en(result.getString("article_title_EN").replace("\"","&quot;"));
                temp.setArticle_title_ua(result.getString("article_title_UA").replace("\"","&quot;"));
                temp.setArticle_title_hu(result.getString("article_title_HU").replace("\"","&quot;"));
                temp.setArticle_title_sk(result.getString("article_title_SK").replace("\"","&quot;"));
                temp.setArticle_title_ro(result.getString("article_title_RO").replace("\"","&quot;"));
        	temp.setArticle_text_en(result.getString("article_text_EN"));
                temp.setArticle_text_ua(result.getString("article_text_UA"));
                temp.setArticle_text_hu(result.getString("article_text_HU"));
                temp.setArticle_text_sk(result.getString("article_text_SK"));
                temp.setArticle_text_ro(result.getString("article_text_RO"));
        	temp.setArticle_category(result.getInt("article_category"));
        	temp.setArticle_category_text(Menu.getCategoryName(result.getString("article_category")));
        	temp.setArticle_author(result.getString("article_author"));
        	temp.setArticle_editor(result.getString("article_editor"));
        	temp.setArticle_add_date(result.getString("article_add_date"));
        	temp.setArticle_edit_date(result.getString("article_edit_date"));
        	temp.setArticle_is_edit(result.getInt("article_is_edit"));
        	temp.setArticle_is_delete(result.getInt("article_is_delete"));
        	temp.setArticle_is_publish(result.getInt("article_is_publish"));
        	temp.setArticle_dir(result.getString("article_dir"));
        	temp.setArticle_file_size(Helpers.getReadableSize(Constants.home + "archive_content/" + temp.article_dir + "/files", 2));
        	String[] size = temp.article_file_size.split("\\s+");
        	if("0".equals(size[0])) {
            	temp.setArticle_file_size(Helpers.getReadableSize(Constants.home + "archive_content/" + temp.article_dir + "/files", 3));
            	if("0".equals(temp.article_file_size.split("\\s+")[0])) {
                	temp.setArticle_file_size("");
            	}
        	}
        	temp.setArticle_image_size(Helpers.getReadableSize(Constants.home + "archive_content/" + temp.article_dir + "/images", 2));
        	String[] sizeimage = temp.article_image_size.split("\\s+");
        	if("0".equals(sizeimage[0])) {
            	temp.setArticle_image_size(Helpers.getReadableSize(Constants.home + "archive_content/" + temp.article_dir + "/images", 3));
            	if("0".equals(temp.article_image_size.split("\\s+")[0])) {
                	temp.setArticle_image_size("");
            	}
        	}
        	temp.setArticle_lang("EN");
        	if(!"".equals(temp.article_title_ua) && temp.article_title_ua != null) {
            	temp.article_lang += ",UA";
        	}
        	articleList.add(temp);
    	}
    	DB.closeCon();
    	return articleList;
	}
}
