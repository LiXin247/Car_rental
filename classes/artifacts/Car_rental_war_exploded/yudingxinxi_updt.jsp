<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>预订信息</title>
	
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>


  </head>
<script language="javascript">

function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"；", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"；";
	}
}
</script>

  <body >
   <% 

String id = request.getParameter("id"); 

HashMap ext = new HashMap(); 

new CommDAO().update(request,response,"yudingxinxi",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"yudingxinxi"); 

%>
  <form  action="yudingxinxi_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  修改预订信息:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">  
     
     <tr><td>车辆编号：</td><td><input name='cheliangbianhao' type='text' id='cheliangbianhao' value='<%= mmm.get("cheliangbianhao")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>车辆类别：</td><td><input name='cheliangleibie' type='text' id='cheliangleibie' value='<%= mmm.get("cheliangleibie")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>车辆名称：</td><td><input name='cheliangmingcheng' type='text' id='cheliangmingcheng' value='<%= mmm.get("cheliangmingcheng")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>租金：</td><td><input name='zujin' type='text' id='zujin' value='<%= mmm.get("zujin")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>车辆状态：</td><td><input name='cheliangzhuangtai' type='text' id='cheliangzhuangtai' value='<%= mmm.get("cheliangzhuangtai")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
     <tr><td>租用开始时间：</td><td><input name='zuyongkaishishijian' type='text' id='zuyongkaishishijian' value='<%= mmm.get("zuyongkaishishijian")%>' onclick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" readonly='readonly'  /></td></tr>
     <tr><td>租用人：</td><td><input name='zuyongren' type='text' id='zuyongren' value='<%= mmm.get("zuyongren")%>' style='border:solid 1px #000000; color:#666666' /></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return checkform();" />
      <input type="reset" name="Submit2" value="重置" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


