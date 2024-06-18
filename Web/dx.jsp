<%@page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<%
    if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")
    {
        out.print("<script>javascript:alert('对不起，请您先登陆！');history.back();</script>");
        out.close();
    }
%>
<html>

<head>
    <title>dx</title>
    <link href="css.css" type="text/css" rel="stylesheet">
</head>


<body>
<%
    String lb = "系统简介";
    if (request.getParameter("lb").equals("1")) {
        lb = "系统简介";
    } else {
        lb = "系统公告";
    }
%>

编辑<%= lb %>:
<br><br>
<%
    String url = "dx.jsp?lb=" + lb;
    HashMap ext = new HashMap();
    new CommDAO().update(request, response, "dx", ext, true, false, "");

    String sql = "select * from dx where leibie='" + lb + "'";
    ArrayList<HashMap> list = PageManager.getPages(url, 20, sql, request);
    int i = 0;
    for (HashMap map : list) {
        i++;
    }
    if (i == 0) {
        sql = "insert into dx(leibie, content) values('" + lb + "', '" + lb + "')";
        new CommDAO().commOper(sql);
        out.print("<script>javascript:location.href='dx.jsp?lb=" + lb + "';</script>");
    } else {
        HashMap m = new CommDAO().getmaps("leibie", lb, "dx");
%>
<form action="dx.jsp?f=f&id=<%= m.get("id") %>&lb=<%= lb %>" method="post" name="f1">
    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
        <tr>
            <td>内容：</td>
            <td>
                <textarea name="content" cols="100" rows="8" style="width:700px;height:400px;"><%= m.get("content") %></textarea>
                <input name="lb" type="hidden" id="lb" value="<%= m.get("leibie") %>">
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <input type="submit" name="Submit" value="确定编辑" />
                <input type="reset" name="Submit2" value="重置" />
            </td>
        </tr>
    </table>
</form>
<%
    }
%>
</body>
</html>
