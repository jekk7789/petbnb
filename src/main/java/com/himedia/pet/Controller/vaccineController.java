package com.himedia.pet.Controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.himedia.pet.DAO.vaccineDAO;
import com.himedia.pet.DTO.vpetDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class vaccineController {
   
   @Autowired
   private vaccineDAO vdao;
   
    @GetMapping("/vaccine")
      public String vaccine() {
         return "vaccine";
    }
    @PostMapping("/petadd") //펫 등록
    @ResponseBody
      public String addpet(HttpServletRequest req) {
      String num = req.getParameter("num");
      String petId = req.getParameter("petId");
      if (num== null || num.isEmpty()) {
         num="정보없음";
      }
      String name= req.getParameter("name");
      String birth = req.getParameter("birth");
      String loginid= req.getParameter("loginid");
      System.out.println(loginid);
      
      int n = vdao.petadd(num, name, birth,loginid);
      
      return ""+n;
         
    }

    @PostMapping("/petload") // 펫 리스트 띄우기
    @ResponseBody
      public String loadpet(HttpServletRequest req) {
      String loginid= req.getParameter("loginid");
    
      JSONArray ja = new JSONArray();
      ArrayList<vpetDTO> data = vdao.petload(loginid);
      for (int i=0; i<data.size(); i++) {
         JSONObject jo = new JSONObject();
         jo.put("name", data.get(i).getPetname());
         jo.put("number", data.get(i).getPetnumber());
         jo.put("birth", data.get(i).getPetbirth());
         jo.put("id", data.get(i).getId());
         
         ja.add(jo);
      }
   
      return ja.toJSONString();    
         
    }
    @PostMapping("/petchoice") //선택한 펫 올리기
    @ResponseBody
      public String choicepet(HttpServletRequest req) {
      int petId= Integer.parseInt(req.getParameter("petId"));
      vpetDTO bdto =vdao.petchoice(petId);
      JSONObject jo =new JSONObject();
      jo.put("name",bdto.getPetname());
      jo.put("number",bdto.getPetnumber());
      jo.put("birth",bdto.getPetbirth());

      return jo.toJSONString();
     
    }
    @PostMapping("/petvaccine") // 백신 접종 날짜 구하기
    @ResponseBody
    public List<String> vaccinepet(HttpServletRequest req) {
       List<String> date = new ArrayList<> ();
        String petbirth = req.getParameter("petbirth");
        
        for(int num=6; num<19; num+=2) {
//           System.out.println(num);
           String n = vdao.dateadd(petbirth, num);
//           System.out.println(n);
           date.add(n);
        }
     
        return date;
    }
    @PostMapping("/petmodify") // 펫 정보 수정하기 
    @ResponseBody
    public String petmodify(HttpServletRequest req) {
        String petId = req.getParameter("petId");
        String petno = req.getParameter("petno");
        String petname = req.getParameter("petname");
        String birth = req.getParameter("birth");

        int n = vdao.pmodify(Integer.parseInt(petId), petno, petname, birth);
        System.out.println("Modified rows: " +n);
        
        return ""+n;
    }
    @PostMapping("/petdelete") // 펫 정보 삭제하기 
    @ResponseBody
    public String petdeletey(HttpServletRequest req) {
        String petId = req.getParameter("petId");
     
        int n = vdao.pdelete(petId);
        
        return ""+n;
    }


    
}