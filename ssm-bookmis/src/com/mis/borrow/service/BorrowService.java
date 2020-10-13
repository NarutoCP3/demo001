package com.mis.borrow.service;

import com.mis.base.PageModel;
import com.mis.book.domain.Books;

public interface BorrowService {

	public PageModel pageList(Books book,PageModel pageModel);
	public int borrow(Integer bookId,String username);
	public PageModel borrowList(String username,PageModel pageModel);
	public int returnBook(String bbid);
}
