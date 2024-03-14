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

import com.himedia.pet.DAO.LoginDAO;
import com.himedia.pet.DAO.dataDAO;
import com.himedia.pet.DTO.LoginDTO;
import com.himedia.pet.DTO.QnaDTO;
import com.himedia.pet.DTO.boardDTO;
import com.himedia.pet.DTO.dataDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

	@Autowired
	private dataDAO ddao;
	
	@Autowired
	private LoginDAO ldao;
	
	@GetMapping("/")
	public String goHome() {
		return "popupContent";
	}
	@GetMapping("/home")
	public String go22Home() {
		return "home";
	}
	
	@GetMapping("/popupContent")
	public String popupContent() {
		return "popupContent";
	}
	
	@GetMapping("/review")
	public String goReview(HttpServletRequest req,Model model) {
		String pid = req.getParameter("pid");
		model.addAttribute("pid",pid);
		return "/review";
	}
	
	@GetMapping("/write")
	public String goWrite(HttpServletRequest req,Model model) {
		String pid = req.getParameter("pid");
		model.addAttribute("pid",pid);
		return "/write";
	}
	
	@GetMapping("/page")
	public String gopage(HttpServletRequest req,Model model) {
		String id = req.getParameter("id");
		int petId = Integer.parseInt(id);
		int total=ddao.reviewTotal(petId);
		String pageno ="1";
		if(req.getParameter("page")!=null && !req.getParameter("page").equals("")) {
			pageno=req.getParameter("page");
		}
		
		int page=Integer.parseInt(pageno);
		int lastpage=(int)Math.ceil((double)total/10);
		
		
		model.addAttribute("page",page);
		model.addAttribute("id",petId);
		model.addAttribute("lastpage",lastpage);
		return "/page";
	}
	@GetMapping("/search")
	public String test(HttpServletRequest req,Model model) {
		String text=req.getParameter("search");
		text="*"+text+"*";
		int total=ddao.searchTotal(text);
		String pageno ="1";
		if(req.getParameter("page")!=null && !req.getParameter("page").equals("")) {
			pageno=req.getParameter("page");
		}
		
		int page=Integer.parseInt(pageno);
		int start=(page-1)*10;
		int block=(page-1)/10+1;
		int lastpage=(int)Math.ceil((double)total/10);
//		System.out.println(lastpage);
		int showpage=(block-1)*10;
		ArrayList<Integer> a= new ArrayList<Integer>();
		for (int i=1;i<=10;i++) {
			showpage++;
			a.add(showpage);
			if(showpage==lastpage) break;
		}
		
		
		
		ArrayList<dataDTO> alsearch =ddao.searchList(text,start);
		model.addAttribute("alList",alsearch);
		model.addAttribute("showpage",a);
		model.addAttribute("page",page);
		model.addAttribute("search",text);
		model.addAttribute("lastpage",lastpage);
		return "store";
	}
	
	@GetMapping("/store")
    public String getHospital(HttpServletRequest req,Model model) {
		String text = req.getParameter("text");
		String[] split = text.split(",");
		String search=req.getParameter("search");
		System.out.println("search"+search);
		String pageno="1";
		if(req.getParameter("page")!=null && !req.getParameter("page").equals("")) {
			pageno = req.getParameter("page");
		}
		int page = Integer.parseInt(pageno);
		int start = (page-1)*10;
//		System.out.println("start 는 시작" + start);
		int block = (page-1)/10+1;
//		System.out.println("block 은 페이지열 갯수" + block);
		
//		System.out.println("lastpage 는 끝페이지"+lastpage);
		int showpage=(block-1)*10;
//		System.out.println("showpage는 10개페이지"+showpage);
		System.out.println(text);
//		System.out.println("text 는 이름 "+text);
		int lastpage =0;
		if(search==null||search.equals("")) {
			if(split.length==1) {
				System.out.println("1");
				int hos_cnt = ddao.getHos_cnt(split[0]);
				lastpage = (int)Math.ceil((double)hos_cnt/10);
				ArrayList<dataDTO> alHospital=ddao.getHos(text,start);
				model.addAttribute("alList",alHospital);
				model.addAttribute("text",text);
			}else {
				System.out.println("2");
				
				int total_cnt=ddao.getTotal_cnt(split[0],split[1],split[2]);
				lastpage = (int)Math.ceil((double)total_cnt/10);
				ArrayList<dataDTO> alTotal=ddao.getTotal(split[0],split[1],split[2],start);
				model.addAttribute("alList",alTotal);
				model.addAttribute("text",text);
			}
		} else {
			int total=ddao.searchTotal(search);
			lastpage=(int)Math.ceil((double)total/10);
			ArrayList<dataDTO> alsearch =ddao.searchList(search,start);
			model.addAttribute("alList",alsearch);
			model.addAttribute("search",search);
		}
//		System.out.println("hos_cnt는 갯수"+hos_cnt);
		ArrayList<Integer> a = new ArrayList<Integer>();
//		System.out.println("a는 페이지어레이"+a);
		for(int i=1;i<=10;i++) {
			showpage++;
			a.add(showpage);
//			System.out.println("a는 담은 그릇"+a);
			if(showpage==lastpage) break;
		}
		
		//페이지를 위한 모델들
		model.addAttribute("showpage",a);
		model.addAttribute("page",page);
		model.addAttribute("lastpage",lastpage);
		
        return "store";
    }
	
	@PostMapping("like") // 찜하기
	@ResponseBody
	public String JJim(HttpServletRequest req) {
		String pid=req.getParameter("id");
		String userid=req.getParameter("userid");
		String jjim_id=req.getParameter("jjim_id");
		int uid=ldao.getuserid(userid);
		if(jjim_id==null ||jjim_id.equals("")) {
			int n=ddao.jjim(uid, Integer.parseInt(pid));
			int y=ddao.getJjimid(uid, Integer.parseInt(pid));
			return ""+y;
		}else {
			ddao.delJjim(Integer.parseInt(jjim_id));
			return "-1";
		}
	}
	
	@PostMapping("cheklike") // 찜체크하기
	@ResponseBody
	public String chekJJim(HttpServletRequest req) {
		String pid=req.getParameter("id");
		String userid=req.getParameter("userid");
		int uid=ldao.getuserid(userid);
		int n=ddao.chekJjim(uid, Integer.parseInt(pid));
		if(n==1) {
			int y=ddao.getJjimid(uid, Integer.parseInt(pid));
			return  ""+y;
		}
		return ""+n;
	}
	
	@PostMapping("/doload") // 상세페이지에 db가져오기
	@ResponseBody
	public String doload(HttpServletRequest req) {
		String id = req.getParameter("id");	
		dataDTO ddto = ddao.view(Integer.parseInt(id));
				
		JSONObject jo = new JSONObject();	
		jo.put("name", ddto.name);
	    jo.put("localAddress",ddto.loadAddress);
	    jo.put("number", ddto.number);
	    jo.put("homepage", ddto.homepage);
	    jo.put("time", ddto.operatingTime);
	    jo.put("holiday", ddto.holiday);
	    jo.put("petben", ddto.petben);
	    jo.put("size", ddto.petSize);
	    jo.put("areain", ddto.areaIn);
	    jo.put("areaout",ddto.areaOut);
	    jo.put("parking", ddto.parking);
	    jo.put("wido",ddto.wido);
	    jo.put("gyeongdo", ddto.gyeongdo);
		    		
		return jo.toJSONString();
	}
	@PostMapping("/doWrite") // 리뷰작성
	@ResponseBody
	public String doWrite(HttpServletRequest req) {
		String pName=req.getParameter("pName");
		String writer = req.getParameter("writer");
		String content = req.getParameter("content");
		String idDisplay = req.getParameter("idDisplay");
		int n=0;
		if(idDisplay == null || idDisplay.equals("")) {
			n = ddao.write(Integer.parseInt(pName),writer,content);
		} else {
			n = ddao.rUpdate(content,Integer.parseInt(idDisplay));
		}
		return ""+n;
	}
	@PostMapping("/doReview") // 리뷰 로딩
	@ResponseBody
	public String review(HttpServletRequest req) {
	    String id = req.getParameter("id");
	    
	    if (id == null || id.isEmpty()) {
	        return "Error: Invalid pet_id";
	    }// 유효한 값인 경우에만 숫자로 변환
	    try {
	        int petId = Integer.parseInt(id);
	        
	        int total=ddao.reviewTotal(petId);
			String pageno ="1";

			if(req.getParameter("page")!=null && !req.getParameter("page").equals("")) {
				pageno=req.getParameter("page");
			}
			int page=Integer.parseInt(pageno);

			int start=(page-1)*10;
			
	        ArrayList<boardDTO> data = ddao.reviewLoad(petId,start);
	        JSONArray ja = new JSONArray();
	        for (int i = 0; i < data.size(); i++) {
	            JSONObject jo = new JSONObject();
	            jo.put("id", data.get(i).id);
	            jo.put("writer", data.get(i).writer);
	            jo.put("content", data.get(i).content);
	            jo.put("time", data.get(i).created);
	            ja.add(jo);
	        }
	        return ja.toJSONString();
	    } catch (NumberFormatException e) { // 숫자로 변환할 수 없는 경우에 대한 예외 처리.
	        e.printStackTrace(); //
	        return "Error: Invalid pet_id";
	    }
	}
	@GetMapping("/rDelet") // 리뷰 삭제
	@ResponseBody
	public String rDelet(HttpServletRequest req) {
		String id=req.getParameter("id");
	    int n=ddao.rDelete(Integer.parseInt(id));
	    
	    return ""+n; 
	}
	@PostMapping("/reLoad") // 수정할 리뷰 로딩
	@ResponseBody
	public String reviewLoad(HttpServletRequest req) {
		int idDisplay = Integer.parseInt(req.getParameter("idDisplay")); 
		
		boardDTO ddto2 = ddao.reLoad(idDisplay);
		JSONObject jo = new JSONObject();	
		jo.put("writer", ddto2.writer);
	    jo.put("content",ddto2.content);
	        		
		return jo.toJSONString();
	}
	
	@GetMapping("/showpage") // 페이징
	@ResponseBody
	public String showpage(HttpServletRequest req) {
		String id = req.getParameter("id");
		int petId = Integer.parseInt(id);
		int total=ddao.reviewTotal(petId);
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
	
	
	
	
	
	//마이페이지 만들기
		@GetMapping("/mypage")
		public String gomypage() {
			return "mypage";
		}
		//포인트샵만들기
		@GetMapping("/pointShop")
		public String gopointShop() {
			return "pointShop";
		}
		
		
		@GetMapping("/updateMy")
		@ResponseBody
		public String goprofileList(HttpServletRequest req) {
			String id = req.getParameter("id");
			int mem_id = ldao.getuserid(id);
			System.out.println("member_id는 넘버"+mem_id);
			String pass = req.getParameter("pass");
			System.out.println("id 는 업데이트"+id);
			System.out.println("pass는비번"+pass);
			
			ArrayList<LoginDTO> alUpdateMy = ldao.updateMyList(mem_id);
			JSONArray ja = new JSONArray();
			for(int i=0;i<alUpdateMy.size();i++) {
				JSONObject jo = new JSONObject();
				jo.put("id",alUpdateMy.get(i).getId());
				jo.put("email",alUpdateMy.get(i).getEmail());
				jo.put("password",alUpdateMy.get(i).getPassword());
				jo.put("kakaoId",alUpdateMy.get(i).getKakaoId());
				jo.put("naverId",alUpdateMy.get(i).getNaverId());
				ja.add(jo);	
			}
			return ja.toJSONString();
		
			
		}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	@GetMapping("/ajax")
//	public String ajax(HttpServletRequest req,Model model) {
//		String text=req.getParameter("text");
//		int total=ddao.searchTotal(text);
//		String pageno ="1";
//		if(req.getParameter("page")!=null && !req.getParameter("page").equals("")) {
//			pageno=req.getParameter("page");
//		}
//		
//		int page=Integer.parseInt(pageno);
//		int start=(page-1)*10;
//		int block=(page-1)/10+1;
//		int lastpage=(int)Math.ceil((double)total/10);
////		System.out.println(lastpage);
//		int showpage=(block-1)*10;
//		ArrayList<Integer> a= new ArrayList<Integer>();
//		for (int i=1;i<=10;i++) {
//			showpage++;
//			a.add(showpage);
//			if(showpage==lastpage) break;
//		}
//		
//		model.addAttribute("page",page);
//		model.addAttribute("lastpage",lastpage);
//		model.addAttribute("text",text);
//		
//		return "pagingAjax";
//	}
//	
//	
//	@GetMapping("/testajax")
//	@ResponseBody
//	public String testajax(HttpServletRequest req) {
//		String text=req.getParameter("text");
//		System.out.println(text);
//		int total=ddao.searchTotal(text);
//		String pageno ="1";
//		System.out.println(req.getParameter("page"));
//		if(req.getParameter("page")!=null && !req.getParameter("page").equals("")) {
//			pageno=req.getParameter("page");
//		}
//		int page=Integer.parseInt(pageno);
//		System.out.println("page"+page);
//		int start=(page-1)*10;
//		int block=(page-1)/10+1;
//		int lastpage=(int)Math.ceil((double)total/10);
////		System.out.println(lastpage);
//		int showpage=(block-1)*10;
//		ArrayList<Integer> a= new ArrayList<Integer>();
//		for (int i=1;i<=10;i++) {
//			showpage++;
//			a.add(showpage);
//			if(showpage==lastpage) break;
//		}
//		
//		
//		
//		ArrayList<dataDTO> alsearch =ddao.searchList(text,start);
//		JSONArray ja = new JSONArray();
//		for (int i = 0; i < alsearch.size(); i++) {
////			System.out.println("들어옴");
//			JSONObject jo = new JSONObject();
//			jo.put("id", alsearch.get(i).getId());
//			jo.put("loadAddress", alsearch.get(i).getLoadAddress());
////			System.out.println(alsearch.get(i).getImage());
//			jo.put("name", alsearch.get(i).getName());
//			ja.add(jo);
//		}
//
//		return ja.toJSONString();
//	}
//	
//	@GetMapping("/showpage")
//	@ResponseBody
//	public String showpage(HttpServletRequest req) {
//		String text=req.getParameter("text");
//		int total=ddao.searchTotal(text);
//		String pageno ="1";
//		if(req.getParameter("page")!=null && !req.getParameter("page").equals("")) {
//			pageno=req.getParameter("page");
//		}
//		
//		int page=Integer.parseInt(pageno);
//		int start=(page-1)*10;
//		int block=(page-1)/10+1;
//		int lastpage=(int)Math.ceil((double)total/10);
////		System.out.println(lastpage);
//		int showpage=(block-1)*10;
//		ArrayList<Integer> a= new ArrayList<Integer>();
//		for (int i=1;i<=10;i++) {
//			showpage++;
//			a.add(showpage);
//			if(showpage==lastpage) break;
//		}
//
//		return ""+a;
//	}
	
}
