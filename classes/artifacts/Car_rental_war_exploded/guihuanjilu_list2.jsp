<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>�黹��¼</title>
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>���й黹��¼�б�</p>
  <form name="form1" id="form1" method="post" action="">
   ����:  ������ţ�<input name="cheliangbianhao" type="text" id="cheliangbianhao" style='border:solid 1px #000000; color:#666666' size="12" />  �������<input name="cheliangleibie" type="text" id="cheliangleibie" style='border:solid 1px #000000; color:#666666' size="12" />
     <input type="submit" name="Submit" value="����" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">���</td>
    <td bgcolor='#CCFFFF'>�������</td>
    <td bgcolor='#CCFFFF'>�������</td>
    <td bgcolor='#CCFFFF'>��������</td>
    <td bgcolor='#CCFFFF'>���</td>
    <td bgcolor='#CCFFFF'>���ÿ�ʼʱ��</td>
    <td bgcolor='#CCFFFF' width='65' align='center'>�黹ʱ��</td>
    <td bgcolor='#CCFFFF'>��������</td>
    <td bgcolor='#CCFFFF'>���</td>
    <td bgcolor='#CCFFFF'>�黹��</td>
    
    <td bgcolor='#CCFFFF' width='80' align='center'>�Ƿ����</td>
    <td width="138" align="center" bgcolor="CCFFFF">���ʱ��</td>
    <td width="60" align="center" bgcolor="CCFFFF">����</td>
  </tr>
 <% 
  	


  	 new CommDAO().delete(request,"guihuanjilu"); 
    String url = "guihuanjilu_list2.jsp?1=1"; 
    String sql =  "select * from guihuanjilu where guihuanren='"+request.getSession().getAttribute("username")+"' ";
	
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
 <td><%=map.get("zujin") %></td>
 <td><%=map.get("zuyongkaishishijian") %></td>
 <td><%=map.get("guihuanshijian") %></td>
 <td><%=map.get("zuyongtianshu") %></td>
 <td><%=map.get("jine") %></td>
 <td><%=map.get("guihuanren") %></td>

    <td width='80' align='center'><%=map.get("issh")%></td>
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><a href="guihuanjilu_updt.jsp?id=<%=map.get("id")%>">�޸�</a>  <a href="guihuanjilu_list2.jsp?scid=<%=map.get("id") %>" onclick="return confirm('���Ҫɾ����')">ɾ��</a> <!--qiatnalijne--> </td>
  </tr>
  	<%
  }
   %>
</table><br>
  
${page.info }

  <%
//yoxutixinxg if(kucddduntx>0)
//yoxutixinxg{
//yoxutixinxg tsgehxdhdm
//yoxutixinxg}
%>
  </body>
</html>

