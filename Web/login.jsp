<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
<head>
<title>汽车租赁管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #FFFFFF;	
	
}
.STYLE2 {color: #FFFFFF; }
.STYLE3 {color:#A3371D; font-size: 12px; }

-->
</style>

</head>
<script type="text/javascript">
 <%
String error = (String)request.getAttribute("error"); 
if(error!=null)
{
 %>
 alert("用户名或密码错误");
 <%}%>

 <%
String random = (String)request.getAttribute("random"); 
if(random!=null)
{
%>
 alert("验证码错误");
 <%}%>
 
 popheight = 39;

 function check()
 {
   if(document.form1.username.value=="" || document.form1.pwd.value=="" || document.form1.pagerandom.value=="")
   {
     alert('请输入完整');
     return false;
   }
 }

 function loadimage(){
   document.getElementById("randImage").src = "image.jsp?"+Math.random();
 }

           
           </script>     
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p>&nbsp;</p>
<table width="1024" height="643" border="0" align="center" cellpadding="0" cellspacing="0" background="images/login.jpg">
  <tr>
    <td height="220" valign="bottom"><p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <table width="72%" height="77" border="0" align="center">
        <tr>
          <td align="center"><div style="font-family:宋体; color:#FFFFFF;  WIDTH: 100%; FONT-WEIGHT: bold; FONT-SIZE: 28px; margin-top:5pt"> 汽车租赁管理系统 </div></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td valign="top"><table width="452" height="154" border="0" align="center" cellpadding="0" cellspacing="0">
      
      <tr>
        <td height="123" background="images/hsgbg2.gif"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="34%" height="20">
			
			
				</td>
            <td width="66%">&nbsp;</td>
          </tr>
          <tr>
            <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="52%"><table width="56%" border="0" align="right" cellpadding="0" cellspacing="0">
                      
                  </table></td>
                </tr>
            </table></td>
            <td valign="top"><form action="Car_rental?ac=adminlogin&a=a" method="post" name="form1" style="display: inline"><table width="205" border="0" align="left" cellpadding="0" cellspacing="0">
              <tr>
                <td width="44" height="30"><span class="STYLE3">用户:</span></td>
                <td height="30" colspan="2"><input name="username" type="text" id="username" style="width:100px; height:16px; border:solid 1px #000000; color:#666666"></td>
              </tr>
              <tr>
                <td height="30"><span class="STYLE3">密码:</span></td>
                <td height="30" colspan="2"><input name="pwd" type="password" id="pwd" style="width:100px; height:16px; border:solid 1px #000000; color:#666666"></td>
              </tr>
              <tr>
                <td height="30"><span class="STYLE3">权限:</span></td>
                <td height="30" colspan="2"><select name="cx" id="cx">
                    <option value="管理员">管理员</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td height="30"><span class="STYLE3">验证码:</span></td>
                <td width="59" height="30"><input name="pagerandom" type="text" id="pagerandom" style=" height:20px; border:solid 1px #000000; color:#666666; width:50px" />
                <td width="102"><a href="javascript:loadimage();"><img alt="看不清请点我！" name="randImage" id="randImage" src="image.jsp" width="60" height="20" border="1" align="absmiddle"> </a></td>
              </tr>
              <tr>
                <td height="30" colspan="3"><input type="submit" name="Submit" value="登陆" onClick="return check();" >
                    <input type="reset" name="Submit2" value="重置"></td>
              </tr>
            </table>	</form>	</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>