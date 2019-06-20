package com.ssafy.service;

import java.util.ArrayList;
import java.util.List;

import com.ssafy.dto.Board;

public interface BoardService {
	public List<Board> selectPage(int page);
	public Board select(int num);
	public List<Board> selectById(String email);
	public int insertBoard(Board board);
	public int updateBoard(Board board);
	public int deleteBoard(int id);
	public int selectCount();
	public int deleteBoards(Integer[] ids);
	
	public List<Board> selectByName(String searchName);
	public List<Board> selectByTitle(String searchTitle);
	public List<Board> selectByContent(String searchContent);
}
