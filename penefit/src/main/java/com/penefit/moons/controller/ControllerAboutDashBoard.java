package com.penefit.moons.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.penefit.moons.domain.ClassVO;
import com.penefit.moons.domain.MemberVO;
import com.penefit.moons.domain.QnAVO;
import com.penefit.moons.domain.SuggestDTO;
import com.penefit.moons.domain.VisitsDTO;
import com.penefit.moons.service.ServiceAboutDashBoard;

@Controller
@RequestMapping("/dashboard")
public class ControllerAboutDashBoard {
	
	@Autowired
	ServiceAboutDashBoard serviceDash;
	
	@GetMapping("/")
	public String dashboard(Model model, String class_date) {
		
		ArrayList<MemberVO>memberList = serviceDash.teacherSelectALL(); 
		
		int suggestionCount = serviceDash.getSuggestCount();
		List<SuggestDTO> suggestionList  = serviceDash.getSuggestList();
		
		int classTodayCount = serviceDash.getClassTodayCount();
		int classEndCount = serviceDash.getClassEndCount();
		int classActiveCount = serviceDash.getClassActiveCount();
		List<ClassVO> classTodayList = serviceDash.getClassListToday();
		
		int qnaCount = serviceDash.getQnACount();
		List<QnAVO> qnaList = serviceDash.getQnAList();
		model.addAttribute("memberList", memberList);
		
		model.addAttribute("suggestionList", suggestionList);
		model.addAttribute("suggestionCount", suggestionCount);
		
		model.addAttribute("classTodayCount", classTodayCount);
		model.addAttribute("classEndCount", classEndCount);
		model.addAttribute("classActiveCount", classActiveCount);
		model.addAttribute("classTodayList", classTodayList);
		
		model.addAttribute("qnaCount", qnaCount);
		model.addAttribute("qnaList", qnaList);
		
		List<VisitsDTO> visits = serviceDash.getVisits();
		List<VisitsDTO> visitList = new ArrayList<>();
		for(int i = visits.size() - 1; i >= 0; i--) {
			VisitsDTO dto = new VisitsDTO();
			dto.setVisit(visits.get(i).getVisit());
			dto.setDay(visits.get(i).getDay());
			visitList.add(dto);
		}
		model.addAttribute("visits", visitList);
		return "/admin/mainChaeng";
	}
	
	

}
