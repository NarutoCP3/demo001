package com.mis.base;

import java.util.ArrayList;
import java.util.List;

public class PageModel {
	public Integer pageNum = 1;//当前的页数（页码），从第1页开始
	public Integer pageSize = 5;//每页查询的条数
	public Integer lastNum;//当前分页查询的最后一页
	
	public List list = new ArrayList();//分页查询到的数据的集合

	public Integer getLastNum() {
		return lastNum;
	}

	public void setLastNum(Integer lastNum) {
		this.lastNum = lastNum;
	}

	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

}
