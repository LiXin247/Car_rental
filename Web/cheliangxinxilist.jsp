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
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
<%

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
					
					 <form name="form1" id="form1" method="post" action="">
   搜索:  车辆编号：<input name="cheliangbianhao" type="text" id="cheliangbianhao" style='border:solid 1px #000000; color:#666666' size="12" />  车辆类别：<%=Info.getselect("cheliangleibie","cheliangleibiexinxi","cheliangleibie"," 1=1 ")%>
   <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' />
</form>
<table width="100%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse" class="newsline">  
  <tr>
    <td width="30" align="center" bgcolor="CCFFFF">序号</td>
    <td bgcolor='#CCFFFF'>车辆编号</td>
    <td bgcolor='#CCFFFF'>车辆类别</td>
    <td bgcolor='#CCFFFF'>车辆名称</td>
    <td bgcolor='#CCFFFF'>汽车用途</td>
    <td bgcolor='#CCFFFF'>租金</td>
    <td bgcolor='#CCFFFF'>车辆状态</td>
    <td bgcolor='#CCFFFF' width='90' align='center'>图片</td>
    
    
    
    <td width="30" align="center" bgcolor="CCFFFF">详细</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"cheliangxinxi"); 
    String url = "cheliangxinxilist.jsp?2=2"; 
    String sql =  "select * from cheliangxinxi where 1=1";
	
if(request.getParameter("cheliangbianhao")=="" ||request.getParameter("cheliangbianhao")==null ){}else{sql=sql+" and cheliangbianhao like '%"+request.getParameter("cheliangbianhao")+"%'";}
if(request.getParameter("cheliangleibie")=="" ||request.getParameter("cheliangleibie")==null ){}else{sql=sql+" and cheliangleibie like '%"+request.getParameter("cheliangleibie")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("cheliangbianhao") %></td><td><%=map.get("cheliangleibie") %></td><td><%=map.get("cheliangmingcheng") %></td><td><%=map.get("qicheyongtu") %></td><td><%=map.get("zujin") %></td><td><%=map.get("cheliangzhuangtai") %></td><td width='90'><a href='<%=map.get("tupian") %>' target='_blank'><img src='<%=map.get("tupian") %>' width=88 height=99 border=0 /></a></td>
    
    <td width="30" align="center"> <a href="cheliangxinxidetail.jsp?id=<%=map.get("id")%>" >详细</a></td>
  </tr>
  	<%
  }
   %>
</table><br>

  
${page.info }						
					
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

