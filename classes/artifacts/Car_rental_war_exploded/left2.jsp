<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
<head>
    <title>left</title><script src="js/menu.js"></script>
    <link rel="stylesheet" href="css.css">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <style type="text/css">
        <!--
        body,td,th {
            font-size: 12px;
        }
        body {
            background-color: #fbf6f2;

        }
        .STYLE2 {color: #FFFFFF}
        .STYLE3 {color: #6d1d0a}
        -->
    </style></head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table id="__01" width="184" border="0" cellpadding="0" cellspacing="0">

    <tr>
        <td ><table width="184"  border="0" cellpadding="0" cellspacing="0"  id="__01">

            <tr>
                <td><table id="__01" width="184" border="0" cellpadding="0" cellspacing="0">
                    <tr onClick="show('1')" style="cursor:pointer;">
                        <td width="184"  background="images/hsg4.gif"><table width="100%" height="26" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="14%"  height="25" align="center" valign="bottom">&nbsp;</td>
                                <td width="86%" height="25"><span class="STYLE3"><strong>个人资料管理</strong></span></td>
                            </tr>
                        </table></td>
                    </tr>
                    <tr>
                        <td width="184"  style="display:none"  id="show1">
                            <table width="91%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
                                    <td ><a href="kehuxinxi_updt2.jsp" target="mainFrame">个人资料管理</a></td>
                                </tr>
                                <tr>
                                    <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
                                    <td ><a href="mod2.jsp" target="mainFrame">个人密码管理</a></td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                </table></td>
            </tr>
            <tr>
                <td><table id="__01" width="184" border="0" cellpadding="0" cellspacing="0">
                    <tr onClick="show('2')" style="cursor:pointer;">
                        <td width="184" background="images/hsg4.gif"><table width="100%" height="26" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="14%"  height="26" align="center" valign="bottom">&nbsp;</td>
                                <td width="86%"><span class="STYLE3"><strong>我的预订车辆</strong></span></td>
                            </tr>
                        </table></td>
                    </tr>
                    <tr>
                        <td width="184"  style="display:none"  id="show2"><table width="91%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
                                <td ><a href="yudingxinxi_list2.jsp" target="mainFrame">预订车辆查看</a></td>
                            </tr>

                        </table></td>
                    </tr>

                </table></td>
            </tr>
            <tr>
                <td><table id="__01" width="184" border="0" cellpadding="0" cellspacing="0">
                    <tr onClick="show('3')" style="cursor:pointer;">
                        <td width="184" background="images/hsg4.gif"><table width="100%" height="26" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="14%"  height="26" align="center" valign="bottom">&nbsp;</td>
                                <td width="86%"><span class="STYLE3"><strong>车辆归还管理</strong></span></td>
                            </tr>
                        </table></td>
                    </tr>
                    <tr>
                        <td width="184"   style="display:none"  id="show3"><table width="91%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
                                <td ><a href="guihuanjilu_list2.jsp" target="mainFrame">我的归还车辆</a></td>
                            </tr>

                        </table></td>
                    </tr>


                </table>
                </td>
            </tr>



        </table></td>
    </tr>

</table>
</body>
</html>