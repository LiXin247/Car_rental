<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
<head>

    <title>������Ϣ</title>

    <LINK href="css.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
    <script type="text/javascript" src="js/popup.js"></script>

</head>
<%
    String id="";


%>
<script language="javascript">

    function gow()
    {
        document.location.href="cheliangxinxi_add.jsp?id=<%=id%>";
    }
    function hsgxia2shxurxu(nstr,nwbk)
    {
        if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
        {
            eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"��", "");
        }
        else
        {
            eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"��";
        }
    }
</script>

<%
    HashMap ext = new HashMap();
    if(request.getParameter("f")!=null){






    }
    new CommDAO().insert(request,response,"cheliangxinxi",ext,true,false,"");
%>

<body >
<form  action="cheliangxinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
    ��ӳ�����Ϣ:
    <br><br>
    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
        <tr><td  width="200">������ţ�</td><td><input name='cheliangbianhao' type='text' id='cheliangbianhao' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;*<label id='clabelcheliangbianhao' /></td></tr>
        <tr><td>�������</td><td><%=Info.getselect("cheliangleibie","cheliangleibiexinxi","cheliangleibie")%></td></tr>
        <tr><td  width="200">�������ƣ�</td><td><input name='cheliangmingcheng' type='text' id='cheliangmingcheng' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
        <tr><td  width="200">������;��</td><td><input name='qicheyongtu' type='text' id='qicheyongtu' value='' onblur='' style='border:solid 1px #000000; color:#666666' /></td></tr>
        <tr><td  width="200">���</td><td><input name='zujin' type='text' id='zujin' value='' onblur='checkform()' style='border:solid 1px #000000; color:#666666' />&nbsp;<label id='clabelzujin' />����������</td></tr>
        <tr><td>����״̬��</td><td><select name='cheliangzhuangtai' id='cheliangzhuangtai'><option value="����">����</option><option value="����">����</option></select></td></tr>
        <tr><td  width="200">ͼƬ��</td><td><input name='tupian' type='text' id='tupian' size='50' value='' onblur='' style='border:solid 1px #000000; color:#666666' />&nbsp;<input type='button' value='�ϴ�' onClick="up('tupian')" style='border:solid 1px #000000; color:#666666'/></td></tr>
        <tr><td  width="200">��ע��</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' onblur='' style='border:solid 1px #000000; color:#666666' ></textarea></td></tr>

        <tr>
            <td>&nbsp;</td>
            <td><input type="submit" name="Submit" value="�ύ"  style='border:solid 1px #000000; color:#666666' />
                <input type="reset" name="Submit2" value="����" style='border:solid 1px #000000; color:#666666' /></td>
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

        var cheliangbianhaoobj = document.getElementById("cheliangbianhao"); if(cheliangbianhaoobj.value==""){document.getElementById("clabelcheliangbianhao").innerHTML="&nbsp;&nbsp;<font color=red>�����복�����</font>";return false;}else{document.getElementById("clabelcheliangbianhao").innerHTML="  "; }
        var zujinobj = document.getElementById("zujin"); if(zujinobj.value!=""){ if(/^(\+|-)?(0|[1-9]\d*)(\.\d*[1-9])?$/.test(zujinobj.value)){document.getElementById("clabelzujin").innerHTML=""; }else{document.getElementById("clabelzujin").innerHTML="&nbsp;&nbsp;<font color=red>����������</font>"; return false;}}
        return true;
    }
    popheight=450;
</script>  


