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
 alert("�û������������");
 <%}%>
 
  <%
String random = (String)request.getAttribute("random"); 
if(random!=null)
{
 %>
 alert("��֤�����");
 <%}%>
 
 popheight = 39;
 </script>

<table id="__01" width="986" height="149" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="986" height="100" background="qtimages/1_01_01.gif">
			<table width="84%" height="70" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr>
                    <td height="70" valign="top"><div style="font-family:����; color:#FFFFFF;WIDTH: 100%; FONT-WEIGHT: bold; FONT-SIZE:30px ; margin-top:5pt">
                        <div ><span class="STYLE11"> &nbsp;<span class="STYLE14">�������޹���ϵͳ</span></span></div>
                    </div></td>
                  </tr>
              </table>
			</td>
          </tr>
          <tr>
            <td width="986" height="49" background="qtimages/1_01_02.gif">
			<table width="78%" height="25" border="0" align="center" cellpadding="0" cellspacing="0" >
                  <tr>
                    <td align="center"><a href="index.jsp"><span class="STYLE9 STYLE12">��ҳ</span></a></td>
                    <td align="center"><a href="news.jsp"><span class="STYLE9 STYLE12">֪ͨ����</span></a></td>
                  
                    <td align="center"><a href="kehuxinxiadd.jsp"><span class="STYLE9 STYLE12">�ͻ�ע��</span></a></td>
					<td align="center"><a href="cheliangxinxilist.jsp"><span class="STYLE9 STYLE12">������Ϣ</span></a></td>
                    <td align="center"><a href="lyblist.jsp"><span class="STYLE9 STYLE12">��������</span></a></td>
                  
                    <td align="center"><a href="login.jsp"><span class="STYLE9 STYLE12">��̨</span></a></td>
                  </tr>
              </table>
			</td>
          </tr>
        </table>