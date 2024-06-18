package control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.RequestContext;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;


import util.Info;

import dao.CommDAO;

public class MainCtrl extends HttpServlet {  //111
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}
	public void go(String url,HttpServletRequest request, HttpServletResponse response) {
		try {
			request.getRequestDispatcher(url).forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public void gor(String url,HttpServletRequest request, HttpServletResponse response)
	{
		try {
			response.sendRedirect(url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String ac = request.getParameter("ac");
		request.setCharacterEncoding("UTF-8");
		if(ac==null)ac="";
		CommDAO dao = new CommDAO();
		String date = Info.getDateStr();
		String today = date.substring(0,10);
		String tomonth = date.substring(0,7);


		if(ac.equals("login"))
		{
			String username = request.getParameter("username");
			String password = request.getParameter("pwd1");
			String utype = request.getParameter("cx");
			String pagerandom = request.getParameter("pagerandom")==null?"":request.getParameter("pagerandom");
			String random = (String)request.getSession().getAttribute("random");
			if(!pagerandom.equals(random)&&request.getParameter("a")!=null)
			{
				request.setAttribute("random", "");
				go("/index.jsp", request, response);
			}
			else{
				String sql1="";
				if (utype.equals("�ͻ�"))
				{
					sql1 = "select * from kehuxinxi where yonghuming='"+username+"' and mima='"+password+"' and issh='��'";

				}
				else
				{
					sql1 = "select * from kehuxinxi where yonghuming='"+username+"' and mima='"+password+"' and issh='��'";
				}
				List<HashMap> userlist1 = dao.select(sql1);
				if(userlist1.size()==1)
				{
					if (utype.equals("�ͻ�"))
					{
						request.getSession(). setAttribute("username", userlist1.get(0).get("yonghuming"));
					}
					else
					{
						request.getSession(). setAttribute("username", userlist1.get(0).get("gonghao"));
					}
					request.getSession(). setAttribute("cx", utype);
					gor("index.jsp", request, response);
				}else{
					request.setAttribute("error", "");
					go("/index.jsp", request, response);
				}



			}
		}

		if(ac.equals("adminlogin"))
		{
			String username = request.getParameter("username");
			String password = request.getParameter("pwd");
			String utype = request.getParameter("cx");
			String pagerandom = request.getParameter("pagerandom")==null?"":request.getParameter("pagerandom");
			String random = (String)request.getSession().getAttribute("random");
			if(!pagerandom.equals(random)&&request.getParameter("a")!=null)
			{
				request.setAttribute("random", "");
				go("/login.jsp", request, response);
			}
			else{
				String sql1 = "select * from allusers where username='"+username+"' and pwd='"+password+"'  ";
				List<HashMap> userlist1 = dao.select(sql1);
				if(userlist1.size()==1)
				{
					request.getSession(). setAttribute("username", userlist1.get(0).get("username"));
					request.getSession(). setAttribute("cx",  userlist1.get(0).get("cx"));
					gor("main.jsp", request, response);
				}else{
					request.setAttribute("error", "");
					go("/login.jsp", request, response);
				}



			}
		}


		//�޸�����
		if(ac.equals("uppass"))
		{
			String olduserpass = request.getParameter("ymm");
			String userpass = request.getParameter("xmm1");
			String copyuserpass = request.getParameter("xmm2");
			HashMap m = dao.getmaps("yonghuming",(String)request.getSession().getAttribute("username"), "yonghuzhuce");
			if(!(((String)m.get("mima")).equals(olduserpass)))
			{
				request.setAttribute("error", "");
				go("mod2.jsp", request, response);
			}else{
				//String id = (String)user.get("id");
				String sql = "update yonghuzhuce set mima='"+userpass+"' where yonghuming='"+(String)request.getSession().getAttribute("username")+"'";
				dao.commOper(sql);
				request.setAttribute("suc", "");
				go("mod2.jsp", request, response);
			}
		}

		//�޸�����
		if(ac.equals("adminuppass"))
		{
			String olduserpass = request.getParameter("ymm");
			String userpass = request.getParameter("xmm1");
			String copyuserpass = request.getParameter("xmm2");
			//println(Info.getUser(request).get("id").toString());
			HashMap m = dao.getmaps("username",(String)request.getSession().getAttribute("username"), "allusers");

			if(!(((String)m.get("pwd")).equals(olduserpass)))
			{
				request.setAttribute("error", "");
				go("mod.jsp", request, response);
			}else{
				//String id = (String)user.get("id");
				String sql = "update allusers set pwd='"+userpass+"' where username='"+(String)request.getSession().getAttribute("username")+"'";
				dao.commOper(sql);
				request.setAttribute("suc", "");
				go("mod.jsp", request, response);
			}
		}


		if(ac.equals("uploaddoc"))
		{
			try {
				String filename="";
				request.setCharacterEncoding("gb2312");
				RequestContext  requestContext = new ServletRequestContext(request);
				if(FileUpload.isMultipartContent(requestContext)){

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100*1024*1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if(fileItem.getName()!=null && fileItem.getSize()!=0)
					{
						if(fileItem.getName()!=null && fileItem.getSize()!=0){
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						}else{
						}
					}
				}

				go("/js/uploaddoc.jsp?docname="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}


		if(ac.equals("uploaddoc2"))
		{
			try {
				String filename="";
				request.setCharacterEncoding("gb2312");
				RequestContext  requestContext = new ServletRequestContext(request);
				if(FileUpload.isMultipartContent(requestContext)){

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100*1024*1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if(fileItem.getName()!=null && fileItem.getSize()!=0)
					{
						if(fileItem.getName()!=null && fileItem.getSize()!=0){
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						}else{
						}
					}
				}

				go("/js/uploaddoc2.jsp?docname="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}


		if(ac.equals("uploaddoc3"))
		{
			try {
				String filename="";
				request.setCharacterEncoding("gb2312");
				RequestContext  requestContext = new ServletRequestContext(request);
				if(FileUpload.isMultipartContent(requestContext)){

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100*1024*1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if(fileItem.getName()!=null && fileItem.getSize()!=0)
					{
						if(fileItem.getName()!=null && fileItem.getSize()!=0){
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						}else{
						}
					}
				}

				go("/js/uploaddoc3.jsp?docname="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
		if(ac.equals("uploadimg"))
		{
			try {
				String filename="";
				request.setCharacterEncoding("gb2312");
				RequestContext  requestContext = new ServletRequestContext(request);
				if(FileUpload.isMultipartContent(requestContext)){

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100*1024*1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if(fileItem.getName()!=null && fileItem.getSize()!=0)
					{
						if(fileItem.getName()!=null && fileItem.getSize()!=0){
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						}else{
						}
					}
				}

				go("/js/uploadimg.jsp?filename="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}


		if(ac.equals("uploadimg2"))
		{
			try {
				String filename="";
				request.setCharacterEncoding("gb2312");
				RequestContext  requestContext = new ServletRequestContext(request);
				if(FileUpload.isMultipartContent(requestContext)){

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100*1024*1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if(fileItem.getName()!=null && fileItem.getSize()!=0)
					{
						if(fileItem.getName()!=null && fileItem.getSize()!=0){
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						}else{
						}
					}
				}

				go("/js/uploadimg2.jsp?filename="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

		if(ac.equals("uploadimg3"))
		{
			try {
				String filename="";
				request.setCharacterEncoding("gb2312");
				RequestContext  requestContext = new ServletRequestContext(request);
				if(FileUpload.isMultipartContent(requestContext)){

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100*1024*1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if(fileItem.getName()!=null && fileItem.getSize()!=0)
					{
						if(fileItem.getName()!=null && fileItem.getSize()!=0){
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						}else{
						}
					}
				}

				go("/js/uploadimg3.jsp?filename="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

		if(ac.equals("uploadimg4"))
		{
			try {
				String filename="";
				request.setCharacterEncoding("gb2312");
				RequestContext  requestContext = new ServletRequestContext(request);
				if(FileUpload.isMultipartContent(requestContext)){

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100*1024*1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if(fileItem.getName()!=null && fileItem.getSize()!=0)
					{
						if(fileItem.getName()!=null && fileItem.getSize()!=0){
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						}else{
						}
					}
				}

				go("/js/uploadimg4.jsp?filename="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}

		if(ac.equals("uploadimg5"))
		{
			try {
				String filename="";
				request.setCharacterEncoding("gb2312");
				RequestContext  requestContext = new ServletRequestContext(request);
				if(FileUpload.isMultipartContent(requestContext)){

					DiskFileItemFactory factory = new DiskFileItemFactory();
					factory.setRepository(new File(request.getRealPath("/upfile/")+"/"));
					ServletFileUpload upload = new ServletFileUpload(factory);
					upload.setSizeMax(100*1024*1024);
					List items = new ArrayList();

					items = upload.parseRequest(request);

					FileItem fileItem = (FileItem) items.get(0);
					if(fileItem.getName()!=null && fileItem.getSize()!=0)
					{
						if(fileItem.getName()!=null && fileItem.getSize()!=0){
							File fullFile = new File(fileItem.getName());
							filename = Info.generalFileName(fullFile.getName());
							File newFile = new File(request.getRealPath("/upfile/")+"/" + filename);
							try {
								fileItem.write(newFile);
							} catch (Exception e) {
								e.printStackTrace();
							}
						}else{
						}
					}
				}

				go("/js/uploadimg5.jsp?filename="+filename, request, response);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}


		dao.close();
		out.flush();
		out.close();
	}

	public void init() throws ServletException {
		// Put your code here
	}
}
