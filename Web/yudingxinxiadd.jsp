<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>



<html>
<head>
    <title>预订信息</title>

    <LINK href="qtimages/style.css" type=text/css rel=stylesheet>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
    if((String)request.getSession().getAttribute("username")==null || (String)request.getSession().getAttribute("username")=="")
    {
        out.print("<script>alert('对不起,请您先登陆!');location.href='index.jsp';</script>");
        return;
    }
    String id="";


    id=request.getParameter("id");
    HashMap mlbdq = new CommDAO().getmap(id,"cheliangxinxi");
    String cheliangbianhao="";
    String cheliangleibie="";
    String cheliangmingcheng="";
    String zujin="";
    String cheliangzhuangtai="";

    cheliangbianhao=(String)mlbdq.get("cheliangbianhao");
    cheliangleibie=(String)mlbdq.get("cheliangleibie");
    cheliangmingcheng=(String)mlbdq.get("cheliangmingcheng");
    zujin=(String)mlbdq.get("zujin");
    cheliangzhuangtai=(String)mlbdq.get("cheliangzhuangtai");



%>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<script type="text/javascript" src="js/popup.js"></script>
<script language=javascript src='js/ajax.js'></script>
<script language="javascript">
    function checkform()
    {

    }
    function gow()
    {
        document.location.href="yudingxinxiadd.jsp?id=<%=id%>";
    }
</script>


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
                                            <td width="16%" align="center" valign="middle"><span class="STYLE11">预订信息</span></td>
                                            <td width="70%" valign="bottom">&nbsp;</td>
                                            <td width="14%" align="center" valign="middle" ></td>
                                        </tr>
                                    </table>					</td>
                            </tr>
                            <tr>
                                <td valign="top">


                                    <%
                                        HashMap ext = new HashMap();
                                        if(request.getParameter("f")!=null){


                                            ext.put("issh","否");
                                            ext.put("issh2","否");


                                            String sql="update cheliangxinxi set  cheliangzhuangtai='已租' where cheliangbianhao='"+request.getParameter("cheliangbianhao")+"'";
                                            new CommDAO().commOper(sql);


                                            if(cheliangzhuangtai.equals("已租"))
                                            {
                                                out.print("<script>alert('对不起,此车已租!');location.href='index.jsp';</script>");
                                                return;
                                            }



                                        }
                                        new CommDAO().insert(request,response,"yudingxinxi",ext,true,false,"");
                                    %>
                                    <form  action="yudingxinxiadd.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
                                        <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">
                                            <tr><td  width="200">车辆编号：</td><td><input name='cheliangbianhao' type='text' id='cheliangbianhao' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.cheliangbianhao.value='<%=cheliangbianhao%>';document.form1.cheliangbianhao.setAttribute("readOnly",'true');</script>
                                            <tr><td  width="200">车辆类别：</td><td><input name='cheliangleibie' type='text' id='cheliangleibie' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.cheliangleibie.value='<%=cheliangleibie%>';document.form1.cheliangleibie.setAttribute("readOnly",'true');</script>
                                            <tr><td  width="200">车辆名称：</td><td><input name='cheliangmingcheng' type='text' id='cheliangmingcheng' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.cheliangmingcheng.value='<%=cheliangmingcheng%>';document.form1.cheliangmingcheng.setAttribute("readOnly",'true');</script>
                                            <tr><td  width="200">租金：</td><td><input name='zujin' type='text' id='zujin' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.zujin.value='<%=zujin%>';document.form1.zujin.setAttribute("readOnly",'true');</script>
                                            <tr><td  width="200">车辆状态：</td><td><input name='cheliangzhuangtai' type='text' id='cheliangzhuangtai' value='' onblur='' style='border:solid 1px #000000; color:#666666'  readonly='readonly' /></td></tr><script language="javascript">document.form1.cheliangzhuangtai.value='<%=cheliangzhuangtai%>';document.form1.cheliangzhuangtai.setAttribute("readOnly",'true');</script>
                                            <tr><td width="200">租用开始时间：</td><td><input name='zuyongkaishishijian' type='text' id='zuyongkaishishijian' value='' onblur='' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" style='width:100px; height:16px; border:solid 1px #000000; color:#666666'/></td></tr>
                                            <tr><td  width="200">租用人：</td><td><input name='zuyongren' type='text' id='zuyongren' onblur='' style='border:solid 1px #000000; color:#666666' value='<%=request.getSession().getAttribute("username")%>' readonly="readonly" /></td></tr>


                                            <tr>
                                                <td>&nbsp;</td>
                                                <td><input type="submit" name="Submit" value="提交" onClick="return checkform();" style='border:solid 1px #000000; color:#666666' />
                                                    <input type="reset" name="Submit2" value="重置" style='border:solid 1px #000000; color:#666666' /></td>
                                            </tr>
                                        </table>
                                    </form>

                                </td>
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

