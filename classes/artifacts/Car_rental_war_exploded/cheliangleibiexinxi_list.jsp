<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>车辆类别信息</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有车辆类别信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  车辆类别：<input name="cheliangleibie" type="text" id="cheliangleibie" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>车辆类别</td>


    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>

    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  <%



  	 new CommDAO().delete(request,"cheliangleibiexinxi");
    String url = "cheliangleibiexinxi_list.jsp?1=1";
    String sql =  "select * from cheliangleibiexinxi where 1=1";

if(request.getParameter("cheliangleibie")=="" ||request.getParameter("cheliangleibie")==null ){}else{sql=sql+" and cheliangleibie like '%"+request.getParameter("cheliangleibie")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request);
	int i=0;
	for(HashMap map:list){
	i++;




     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("cheliangleibie") %></td>


    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="cheliangleibiexinxi_updt.jsp?id=<%=map.get("id")%>">修改</a>  <a href="cheliangleibiexinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> <!--qiatnalijne--> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>

${page.info }


  </body>
</html>

