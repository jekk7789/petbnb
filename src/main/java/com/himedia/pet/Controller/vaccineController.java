package com.himedia.pet.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.himedia.pet.DAO.vaccineDAO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class vaccineController {
   
   @Autowired
   private vaccineDAO vdao;
   
    @GetMapping("/vaccine")
      public String vaccine() {
         return "vaccine";
    }
    @PostMapping("/addpet")
    @ResponseBody
      public String addpet(HttpServletRequest req) {
      String num = req.getParameter("num");
      if (num== null || num.isEmpty()) {
         return "Error: Invalid num";
      }
      String name= req.getParameter("name");
      String birth = req.getParameter("birth");
      
      int n = vdao.petadd(num, name, birth);
      
      return ""+n;
         
    }
    
}