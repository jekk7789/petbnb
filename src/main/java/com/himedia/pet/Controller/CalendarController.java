package com.himedia.pet.Controller;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.himedia.pet.DAO.calendarDAO;
import com.himedia.pet.DTO.calendarDTO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CalendarController {
    
    @Autowired
    calendarDAO cdao;
    
    @GetMapping("/calendar")
    public String getCalendarPage() {
        return "calendar";
    }
    
    @PostMapping("/calendar")
    @ResponseBody
    public String calendar(HttpServletRequest req) {
      String userName = req.getParameter("userName");
        String title = req.getParameter("title");
        String start = req.getParameter("start");
        String end = req.getParameter("end");
        String backgroundColor = req.getParameter("backgroundColor");
        
        System.out.println(userName);
        System.out.println(title);
        System.out.println(start);
        System.out.println(end);
        System.out.println(backgroundColor);
        
        HttpSession sess = req.getSession();
      sess.setAttribute("userName", userName);
        int n = cdao.addCalendar(userName, title, start, end, backgroundColor);
        
        return ""+1;
    }
    
    @PostMapping("/CalendarList")
    @ResponseBody
    public JSONArray doCalendar(HttpServletRequest req) {
        HttpSession sess = req.getSession();
        String userName = (String) sess.getAttribute("userName");
        ArrayList<calendarDTO> alCal = cdao.selectCal(userName);
        JSONArray ja = new JSONArray();
        for (int i = 0; i < alCal.size(); i++) {
            JSONObject jo = new JSONObject();
            jo.put("id", alCal.get(i).getId());
            jo.put("userName", alCal.get(i).getUserName());
            jo.put("title", alCal.get(i).getTitle());
            jo.put("start", alCal.get(i).getStart());
            jo.put("end", alCal.get(i).getEnd());
            jo.put("backgroundColor", alCal.get(i).getBackgroundColor());
            jo.put("created", alCal.get(i).getCreated());
            ja.add(jo);
        }
        System.out.println(ja);
        return ja;
    }
    
    
}
