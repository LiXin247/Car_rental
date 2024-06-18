<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>



<html>
<head>
<title>车辆信息</title>

<LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<script language=javascript src='js/popup.js'></script>
<script language=javascript> 
function hsgpinglun(nbiao,nid){ 
popheight=450;
pop('hsgpinglun.jsp?biao='+nbiao+'&id='+nid,'在线评论',550,250) ;
}
</script> 
<%

	String id=request.getParameter("id");
	HashMap mqt = new CommDAO().getmap(id,"cheliangxinxi");
	
     %>
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
                            <td width="16%" align="center" valign="middle"><span class="STYLE11">车辆信息</span></td>
                            <td width="70%" valign="bottom">&nbsp;</td>
                            <td width="14%" align="center" valign="middle" ></td>
                          </tr>
                        </table>					</td>
                  </tr>
                  <tr>
                    <td valign="top">
					
					
   <table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#00FFFF" style="border-collapse:collapse"  class="newsline">  
      <tr>
		 <td width='11%' height=44>车辆编号：</td><td width='39%'><%=mqt.get("cheliangbianhao")%></td><td  rowspan=6 align=center><a href=<%=mqt.get("tupian")%> target=_blank><img src=<%=mqt.get("tupian")%> width=228 height=215 border=0></a></td></tr><tr>
         <td width='11%' height=44>车辆类别：</td><td width='39%'><%=mqt.get("cheliangleibie")%></td></tr><tr>
         <td width='11%' height=44>车辆名称：</td><td width='39%'><%=mqt.get("cheliangmingcheng")%></td></tr><tr>
         <td width='11%' height=44>汽车用途：</td><td width='39%'><%=mqt.get("qicheyongtu")%></td></tr><tr>
         <td width='11%' height=44>租金：</td><td width='39%'><%=mqt.get("zujin")%></td></tr><tr>
         <td width='11%' height=44>车辆状态：</td><td width='39%'><%=mqt.get("cheliangzhuangtai")%></td></tr><tr>
         
         
         <td width='11%' height=100  >备注：</td><td width='39%' colspan=2 height=100 ><%=mqt.get("beizhu")%></td></tr><tr><td colspan=3 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />
<input type=button name=Submit53 value=车辆预订 onClick="javascript:location.href='yudingxinxiadd.jsp?id=<%=id%>';" />
</td></tr>
    
  </table>
					
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

