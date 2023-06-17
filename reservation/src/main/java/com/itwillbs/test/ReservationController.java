package com.itwillbs.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.test.service.ReservationService;
import com.itwillbs.test.vo.RestaurantVO;


@Controller
public class ReservationController {
	
	@Autowired
	private ReservationService service;
	
	
	// 예약 검색 페이지
	@GetMapping("reservationMain")
	public String reservationMain(Model model) {
		
		// 전체 식당 조회
		List<RestaurantVO> restaurantList = service.getRestaurantList();
		
		model.addAttribute("restaurantList", restaurantList);
		
		return "reservation/reservation_main";
	}
	
	// 예약 페이지
	@GetMapping("reservationReserve")
	public String reservationReserve() {
		return "reservation/reservation_store";
	}
	
	// 결제 후 예약 내역 페이지
	@GetMapping("reservationResult")
	public String reservationResult() {
		return "reservation/reservation_result";
	}
	
	// 예약 검색 페이지 식당 이름 실시간 검색
	// 한글자 입력할때마다 조회됨
	@PostMapping("getRestaurantName")
	@ResponseBody
	public List<RestaurantVO> getRestaurantName(@RequestParam("name") String resName, Model model) {
		
		List<RestaurantVO> restaurantName = service.getRestaurantName(resName);
		
		model.addAttribute("restaurantName", restaurantName);
		
		return restaurantName;
		
	}
	
	// 예약취소 버튼을 눌렀을 때 상태 처리
	@GetMapping("resCancel")
	public String resCancel(@RequestParam int r_idx, Model model) {
		
		int updateCount = service.CancelStatus(r_idx);
		
		if(updateCount < 0) {
			model.addAttribute("msg", "취소 실패");
			return "fail_back";
		}
		
		return "redirect:StoreReservation";
	}
	
	
	
}
