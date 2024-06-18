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
    <title>新闻通知</title>
</head>

<script language="javascript">
    function check()
    {
        if(document.form1.biaoti.value==""){alert("请输入标题");document.form1.biaoti.focus();return false;}if(document.form1.leibie.value==""){alert("请输入类别");document.form1.leibie.focus();return false;}if(document.form1.tianjiaren.value==""){alert("请输入添加人");document.form1.tianjiaren.focus();return false;}if(document.form1.dianjilv.value==""){alert("请输入点击率");document.form1.dianjilv.focus();return false;}
    }

</script>

<body>
<form action="xinwentongzhi_add.jsp?f=f" method="post" name="f1" onsubmit="return check();">
    添加新闻数据:
    <br><br>
    <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse">
        <tr><td>标题：</td><td><input name='biaoti' type='text' id='biaoti' value='' size='50' />&nbsp;*</td></tr>
        <tr><td>类别：</td><td>
            <select name="leibie" id="leibie">
                <option value="通知公告">通知公告</option>
            </select>
            &nbsp;*
        </td></tr>
        <tr><td>内容：</td><td>
            <textarea name="neirong" cols="100" rows="8" style="width:700px;height:200px;"></textarea>
        </td></tr>
        <tr><td>添加人：</td><td><input name='tianjiaren' type='text' id='tianjiaren' value='<%= request.getSession().getAttribute("username") %>' />&nbsp;*</td></tr>
        <tr><td>首页图片：</td><td>
            <input name='shouyetupian' type='text' id='shouyetupian' size='50' value='' />
            &nbsp;<input type='button' value='上传' onClick="up('shouyetupian')" />
        </td></tr>
        <tr><td>点击率：</td><td><input name='dianjilv' type='text' id='dianjilv' value='1' />&nbsp;*</td></tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <input type="submit" name="Submit" value="提交" onClick="return check();" />
                <input type="reset" name="Submit2" value="重置" />
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script type="text/javascript" src="js/popup.js"></script>