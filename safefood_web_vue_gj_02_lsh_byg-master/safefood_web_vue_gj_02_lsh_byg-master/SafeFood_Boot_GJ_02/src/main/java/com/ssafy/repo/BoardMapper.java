package com.ssafy.repo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ssafy.dto.Board;


@Mapper	//repository 대체 ==> mapper.xml과 바로 연결
public interface BoardMapper {

	public List<Board> selectPage(int page);
	public Board select(int num);
	public List<Board> selectById(String email);
	public int insertBoard(Board board);
	public int updateBoard(Board board);
	public int deleteBoard(int id);
	public int updateHit(int id);
	public int selectCount();
	public int deleteBoards(Integer[] ids);
	
	public List<Board> selectByName(String searchName);
	public List<Board> selectByTitle(String searchTitle);
	public List<Board> selectByContent(String searchContent);
}
