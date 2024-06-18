<%@page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>


<html>
<head>
    <title>汽车租赁管理系统</title>

    <LINK href="qtimages/style.css" type=text/css rel=stylesheet>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">

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
                        <td><table id="__01" width="761" height="254" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="761" height="45" background="qtimages/1_02_01_02_01.gif">
                                    <table width="100%" height="27" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="16%" align="center" valign="middle"><span class="STYLE11">在线留言</span></td>
                                            <td width="70%" valign="bottom">&nbsp;</td>
                                            <td width="14%" align="center" valign="middle" ><a href="lyb.jsp"><font class="STYLE11">&gt;&gt; 我要留言 </font></a> </td>
                                        </tr>
                                    </table>					</td>
                            </tr>
                            <tr>
                                <td valign="top"><%
                                    String url = "lyblist.jsp?1=1";
                                    String sql =  "select * from liuyanban  order by id desc";
                                    //out.print(sql);
                                    ArrayList<HashMap> list = PageManager.getPages(url,4,sql, request );
                                    int i=0;
                                    for(HashMap map:list){
                                        i++;
                                %>
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#000000" class="tb">
                                        <!--DWLayoutTable-->
                                        <tr>
                                            <td height="20" align="left" valign="middle" bgcolor="#FFFFFF">&nbsp; &nbsp; 留言于:<%=map.get("addtime") %> &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td height="78" align="left" valign="top" bgcolor="#FFFFFF">&nbsp;<%=map.get("neirong") %></td>
                                        </tr>
                                        <tr>
                                            <td align="left" valign="middle" bgcolor="#FFFFFF" style="height: 25px">&nbsp; &nbsp;昵称：<%=map.get("cheng") %> &nbsp; &nbsp;电话：<%=map.get("dianhua") %>&nbsp;&nbsp;邮 箱:<%=map.get("youxiang") %> &nbsp; QQ:<%=map.get("QQ") %>&nbsp; &nbsp; </td>
                                        </tr>
                                        <tr>
                                            <td align="left" valign="middle" bgcolor="#FFFFFF" style="height: 25px">&nbsp; &nbsp;管理员回复：<%=map.get("huifuneirong") %></td>
                                        </tr>
                                    </table>
                                    <div align="center">
                                        <%} %>
                                        ${page.info } </div></td>
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