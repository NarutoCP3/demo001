package com.mis.book.service;

import java.util.Map;

import com.mis.base.PageModel;
import com.mis.book.domain.Books;

public interface BookService {
	
	public PageModel pageList(Books book,PageModel pageModel);
	public int add(Books book);
	public Books getBookById(Integer id);
	public int update(Books book);
	public int delBookById(Integer id);
	public Map<String, Object> getBookInfoById(Integer id);
}
