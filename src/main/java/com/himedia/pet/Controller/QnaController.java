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

import com.himedia.pet.DAO.dataDAO;
import com.himedia.pet.DTO.QnaDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class QnaController {
	
	@Autowired dataDAO ddao;
	
	
	
	@PostMapping("/doQna") // Qna로딩
	@ResponseBody
	public String doQna(HttpServletRequest req) {
		 
		String pageno ="1";
		if(req.getParameter("page")!=null && !req.getParameter("page").equals("")) {
			pageno=req.getParameter("page");
		}
		int page=Integer.parseInt(pageno);
		int start=(page-1)*10;
		
        ArrayList<QnaDTO> data = ddao.QnaLoad(start);
        JSONArray ja = new JSONArray();
        
        for (int i = 0; i < data.size(); i++) {
            JSONObject jo = new JSONObject();
            jo.put("id",data.get(i).getId());
            jo.put("title", data.get(i).getTitle());
            jo.put("writer", data.get(i).getWriter());
            jo.put("content", data.get(i).getContent());
            jo.put("time", data.get(i).getCreated_at());
            ja.add(jo);
        }
         return ja.toJSONString();
		 
	}
	
	@GetMapping("/Qna")
	public String goQna(HttpServletRequest req,Model model) {
		int total=ddao.QnaTotal();
		String pageno ="1";
		if(req.getParameter("page")!=null && !req.getParameter("page").equals("")) {
			pageno=req.getParameter("page");
		}
		
		int page=Integer.parseInt(pageno);
		int lastpage=(int)Math.ceil((double)total/10);


		model.addAttribute("page",page);
		model.addAttribute("lastpage",lastpage);
		return "/Qna";
	}
	
	@PostMapping("/addQna") // Qna작성
	@ResponseBody
	public String addQna(HttpServletRequest req) {
		String title=req.getParameter("title");
		String writer = req.getParameter("writer");
		String content = req.getParameter("content");
		
	
		int n = ddao.QnaWrite(title, writer, content);
		
//			n = ddao.rUpdate(content,Integer.parseInt(idDisplay));

		return ""+n;
	}
	
	@GetMapping("/Qnapage") // 페이징
	@ResponseBody
	public String Qnapage(HttpServletRequest req) {
		int total=ddao.QnaTotal();
		String pageno ="1";
		if(req.getParameter("page")!=null && !req.getParameter("page").equals("")) {
			pageno=req.getParameter("page");
		}
		
		int page=Integer.parseInt(pageno);
		int block=(page-1)/10+1;
		int lastpage=(int)Math.ceil((double)total/10);
		int showpage=(block-1)*10;
		
		ArrayList<Integer> a= new ArrayList<Integer>();
		for (int i=1;i<=10;i++) {
			showpage++;
			a.add(showpage);
			if(showpage==lastpage) break;
		} 
		if(total==0) {
			return "";
		}
		
		return ""+a;
	}
	
	@PostMapping("/QnaModify") // 글 수정
	@ResponseBody
	public String QnaModify(HttpServletRequest req) {
	    String title = req.getParameter("title");
	    String content = req.getParameter("content");
	    int uniq = Integer.parseInt(req.getParameter("uniq"));

	        int n = ddao.Qmodify(title, content, uniq);
	   
	    return ""+n;
	}
	
	@PostMapping("/QnaDelete") // 글 삭제
	@ResponseBody
	public String QnaDelete(HttpServletRequest req) {
	    int uniq = Integer.parseInt(req.getParameter("uniq"));
        int n = ddao.QDelete(uniq);
	    
	    return ""+n;
	}

}
