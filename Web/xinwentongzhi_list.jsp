<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>



<html>
  <head>
    
    <title>新闻通知</title>

  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  </head>
  <script language="javascript">
  function checkall()
  {
  	if(document.form2.plxz.checked==true)
	{
		var code_Values = document.all['pldel']; 
		if(code_Values.length){ 
		for(var i=0;i<code_Values.length;i++) 
		{ 
		code_Values[i].checked = true; 
		} 
		}else{ 
		code_Values.checked = true; 
		} 
	}
	else
	{
		var code_Values = document.all['pldel']; 
		if(code_Values.length){ 
		for(var i=0;i<code_Values.length;i++) 
		{ 
		code_Values[i].checked = false; 
		} 
		}else{ 
		code_Values.checked = false; 
		} 
	}
  }
  </script>
 <%
 new CommDAO().delete(request,"xinwentongzhi"); 

 %>
  <body >
  <p>已有新闻数据列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索: 标题：<input name="biaoti" type="text" id="biaoti" />
   类别
   <select name="leibie" id="leibie">
     <option value="">所有</option>
	 <option value="站内新闻">站内新闻</option>
     <option value="招聘会信息">招聘会信息</option>
     <option value="面试技巧">面试技巧</option>
   </select> 
   添加人：
   <input name="tianjiaren" type="text" id="tianjiaren" />
   <input type="submit" name="Submit" value="查找" />
   <input type="button" name="Submit2" value="新增" onClick="javascript:location.href='xinwentongzhi_add.jsp';" />
  </form>

  <form name="form2" method="post" action="delall.jsp">
    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">
      <tr>
        <td width="30" align="center" bgcolor="CCFFFF">序号</td>
        <td bgcolor='#CCFFFF'>标题</td>
        <td bgcolor='#CCFFFF'>类别</td>
        <td bgcolor='#CCFFFF'>添加人</td>
        <td bgcolor='#CCFFFF'>首页图片</td>
        <td bgcolor='#CCFFFF'>点击率</td>
        <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
        <td width="60" align="center" bgcolor="CCFFFF">操作</td>
            <input name="tablename" type="hidden" id="tablename" value="xinwentongzhi">
           </td>
      </tr>
    <%
        new CommDAO().delete(request,"xinwentongzhi");
        String url = "xinwentongzhi_list.jsp?1=1";
        String sql =  "select * from xinwentongzhi where 1=1 ";

        if(request.getParameter("biaoti")=="" ||request.getParameter("biaoti")==null ){}else{sql=sql + " and biaoti like '%"+request.getParameter("biaoti").trim()+"%' ";}
        if(request.getParameter("tianjiaren")=="" ||request.getParameter("tianjiaren")==null ){}else{sql=sql+ " and tianjiaren like '%"+request.getParameter("tianjiaren").trim()+"%' ";}
        if(request.getParameter("leibie")=="" ||request.getParameter("leibie")==null ){}else{sql=sql+ " and leibie like '%"+request.getParameter("leibie").trim()+"%' ";}
        sql+=" order by id desc";
        //out.print(sql);
        ArrayList<HashMap> list = PageManager.getPages(url,10,sql, request );
        int i=0;
        for(HashMap map:list){
            i++;
    %>
        <tr>
            <td width="30" align="center"><%=i %></td>
            <td><%=map.get("biaoti") %></td>
            <td><%=map.get("leibie") %></td>
            <td><%=map.get("tianjiaren") %></td>
            <td><%
                if (map.get("shouyetupian")==null || map.get("shouyetupian").equals("") || map.get("shouyetupian").equals("null"))
                {
            %>
                <%
                }
                else
                {
                %>
                <a href='<%=map.get("shouyetupian") %>' target='_blank'><img src='<%=map.get("shouyetupian") %>' width=88 height=99 border=0 /></a>
                <%
                    }
                %>
            </td>
            <td><%=map.get("dianjilv") %></td>
            <td width="138" align="center"><%=map.get("addtime") %></td>
            <td width="60" align="center"><a href="xinwentongzhi_updt.jsp?id=<%=map.get("id")%>">修改</a> <a onClick="return confirm('确定要删除这条记录吗?')"  href="xinwentongzhi_list.jsp?scid=<%=map.get("id")%>">删除</a></td>

        </tr>
        <%} %>
    </table>

      <br>
      ${page.info }
  </form>
  </body>
</html>



