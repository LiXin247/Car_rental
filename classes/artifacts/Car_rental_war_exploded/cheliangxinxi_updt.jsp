<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>������Ϣ</title>
	
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
    <LINK href="css.css" type=text/css rel=stylesheet>

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

new CommDAO().update(request,response,"cheliangxinxi",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"cheliangxinxi"); 

%>
  <form  action="cheliangxinxi_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  �޸ĳ�����Ϣ:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     
     <tr><td>������ţ�</td><td><input name='cheliangbianhao' type='text' id='cheliangbianhao' value='<%= mmm.get("cheliangbianhao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>�������</td><td><%=Info.getselect("cheliangleibie","cheliangleibiexinxi","cheliangleibie")%></td></tr><script language="javascript">document.form1.cheliangleibie.value='<%=mmm.get("cheliangleibie")%>';</script>
     <tr><td>�������ƣ�</td><td><input name='cheliangmingcheng' type='text' id='cheliangmingcheng' value='<%= mmm.get("cheliangmingcheng")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>������;��</td><td><input name='qicheyongtu' type='text' id='qicheyongtu' value='<%= mmm.get("qicheyongtu")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>���</td><td><input name='zujin' type='text' id='zujin' value='<%= mmm.get("zujin")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>����״̬��</td><td><select name='cheliangzhuangtai' id='cheliangzhuangtai'><option value="����">����</option><option value="����">����</option></select></td></tr><script language="javascript">document.form1.cheliangzhuangtai.value='<%=mmm.get("cheliangzhuangtai")%>';</script>
     <tr><td>ͼƬ��</td><td><input name='tupian' type='text' id='tupian' size='50' value='<%= mmm.get("tupian")%>' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='�ϴ�' onClick="up('tupian')" style='border:solid 1px #000000; color:#666666'/></td></tr>
     <tr><td>��ע��</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' style='border:solid 1px #000000; color:#666666'><%=mmm.get("beizhu")%></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="�ύ" onClick="return checkform();" />
      <input type="reset" name="Submit2" value="����" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


