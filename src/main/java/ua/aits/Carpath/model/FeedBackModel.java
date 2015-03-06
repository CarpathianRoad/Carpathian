/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.model;

/**
 *
 * @author kiwi
 */
public class FeedBackModel {
    private String name;
    private String email;
    private String subject;
    private String text;


    public void setEmail(String email) {
       this.email = email;
    }
    public String getEmail() {
       return email;
    }

    public void setName(String name) {
       this.name = name;
    }
    public String getName() {
       return name;
    }

    public void setSubject(String subject) {
       this.subject = subject;
    }
    public String getSubject() {
       return subject;
    }

    public void setText(String text) {
       this.text = text;
    }
    public String getText() {
       return text;
    }
}
