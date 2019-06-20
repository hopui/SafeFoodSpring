package com.ssafy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.dto.Board;
import com.ssafy.service.BoardService;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/api")
@Api(value="SSAFY")
@CrossOrigin(origins="*")
public class MainCotroller {
	@Autowired
	BoardService service;
	
	@GetMapping("/page")
	@ApiOperation(value="1페이지의 목록을 리턴",response= Map.class)
	public ResponseEntity<Map<String, Object>> getFirstPage(){
		//상태값 전달
		Map<String, Object> resultMap=new HashMap<String, Object>();
		resultMap.put("status", "OK");
		resultMap.put("maxPage", service.selectCount());
		resultMap.put("data", service.selectPage(1));
		
		ResponseEntity<Map<String, Object>> ent= new ResponseEntity<>(resultMap, HttpStatus.OK);
		return ent;
	}
	
	@GetMapping("/page/{id}")
	@ApiOperation(value="x페이지의 목록을 리턴",response= Map.class)
	public ResponseEntity<Map<String, Object>> getPages(@PathVariable int id){
		//상태값 전달
		Map<String, Object> resultMap=new HashMap<String, Object>();
		resultMap.put("status", "OK");
		resultMap.put("data", service.selectPage(id));
		
		ResponseEntity<Map<String, Object>> ent= new ResponseEntity<>(resultMap, HttpStatus.OK);
		return ent;
	}
	
	@GetMapping("/detail/{id}")
	@ApiOperation(value="게시글 하나 가져오기",response= Map.class)
	public ResponseEntity<Map<String, Object>> getPage(@PathVariable int id){
		//상태값 전달
		Map<String, Object> resultMap=new HashMap<String, Object>();
		resultMap.put("status", "OK");
		resultMap.put("data", service.select(id));
		
		ResponseEntity<Map<String, Object>> ent= new ResponseEntity<>(resultMap, HttpStatus.OK);
		return ent;
	}
	
	//게시글 유저 아이디로 가져오기
	@GetMapping("/page/user/{user}")
	@ApiOperation(value="유저의 게시글 가져오기",response= Map.class)
	public ResponseEntity<Map<String, Object>> getPageUser(@PathVariable String user){
		//상태값 전달
		Map<String, Object> resultMap=new HashMap<String, Object>();
		List<Board> list = service.selectById(user);
		resultMap.put("status", "OK");
		resultMap.put("maxPage", list.size());
		resultMap.put("data", list);
		
		ResponseEntity<Map<String, Object>> ent= new ResponseEntity<>(resultMap, HttpStatus.OK);
		return ent;
	}
	
	//게시글 입력
	@PostMapping("/insert")
	@ApiOperation(value="게시글을 추가",response= Integer.class)
	public ResponseEntity<Integer> empInsert(@RequestBody Board board){
		Integer result = service.insertBoard(board);
		
		ResponseEntity<Integer> ent;
		if( result>-1) {
			ent=new ResponseEntity<>(result, HttpStatus.OK);	//200
		}else {
			ent=new ResponseEntity<>(result, HttpStatus.NO_CONTENT); //204
		}
		return ent;
	}
	
	//게시글 수정
	@PutMapping("/update")
	@ApiOperation(value="게시글 수정",response= Integer.class)
	public ResponseEntity<Integer> empDelete(@RequestBody Board board){
		Integer result = service.updateBoard(board);
		ResponseEntity<Integer> ent;
		if( result>-1) {
			ent=new ResponseEntity<>(result, HttpStatus.OK);	//200
		}else {
			ent=new ResponseEntity<>(result, HttpStatus.NO_CONTENT); //204
		}
		return ent;
	}
	
	//게시글 삭제
	@DeleteMapping("/delete/{id}")
	@ApiOperation(value="게시글 삭제",response= Integer.class)
	public ResponseEntity<Integer> empDelete(@PathVariable int id){
		Integer result = service.deleteBoard(id);
		ResponseEntity<Integer> ent;
		if( result>-1) {
			ent=new ResponseEntity<>(result, HttpStatus.OK);	//200
		}else {
			ent=new ResponseEntity<>(result, HttpStatus.NO_CONTENT); //204
		}
		return ent;
	}
	
	//검색기능
	@GetMapping("/search/name/{searchName}")
	@ApiOperation(value="이름으로 게시글 검색",response= Map.class)
	public ResponseEntity<Map<String, Object>> getSelectByName(@PathVariable String searchName){
		//상태값 전달
		System.err.println("이름으로 검색:"+searchName);
		Map<String, Object> resultMap=new HashMap<String, Object>();
		List<Board> list = service.selectByName(searchName);
		resultMap.put("status", "OK");
		resultMap.put("maxPage", list.size());
		resultMap.put("data", list);
		ResponseEntity<Map<String, Object>> ent= new ResponseEntity<>(resultMap, HttpStatus.OK);
		return ent;
	}
	//검색기능
	@GetMapping("/search/title/{searchTitle}")
	@ApiOperation(value="제목으로 게시글 검색",response= Map.class)
	public ResponseEntity<Map<String, Object>> getSelectByTitle(@PathVariable String searchTitle){
		//상태값 전달
		System.err.println("제목으로 검색:"+searchTitle);
		Map<String, Object> resultMap=new HashMap<String, Object>();
		List<Board> list = service.selectByTitle(searchTitle);
		resultMap.put("status", "OK");
		resultMap.put("maxPage", list.size());
		resultMap.put("data", list);
		ResponseEntity<Map<String, Object>> ent= new ResponseEntity<>(resultMap, HttpStatus.OK);
		return ent;
	}
	//검색기능
	@GetMapping("/search/content/{searchContent}")
	@ApiOperation(value="내용으로 게시글 검색",response= Map.class)
	public ResponseEntity<Map<String, Object>> getSelectByContent(@PathVariable String searchContent){
		//상태값 전달
		System.err.println("제목으로 검색:"+searchContent);
		Map<String, Object> resultMap=new HashMap<String, Object>();
		List<Board> list = service.selectByContent(searchContent);
		resultMap.put("status", "OK");
		resultMap.put("maxPage", list.size());
		resultMap.put("data", list);
		ResponseEntity<Map<String, Object>> ent= new ResponseEntity<>(resultMap, HttpStatus.OK);
		return ent;
	}
}
