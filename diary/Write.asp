<!--#include file="conn.asp"-->
<!--#include file="config.asp"-->
<%
IF POPWrite<>"True" Then
   IF Session("PROADMIN")<>True Then
   Response.Redirect "Login.asp"
   Response.End
   End IF
End IF

IF Request("POST")<>"" Then
Call WriteData
End IF

function HTMLcode(fString)
if not isnull(fString) then
    fString = Replace(fString, CHR(13), "")
    fString = Replace(fString, CHR(10) & CHR(10), "</P><P>")
    fString = Replace(fString, CHR(10), "<BR>")
    HTMLcode = fString
end if
end function

Function WriteData
IF Request("content")="" or Request("content")="����д�ռ�����" Then
 Response.Write "<font color=red>����д�ռ�����</font>"
Else
Set Rs = Server.CreateObject("ADODB.Recordset")
Sql = "Select * From diary"
Rs.Open Sql,conn,1,3
Rs.AddNew

Rs("title")=Request("title")
Rs("content")=HTMLcode(Request("content"))
Rs("weather")=Request("weather")
Rs("date")=year(now)&"-"&month(now)&"-"&day(now)
Rs.Update
Rs.Close
Set Rs=Nothing
Call CloseDB

Response.Redirect "index.asp"

End IF
End Function
%>
<html>
<head>
<title>ǩд�ռ� --&gt; .:::..�����ռ�..::....::::</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="main.css" type="text/css">
<style type="text/css">
<!--
body {  background-attachment: fixed;  background-repeat: no-repeat; background-position: center center}
.style1 {color: #1178BA}
-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#FFFFFF" leftmargin="0" topmargin="80">
<br>
<br><br>
<form name="form1" method="post" action="">
  <input type="hidden" name="POST" value="True">
  <table width="400" border="0" cellspacing="1" cellpadding="1" align="center">
    <tr> 
      <td height="30" bgcolor="#EEF8FF">��<span class="style1">ǩд�ռ�</span>�� [ <a href=index.asp>���� <%=USRName%> | �����ռ� </a>]</td>    
      <td>&nbsp;</td>
    </tr>    
    <tr>     
      <td width="359" height="30" bgcolor="#EEF8FF"><font color="#000000">��</font><span class="style1">���⣺</span><font color="#FFFFFF">      <input type="text" name="title"></td>
      <td width="34" bgcolor="#ffffff">&nbsp;<font color="#FFFFFF"><%=year(now)&"-"&month(now)&"-"&day(now)%></font></td>
    </tr>
    <tr> 
      <td width="359" height="171" align="center" valign="top" bgcolor="#EEF8FF"> 
      <textarea name="content" rows="10" cols="40"></textarea>      </td>
      <td width="34">&nbsp;</td>
    </tr>
    <tr> 
      <td height="42" valign="middle" bgcolor="#EEF8FF"> 
        ��������������������
        <input type="submit" value="����">����
          <input type="reset" value="��д" name="����">
      </td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
<p align="center">
</body>
</html>
