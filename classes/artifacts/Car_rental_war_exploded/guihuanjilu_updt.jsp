<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>�黹��¼</title>
	
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>

  </head>
<script language="javascript">

function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"��", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"��";
	}
}
</script>

  <body >
   <% 

String id = request.getParameter("id"); 

HashMap ext = new HashMap(); 

new CommDAO().update(request,response,"guihuanjilu",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"guihuanjilu"); 

%>
  <form  action="guihuanjilu_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  �޸Ĺ黹��¼:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     
     <tr><td>������ţ�</td><td><input name='cheliangbianhao' type='text' id='cheliangbianhao' value='<%= mmm.get("cheliangbianhao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>�������</td><td><input name='cheliangleibie' type='text' id='cheliangleibie' value='<%= mmm.get("cheliangleibie")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>�������ƣ�</td><td><input name='cheliangmingcheng' type='text' id='cheliangmingcheng' value='<%= mmm.get("cheliangmingcheng")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>���</td><td><input name='zujin' type='text' id='zujin' value='<%= mmm.get("zujin")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>���ÿ�ʼʱ�䣺</td><td><input name='zuyongkaishishijian' type='text' id='zuyongkaishishijian' value='<%= mmm.get("zuyongkaishishijian")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>�黹ʱ�䣺</td><td><input name='guihuanshijian' type='text' id='guihuanshijian' value='<%= mmm.get("guihuanshijian")%>' onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" readonly='readonly'  /></td></tr>
     <tr><td>����������</td><td><input name='zuyongtianshu' type='text' id='zuyongtianshu' value='<%= mmm.get("zuyongtianshu")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>��</td><td><input name='jine' type='text' id='jine' value='<%= mmm.get("jine")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>�黹�ˣ�</td><td><input name='guihuanren' type='text' id='guihuanren' value='<%= mmm.get("guihuanren")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onClick="return checkform();" />
      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


