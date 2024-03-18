package com.himedia.pet.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.himedia.pet.DAO.calendarDAO;
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
    public String calendar(HttpServletRequest req, Model model) {
		/* String userName = req.getParameter("userName"); */
        String title = req.getParameter("title");
        String start = req.getParameter("start");
        String end = req.getParameter("end");
        String color = req.getParameter("color");
        
        HttpSession sess = req.getSession();
		/* sess.setAttribute("userName", userName); */
        int n = cdao.addCalendar(title, start, end, color);
        
        return "calendar"; // 뷰 이름 반환
    }
}
