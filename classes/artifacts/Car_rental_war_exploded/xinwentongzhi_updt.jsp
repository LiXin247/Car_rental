<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
<head>
    <title>����֪ͨ</title>
    <script type="text/javascript" src="js/popup.js"></script>
</head>

<%
    String id = request.getParameter("id");
    HashMap ext = new HashMap();
    new CommDAO().update(request, response, "xinwentongzhi", ext, true, false, "");
    HashMap mmm = new CommDAO().getmap(id, "xinwentongzhi");
%>

<body>
<form action="xinwentongzhi_updt.jsp?f=f&id=<%=mmm.get("id")%>" method="post" name="f1" onsubmit="return checkform();">
    �޸�<%=mmm.get("leibie")%>:
    <br><br>
    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
        <tr><td>���⣺</td><td><input name='biaoti' type='text' id='biaoti' size='50' value="<%=mmm.get("biaoti")%>" /></td></tr>
        <tr><td>���</td><td><input name='leibie' type='text' id='leibie' value='<%=mmm.get("leibie")%>' /></td></tr>
        <tr><td>���ݣ�</td><td><textarea name="neirong" cols="100" rows="8" style="width:700px;height:200px;"><%=mmm.get("neirong")%></textarea></td></tr>
        <tr><td>�����ˣ�</td><td><input name='tianjiaren' type='text' id='tianjiaren' value='<%=mmm.get("tianjiaren")%>' /></td></tr>
        <tr><td>��ҳͼƬ��</td><td><input name='shouyetupian' type='text' id='shouyetupian' size='50' value='<%=mmm.get("shouyetupian")%>' />&nbsp;<input type='button' value='�ϴ�' onClick="up('shouyetupian')"/></td></tr>
        <tr><td>����ʣ�</td><td><input name='dianjilv' type='text' id='dianjilv' value='<%=mmm.get("dianjilv")%>' /></td></tr>
        <tr>
            <td>&nbsp;</td>
            <td><input type="submit" name="Submit" value="�ύ" />
                <input type="reset" name="Submit2" value="����" /></td>
        </tr>
    </table>
</form>
</body>
</html>