<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>车辆信息详细</title>
    <LINK href="css.css" type=text/css rel=stylesheet>

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"cheliangxinxi");
     %>
  车辆信息详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%' height=44>车辆编号：</td><td width='39%'><%=m.get("cheliangbianhao")%></td>
<td  rowspan=6 align=center><a href=<%=m.get("tupian")%> target=_blank><img src=<%=m.get("tupian")%> width=228 height=215 border=0></a></td></tr><tr>
<td width='11%' height=44>车辆类别：</td><td width='39%'><%=m.get("cheliangleibie")%></td>
</tr><tr>
<td width='11%' height=44>车辆名称：</td><td width='39%'><%=m.get("cheliangmingcheng")%></td>
</tr><tr>
<td width='11%' height=44>汽车用途：</td><td width='39%'><%=m.get("qicheyongtu")%></td>
</tr><tr>
<td width='11%' height=44>租金：</td><td width='39%'><%=m.get("zujin")%></td>
</tr><tr>
<td width='11%' height=44>车辆状态：</td><td width='39%'><%=m.get("cheliangzhuangtai")%></td>
</tr><tr>


<td width='11%' height=100  >备注：</td><td width='39%' colspan=2 height=100 ><%=m.get("beizhu")%></td></tr><tr><td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" /></td></tr>
    
  </table>

  </body>
</html>


