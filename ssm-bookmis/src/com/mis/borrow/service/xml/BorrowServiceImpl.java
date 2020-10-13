package com.mis.borrow.service.xml;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mis.base.PageModel;
import com.mis.book.domain.Books;
import com.mis.borrow.dao.BorrowMapper;
import com.mis.borrow.service.BorrowService;

@Service
public class BorrowServiceImpl implements BorrowService{
	
	@Autowired
	BorrowMapper borrowMapper;

	@Override
	public PageModel pageList(Books book, PageModel pageModel) {
		//分页查询，limit中第一个参数 从第几条开始（pageNum）
		Integer pageNum = (pageModel.getPageNum() - 1)*pageModel.getPageSize();
		//limit中，第二个参数 每页查询显示几条（pageSize）。
		Integer pageSize = pageModel.getPageSize();
		
		pageModel.list = borrowMapper.borrowBooks(book.getBookType(), book.getBookName(), book.getAuthor(), pageNum, pageSize);
		
		int count = borrowMapper.selectCountByPages(book);
		
		int lastNum = count/pageModel.pageSize;
		//例如：10条数据，每页显示3条，三页余1条，所以总共要4页
		if(count % pageModel.pageSize != 0) {//没有整除
			lastNum = lastNum + 1;
		}
		pageModel.setLastNum(lastNum);
		
		return pageModel;//设置了pageModel对象的list和lastNum属性，返回pageModel对象
	}

	@Override
	public int borrow(Integer bookId, String username) {
		//borrow表UUID为主键
//		UUID.randomUUID().toString(); ad12-asdzxz-asda-xzcz
		String id = UUID.randomUUID().toString().replaceAll("-", "");//替换掉-为空字符串
		
		int res = borrowMapper.insertBorrow(id, bookId, username);
		
		return res;
	}

	@Override
	public PageModel borrowList(String username, PageModel pageModel) {
		//分页查询，limit中第一个参数 从第几条开始（pageNum）
		Integer pageNum = (pageModel.getPageNum() - 1)*pageModel.getPageSize();
		//limit中，第二个参数 每页查询显示几条（pageSize）。
		Integer pageSize = pageModel.getPageSize();
		
		pageModel.list = borrowMapper.selectBorrowBooks(username, pageNum, pageSize);
		
		int count = borrowMapper.selectCountOfBorrower(username);
		
		int lastNum = count/pageModel.pageSize;
		//例如：10条数据，每页显示3条，三页余1条，所以总共要4页
		if(count % pageModel.pageSize != 0) {//没有整除
			lastNum = lastNum + 1;
		}
		pageModel.setLastNum(lastNum);
		
		return pageModel;//设置了pageModel对象的list和lastNum属性，返回pageModel对象
	}

	@Override
	public int returnBook(String bbid) {
		int res = borrowMapper.returnBooks(bbid);
		
		return res;
	}
}
