package com.mis.borrow.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.mis.book.domain.Books;

@Repository
public interface BorrowMapper {

	public List<Map<String, Object>> borrowBooks(@Param("bookType")String bookType,
			@Param("bookName")String bookName,
			@Param("author")String author,
			@Param("pageNum")Integer pageNum,
			@Param("pageSize")Integer pageSize);
	
	public Integer selectCountByPages(Books book);
	
	public Integer insertBorrow(@Param("id")String id,@Param("bookId")Integer bookId,@Param("username")String username);
	
	public List<Map<String, Object>> selectBorrowBooks(@Param("username")String username,
			@Param("pageNum")Integer pageNum,
			@Param("pageSize")Integer pageSize);
	
	public Integer selectCountOfBorrower(String username);
	
	public Integer returnBooks(String bbid);
}
