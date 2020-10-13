package com.mis.borrow.contoller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mis.base.CommonSelect;
import com.mis.base.PageModel;
import com.mis.book.domain.Books;
import com.mis.borrow.service.BorrowService;
import com.mis.user.domain.Users;

@Controller
@RequestMapping("borrow")
public class BorrowController {
	
	@Autowired
	BorrowService borrowService;
	
	@Autowired
	HttpServletRequest request;
	
	/**
	 * 跳转到借阅图书列表页
	 */
	@RequestMapping("bookList")
	public String bookList(Integer pageNum,Books book,Integer borrowFlag) {
		PageModel pageModel = new PageModel();
		
		if(pageNum != null) {
			pageModel.setPageNum(pageNum);
		}
		
		pageModel = borrowService.pageList(book, pageModel);
		
		request.setAttribute("pageModel", pageModel);
		request.setAttribute("book", book);
		request.setAttribute("book_type", CommonSelect.bookType);
		request.setAttribute("borrowFlag", borrowFlag);

		return "borrow_book_list";
	}
	
	/**
	 * 图书借阅
	 */
	@RequestMapping("borrow")
	public String borrow(Integer bookId) {
		Users user = (Users)request.getSession().getAttribute("currentUser");
		
		int res = borrowService.borrow(bookId, user.getUserName());
		
		return "redirect:/borrow/bookList?borrowFlag=" + res;
	}
	
	/**
	 * 跳转当前用户已借阅图书页面
	 */
	@RequestMapping("borrowedBooks")
	public String borrowedBooks(Integer pageNum,Integer returnFlag) {
		Users user = (Users)request.getSession().getAttribute("currentUser");
		
		PageModel pageModel = new PageModel();
		
		if(pageNum != null) {
			pageModel.setPageNum(pageNum);
		}
		
		pageModel = borrowService.borrowList(user.getUserName(), pageModel);
		
		request.setAttribute("pageModel", pageModel);
		request.setAttribute("returnFlag", returnFlag);
		
		return "borrowed_books";
	}
	
	/**
	 * 归还图书
	 */
	@RequestMapping("returnBook")
	public String returnBook(String bbid) {
		int res = borrowService.returnBook(bbid);
		
		return "redirect:/borrow/borrowedBooks?returnFlag=" + res;
	}
}
