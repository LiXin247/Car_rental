<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>Ԥ����Ϣ��ϸ</title>


  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"yudingxinxi");
     %>
  Ԥ����Ϣ��ϸ:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
   <tr>
     <td width='11%'>������ţ�</td><td width='39%'><%=m.get("cheliangbianhao")%></td>
<td width='11%'>�������</td><td width='39%'><%=m.get("cheliangleibie")%></td></tr><tr>
<td width='11%'>�������ƣ�</td><td width='39%'><%=m.get("cheliangmingcheng")%></td>
<td width='11%'>���</td><td width='39%'><%=m.get("zujin")%></td></tr><tr>
<td width='11%'>����״̬��</td><td width='39%'><%=m.get("cheliangzhuangtai")%></td>
<td width='11%'>���ÿ�ʼʱ�䣺</td><td width='39%'><%=m.get("zuyongkaishishijian")%></td></tr><tr>
<td width='11%'>�����ˣ�</td><td width='39%'><%=m.get("zuyongren")%></td>
<td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=���� onClick="javascript:history.back()" /></td></tr>
    
  </table>

  </body>
</html>


