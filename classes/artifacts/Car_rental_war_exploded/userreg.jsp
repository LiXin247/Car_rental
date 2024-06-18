<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>



<html>
<head>
<title>汽车租赁管理系统</title>

<LINK href="qtimages/style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

</head>
 <% 
HashMap ext = new HashMap();
ext.put("issh","否"); 
new CommDAO().insert(request,response,"yonghuzhuce",ext,true,false,"index.jsp"); 
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
                            <td width="16%" align="center" valign="middle"><span class="STYLE11">用户注册</span></td>
                            <td width="70%" valign="bottom">&nbsp;</td>
                            <td width="14%" align="center" valign="middle" > </td>
                          </tr>
                        </table>					</td>
                  </tr>
                  <tr>
                    <td valign="top">
					
					
					
							<form  action="userreg.jsp?f=f"  method="post" name="f1"  onsubmit="return checkform();">
						<table width="96%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#784386" style="border-collapse:collapse">
                        
                            <tr>
                              <td width="15%">用户名：</td>
                              <td colspan="2"><input name='yonghuming' type='text' id='yonghuming' value='' onblur='checkform()'  /><label id='clabelyonghuming' />
                                &nbsp;*</td>
                            </tr>
                            <tr>
                              <td>密码：</td>
                              <td width="27%"><input name='mima' type='password' id='mima' value='' onblur='checkform()'  /><label id='clabelmima' />
                                &nbsp;* 
                              </td>
                              <td width="58%">确认密码：
                                <input name='mima2' type='password' id='mima2' value='' onblur='checkform()'>  <label id='clabelmima2' /> </td>
                            </tr>
                            <tr>
                              <td>姓名：</td>
                              <td colspan="2"><input name='xingming' type='text' id='xingming' value='' onblur='checkform()'  /><label id='clabelxingming' />
                                &nbsp;*</td>
                            </tr>
                            <tr>
                              <td>性别：</td>
                              <td colspan="2"><select name='xingbie' id='xingbie' style=" height:19px; border:solid 1px #000000; color:#666666">
                                  <option value="男">男</option>
                                  <option value="女">女</option>
                              </select></td>
                            </tr>
                            <tr>
                              <td>出生年月：</td>
                              <td colspan="2"><input name='chushengnianyue' type='text' id='chushengnianyue' value='' readonly='readonly' onClick="WdatePicker({'dateFmt':'yyyy-MM-dd'})" /></td>
                            </tr>
                            <tr>
                              <td>QQ：</td>
                              <td colspan="2"><input name='QQ' type='text' id='QQ' value='' onblur='checkform()'  /> <label id='clabelQQ' /></td>
                            </tr>
                            <tr>
                              <td>邮箱：</td>
                              <td colspan="2"><input name='youxiang' type='text' id='youxiang' value='' onblur='checkform()'  /> <label id='clabelyouxiang' /></td>
                            </tr>
                            <tr>
                              <td>电话：</td>
                              <td colspan="2"><input name='dianhua' type='text' id='dianhua' value='' onblur='checkform()'  /> <label id='clabeldianhua' /></td>
                            </tr>
                            <tr>
                              <td>身份证：</td>
                              <td colspan="2"><input name='shenfenzheng' type='text' id='shenfenzheng' value='' onblur='checkform()'  /> <label id='clabelshenfenzheng' /> </td>
                            </tr>
                            <tr>
                              <td>头像：</td>
                              <td colspan="2"><input name='touxiang' type='text' id='touxiang' size='50' value='' />
                                &nbsp;
                                <input name="button" type='button' onClick="up('touxiang')" value='上传' style=" height:19px; border:solid 1px #000000; color:#666666"/></td>
                            </tr>
                            <tr>
                              <td>地址：</td>
                              <td colspan="2"><input name='dizhi' type='text' id='dizhi' value='' size='50' /></td>
                            </tr>
                            <tr>
                              <td>备注：</td>
                              <td colspan="2"><textarea name='beizhu' cols='50' rows='5' id='beizhu'></textarea></td>
                            </tr>
                            <tr>
                              <td>&nbsp;</td>
                              <td colspan="2"><input type="submit" name="Submit5" value="提交" onClick="return check();" style=" height:19px; border:solid 1px #000000; color:#666666"/>
                                  <input type="reset" name="Submit22" value="重置" style=" height:19px; border:solid 1px #000000; color:#666666" /></td>
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

<script language=javascript src='js/My97DatePicker/WdatePicker.js'></script>
<script type="text/javascript" src="js/popup.js"></script>
<script language=javascript src='js/ajax.js'></script>

<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 

<script language=javascript >

    function checkform(){
        var yonghumingobj = document.getElementById("yonghuming");
        if(yonghumingobj.value==""){
            document.getElementById("clabelyonghuming").innerHTML="&nbsp;&nbsp;<font color=red>请输入用户名</font>";
            return false;
        }else{
            document.getElementById("clabelyonghuming").innerHTML="  ";
        }

        var yonghumingobj = document.getElementById("yonghuming");
        if(yonghumingobj.value!=""){
            var ajax = new AJAX();
            ajax.post("factory/checkno.jsp?table=yonghuzhuce&col=yonghuming&value="+yonghumingobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>")
            var msg = ajax.getValue();
            if(msg.indexOf('Y')>-1){
                document.getElementById("clabelyonghuming").innerHTML="&nbsp;&nbsp;<font color=red>用户名已存在</font>";
                return false;
            }else{document.getElementById("clabelyonghuming").innerHTML="  ";
            }
        }
        var mimaobj = document.getElementById("mima");
        if(mimaobj.value==""){
            document.getElementById("clabelmima").innerHTML="&nbsp;&nbsp;<font color=red>请输入密码</font>";
            return false;
        }else{
            document.getElementById("clabelmima").innerHTML="  ";
        }

        var mima2obj = document.getElementById("mima2");
        if(mima2obj.value==""){
            document.getElementById("clabelmima2").innerHTML="&nbsp;&nbsp;<font color=red>请再次输入密码</font>";
            return false;
        }else{
            document.getElementById("clabelmima2").innerHTML="  ";
        }

        if(mima2obj.value!=mimaobj.value){
            document.getElementById("clabelmima2").innerHTML="&nbsp;&nbsp;<font color=red>两次密码输入不一致</font>";
            return false;
        }else{
            document.getElementById("clabelmima2").innerHTML="  ";
        }


        var xingmingobj = document.getElementById("xingming");
        if(xingmingobj.value==""){
            document.getElementById("clabelxingming").innerHTML="&nbsp;&nbsp;<font color=red>请输入姓名</font>";
            return false;
        }else{
            document.getElementById("clabelxingming").innerHTML="  ";
        }


        var QQobj = document.getElementById("QQ");
        if(QQobj.value!=""){
            if(QQobj.value.length>12||isNaN(QQobj.value)){
                document.getElementById("clabelQQ").innerHTML="&nbsp;&nbsp;<font color=red>联系QQ必须为12位以内数字</font>";
                return false;
            }else{
                document.getElementById("clabelQQ").innerHTML="";
            }
        }

        var youxiangobj = document.getElementById("youxiang");
        if(youxiangobj.value!=""){
            if(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(youxiangobj.value))
            {
                document.getElementById("clabelyouxiang").innerHTML="";
            }else{
                document.getElementById("clabelyouxiang").innerHTML="&nbsp;&nbsp;<font color=red>必需邮箱格式</font>";
                return false;
            }
        }

        var dianhuaobj = document.getElementById("dianhua");
        if(dianhuaobj.value!=""){
            if(/^(([0\+]\d{2,3}-)?(0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/.test(dianhuaobj.value))
            {
                document.getElementById("clabeldianhua").innerHTML="";
            }else{
                document.getElementById("clabeldianhua").innerHTML="&nbsp;&nbsp;<font color=red>必需电话格式</font>";
                return false;
            }
        }

        var shenfenzhengobj = document.getElementById("shenfenzheng");
        if(shenfenzhengobj.value!=""){
            if(/^\d{15}$|^\d{18}$|^\d{17}[xX]$/.test(shenfenzhengobj.value))
            {
                document.getElementById("clabelshenfenzheng").innerHTML="";
            }else{
                document.getElementById("clabelshenfenzheng").innerHTML="&nbsp;&nbsp;<font color=red>必需身份证格式</font>";
                return false;
            }
        }



        return true;
    }
    popheight=450;
</script>  

