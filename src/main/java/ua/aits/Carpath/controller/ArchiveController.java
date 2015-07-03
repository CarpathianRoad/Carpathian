/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ua.aits.Carpath.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author kiwi
 */
@Controller
public class ArchiveController {
    @RequestMapping(value = {"/archive/login", "/archive/login"})
    public ModelAndView archiveLogin(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/archive/Login");
        return modelAndView;
    }
    @RequestMapping(value = {"/archive/index", "/archive/index/"})
    public ModelAndView archiveIndex(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        ModelAndView modelAndView = new ModelAndView("/archive/Index");
        return modelAndView;
    }
}
