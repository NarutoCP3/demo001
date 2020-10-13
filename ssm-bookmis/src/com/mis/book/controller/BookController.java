package com.mis.book.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mis.base.CommonSelect;
import com.mis.base.PageModel;
import com.mis.book.domain.Books;
import com.mis.book.service.BookService;

@Controller
@RequestMapping("book")
public class BookController {

	@Autowired
	BookService bookService;
	
	@Autowired
	HttpServletRequest request;
	
	/**
	 * 图书列表页面
	 */
	@RequestMapping("bookList")
	public String bookList(Books book,Integer pageNum,Integer delFlag) {
		request.setAttribute("delFlag", delFlag);
		
		PageModel pageModel = new PageModel();
		
		if(pageNum != null) {
			pageModel.setPageNum(pageNum);
		}
		
		pageModel = bookService.pageList(book, pageModel);
		
		request.setAttribute("pageModel", pageModel);
		request.setAttribute("book", book);
		
		request.setAttribute("bookType", CommonSelect.bookType);
		
		return "book_list";
	}
	
	/**
	 * 跳转书籍添加页面
	 */
	@RequestMapping("addPage")
	public String addPage(Integer addFlag) {
		request.setAttribute("bookType", CommonSelect.bookType);
		
		request.setAttribute("addFlag", addFlag);
		
		return "book_add";
	}
	
	/**
	 * 添加图书
	 */
	@RequestMapping("add")
	public String add(Books book) {
		int res = bookService.add(book);
		
		return "redirect:/book/addPage?addFlag=" + res;
	}
	
	/**
	 * 跳转图书修改页
	 */
	@RequestMapping("toUpdatePage")
	public String toUpdatePage(Integer id,Integer updateFlag) {
		request.setAttribute("b", bookService.getBookById(id));
		
		request.setAttribute("updateFlag", updateFlag);
		
		request.setAttribute("bookType", CommonSelect.bookType);
		
		return "book_update";
	}
	
	/**
	 * 修改图书
	 */
	@RequestMapping("update")
	public String update(Books book) {
		int res = bookService.update(book);
		
		return "redirect:/book/toUpdatePage?updateFlag=" + res + "&id=" + book.getId();
	}
	
	/**
	 * 删除图书
	 */
	@RequestMapping("del")
	public String del(Integer id) {
		int res = bookService.delBookById(id);
		
		return "redirect:/book/bookList?delFlag=" + res;
	}
	
	/**
	 * 图书详情
	 */
	@RequestMapping("bookInfo")
	public String bookInfo(Integer id) {
		request.setAttribute("bookInfo", bookService.getBookInfoById(id));

		return "book_info";
	}
}
