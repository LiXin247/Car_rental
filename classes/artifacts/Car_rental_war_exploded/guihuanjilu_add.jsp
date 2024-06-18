<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>归还记录</title>

    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
  String id="";
  id=request.getParameter("id");
 HashMap mlbdq = new CommDAO().getmap(id,"yudingxinxi");
 String cheliangbianhao="";
  	String cheliangleibie="";
  	String cheliangmingcheng="";
  	String zujin="";
  	String zuyongkaishishijian="";
  	
 cheliangbianhao=(String)mlbdq.get("cheliangbianhao");
  	cheliangleibie=(String)mlbdq.get("cheliangleibie");
  	cheliangmingcheng=(String)mlbdq.get("cheliangmingcheng");
  	zujin=(String)mlbdq.get("zujin");
  	zuyongkaishishijian=(String)mlbdq.get("zuyongkaishishijian");
  	 
 
   %>
<script language="javascript">

function gow()
{
	document.location.href="guihuanjilu_add.jsp?id=<%=id%>";
}
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

 <% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){


int tianshu=Info.dayToday(request.getParameter("zuyongkaishishijian"),request.getParameter("guihuanshijian"))+1;
ext.put("zuyongtianshu",tianshu); 
double jinej=0;jinej=Float.valueOf(request.getParameter("zujin")).floatValue()*Float.valueOf(tianshu).floatValue();
ext.put("jine",jinej);

String sql="update yudingxinxi set issh2='是' where cheliangbianhao='"+request.getParameter("cheliangbianhao")+"'";
	new CommDAO().commOper(sql);
	
	
	String sql4="update cheliangxinxi set cheliangzhuangtai='空闲' where cheliangbianhao='"+request.getParameter("cheliangbianhao")+"'";
	new CommDAO().commOper(sql4);



ext.put("issh","否");
ext.put("iszf","否");


}
new CommDAO().insert(request,response,"guihuanjilu",ext,true,false,""); 
%>

  <body >
 <form  action="guihuanjilu_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加归还记录:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
		<tr><td  width="200">车辆编号：</td><td><input name='cheliangbianhao' type='text' id='cheliangbianhao' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.cheliangbianhao.value='<%=cheliangbianhao%>';document.form1.cheliangbianhao.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">车辆类别：</td><td><input name='cheliangleibie' type='text' id='cheliangleibie' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.cheliangleibie.value='<%=cheliangleibie%>';document.form1.cheliangleibie.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">车辆名称：</td><td><input name='cheliangmingcheng' type='text' id='cheliangmingcheng' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.cheliangmingcheng.value='<%=cheliangmingcheng%>';document.form1.cheliangmingcheng.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">租金：</td><td><input name='zujin' type='text' id='zujin' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.zujin.value='<%=zujin%>';document.form1.zujin.setAttribute("readOnly",'true');</script>
		<tr><td  width="200">租用开始时间：</td><td><input name='zuyongkaishishijian' type='text' id='zuyongkaishishijian' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.zuyongkaishishijian.value='<%=zuyongkaishishijian%>';document.form1.zuyongkaishishijian.setAttribute("readOnly",'true');</script>
		<tr><td width="200">归还时间：</td><td><input name='guihuanshijian' type='text' id='guihuanshijian' value='' onblur='' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:100px; height:16px; border:solid 1px #000000; color:#666666'/></td></tr>
		<tr><td  width="200">租用天数：</td><td>此项不必填写，系统自动计算</td></tr>
		<tr><td  width="200">金额：</td><td>此项不必填写，系统自动计算</td></tr>
		<tr><td  width="200">归还人：</td><td><input name='guihuanren' type='text' id='guihuanren' onblur='' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>
		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交"  style='border:solid 1px #000000; color:#666666' />
      <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
    </tr>
  </table>
</form>

  </body>
</html>




<script language=javascript src='js/ajax.js'></script>

<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 

<script language=javascript >  
 
 function checkform(){  
 
	var zuyongtianshuobj = document.getElementById("zuyongtianshu"); if(zuyongtianshuobj.value!=""){ if(/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(zuyongtianshuobj.value)){document.getElementById("clabelzuyongtianshu").innerHTML=""; }else{document.getElementById("clabelzuyongtianshu").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
    var jineobj = document.getElementById("jine"); if(jineobj.value!=""){ if(/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(jineobj.value)){document.getElementById("clabeljine").innerHTML=""; }else{document.getElementById("clabeljine").innerHTML="&nbsp;&nbsp;<font color=red>必需数字型</font>"; return false;}}  
    


return true;   
}   
popheight=450;
</script>  


