<!--#include file="conn.asp"-->
<!--#include file="config.asp"-->
<%
IF Request("POST")="True" Then

Trim(Replace(Request("LogPwd"),"'",""))

 IF Trim(Replace(Request("LogName"),"'",""))=LogName and Trim(Replace(Request("LogPwd"),"'",""))=LogPWD Then
    Session("PROADMIN")=True
    Response.Redirect "index.asp"
 Else
    Response.Write "<script language='javascript'>alert('�Ƿ���½!');</script>"
 End IF



End IF
%>
<html>
<head>
<title>.:::..������ͷ|�����ռ�..::....::::</title>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="�����|�����ռ�" name=keywords>
<META content="�����|�����ռ�" name=description>
<LINK href="main.css" type=text/css rel=stylesheet>
<style type="text/css">
<!--
body {  background-color: #FFFFFF; background-attachment: fixed;  background-repeat: no-repeat; background-position: center center}
.style1 {color: #1178BA}
-->
</style>
</head>
<body bgColor=#ffffff leftMargin=0 topMargin=100>
<form method="post">
<input type="hidden" name="POST" value="True">
  <table width="300" border="1" cellspacing="0" cellpadding="0" bordercolordark="#FFFFFF" bordercolorlight="#FFFFFF" align="center" bordercolor=""#FFFFFF" height="186">
    <tr> 
      <td height="67" align="center" bgcolor="#EEF8FF"> .::.::: <%=USRName%><font size="3">&nbsp;|</font>  
        �����ռ� :::.::. <br> 
      <span class="style1">�Բ��𣬱��ռ���ʱ�����⿪�Ź���</span></td> 
   </tr> 
   <tr> 
     <td height="70" align="center" bgcolor="#EEF8FF">�û�����
      <input type="text" name="LogName" size="10" maxlength="10">
      <br>
      �ܡ��룺
      <input type="password" name="LogPwd" size="10" maxlength="10"></td> 
   </tr> 
   <tr> 
     <td height="47" align="center" bgcolor="#EEF8FF"> <input type="submit" value="ȷ��">��
       <input type="reset" value="��д"></td> 
   </tr> 
</table> 
</form> 
</body> 
</html> 
 
 
 




