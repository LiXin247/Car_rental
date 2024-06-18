package util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import dao.CommDAO;

public class PageManager {
	public static final int DEFAULTPAGESIZE = 20;
	public static final int segment = 10;
	protected int currentPage;
	protected int pageSize;
	protected long pageNumber;
	protected long count;
	protected Collection collection;
	protected CommDAO dao = new CommDAO();
	protected String info;
	protected String path;
	protected HttpServletRequest request;
	protected String parameter = "";
	protected PageManager(String path, int pageSize, HttpServletRequest request) {
		// ???????dao????
		this.currentPage = 1;
		this.pageNumber = 1;
		this.count = 0;
		this.pageSize = pageSize <= 0 ? DEFAULTPAGESIZE : pageSize;
		this.request = request;
		this.path = path;

		request.setAttribute("page", this);

		try {
			this.currentPage = Integer.parseInt(request
					.getParameter("currentPage")) <= 0 ? 1 : Integer
					.parseInt(request.getParameter("currentPage"));

		} catch (Exception e) {

			try {
				this.currentPage = Integer.parseInt((String) request
						.getSession().getAttribute("currentPage"));

			} catch (Exception e1) {
				this.currentPage = 1;

			}

		}

	}
	public static PageManager getPage(String path, int pageSize,
			HttpServletRequest request) {
		return new PageManager(path, pageSize, request);

	}
	public void doList(String hql) {
        
		this.count = this.dao.select(hql).size();
		if (this.count != 0) {
			this.pageNumber = count % this.pageSize == 0 ? this.count
					/ this.pageSize : this.count / this.pageSize + 1;
			if (this.currentPage > this.pageNumber)
				this.currentPage = (int) this.pageNumber;

		}
		this.request.getSession().setAttribute("currentPage",
				String.valueOf(this.currentPage));
		this.collection = this.dao.select(hql,
				this.currentPage , this.pageSize);

		this.refreshUrl();
	}
	protected void refreshUrl() {
		StringBuffer buf = new StringBuffer();
		buf.append("<font color='#1157B7'>共").append(count);
		buf.append("条");
		buf.append("&nbsp;&nbsp;");
		buf.append("第").append(this.currentPage).append("/").append(
				this.pageNumber).append("页");
		buf.append("&nbsp;&nbsp;&nbsp;&nbsp;");
		if (this.currentPage == 1)
			buf.append("首页");
		else
			buf.append("<a href='").append(this.path).append("&currentPage=1")
					.append(parameter)
					.append("' class='ls'>").append("首页")
					.append("</a>");
		// ////////////////////////#1157B7
		buf.append("&nbsp;&nbsp;&nbsp;&nbsp;");

		if (this.currentPage > 1) {
			buf.append("<a href='").append(this.path).append("&currentPage=")
					.append(currentPage - 1).append(parameter).append(
							"' class='ls'>").append("上页")
					.append("</a>");
		} else {
			buf.append("上页");

		}
		buf.append("&nbsp;&nbsp;");

		int currentSegment = this.currentPage % segment == 0 ? this.currentPage
				/ segment : this.currentPage / segment + 1;

		buf.append("&nbsp;&nbsp;");
		if (this.currentPage < this.pageNumber) {
			buf.append("<a href='").append(this.path).append("&currentPage=")
					.append(currentPage + 1).append(parameter).append(
							"' class='ls'>").append("下页")
					.append("</a>");
		} else {

			buf.append("下页");

		}

		buf.append("&nbsp;&nbsp;&nbsp;&nbsp;");
		if (this.currentPage == this.pageNumber)
			buf.append("末页&nbsp;&nbsp;");
		else
			buf.append("<a href='").append(this.path).append("&currentPage=")
					.append(this.pageNumber).append(parameter).append(
							"' class='ls'>").append("末页")
					.append("</a></font>&nbsp;&nbsp;");
		buf.append("<select onchange=\"javascript:window.location='").append(
						this.path).append("&currentPage='+").append(
						"this.options[this.selectedIndex].value").append(parameter)
				.append("\">");
		for (int i = 0; i < this.pageNumber; i++) {
			if (this.currentPage == i + 1)
				buf.append("<option value=" + (i + 1)
						+ " selected=\"selected\">" + (i + 1) + "</option>");
			else
				buf.append("<option value=" + (i + 1) + ">" + (i + 1)
						+ "</option>");

		}
		buf.append("</select>");
		this.info = buf.toString();

	}
	public Collection getCollection() {
		return collection;
	}
	public long getCount() {
		return count;
	}
	public String getInfo() {
		return info;
	}
	public static ArrayList<HashMap> getPages(String url,int pagesize,String sql,HttpServletRequest request )
	{
	     
		PageManager pageManager = PageManager.getPage(url, pagesize, request);
		  pageManager.doList(sql);
		  PageManager bean = (PageManager) request.getAttribute("page");
		 
		  ArrayList<HashMap> nlist = (ArrayList) bean.getCollection();
		  return nlist;
	}
}
