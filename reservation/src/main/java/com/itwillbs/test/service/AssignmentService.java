package com.itwillbs.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.AssignmentMapper;
import com.itwillbs.test.vo.AssignmentVO;

@Service
public class AssignmentService {
	
	@Autowired
	private AssignmentMapper mapper;
	
	// 양도 게시판 출력
	public List<AssignmentVO> getAssignmentList() {
		return mapper.getAssignmentList();
	}
	
	// 양도상태'2-거래완료'로 변경
	public int updateStatus(int r_idx) {
		return mapper.updateStatus(r_idx);
	}
	
	// 관리자의 양도 리스트 조회
	public List<AssignmentVO> getAdminAssignmentList() {
		return mapper.getAdminAssignmentList();
	}

	// 관리자의 양도 정보 삭제
	public int deleteAssignment(String idx) {
		return mapper.deleteAssignment(idx);
	}
	
}
