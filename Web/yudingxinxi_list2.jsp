<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>Ԥ����Ϣ</title>

	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>����Ԥ����Ϣ�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:  ������ţ�<input name="cheliangbianhao" type="text" id="cheliangbianhao" style='border:solid 1px #000000; color:#666666' size="12" />  �������<input name="cheliangleibie" type="text" id="cheliangleibie" style='border:solid 1px #000000; color:#666666' size="12" />
     <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">
  <tr>
    <td width="27" align="center" bgcolor="CCFFFF">���</td>
    <td width="112" bgcolor='#CCFFFF'>�������</td>
    <td width="112" bgcolor='#CCFFFF'>�������</td>
    <td width="112" bgcolor='#CCFFFF'>��������</td>
    <td width="63" bgcolor='#CCFFFF'>���</td>
    <td width="112" bgcolor='#CCFFFF'>����״̬</td>
    <td bgcolor='#CCFFFF' width='67' align='center'>���ÿ�ʼʱ��</td>
    <td width="81" bgcolor='#CCFFFF'>������</td>
    <td bgcolor='#CCFFFF' width='69' align='center'>�Ƿ����</td>
    <td bgcolor='#CCFFFF' width='69' align='center'>�Ƿ�黹</td>
    <td width="68" align="center" bgcolor="CCFFFF">���ʱ��</td>
    <td width="110" align="center" bgcolor="CCFFFF">����</td>
  </tr>
 <%

  	 new CommDAO().delete(request,"yudingxinxi");
    String url = "yudingxinxi_list2.jsp?1=1";
    String sql =  "select * from yudingxinxi where zuyongren='"+request.getSession().getAttribute("username")+"' ";

if(request.getParameter("cheliangbianhao")=="" ||request.getParameter("cheliangbianhao")==null ){}else{sql=sql+" and cheliangbianhao like '%"+request.getParameter("cheliangbianhao")+"%'";}
if(request.getParameter("cheliangleibie")=="" ||request.getParameter("cheliangleibie")==null ){}else{sql=sql+" and cheliangleibie like '%"+request.getParameter("cheliangleibie")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request);
	int i=0;
	for(HashMap map:list){
	i++;

     %>
  <tr>
    <td width="27" align="center"><%=i %></td>
    <td><%=map.get("cheliangbianhao") %></td>
 <td><%=map.get("cheliangleibie") %></td>
 <td><%=map.get("cheliangmingcheng") %></td>
 <td><%=map.get("zujin") %></td>
 <td><%=map.get("cheliangzhuangtai") %></td>
 <td><%=map.get("zuyongkaishishijian") %></td>
 <td><%=map.get("zuyongren") %></td>
 <td width='69' align='center'><%=map.get("issh")%></td>
    <td width='69' align='center'><%=map.get("issh2")%></td>
    <td width="68" align="center"><%=map.get("addtime") %></td>
    <td width="110" align="center"><a href="yudingxinxi_detail.jsp?id=<%=map.get("id")%>">��ϸ</a>

	<%

         if (map.get("issh").equals("��") && map.get("issh2").equals("��"))

       {
	    %>
	<a href="guihuanjilu_add.jsp?id=<%=map.get("id")%>">�����黹</a>
		<%
           }
            else

		{

			}
				%>


	</td>
  </tr>
  	<%
  }
   %>
</table>
<br>

${page.info }

  <%

%>
  </body>
</html>

