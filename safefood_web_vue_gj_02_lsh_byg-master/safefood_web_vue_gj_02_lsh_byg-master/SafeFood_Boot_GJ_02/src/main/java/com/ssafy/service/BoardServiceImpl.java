package com.ssafy.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.dto.Board;
import com.ssafy.repo.BoardMapper;

@Service
@Transactional
public class BoardServiceImpl implements BoardService{
	
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	BoardMapper mapper;

	@Override
	public List<Board> selectPage(int page) {
		// TODO Auto-generated method stub
		return mapper.selectPage(page);
	}

	@Override
	public Board select(int num) {
		// TODO Auto-generated method stub
		mapper.updateHit(num);
		return mapper.select(num);
	}

	@Override
	public List<Board> selectById(String id) {
		// TODO Auto-generated method stub
		return mapper.selectById(id);
	}

	@Override
	public int insertBoard(Board board) {
		// TODO Auto-generated method stub
		return mapper.insertBoard(board);
	}

	@Override
	public int updateBoard(Board board) {
		// TODO Auto-generated method stub
		return mapper.updateBoard(board);
	}

	@Override
	public int deleteBoard(int id) {
		// TODO Auto-generated method stub
		return mapper.deleteBoard(id);
	}

	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		int result = 0;
		try {
			result = mapper.selectCount();
			logger.trace("selectCount : {}", result);
		} catch(Exception e)
		{
			logger.error("selectCount Error: {}", e);
		}
		return result;
	}
	
	@Override
	public int deleteBoards(Integer[] ids)
	{
		// TODO Auto-generated method stub
		return mapper.deleteBoards(ids);
	}
	
	//검색기능
	@Override
	public List<Board> selectByTitle(String searchTitle)
	{
		return mapper.selectByTitle(searchTitle);
	}
	@Override
	public List<Board> selectByContent(String searchContent)
	{
		return mapper.selectByContent(searchContent);
	}
	@Override
	public List<Board> selectByName(String searchName)
	{
		return mapper.selectByName(searchName);
	}
}