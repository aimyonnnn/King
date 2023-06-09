package com.itwillbs.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.test.mapper.CeoMapper;
import com.itwillbs.test.mapper.HelpMapper;
import com.itwillbs.test.mapper.MemberMapper;
import com.itwillbs.test.vo.CeoVO;
import com.itwillbs.test.vo.HelpVO;
import com.itwillbs.test.vo.MemberVO;
import com.itwillbs.test.vo.NoticeVO;
import com.itwillbs.test.vo.QNAVO;

@Service
public class HelpService {
	
	@Autowired
	HelpMapper mapper;
	@Autowired
	MemberMapper mMapper;
	@Autowired
	CeoMapper cMapper;

	// help 게시판 목록 조회
	public List<HelpVO> getHelpList(int h_index) {
		return mapper.getHelplist(h_index);
	}

	public int registQNA(QNAVO qna, String id) {
		MemberVO member = mMapper.isCorrectMember(id);
		qna.setM_idx(member.getM_idx());
		return mapper.insertQNA(qna);
	}
	
	public int registCeoQNA(QNAVO qna, String id) {
		CeoVO ceo = cMapper.selectFromCeo(id);
		qna.setC_idx(ceo.getC_idx());
		return mapper.insertCeoQNA(qna);
	}

	// QNA 회원 리스트 불러옴
	public List<QNAVO> getQNAMemberList(String sid, String searchType, String searchKeyword, int startRow, int listLimit) {
		return mapper.selectQNAMemberList(sid, searchType, searchKeyword, startRow, listLimit);
	}
	
	// QNA 점주 리스트 불러옴
	public List<QNAVO> getQNACeoList(String cid, String searchType, String searchKeyword, int startRow, int listLimit) {
		return mapper.selectQNACeoList(cid, searchType, searchKeyword, startRow, listLimit);
	}
	
	// QNA 답변
	public int QnaAnswer(QNAVO qna) {
		return mapper.updateQnaAnswer(qna);
	}

	// 공지 등록
	public int registNotice(NoticeVO notice) {
		return mapper.insertNotice(notice);
	}

	// 공지 글목록 조회 - 검색 가능
	public List<NoticeVO> getNoticeList(String searchType, String searchKeyword, int startRow, int listLimit) {
		return mapper.selectNoticeList(searchType, searchKeyword, startRow, listLimit);
	}

	// 전체 게시물 수 조회 요청 
	public int getNoticeListCount(String searchType, String searchKeyword) {
		return mapper.selectNoticeListCount(searchType, searchKeyword);
	}

	// 공지글 상세정보 조회 요청 => 조회 시 조회수 증가 
	public NoticeVO getNotice(int no_idx) {
		// 글정보 조회 
		NoticeVO notice = mapper.selectNotice(no_idx);
		if(notice != null) {
			// 조회수 증가 
			mapper.updateReadcount(notice);
		}
		
		return notice;
	}

	// 공지글 수정
	public int modifyNotice(NoticeVO notice) {
		return mapper.updateNotice(notice);
	}

	// 공지글 삭제
	public int removeNotice(int no_idx) {
		return mapper.deleteNotice(no_idx);
	}
	
	// 전체 QNA 수 조회 요청
	public int getQnaListCount(String id,String searchType, String searchKeyword) {
		return mapper.selectQnaListCount(id, searchType, searchKeyword);
	}
	
	// QNA 삭제시 동일한 아이디 인가 판별
	public String getQnaMemberInfo(int q_idx) {
		return mapper.selectMemberIdInfo(q_idx);
	}
	
	// CEO QNA 삭제시 동일한 아이디 인가 판별
	public String getQnaCeoInfo(int q_idx) {
		return mapper.selectCeoIdInfo(q_idx);
	}
	
	// QNA 삭제
	public int removeQNA(int q_idx) {
		return mapper.deleteQNA(q_idx);
	}

	public int getQnaCeoListCount(String cid, String searchType, String searchKeyword) {
		return mapper.selectQnaCeoListCount(cid, searchType, searchKeyword);
	}
	

}
