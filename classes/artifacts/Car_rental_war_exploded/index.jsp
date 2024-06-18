<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>



<html>
<head>
<title>汽车租赁</title>

<LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>

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
                <td><img src="qtimages/1_02_01_01.gif" width="761" height="180" alt=""></td>
              </tr>
              <tr>
                <td><table id="__01" width="761" height="254" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="761" height="45" background="qtimages/1_02_01_02_01.gif">
					<table width="100%" height="27" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="16%" align="center" valign="middle"><span class="STYLE11">通知公告</span></td>
                            <td width="70%" valign="bottom">&nbsp;</td>
                            <td width="14%" align="center" valign="middle" ><a href="news.jsp?lb=֪ͨ����"><font class="STYLE11">&gt;&gt;更多</font></a> </td>
                          </tr>
                        </table>
					</td>
                  </tr>
                  <tr>
                    <td><table id="__01" width="761" height="209" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td><img src="qtimages/1_02_01_02_02_01.gif" width="24" height="209" alt=""></td>
                        <td width="306" height="209"><img src="upload/Benz1.jpg" style="height: 200px;width: 290px"></td>
                        <td width="431" height="209" valign="top"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" class="newsline">
                          <%

    for(HashMap map:new CommDAO().select("select * from xinwentongzhi where leibie='通知公告' order by id desc ",1,7)){

     %>
                          <tr height="25">
                            <td width="24" align="left" class="newslist"><img src="qtimages/1.jpg" /></td>
                            <td width="320"  class="newslist"><a href="gg_detail.jsp?id=<%=map.get("id")%>"><%=Info.ensubStr(map.get("biaoti"),25)%></a></td>
                            <td width="78" class="newslist">[<%=map.get("addtime").toString().substring(0,10) %>]</td>
                          </tr>
                          <%
							}
							%>
                        </table></td>
                      </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td><table id="__01" width="761" height="259" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td><table id="__01" width="255" height="259" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="255" height="45" background="qtimages/1_02_01_03_01_01.gif">
						<table width="100%" height="36" border="0" cellpadding="0" cellspacing="0">
                      <tr>
					  <td width="13%" valign="bottom">&nbsp;</td>
                        <td width="68%" height="30" align="left" valign="bottom" class="STYLE11">用户登录</td>
                        <td width="20%" valign="bottom">&nbsp;</td>
                      </tr>
                    </table>
						</td>
                      </tr>
                      <tr>
                        <td><table id="__01" width="255" height="194" border="0" cellpadding="0" cellspacing="0">
                          <tr>
                            <td width="17" height="194" background="qtimages/1_02_01_03_01_02_01.gif"></td>
                            <td width="229" height="194" bgcolor="#FFFFFF"><%
    if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")==""){
     %>
                              <form action="Car_rental?ac=login&amp;a=a" method="post" name="f11" id="f11" style="display: inline">
                                <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td width="15" height="28">&nbsp;</td>
                                    <td width="243" height="28">用户名:</td>
                                    <td height="28" colspan="2"><input name="username" type="text" id="username" style="width:100px; height:20px; border:solid 1px #000000; color:#666666" /></td>
                                  </tr>
                                  <tr>
                                    <td height="28">&nbsp;</td>
                                    <td height="28">密码:</td>
                                    <td height="28" colspan="2"><input name="pwd1" type="password" id="pwd1"  style="width:100px; height:20px; border:solid 1px #000000; color:#666666" /></td>
                                  </tr>
                                  <tr>
                                    <td height="28">&nbsp;</td>
                                    <td height="28">权限:</td>
                                    <td height="28" colspan="2"><select name="cx" id="cx" style="width:100px; height:20px; border:solid 1px #000000; color:#666666" >
                                        <option value="客户">客户</option>
                                    </select></td>
                                  </tr>
                                  <tr >
                                    <td height="28">&nbsp;</td>
                                    <td height="28">验证码</td>
                                    <td width="97" height="28"><input name="pagerandom" type="text" id="pagerandom" style=" height:20px; border:solid 1px #000000; color:#666666; width:50px" /></td>
                                    <td width="299"><a href="javascript:loadimage();"><img alt="刷新" name="randImage" id="randImage" src="image.jsp" width="60" height="20" border="1" align="absmiddle" /> </a> </td>
                                  </tr>
                                  <script type="text/javascript">

           function loadimage(){
document.getElementById("randImage").src = "image.jsp?"+Math.random();
}
function checklog()
{
	if(document.f11.username.value=="" || document.f11.pwd1.value=="" || document.f11.pagerandom.value=="")
	{
		alert("请输入值");
		return false;
	}
}

                              </script>
                                  <tr>
                                    <td height="38" align="center">&nbsp;</td>
                                    <td height="38" colspan="3" align="center"><input type="submit" name="Submit" value="登录" class="hsgbutton" onClick="return checklog();" />
                                        <input type="reset" name="Submit2" value="重置" class="hsgbutton" /></td>
                                  </tr>
                                </table>
                              </form>
                              <%}else{ %>
                              <table width="90%" height="82%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                  <td width="31%" height="30">用户:</td>
                                  <td width="69%" height="30"><%=request.getSession().getAttribute("username")%> </td>
                                </tr>
                                <tr>
                                  <td height="30">权限</td>
                                  <td height="30"><%=request.getSession().getAttribute("cx")%> </td>
                                </tr>
                                <tr>
                                  <td height="30" colspan="2" align="center"><input type="button" name="Submit3" value="退出" onClick="javascript:location.href='logout.jsp';" style=" height:19px; border:solid 1px #000000; color:#666666" />
                                      <input type="button" name="Submit32" value="后台" onClick="javascript:location.href='main.jsp';" style=" height:19px; border:solid 1px #000000; color:#666666" />
                                  </td>
                                </tr>
                              </table>
                              <%} %></td>
                            <td width="9" height="194" background="qtimages/1_02_01_03_01_02_03.gif"></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td><img src="qtimages/1_02_01_03_01_03.gif" width="255" height="20" alt=""></td>
                      </tr>
                    </table></td>
                    <td valign="top">&nbsp;</td>
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
