<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>车辆信息</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有车辆信息列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  车辆编号：<input name="cheliangbianhao" type="text" id="cheliangbianhao" style='border:solid 1px #000000; color:#666666' size="12" />  车辆类别：<%=Info.getselect("cheliangleibie","cheliangleibiexinxi","cheliangleibie"," 1=1 ")%>
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>车辆编号</td>
    <td bgcolor='#CCFFFF'>车辆类别</td>
    <td bgcolor='#CCFFFF'>车辆名称</td>
    <td bgcolor='#CCFFFF'>汽车用途</td>
    <td bgcolor='#CCFFFF'>租金</td>
    <td bgcolor='#CCFFFF'>车辆状态</td>
    <td bgcolor='#CCFFFF' width='90' align='center'>图片</td>
    
    
	
    <td width="138" align="center" bgcolor="CCFFFF">添加时间</td>
    
    <td width="60" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"cheliangxinxi"); 
    String url = "cheliangxinxi_list.jsp?1=1"; 
    String sql =  "select * from cheliangxinxi where 1=1";
	
if(request.getParameter("cheliangbianhao")=="" ||request.getParameter("cheliangbianhao")==null ){}else{sql=sql+" and cheliangbianhao like '%"+request.getParameter("cheliangbianhao")+"%'";}
if(request.getParameter("cheliangleibie")=="" ||request.getParameter("cheliangleibie")==null ){}else{sql=sql+" and cheliangleibie like '%"+request.getParameter("cheliangleibie")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("cheliangbianhao") %></td>
    <td><%=map.get("cheliangleibie") %></td>
    <td><%=map.get("cheliangmingcheng") %></td>
    <td><%=map.get("qicheyongtu") %></td>
    <td><%=map.get("zujin") %></td>
    <td><%=map.get("cheliangzhuangtai") %></td>
    <td width='90' align='center'><a href='<%=map.get("tupian") %>' target='_blank'><img src='<%=map.get("tupian") %>' width=88 height=99 border=0 /></a></td>
    
    
	
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="cheliangxinxi_updt.jsp?id=<%=map.get("id")%>">修改</a>  <a href="cheliangxinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> <a href="cheliangxinxidetail.jsp?id=<%=map.get("id")%>" target="_blank">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
${page.info }


  </body>
</html>

