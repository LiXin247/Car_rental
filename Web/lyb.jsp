<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>



<html>
<head>
<title>�������޹���ϵͳ</title>

<LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

</head>
  <% 
HashMap ext = new HashMap(); 
//ext.put("tglparentid",tglparentid); 
ext.put("huifuneirong",""); 
new CommDAO().insert(request,response,"liuyanban",ext,true,false,"lyblist.jsp"); 
%>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="986" border="0" align="center" cellpadding="0" cellspacing="0" id="__01">
	<tr>
		<td><%@ include file="qttop.jsp"%></td>
	</tr>
	<tr>
		<td><table id="__01" width="986" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><table id="__01" width="761" border="0" cellpadding="0" cellspacing="0">
              
              <tr>
                <td><table id="__01" width="761" height="254" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="761" height="45" background="qtimages/1_02_01_02_01.gif">
					<table width="100%" height="27" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="16%" align="center" valign="middle"><span class="STYLE11">��������</span></td>
                            <td width="70%" valign="bottom">&nbsp;</td>
                            <td width="14%" align="center" valign="middle" ><a href="lyb.jsp"><font class="STYLE11">&gt;&gt; �鿴���� </font></a> </td>
                          </tr>
                        </table>					</td>
                  </tr>
                  <tr>
                    <td valign="top">
					
						<form  action="lyb.jsp?f=f"  method="post" name="f1"  onsubmit="return checkform();">
						<table width="98%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#6FA9C1" style="border-collapse:collapse">
						 
                            <tr>
                              <td width="12%">�ǳƣ�</td>
                              <td width="88%"><input name='cheng' type='text' id='cheng' value='' onblur='checkform()' /> <label id='clabelcheng' />
                                *</td>
                            </tr>
                            <%--<tr>
                              <td>ͷ��</td>
                              <td><input name="xingbie" type="radio" value="1" checked>
                                  <img src="img/1.gif" width="64" height="71">
                                  <input type="radio" name="xingbie" value="2">
                                  <img src="img/2.gif" width="64" height="71">
                                  <input type="radio" name="xingbie" value="3">
                                  <img src="img/3.gif" width="64" height="71">
                                  <input type="radio" name="xingbie" value="4">
                                  <img src="img/4.gif" width="64" height="71">
                                  <input type="radio" name="xingbie" value="5">
                                  <img src="img/5.gif" width="64" height="71"></td>
                            </tr>--%>
                            <tr>
                              <td>QQ��</td>
                              <td><input name='QQ' type='text' id='QQ' value='' /></td>
                            </tr>
                            <tr>
                              <td>���䣺</td>
                              <td><input name='youxiang' type='text' id='youxiang' value='' /></td>
                            </tr>
                            <tr>
                              <td>�绰��</td>
                              <td><input name='dianhua' type='text' id='dianhua' value='' /></td>
                            </tr>
                            <tr>
                              <td>���ݣ�</td>
                              <td><textarea name="neirong" cols="50" rows="10" id="neirong" onblur='checkform()'></textarea>
                                * <label id='clabelneirong' /> </td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td><input type="submit" name="Submit42" value="�ύ" onClick="return checklyb();" style=" height:19px; border:solid 1px #000000; color:#666666" />
                                  <input type="reset" name="Submit22" value="����" style=" height:19px; border:solid 1px #000000; color:#666666" /></td>
                            </tr>
                         
                        </table>
						 </form>
						 
						 </td>
                  </tr>
                </table></td>
              </tr>
              
            </table></td>
            <td valign="top">
			<%@ include file="qtleft.jsp"%>			</td>
          </tr>
        </table></td>
	</tr>
	<tr>
		<td><%@ include file="qtdown.jsp"%>	</td>
	</tr>
</table>
</body>
</html>

<script language=javascript >  
 
 function checkform(){  
var chengobj = document.getElementById("cheng");  
if(chengobj.value==""){  
document.getElementById("clabelcheng").innerHTML="&nbsp;&nbsp;<font color=red>�������ǳ�</font>";  
return false;  
}else{
document.getElementById("clabelcheng").innerHTML="  ";  
}  
  
var neirongobj = document.getElementById("neirong");  
if(neirongobj.value==""){  
document.getElementById("clabelneirong").innerHTML="&nbsp;&nbsp;<font color=red>��������������</font>";  
return false;  
}else{
document.getElementById("clabelneirong").innerHTML="  ";  
}  


return true;   
}   
</script>  