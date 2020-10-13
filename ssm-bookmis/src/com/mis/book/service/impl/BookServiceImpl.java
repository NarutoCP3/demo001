package com.mis.book.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mis.base.PageModel;
import com.mis.book.dao.BookMapper;
import com.mis.book.domain.Books;
import com.mis.book.service.BookService;

@Service
public class BookServiceImpl implements BookService{

	@Autowired
	BookMapper bookMapper;
	
	/**
	 * MyBatis版本分页查询图书列表逻辑
	 */
	@Override
	public PageModel pageList(Books book,PageModel pageModel) {
		//分页查询，limit中第一个参数 从第几条开始（pageNum）
		Integer pageNum = (pageModel.getPageNum() - 1)*pageModel.getPageSize();
		//limit中，第二个参数 每页查询显示几条（pageSize）。
		Integer pageSize = pageModel.getPageSize();
		
		pageModel.list = bookMapper.selectBooks(book.getBookType(), book.getBookName(), book.getAuthor(), pageNum, pageSize);
		
		int count = bookMapper.selectCountByPages(book);
		
		int lastNum = count/pageModel.pageSize;
		//例如：10条数据，每页显示3条，三页余1条，所以总共要4页
		if(count % pageModel.pageSize != 0) {//没有整除
			lastNum = lastNum + 1;
		}
		pageModel.setLastNum(lastNum);
		
		return pageModel;//设置了pageModel对象的list和lastNum属性，返回pageModel对象
	}
	
	/**
	 * MyBatis添加图书
	 */
	@Override
	public int add(Books book) {
		int res = bookMapper.insertBook(book);
		return res;
	}
	
	/**
	 * MyBatis版本通过id查询books表
	 */
	@Override
	public Books getBookById(Integer id) {
		Books book = bookMapper.selectBookById(id);
		return book;
	}
	
	/**
	 * MyBatis版本修改图书
	 */
	@Override
	public int update(Books book) {
		int res = bookMapper.updateBookById(book);
		return res;
	}
	
	/**
	 * Mybatis版本根据id删除图书
	 */
	@Override
	public int delBookById(Integer id) {
		int res = bookMapper.deleteBookById(id);
		return res;
	}
	
	/**
	 * MyBatis版本图书详情
	 */
	@Override
	public Map<String, Object> getBookInfoById(Integer id) {
		return bookMapper.selectBookInfoById(id);
	}
}
