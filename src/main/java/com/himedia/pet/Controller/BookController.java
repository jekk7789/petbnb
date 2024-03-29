package com.himedia.pet.Controller;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.himedia.pet.DAO.HotelDAO;
import com.himedia.pet.DAO.LoginDAO;
import com.himedia.pet.DTO.HotelDTO;
import com.himedia.pet.DTO.HotelRoomDTO;
import com.himedia.pet.DTO.RoomsDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class BookController {

      @Autowired
      private LoginDAO ldao;
      @Autowired
      private HotelDAO hdao;
      
      @GetMapping("/room")
      public String goRoom() {
         return "room";
      }
      @GetMapping("/book")
      public String gobook() {
         return "book";
      }
      @PostMapping("/room01")
      @ResponseBody
      public String doList() {
         ArrayList<HotelDTO> alRtype = hdao.room_getList();
         
         JSONArray ja=new JSONArray();
         for(int i=0; i<alRtype.size(); i++) {
            JSONObject jo=new JSONObject();
            jo.put("id",alRtype.get(i).getId());
            jo.put("typename",alRtype.get(i).getTypename());
            ja.add(jo);
         }
         return ja.toJSONString();   
      }

      @PostMapping("/Add")
      @ResponseBody
      public String doAdd(HttpServletRequest req) {
         String id=req.getParameter("id");
         String name=req.getParameter("name");
         int type=Integer.parseInt(req.getParameter("type"));
         int howmany=Integer.parseInt(req.getParameter("howmany"));   
         int howmuch=Integer.parseInt(req.getParameter("howmuch"));
         
         int n=0;
         if(id==null || id.equals("")) {
            n=hdao.room_add(name,type,howmany,howmuch);
         } else {
            n=hdao.room_modify(Integer.parseInt(id),name,type,howmany,howmuch);
         }
         return ""+n;   
      }
         
      
      @PostMapping("/List")
      @ResponseBody
      public String todo() {
         ArrayList<HotelRoomDTO> alRoom = hdao.room_doList();
//         System.out.println(alRoom);
         JSONArray ja=new JSONArray();
         for(int i=0; i<alRoom.size(); i++) {
            JSONObject jo=new JSONObject();
            jo.put("id",alRoom.get(i).getId());
            jo.put("name",alRoom.get(i).getName());
//            System.out.println();
            jo.put("typename",alRoom.get(i).getTypename());
            jo.put("personnel",alRoom.get(i).getPersonnel());
            jo.put("price",alRoom.get(i).getPrice());
            ja.add(jo);
         }
         return ja.toJSONString();   
         
      }
      @PostMapping("/remove")
      @ResponseBody
      public String doDelete(HttpServletRequest req) {
         String id=req.getParameter("id");
         int n=hdao.room_remove(Integer.parseInt(id));
         return ""+n ;   
      }
      @PostMapping("/finish")
      @ResponseBody
      public String doFinish(HttpServletRequest req) {
         String userId = req.getParameter("userid");
         System.out.println("userId는"+userId);
         int bookId = ldao.getuserid(userId);
         String id=req.getParameter("id");
         String room_id=req.getParameter("room_id");
         int howmany=Integer.parseInt(req.getParameter("howmany"));
         int howmuch=Integer.parseInt(req.getParameter("howmuch"));
         String checkin=req.getParameter("checkin");
         String checkout=req.getParameter("checkout");
         String name=req.getParameter("name");
         String mobile=req.getParameter("mobile");
         
         int n=0;
         if(id==null || id.equals("")) {
            System.out.println(id);
            n=hdao.room_plus(Integer.parseInt(room_id),howmany,howmuch,checkin,checkout,name,mobile,bookId);
         } else {
            n=hdao.room_update(Integer.parseInt(id),name,mobile);
         }
         return ""+n;
      }
      @PostMapping("/rList")
      @ResponseBody
      public String doFinish() {
         ArrayList<RoomsDTO> rRoom = hdao.room_rList();
         JSONArray ja=new JSONArray();
         
         for(int i=0; i<rRoom.size(); i++) {
            JSONObject jo=new JSONObject();
            jo.put("room_id",rRoom.get(i).getRoom_id());
            jo.put("id",rRoom.get(i).getId());
            jo.put("checkin",rRoom.get(i).getCheckin());
            jo.put("checkout",rRoom.get(i).getCheckout());
            jo.put("rname",rRoom.get(i).getRname());
            jo.put("typename",rRoom.get(i).getTypename());
            jo.put("howmany",rRoom.get(i).getHowmany());
            jo.put("howmuch",rRoom.get(i).getHowmuch());
            jo.put("name",rRoom.get(i).getName());
            jo.put("mobile",rRoom.get(i).getMobile());
            ja.add(jo);
         }
         return ja.toJSONString();   
      }
      @PostMapping("/remove2")
      @ResponseBody
      public String doDelete2(HttpServletRequest req) {
         String id=req.getParameter("id");
         int n=hdao.room_remove2(Integer.parseInt(id));
         return ""+n ;   
      }
      @PostMapping("/select")
      @ResponseBody
      public String doSelect(HttpServletRequest req) {
         String start=req.getParameter("start");
         String end=req.getParameter("end");
         String ints=req.getParameter("ints");
         
         ArrayList<HotelRoomDTO> alRoom = hdao.room_roomselect(start,end, Integer.parseInt(ints));
         JSONArray ja=new JSONArray();
         for(int i=0; i<alRoom.size(); i++) {
            JSONObject jo=new JSONObject();
            jo.put("id",alRoom.get(i).getId());
            jo.put("name",alRoom.get(i).getName());

            jo.put("typename",alRoom.get(i).getTypename());
            jo.put("personnel",alRoom.get(i).getPersonnel());
            jo.put("price",alRoom.get(i).getPrice());
            ja.add(jo);
         }
         return ja.toJSONString();   
         
      }
   


   
}