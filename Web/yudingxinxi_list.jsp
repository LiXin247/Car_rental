<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
<head>
  <title>预订信息</title>

  <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
</head>


<body >
<p>已有预订信息列表：</p>
<form name="form1" id="form1" method="post" action="">
  搜索:  车辆编号：<input name="cheliangbianhao" type="text" id="cheliangbianhao" style='border:solid 1px #000000; color:#666666' size="12" />  车辆类别：<input name="cheliangleibie" type="text" id="cheliangleibie" style='border:solid 1px #000000; color:#666666' size="12" />
  <input type="submit" name="Submit" value="查找" style='border:solid 1px #000000; color:#666666' />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="00FFFF" style="border-collapse:collapse">
  <tr>
    <td width="27" align="center" bgcolor="CCFFFF">序号</td>
    <td width="112" bgcolor='#CCFFFF'>车辆编号</td>
    <td width="112" bgcolor='#CCFFFF'>车辆类别</td>
    <td width="112" bgcolor='#CCFFFF'>车辆名称</td>
    <td width="63" bgcolor='#CCFFFF'>租金</td>
    <td width="112" bgcolor='#CCFFFF'>车辆状态</td>
    <td bgcolor='#CCFFFF' width='64' align='center'>租用开始时间</td>
    <td width="84" bgcolor='#CCFFFF'>租用人</td>
    <td bgcolor='#CCFFFF' width='69' align='center'>是否审核</td>

    <td bgcolor='#CCFFFF' width='69' align='center'>是否归还</td>
    <td width="92" align="center" bgcolor="CCFFFF">添加时间</td>

    <td width="86" align="center" bgcolor="CCFFFF">操作</td>
  </tr>
  <%

    new CommDAO().delete(request,"yudingxinxi");
    String url = "yudingxinxi_list.jsp?1=1";
    String sql =  "select * from yudingxinxi where 1=1";

    if(request.getParameter("cheliangbianhao")=="" ||request.getParameter("cheliangbianhao")==null ){}else{sql=sql+" and cheliangbianhao like '%"+request.getParameter("cheliangbianhao")+"%'";}
    if(request.getParameter("cheliangleibie")=="" ||request.getParameter("cheliangleibie")==null ){}else{sql=sql+" and cheliangleibie like '%"+request.getParameter("cheliangleibie")+"%'";}
    sql+=" order by id desc";
    ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request);
    int i=0;
    for(HashMap map:list){
      i++;

  %>
  <tr>
    <td width="27" align="center"><%=i %></td>
    <td><%=map.get("cheliangbianhao") %></td>
    <td><%=map.get("cheliangleibie") %></td>
    <td><%=map.get("cheliangmingcheng") %></td>
    <td><%=map.get("zujin") %></td>
    <td><%=map.get("cheliangzhuangtai") %></td>
    <td><%=map.get("zuyongkaishishijian") %></td>
    <td><%=map.get("zuyongren") %></td>
    <td align='center'><a href="sh.jsp?id=<%=map.get("id")%>&yuan=<%=map.get("issh")%>&tablename=yudingxinxi" onClick="return confirm('您确定要执行此操作？')"><%=map.get("issh")%></a></td>

    <td align='center'><%=map.get("issh2")%></td>
    <td width="92" align="center"><%=map.get("addtime") %></td>
    <td width="86" align="center"><a href="yudingxinxi_updt.jsp?id=<%=map.get("id")%>">修改</a>  <a href="yudingxinxi_list.jsp?scid=<%=map.get("id") %>" onClick="return confirm('真的要删除？')">删除</a> <a href="yudingxinxi_detail.jsp?id=<%=map.get("id")%>">详细</a> </td>
  </tr>
  <%
    }
  %>
</table>
<br>

${page.info }


</body>
</html>

