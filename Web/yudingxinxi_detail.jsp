<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>预订信息详细</title>


  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"yudingxinxi");
     %>
  预订信息详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>车辆编号：</td><td width='39%'><%=m.get("cheliangbianhao")%></td>
<td width='11%'>车辆类别：</td><td width='39%'><%=m.get("cheliangleibie")%></td></tr><tr>
<td width='11%'>车辆名称：</td><td width='39%'><%=m.get("cheliangmingcheng")%></td>
<td width='11%'>租金：</td><td width='39%'><%=m.get("zujin")%></td></tr><tr>
<td width='11%'>车辆状态：</td><td width='39%'><%=m.get("cheliangzhuangtai")%></td>
<td width='11%'>租用开始时间：</td><td width='39%'><%=m.get("zuyongkaishishijian")%></td></tr><tr>
<td width='11%'>租用人：</td><td width='39%'><%=m.get("zuyongren")%></td>
<td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" /></td></tr>
    
  </table>

  </body>
</html>


