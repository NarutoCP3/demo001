package com.mis.book.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mis.book.domain.Books;

@Repository
public interface BookMapper {
	public List<Map<String,Object>> selectBooks(@Param("bookType")String bookType,
			@Param("bookName")String bookName,
			@Param("author")String author,
			@Param("pageNum")Integer pageNum,
			@Param("pageSize")Integer pageSize);
	
	public Integer selectCountByPages(Books book);
	
	public Integer insertBook(Books book);
	
	public Books selectBookById(Integer id);
	
	public Integer updateBookById(Books book);
	
	public Integer deleteBookById(Integer id);
	
	public Map<String,Object> selectBookInfoById(Integer id);
}
