<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<table id="__01" width="225" height="660" border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td><table id="__01" width="225" height="218" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="225" height="36" background="qtimages/1_02_02_02_01.gif">
                    <table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="12%"></td>
                            <td width="88%" valign="bottom"><span class="STYLE11">系统公告</span></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="172">
                    <table id="__01" width="225" height="172" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="6" height="172" background="qtimages/1_02_02_02_02_01.gif"></td>
                            <td width="205" height="172">
                                <table width="100%" height="100%">
                                    <tr>
                                        <td>
                                            <%
                                                HashMap m1 = new CommDAO().getmaps("leibie","系统公告","dx");
                                                out.print(Info.ensubStr(m1.get("content"),185));
                                            %>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="14" height="172" background="qtimages/1_02_02_02_02_03.gif"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td><img src="qtimages/1_02_02_02_03.gif" width="225" height="9" alt=""></td>
            </tr>
        </table></td>
    </tr>
    <tr>
        <td height="214"></td>
    </tr>
    <tr>
        <td height="233"><table id="__01" width="225" height="229" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="225" height="36" background="qtimages/1_02_02_02_01.gif">
                    <table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td width="12%"></td>
                            <td width="88%" valign="bottom"><span class="STYLE11">友情链接</span></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td><table id="__01" width="225" height="215" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="6" height="215" background="qtimages/1_02_02_02_02_01.gif"></td>
                        <td width="205" height="215"><table width="92%" border="0" align="center" cellpadding="0" cellspacing="0" class="newsline">
                            <%
                                for(HashMap map:new CommDAO().select("select * from youqinglianjie order by id desc",1,8)){
                            %>
                            <tr>
                                <td width="12%" height="25" align="center"><span class="STYLE2"><img src="qtimages/1.jpg" /></span></td>
                                <td width="20%" height="25"><a href="<%=map.get("wangzhi") %>" target="_blank" ><%=map.get("wangzhanmingcheng") %></a></td>
                                <td width="68%" height="25"><a href="<%=map.get("wangzhi") %>" target="_blank" ><%=map.get("wangzhi") %></a></td>
                            </tr>
                            <%
                                }
                            %>
                        </table></td>
                        <td width="14" height="215" background="qtimages/1_02_02_02_02_03.gif"></td>
                    </tr>
                </table></td>
            </tr>
            <tr>
                <td><img src="qtimages/1_02_02_02_03.gif" width="225" height="9" alt=""></td>
            </tr>
        </table></td>
    </tr>
</table>