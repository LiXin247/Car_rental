<%@page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>



<%
    HashMap ext = new HashMap();
    new CommDAO().insert(request,response,"xinwentongzhi",ext,true,false,"");
%>
<html>

<head>
    <title>����֪ͨ</title>
</head>

<script language="javascript">
    function check()
    {
        if(document.form1.biaoti.value==""){alert("���������");document.form1.biaoti.focus();return false;}if(document.form1.leibie.value==""){alert("���������");document.form1.leibie.focus();return false;}if(document.form1.tianjiaren.value==""){alert("�����������");document.form1.tianjiaren.focus();return false;}if(document.form1.dianjilv.value==""){alert("����������");document.form1.dianjilv.focus();return false;}
    }

</script>

<body>
<form action="xinwentongzhi_add.jsp?f=f" method="post" name="f1" onsubmit="return check();">
    �����������:
    <br><br>
    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
        <tr><td>���⣺</td><td><input name='biaoti' type='text' id='biaoti' value='' size='50' />&nbsp;*</td></tr>
        <tr><td>���</td><td>
            <select name="leibie" id="leibie">
                <option value="֪ͨ����">֪ͨ����</option>
            </select>
            &nbsp;*
        </td></tr>
        <tr><td>���ݣ�</td><td>
            <textarea name="neirong" cols="100" rows="8" style="width:700px;height:200px;"></textarea>
        </td></tr>
        <tr><td>����ˣ�</td><td><input name='tianjiaren' type='text' id='tianjiaren' value='<%= request.getSession().getAttribute("username") %>' />&nbsp;*</td></tr>
        <tr><td>��ҳͼƬ��</td><td>
            <input name='shouyetupian' type='text' id='shouyetupian' size='50' value='' />
            &nbsp;<input type='button' value='�ϴ�' onClick="up('shouyetupian')" />
        </td></tr>
        <tr><td>����ʣ�</td><td><input name='dianjilv' type='text' id='dianjilv' value='1' />&nbsp;*</td></tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <input type="submit" name="Submit" value="�ύ" onClick="return check();" />
                <input type="reset" name="Submit2" value="����" />
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script type="text/javascript" src="js/popup.js"></script>