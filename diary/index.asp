<!--#include file="conn.asp"-->
<!--#include file="config.asp"-->
<%
IF ProgramOpen<>"True" Then
 IF Session("PROADMIN")<>True Then
   Response.Redirect "Login.asp"
   Response.End
 End IF
End IF

IF Request("del")<>"" and Session("PROADMIN")=True Then
   Sql = "Delete From diary Where id="&Request("del")
   Conn.Execute(Sql)
End IF
%>
<html>

<head>
<style>
<!--
BODY {
SCROLLBAR-FACE-COLOR: #ffffff;
 SCROLLBAR-HIGHLIGHT-COLOR: #ffffff;
 SCROLLBAR-SHADOW-COLOR: #ffffff;
 SCROLLBAR-3DLIGHT-COLOR: #ffffff;
 SCROLLBAR-ARROW-COLOR: #000000;
 SCROLLBAR-TRACK-COLOR: #ffffff;
 SCROLLBAR-DARKSHADOW-COLOR: #ffffff;
 SCROLLBAR-BASE-COLOR: #ffffff
}
-->
</style>
<title>�����ռ�</title>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="������ͷ|�����ռ�" name=keywords>
<META content="������ͷ|�����ռ�" name=description>
<LINK href="main.css" type=text/css rel=stylesheet>
<script language="JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
<style type="text/css">
<!--
body {  background-attachment: fixed;  background-repeat: no-repeat; background-position: left center}
a {  color: #C47500; text-decoration: none}
a:hover {  color: #1178BA; text-decoration: none}
-->
</style>
</head>
<body bgColor=#ffffff leftMargin=0 onLoad="MM_preloadImages('img/20c.jpg')">
<table width="30%" border="0" cellspacing="0" cellpadding="0" align="center">
</table>
<div align="left">
  <table border=0 cellpadding=0 cellspacing=0 height=93 
  style="FILTER: Alpha(opacity=100)" width="390" align="left">
    <tbody> 
  <tr> 
    <td width="390" height="27"> 
      <table width="390" border="0" align="center" bordercolor="#000000" height="8" cellspacing="0" cellpadding="0">
        <tr> 
          <td bordercolor="#FFFFFF" height="1" width="390"> 
            <table cellspacing=5 cellpadding=1 width=390 border=0 align="right" bgcolor="#FFFFFF">
              <tbody> 
              <%
Set Rs = Server.CreateObject("ADODB.Recordset")
Sql = "Select * From diary Order BY id DESC"
Rs.Open Sql,conn,1,1
IF Not Rs.Eof Then

totalrecord=rs.recordcount
IF Request("s")="" Then
ShowNum=ShowTopic
Else
ShowNum=Request("s")
End IF
rs.pagesize=ShowNum
maxpage=rs.pagecount

requestpage=clng(request("p"))

if requestpage="" or requestpage=0 then
   requestpage=1
end if
if resquestpage>maxpage then
    resquestpage=maxpage
end if

if not requestpage=1 then
rs.move (requestpage-1)*rs.pagesize
end if

for i=1 to rs.pagesize and not rs.bof
%>
              <tr> 
                <td width="233" height="0"><img src="img/fish.gif" width="19" height="13"> 
                  <font color=#000000><%=Rs("title")%></font>                                            
                </td>                             
                <td width="76" align="right"><font size="1"><font color="#1178BA"><%=Rs("date")%> </font>                         
                  </font></td>
              </tr>                             
              <tr>                              
                <td height="11" colspan="2" valign="top" background="img/bg_line280lgd.gif"><%=Rs("content")%>                 
                  &nbsp;<br>                              
                  <br>
                  ������������������������������������������ ����
                  <%IF Session("PROADMIN")=True Then%>                             
                  <a href=index.asp?del=<%=Rs("id")%>><font color="#65ABD8">ɾ��</font></a>                              
                  <%End IF%>                             
                </td>                             
              </tr>                             
              <%                             
Rs.MoveNext                             
if rs.eof then exit for                             
next                             
End IF                             
Rs.Close                             
Set Rs=Nothing                             
Call CloseDB                             
%>                             
              <tr>                              
                <td colspan="2"> ���ռǹ��� <%=maxpage%> ҳ [                              
                  <%                             
For i=1 to maxpage                             
Response.Write "<a href=index.asp?p="&i&"&s="&ShowNum&">"&i&"</a> "                             
Next                             
%>                             
                  ]                 
                                  
                </td>                             
              </tr>                             
              </tbody>                              
            </table>                             
          </td>                             
        </tr>                             
        <tr>                              
          <td bordercolor="#FFFFFF" height="1" width="390">                              
            <table width="100%" border="0" cellpadding="0" cellspacing="0">                             
              <tr>                              
                <td height="2" width="51%">                              
                  ������������������������������������<a href="Write.asp"> ��_�u  
 </a><font color="#1178BA">��                              
                      <%IF ProgramOpen="True" and Session("PROADMIN")<>True Then%>                             
                      <font color="#FFFFFF">3</font>                              
                      <%End IF%>                             
                      <%IF Session("PROADMIN")=True Then%>                             
                      <a href=Logout.asp>�˳�����</a>                              
                      <%End IF%>
                  </font></td>                             
              </tr>                             
            </table>                             
          </td>                             
        </tr>                             
      </table>                             
    </td>                             
  </tr>                             
  </tbody>                             
</table>                            
</div>          
<p>&nbsp;</p>                            
<p>&nbsp;</p>                            
<p>&nbsp;</p>                            
<p>&nbsp;</p>                            
<p>&nbsp;</p>                            
<p>&nbsp;</p>                            
</body>                            
</html>                   
                   
                   
                   
                   
                   
