package com.coding.authentication.controllers;


import com.coding.authentication.models.LoginUser;
import com.coding.authentication.models.User;
import com.coding.authentication.services.UserService;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class HomeController {
     @Autowired
     private UserService userServ;

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser,
                           BindingResult result, Model model, HttpSession session) {
        userServ.register(newUser, result);
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }else{
            session.setAttribute("UserId", newUser.getId());
            session.setAttribute("userName", newUser.getUserName());
            return "redirect:/home";
        }
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin,
                        BindingResult result, Model model, HttpSession session) {
         User user = userServ.login(newLogin, result);
         if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
         }else{
             session.setAttribute("UserId", user.getId());
             session.setAttribute("userName", user.getUserName());
             return "redirect:/home";
         }
    }

    @GetMapping("/home")
    public String home(Model model, HttpSession session){
        if(session.getAttribute("UserId") == null){
            return "redirect:/";
        }
        model.addAttribute("id", session.getAttribute("UserId"));
        model.addAttribute("userName", session.getAttribute("userName"));
        return "home.jsp";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }

}

