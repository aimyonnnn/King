package com.itwillbs.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.test.vo.PayVO;

@Mapper
public interface PayMapper {

	int insertPayInfo(
			@Param("p_orderNum") String p_orderNum, 
            @Param("payment_num") String payment_num, 
            @Param("payment_total_price") int payment_total_price, 
            @Param("sId") String sId, 
            @Param("r_idx") int r_idx);
	
	// 결제리스트 조회
	List<PayVO> selectPayInfo(String sId);
	
	// 결제상태 변경
	int updatePayment(String payment_num);
	
	// 결제내역 조회
	PayVO selectPayInfoByRidx(int r_idx);
	
	// 결제정보 저장 - 예약
	int insertReservationPayInfo(
			@Param("p_orderNum") String p_orderNum, 
			@Param("payment_num") String payment_num,  
			@Param("payment_total_price") int payment_total_price, 
			@Param("sId") String sId);
	
	// 판매금액 정산을 위한 결제정보 조회
	PayVO selectInfoBySeller(int r_idx);

	// 총 결제 금액 조회
	int getTotalPay();

	// 지난 일자 결제 금액 조회
	PayVO adminPaymentCount(int i);

	// 지난 일자 총 결제 금액 조회
	PayVO adminPaymentTotalCount(int x);

}
