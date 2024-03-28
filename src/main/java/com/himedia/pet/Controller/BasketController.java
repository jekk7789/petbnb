package com.himedia.pet.Controller;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.himedia.pet.DAO.BasketDAO;
import com.himedia.pet.DTO.BasketDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class BasketController {
	
	@Autowired
	BasketDAO bdao;
	
	@GetMapping("/basket")
	public String Basket() {
		return "basket";
	}
	
	@PostMapping("/basketrev")
	@ResponseBody
	public String doBasketrev(HttpServletRequest req) {
		HttpSession sess = req.getSession();
		String userid = (String) sess.getAttribute("userid");
		System.out.println("userid: "+ userid);
		ArrayList<BasketDTO> alList = bdao.userbasketList(userid);
		JSONArray ja = new JSONArray();
   	 	for (int i = 0; i < alList.size(); i++) {
	   	     JSONObject jo = new JSONObject();
	   	     jo.put("id", alList.get(i).getId());
	   	     jo.put("userid", alList.get(i).getUserid());
	   	     jo.put("orderid", alList.get(i).getOrderid());
	   	     jo.put("orderName", alList.get(i).getTitle());
	   	     
	   	     jo.put("price", alList.get(i).getPrice());
	   	     jo.put("amount", alList.get(i).getAmount());
	   	     jo.put("count", alList.get(i).getCount());
	   	     	
	   	     ja.add(jo);
   	 	}
   	 	System.out.println(ja);
   	 	return ja.toJSONString();
	}
	//장바구니 아이디 세션등록
    @PostMapping("/doSession")
    @ResponseBody
    public String doSession(HttpServletRequest req,Model model) {
        // 단일 문자열로 받기
        String sessions1 = req.getParameter("session");
        String[] sessions = null;
        if(sessions1 != null && !sessions1.equals("")) {
            sessions = sessions1.split(",");
            String str="";       
            for (int i = 0; i < sessions.length; i++) {
               if (i==sessions.length-1) {
                  str+=sessions[i];
                  break;
               }
               str+=sessions[i]+",";
            }
                HttpSession sess = req.getSession();
               sess.setAttribute("session",str); 
        }
        return "1";
    }
	
}
