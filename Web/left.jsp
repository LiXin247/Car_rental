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
                      <td width="86%" height="25"><span class="STYLE3"><strong>ϵͳ�û�����</strong></span></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td width="184"  style="display:none"  id="show1">
				<table width="91%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
					 <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
					  <td ><a href="yhzhgl.jsp" target="mainFrame">����Ա����</a></td>
					</tr>
					<tr>
					 <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
					  <td ><a href="mod.jsp" target="mainFrame">�����������</a></td>
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
                      <td width="86%"><span class="STYLE3"><strong>�ͻ���Ϣ����</strong></span></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td width="184"  style="display:none"  id="show2"><table width="91%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
                      <td ><a href="kehuxinxi_list.jsp" target="mainFrame">�ͻ���Ϣ���</a></td>
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
                      <td width="86%"><span class="STYLE3"><strong>����������</strong></span></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td width="184"   style="display:none"  id="show3"><table width="91%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
                      <td ><a href="cheliangleibiexinxi_add.jsp" target="mainFrame">����������</a></td>
                    </tr>
                    <tr>
                      <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
                      <td ><a href="cheliangleibiexinxi_list.jsp" target="mainFrame">��������ѯ</a></td>
                    </tr>
                </table></td>
              </tr>
            
            </table></td>
          </tr>
          <tr>
            <td><table id="__01" width="184" border="0" cellpadding="0" cellspacing="0">
              <tr onClick="show('4')" style="cursor:pointer;">
                <td width="184" background="images/hsg4.gif"><table width="100%" height="26" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="14%"  height="26" align="center" valign="bottom">&nbsp;</td>
                      <td width="86%"><span class="STYLE3"><strong>������Ϣ����</strong></span></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td width="184"   style="display:none"  id="show4"><table width="91%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
                      <td ><a href="cheliangxinxi_add.jsp" target="mainFrame">������Ϣ���</a></td>
                    </tr>
                    <tr>
                      <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
                      <td ><a href="cheliangxinxi_list.jsp" target="mainFrame">������Ϣ��ѯ</a></td>
                    </tr>
                </table></td>
              </tr>
             
            </table></td>
          </tr>
		  
		  
		  
		  
		  
		  
          <tr>
            <td><table id="__01" width="184" border="0" cellpadding="0" cellspacing="0">
              <tr onClick="show('5')" style="cursor:pointer;">
                <td width="184" background="images/hsg4.gif"><table width="100%" height="26" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="14%"  height="26" align="center" valign="bottom">&nbsp;</td>
                      <td width="86%"><span class="STYLE3"><strong>������Լ���</strong></span></td>
                    </tr>
                </table></td>
              </tr>

              <tr>
                <td width="184"   style="display:none"  id="show5"><table width="91%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
                      <td ><a href="yudingxinxi_list.jsp" target="mainFrame">Ԥ���������</a></td>
                    </tr>
                    
                </table></td>
              </tr>
             
			 
			 
			 
			 
			 
            </table>
			</td>
          </tr>
          <tr>
            <td>
              <table id="__01" width="184" border="0" cellpadding="0" cellspacing="0">
                <tr onClick="show('6')" style="cursor:pointer;">
                  <td width="184" background="images/hsg4.gif"><table width="100%" height="26" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                      <td width="14%"  height="26" align="center" valign="bottom">&nbsp;</td>
                      <td width="86%"><span class="STYLE3"><strong>�����黹���</strong></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="184"   style="display:none"  id="show6"><table width="91%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
                        <td ><a href="guihuanjilu_list.jsp" target="mainFrame">�黹�������</a></td>
                      </tr>
                      
                  </table></td>
                </tr>
               
			   
			   
			   
			   
			   
              </table>
			  </td>
          </tr>
		  
		  
		  
		 
		   <tr>
            <td>
              <table id="__01" width="184" border="0" cellpadding="0" cellspacing="0">
                <tr onClick="show('10')" style="cursor:pointer;">
                  <td width="184" background="images/hsg4.gif"><table width="100%" height="26" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                      <td width="14%"  height="26" align="center" valign="bottom">&nbsp;</td>
                      <td width="86%"><span class="STYLE3"><strong>֪ͨ�������</strong></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="184"   style="display:none"  id="show10"><table width="91%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
                        <td ><a href="xinwentongzhi_add.jsp" target="mainFrame">֪ͨ�������</a></td>
                      </tr>
					    <tr>
                        <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
                        <td ><a href="xinwentongzhi_list.jsp" target="mainFrame">֪ͨ�����ѯ</a></td>
                      </tr>
					  
					  
					 
                  </table></td>
                </tr>
               
			   
			   
			   
			   
			   
              </table>
			  </td>
          </tr>
		  
		  
		  
		  
          <tr>
            <td>
              <table id="__01" width="184" border="0" cellpadding="0" cellspacing="0">
                <tr onClick="show('7')" style="cursor:pointer;">
                  <td width="184" background="images/hsg4.gif"><table width="100%" height="26" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                      <td width="14%"  height="26" align="center" valign="bottom">&nbsp;</td>
                      <td width="86%"><span class="STYLE3"><strong>ϵͳ����</strong></span></td>
                    </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="184"    id="show7"><table width="91%" border="0" align="center" cellpadding="0" cellspacing="0">
                      
					  <tr>
                        <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
                        <td ><a href="youqinglianjie_add.jsp" target="mainFrame">�����������</a></td>
                      </tr>
                      <tr>
                        <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
                        <td ><a href="youqinglianjie_list.jsp" target="mainFrame">�������Ӳ�ѯ</a></td>
                      </tr>
					  <tr>
                        <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
                        <td ><a href="liuyanban_list.jsp" target="mainFrame">���Թ���</a></td>
                      </tr>
                      <tr>
                        <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
                        <td ><a href="dx.jsp?lb=1" target="mainFrame">ϵͳ�������</a></td>
                      </tr>
					  <tr>
                        <td width="36" height="22" align="center"><img src="images/hsg5.gif"></td>
                        <td ><a href="dx.jsp?lb=2" target="mainFrame">ϵͳ��������</a></td>
                      </tr>
                     
                  </table></td>
                </tr>
				
				
				
				
				
				
               
              </table>
			  </td>
          </tr>
         <!-- <tr>
            <td>
              <table id="__01" width="184" border="0" cellpadding="0" cellspacing="0">
                <tr >
                  <td width="184" background="images/hsg4.gif"><table width="100%" height="26" border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td width="90%"  height="26" align="center" valign="bottom"><span class="STYLE3"><strong>ϵͳ��Ȩ</strong></span></td>
                        <td width="10%">&nbsp;</td>
                      </tr>
                  </table></td>
                </tr>
                <tr>
                  <td width="184"    id="submenu7"><table width="91%" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td colspan="2" align="center"><p>&nbsp;</p>
                        </td>
                      </tr>
                      
                  </table></td>
                </tr>
              
              </table></td>
          </tr>-->
        </table></td>
	</tr>
	
</table>
</body>
</html>