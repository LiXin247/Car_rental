<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>���������Ϣ</title>
	<LINK href="css.css" type=text/css rel=stylesheet>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>���г��������Ϣ�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:  �������<input name="cheliangleibie" type="text" id="cheliangleibie" style='border:solid 1px #000000; color:#666666' size="12" />
   <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>�������</td>


    <td width="138" align="center" bgcolor="CCFFFF">���ʱ��</td>

    <td width="60" align="center" bgcolor="CCFFFF">����</td>
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
    <td width="60" align="center"><a href="cheliangleibiexinxi_updt.jsp?id=<%=map.get("id")%>">�޸�</a>  <a href="cheliangleibiexinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('���Ҫɾ����')">ɾ��</a> <!--qiatnalijne--> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>

${page.info }


  </body>
</html>

