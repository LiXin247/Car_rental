<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>



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
 </script>

<table id="__01" width="986" height="149" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="986" height="100" background="qtimages/1_01_01.gif">
			<table width="84%" height="70" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="70" valign="top"><div style="font-family:宋体; color:#FFFFFF;WIDTH: 100%; FONT-WEIGHT: bold; FONT-SIZE:30px ; margin-top:5pt">
                        <div ><span class="STYLE11"> &nbsp;<span class="STYLE14">汽车租赁管理系统</span></span></div>
                    </div></td>
                  </tr>
              </table>
			</td>
          </tr>
          <tr>
            <td width="986" height="49" background="qtimages/1_01_02.gif">
			<table width="78%" height="25" border="0" align="center" cellpadding="0" cellspacing="0" >
                  <tr>
                    <td align="center"><a href="index.jsp"><span class="STYLE9 STYLE12">首页</span></a></td>
                    <td align="center"><a href="news.jsp"><span class="STYLE9 STYLE12">通知公告</span></a></td>
                  
                    <td align="center"><a href="kehuxinxiadd.jsp"><span class="STYLE9 STYLE12">客户注册</span></a></td>
					<td align="center"><a href="cheliangxinxilist.jsp"><span class="STYLE9 STYLE12">车辆信息</span></a></td>
                    <td align="center"><a href="lyblist.jsp"><span class="STYLE9 STYLE12">在线留言</span></a></td>
                  
                    <td align="center"><a href="login.jsp"><span class="STYLE9 STYLE12">后台</span></a></td>
                  </tr>
              </table>
			</td>
          </tr>
        </table>