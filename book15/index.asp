<%
page = Request.QueryString("page")
action = Request.QueryString("action")
action_e = Request.Form("action_e")
set Conn=Server.CreateObject("ADODB.Connection")
Conn.Open "driver={Microsoft Access Driver (*.mdb)};dbq=" & Server.MapPath("#bict2008data.asa")
%>
<html>
	<head>
		<title>������ͷ��ϡ���˵��˵</title>
		<meta name="keywords" content="������ͷ��ϡ���˵��˵">
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link rel="stylesheet" href="gbstyle.css" type="text/css">
	<style type="text/css">
<!--
body {
	background-color: #FFFFFF;
}
.style1 {color: #999999}
.style3 {color: #FF0000}
-->
    </style>
	<script language="JavaScript" type="text/JavaScript">
<!--
function MM_popupMsg(msg) { //v1.0
  alert(msg);
}
//-->
    </script>
	</head>

<STYLE type="text/css">
<!--
BODY {
scrollbar-face-color:#F4FBF2;
scrollbar-highlight-color:#EFF7EC;
scrollbar-3dlight-color:#FFFFFF;
scrollbar-darkshadow-color:#FFFFFF;
scrollbar-shadow-color:#D1E2CD;
scrollbar-arrow-color:#7DB371;
scrollbar-track-color:#F7FCF5;
}
.style2 {color: #000000}
-->
</STYLE>

<body text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="531" border="0" cellpadding="0" cellspacing="0" align="center">
<tr><td width="531" align="center"  height="16"><table width="530" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td align="center" valign="top">
      <%
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'������
Select Case action_e
	Case ""
	
	Case "Add_New"
		Call Add_New_Execute()
	Case "reply"
		Call Reply_Execute()
	Case "admin"
		Call Admin_Login_Execute()
	Case "EditPWD"
		Call EditPWD_Execute()
	Case "Edit"
		Call Edit_Execute()
End Select
Call Main_Menu()
Select Case action
    Case "UbbHelp"
        Call UbbHelp()
	Case "Admin_Login"
		Call Admin_Login()
	Case "Exit"
		Call Exit_Admin()
		
		Call View_Words()
		
	Case ""
		
		Call View_Words()
		
	Case "Add_New"
		Call Add_New()
	Case "reply"
		Call Reply()
	Case "View_Words"
		
		Call View_Words()
		
	Case "Delete"
		Call Delete()
		Call View_Words()
	Case "EditPWD"
		Call EditPWD()
	Case "Edit"
		Call Edit()
				
End Select
Call Copyrights()	
%>
    </td>
  </tr>
</table></td></tr>
</table>


<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'���һ��������
		%>
<% Sub Add_New() %>
<table width="520" border="0" align="center" cellpadding="0" cellspacing="0">
  <tbody>
    <tr>
      <td width="11"><img src="images/table/point2.gif" width="11" height="11" border="0"></td>
      <td background="images/table/top_bottom.gif"></td>
      <td width="12"><img src="images/table/top_right.gif" width="11" height="11" border="0"></td>
    </tr>
    <tr>
      <td background="images/table/left_right.gif"></td>
      <td width="504" height="80" align="center" valign="top" bgcolor="#F7FFF5"><table width="497" height="5"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="497" height="5"></td>
          </tr>
        </table>
        <table width="499" border="0" cellspacing="0" cellpadding="4" align="center" >
           <form name="new" method="post" action="index.asp">
    <tr> 
      <td colspan="2" align="center"> �� �� �� �� </td>
    </tr>
    <tr> 
      <td height="35" align="right"> �ա����� </td>
      <td> <input type="text" name="name" class="input1" size="40">��&nbsp;
      [ ����] </td>
    </tr>
    <tr>
      <td height="35" align="right">�硡�ʣ�</td>
      <td> <input type="text" name="email" class="input1" size="40">��
      &nbsp;<span class="style1">[ ��ѡ]</span> </td>
    </tr>
    <tr> 
      <td height="35" align="right">����վ�� </td>
      <td> <input type="text" name="web" class="input1" size="40">                ��<span class="style1">       [ ��ѡ] </span></td>
    </tr>
    <tr> 
      <td height="35" align="right">O I C Q�� </td>
      <td> <input type="text" name="oicq" class="input1" size="40">                ��
        <span class="style1"> [ ��ѡ]      [ ��дMSN�ʺ����]</span></td>
    </tr>
    <tr> 
      <td align="right" valign="top"> �����ԣ� </td>
      <td> <textarea name="words" cols="70" rows="6" class="input1"></textarea> 
      </td>
    </tr>
    <tr align="center" valign="bottom"> 
      <td height="45" colspan="2"> <input type="hidden" name="action_e" value="Add_New"> 
        <input type="submit" name="Submit" value="      " class="submit"> 
        ��
        <input type="reset" name="Submit2" value="      " class="reset"> </td>
    </tr>
  </form>
      </table>
        <table width="499"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="499" height="5"></td>
          </tr>
        </table></td>
      <td background="images/table/left_right.gif"></td>
    </tr>
    <tr>
      <td><img src="images/table/bottom_left.gif" width="11" height="11" border="0"></td>
      <td background="images/table/top_bottom.gif"></td>
      <td><img src="images/table/bottom_right.gif" width="11" height="11" border="0"></td>
    </tr>
  </tbody>
</table>
<br>
		<% End Sub %>
		<%
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'����Ա�ظ�����
		%>
		<% Sub Reply() %>
		
        <br>
        <table width="520" border="0" align="center" cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <td width="11"><img src="images/table/point2.gif" width="11" height="11" border="0"></td>
              <td background="images/table/top_bottom.gif"></td>
              <td width="12"><img src="images/table/top_right.gif" width="11" height="11" border="0"></td>
            </tr>
            <tr>
              <td background="images/table/left_right.gif"></td>
              <td width="504" height="80" align="center" valign="top" bgcolor="#F7FFF5"><table width="497" height="5"  border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td width="497" height="5"></td>
                  </tr>
                </table>
                  <table width="499" border="0" cellspacing="1" cellpadding="4" align="center">
                    <form name="reply" method="post" action="index.asp">
                      <tr>
                        <td colspan="2" align="center"> �� �� �� �� </td>
                      </tr>
                      <tr>
                        <td width="70" align="right" valign="top"> �ء����� </td>
                        <td width="410">
                          <textarea name="reply" cols="72" rows="8" class="input1"></textarea>
                        </td>
                      </tr>
                      <tr align="center" valign="bottom">
                        <td height="51" colspan="2">
                          <input type="hidden" name="action_e" value="reply"> <input type="hidden" name="id" value="<%=Request.QueryString("id")%>">
						<input type="submit" name="Submit3" value="�ύ" ID="Submit1" class="input1"> 
						��
						<input type="reset" name="Submit22" value="��д" class="input1">                       </td>
                      </tr>
                    </form>
                  </table>
                  <table width="499"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="499" height="5"></td>
                    </tr>
                </table></td>
              <td background="images/table/left_right.gif"></td>
            </tr>
            <tr>
              <td><img src="images/table/bottom_left.gif" width="11" height="11" border="0"></td>
              <td background="images/table/top_bottom.gif"></td>
              <td><img src="images/table/bottom_right.gif" width="11" height="11" border="0"></td>
            </tr>
          </tbody>
        </table>
        <% End Sub %>
<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		%>
<% Sub Main_Menu() %>
<table width="499" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td align="center"><a href="index.asp?action=Add_New"><span class="style2">��Ҫ����</span> ��</a> 
      <a href="index.asp?action=View_Words"><span class="style2">�鿴����</span></a> �� 
      <% If Session("Admin")="Login" Then %>
      <a href="index.asp?action=Exit"><span class="style2">�˳�����</span>&nbsp;��</a>
      <% Else %>
      <a href="index.asp?action=Admin_Login"><span class="style2">��������</span></a> 
      ��
      <% End If %>
      <a href="index.asp?action=UbbHelp"><span class="style2">UBB����</span></a> �� 
      <% If Session("Admin")="Login" Then %>
      <a href="index.asp?action=EditPWD"><span class="style2">�޸�����</span></a> 
    <% End If %> </td>
  </tr>
</table>
<table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<% End Sub 
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'�鿴����
Sub View_Words() 

If request.querystring("page")="" Then
	absPageNum = 1

else
	absPageNum=cint(request.querystring("page"))
end if
RecordPerPage = 5
Set rs = Server.CreateObject("ADODB.Recordset")
rs.CursorType = adOpenStatic
rs.CacheSize = RecordPerPage
	Sql="Select * From words Order By date Desc"

rs.OPEN sql, Conn,1,1
rs.PageSize = RecordPerPage
Tol = rs.PageCount
		If Not(rs.EOF) Then
			rs.AbsolutePage = absPageNum
		End If
%>

                                <%
if rs.eof and rs.bof then
	response.write "<p align='center'>��������</p>"
else
For absRecordNum = 1 to rs.PageSize%>


<table width="499" border="0" cellspacing="1" cellpadding="4" align="center">
  <tr> 
   
  </tr>
</table>

    <table width="520" border="0" align="center" cellpadding="0" cellspacing="0">
      <tbody>
        <tr>
          <td width="11"><img src="images/table/point2.gif" width="11" height="11" border="0"></td>
          <td background="images/table/top_bottom.gif"></td>
          <td width="12"><img src="images/table/top_right.gif" width="11" height="11" border="0"></td>
        </tr>
        <tr>
          <td background="images/table/left_right.gif"></td>
          <td width="504" height="80" align="center" valign="top" bgcolor="#F7FFF5"><table width="497" height="4"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="497" height="10"></td>
            </tr>
          </table>
            <table width="476" border="0" cellspacing="0" cellpadding="0" align="center" style="table-layout:fixed;word-break:break-all">
            <tr>
              <td width="66" height="26" align="center" valign="top"><table width="66"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="66" height="2"></td>
                  </tr>
                </table>
                  <font color="#000000">�ա�����</font></td>
              <td width="160"><font color="#FF8C3B"><%=Rs("name")%></td>
              <td width="170" align="right"><div class="EFONT"><a  title="�����ʼ�:[ <%=rs("email")%> ]" href="mailto:<%=rs("email")%>"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Email</font></a></div></td>
              <td width="38" align="right"><div class="EFONT"><a title="��վ:[ <%=rs("web")%> ]" href="<%=rs("web")%>" target="_blank"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Web</font></a></div></td>
              <td width="42" align="right"><div class="EFONT" > 
                      <a title="Oicq or Msn:[ <%=rs("oicq")%> ]" href="javascript:;" onClick="MM_popupMsg('QQ���룺[ <%=rs("oicq")%> ]')"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Oicq&nbsp;</font></a></div></td>
              </tr>
            <tr>
              <td height="15" colspan="5" align="right" valign="top"></td>
            </tr>
            <tr>
              <td width="66" height="100%" align="center" valign="top">
                <table width="66"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="66" height="1"></td>
                  </tr>
                </table>
                <font color="#000000">�����ԣ�</font></td>
              <td colspan="4" background="images/line_bg.gif"><font color="#666666"><%=Ubb(unHtml(Rs("words")))%></td>
            </tr>
            <tr>
              <td height="22" align="right" valign="top"></td>
              <td height="22" colspan="4" align="right" valign="top" background="images/line_bg.gif"><font color="#5B994C" face="Verdana, Arial, Helvetica, sans-serif">&nbsp; <%=Left(Rs("date"),14)%></font></td>
              </tr>
              <%If Rs("reply")<>"" Then%>
            <tr>
              
              <td width="66" align="center" valign="top">
              	<table width="66"  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="66" height="1"></td>
                  </tr>
                </table>
              <font color="#000000">�ء�����</font> </td>
              <td colspan="4" background="images/line_bg.gif"><font color="#5B994C"><%=Ubb(unHtml(Rs("reply")))%></font>
              </td>
              
            </tr>
            <tr>
              <td align="right" valign="top"></td>
              <td height="22" colspan="4" align="right" background="images/line_bg.gif"><font color="#666666" face="Verdana, Arial, Helvetica, sans-serif">&nbsp; <%=Left(Rs("replydate"),14)%></font></td>
            </tr>
            <%End If%>
            <tr>
              <td height="16" align="right" valign="top"></td>
              <td height="16" colspan="4" align="right"><% If Session("Admin") = "Login" Then %>
                <a href="index.asp?action=Delete&id=<%=Rs("id")%>">��ɾ����</a> <a href="index.asp?action=reply&id=<%=Rs("id")%>">���ظ���</a> <a href="index.asp?action=Edit&id=<%=Rs("id")%>">���༭��</a>
                <% End If %>
              </td>
            </tr>
          </table></td>
          <td background="images/table/left_right.gif"></td>
        </tr>
        <tr>
          <td><img src="images/table/bottom_left.gif" width="11" height="11" border="0"></td>
          <td background="images/table/top_bottom.gif"></td>
          <td><img src="images/table/bottom_right.gif" width="11" height="11" border="0"></td>
        </tr>
      </tbody>
    </table>
    <table width="500" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td height="16">&nbsp;</td>
  </tr>
</table>
<%
rs.movenext
    If rs.EOF Then
		Exit For
	End If
Next
end if
%>



<!--�޸ķ�ҳ��ʼ------------------------------------------->
<table width="499" border="0" cellspacing="1" cellpadding="4" align="center">
  <tr> 
    <td align="right" height="20">����<%=TotalRecord%>������ ��ҳ

                                   <%
                                    num1=int((absPageNum-1)/10)
                                    abcd1=num1*10+11
                                    abcd2=num1*10

                                    if num1>0 then
                                     if tpe="" then%>
                                    <a title='��һҳ' href='index.asp?page=<%=abcd2%>'>[<<]</a>
                                    <%else%>
                                    <a title='��һҳ' href='index.asp?type=<%=tpe%>&page=<%=abcd2%>'>[<<]</a>
                                    <%end if%>
                                    <%end if%>
																		                              
                                    
                                    
                                    <%
                                    if rs.pagecount<=10 then
                                    fish=rs.pagecount
                                    else 
                                    	if rs.pagecount-num1*10>10 then
                                      fish=10
                                    	else
                                    	fish=rs.pagecount-num1*10
                                    	end if
                                    end if
                                    
                                    
for ppages=1 to fish
ppages1=num1*10+ppages
if ppages1=int(absPageNum) then
%>
                                    <b><font color=red>[<%=ppages1%>]</font></b>
                                    <%
else
	if tpe="" then
%>
                                    <a href='index.asp?page=<%=ppages1%>'>[<%=ppages1%>]</a>
                                    <%	elseif tpe<>"" then%>
                                    <a href='index.asp?type=<%=tpe%>&page=<%=ppages1%>'>[<%=ppages1%>]</a>
                                    <%
	end if
end if
next

																		if num1<int(rs.pagecount/10) and int(rs.pagecount/10)>0 then

%>
                                    <%if tpe="" then%>
                                    <a title='��һҳ' href='index.asp?page=<%=abcd1%>'>[>>]</a>
                                    <%else%>
                                    <a title='��һҳ' href='index.asp?type=<%=tpe%>&page=<%=abcd1%>'>[>>]</a>
                                    <%end if
end if
%>


    </td>
    <td align="right">&nbsp;</td>
  </tr>
</table>
		<%Rs.Close
		Set Rs = Nothing%>
		<% End Sub %>
		<%
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'����Ա��½�ӿ�
		%>
		<% Sub Admin_Login() %>
		<br>
		
<table width="499" border="0" cellspacing="1" cellpadding="4" align="center">
  <form name="reply" method="post" action="index.asp">
				
    <tr> 
      <td colspan="2" align="center">�����¼</td>
	</tr>
				<tr>
					<td align="right" valign="top" width="105">
						�û�����
					</td>
					<td width="226">
						<input type="text" name="username" class="input1">
					</td>
				</tr>
				<tr>
					<td align="right" valign="top" width="105">
						�� �룺
					</td>
					<td width="226">
						<input type="password" name="password" class="input1"> <input type="hidden" name="action_e" value="admin">
					</td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="submit" name="Submit32" value="      " class="b">
					</td>
				</tr>
  </form>
</table>
		<br>
<% End Sub%>
<%
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		%>
		<%
		Sub Copyrights()
		%>
<%
		End Sub
		%>
<%Sub UbbHelp()%>
<div align="left">
  <table width="546" border="0" cellspacing="1" cellpadding="4" align="center">
    <tr> 
      <td height="48" colspan="4" align="center">UBB���ܰ���</td>
    </tr>
    <tr> 
      <td width="17"><div align="right"></div></td>
      <td width="74">[img]</td>
      <td width="349">������дͼƬ���Ե�ַ <font color="#FF0000">http://www.51buyflower/logo.gif</font></td>
      <td width="69">[/img]</td>
    </tr>
    <tr> 
      <td width="17" height="20"><div align="right"></div></td>
      <td width="74" height="20">[url]</td>
      <td width="349" height="20">������д���ӵ�ַ <font color="#FF0000">http://www.51buyflower.com/</font></td>
      <td width="69" height="20">[/url]</td>
    </tr>
    <tr> 
      <td width="17"><div align="right"></div></td>
      <td width="74">[swf]</td>
      <td width="349">������дSWF�ļ��ĵ�ַ <font color="#FF0000">http://www.51buyflower.com/logo.swf</font></td>
      <td width="69">[/swf]</td>
    </tr>
    <tr> 
      <td width="17" height="20"><div align="right"></div></td>
      <td width="74" height="20">[email]</td>
      <td width="349" height="20">������д���������ַ <font color="#FF0000">xiaojie@51buyflower.com</font></td>
      <td width="69" height="20">[/email]</td>
    </tr>
    <tr> 
      <td width="17"><div align="right"></div></td>
      <td width="74">[color=<font color="#FF0000">��ɫ</font>]</td>
      <td width="349">������дҪ��ɫ�� <font color="#FF0000">����</font></td>
      <td width="69">[/color]</td>
    </tr>
    <tr> 
      <td width="17"><div align="right"></div></td>
      <td width="74">[size=<font color="#FF0000">��С</font>]</td>
      <td width="349">������дҪ�Ӵ��<font color="#FF0000"> ����</font></td>
      <td width="69">[/size]</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>[font=<font color="#FF0000">����</font>]</td>
      <td>������дҪ�ı������<font color="#FF0000"> ����</font></td>
      <td>[/font]</td>
    </tr>
    <tr> 
      <td width="17"><div align="right"></div></td>
      <td colspan="3">��������������<span class="style3">ע��</span>UBB�����м䲻Ҫ�пո�</td>
    </tr>
  </table>
  <%End Sub%>
</div>
<%Sub EditPWD()%>
<table width="499" border="0" cellspacing="1" cellpadding="4" align="center">
  <form name="editpwd" method="post" action="index.asp">
    <tr> 
      <td colspan="2" align="center"> <b>�޸�����</b></td>
    </tr>
    <tr> 
      <td align="right" valign="middle" width="105" height="38">���û�����</td>
      <td width="226" height="38" align="left"> 
        <input type="text" name="oldusername" class="input1">
      </td>
    </tr>
    <tr> 
      <td align="right" valign="middle" width="105" height="38">���û�����</td>
      <td width="226" height="38" align="left"> 
        <input type="text" name="username" class="input1">
      </td>
    </tr>
    <tr> 
      <td align="right" valign="middle" width="105" height="38">ȷ�����û�����</td>
      <td width="226" height="38" align="left"> 
        <input type="text" name="username_c" class="input1">
      </td>
    </tr>
    <tr> 
      <td align="right" valign="middle" width="105" height="38"> �� �� �룺 </td>
      <td width="226" height="38" align="left"> 
        <input type="password" name="oldpwd" class="input1">
      </td>
    </tr>
    <tr>
      <td align="right" valign="middle" width="105">�� �� �룺 </td>
      <td width="226" align="left">
        <input type="password" name="newpwd" class="input1">
      </td>
    </tr>
    <tr> 
      <td align="right" valign="middle" width="105" height="38">ȷ�������룺</td>
      <td width="226" align="left" height="38"> 
        <input type="password" name="newpwd_c" class="input1">
        <input type="hidden" name="action_e" value="EditPWD">
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="2"> 
        <input type="submit" name="EditPWD" value="�޸�����" class="input1">
      </td>
    </tr>
  </form>
</table>
<%End Sub%>
<% Sub Edit() %>
<%
Set Rs = Server.CreateObject("ADODB.RecordSet")
Sql="Select * From words Where id="&Request.QueryString("id")
Rs.Open Sql,Conn,1,1
%>
<table width="499" border="0" cellspacing="1" cellpadding="4" align="center">
  <form name="reply" method="post" action="index.asp">
    <tr> 
      <td colspan="2" align="center"> �༭����������</td>
    </tr>
    <tr> 
      <td align="right" valign="top"> �����������ݣ� </td>
      <td> 
        <textarea name="words" cols="50" rows="5" class="input1"><%=Rs("words")%></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td align="right">�ظ���</td>
      <td align="left">
        <textarea name="reply" cols="50" rows="5" class="input1"><%=Rs("reply")%></textarea>
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="2"> 
        <input type="hidden" name="action_e" value="Edit">
        <input type="hidden" name="id" value="<%=Request.QueryString("id")%>">
        <input type="submit" name="Submit" value="�޸�����" id="Submit" class="input1">
        ����<a href="index.asp?action=View_Words">����</a></td>
    </tr>

  </form>
</table>
<% End Sub %>
</body>
</html>
<%

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'��������Ե����ݿ�
Sub Add_New_Execute()
	If Request.Form("name")="" Then
	Response.Write "<br>�������ͣ�&nbsp;��������Ϊ��"
	Response.Write "<br>"
	Response.Write "<a href=""index.asp?action=Add_New""><br>����</a><br><br><table width=100%  border=0 cellspacing=0 cellpadding=0><tr><td></td> </tr></table>"
	Response.End
	End If
	If Len(Request.Form("name"))>20 Then
	Response.Write "<br>�������ͣ�&nbsp;��������̫��"
	Response.Write "<br>"
	Response.Write "<a href=""index.asp?action=Add_New""><br>����</a><br><br><table width=100%  border=0 cellspacing=0 cellpadding=0><tr><td></td> </tr></table>"
	Response.End
	End If
	If Request.Form("email")<>"" Then
	If instr(Request.Form("email"),"@")=0 or instr(Request.Form("email"),"@")=1 or instr(Request.Form("email"),"@")=len(email) then
	Response.Write "<br>�������ͣ�&nbsp;���������ʽ��д����ȷ"
	Response.Write "<br>"
	Response.Write "<a href=""index.asp?action=Add_New""><br>����</a><br><br><table width=100%  border=0 cellspacing=0 cellpadding=0><tr><td></td> </tr></table>"
	Response.End
	End If
	End If
	If Request.Form("words")="" Then
	Response.Write "<br>�������ͣ�&nbsp;���Բ���Ϊ��"
	Response.Write "<br>"
	Response.Write "<a href=""index.asp?action=Add_New""><br>����</a><br><br><table width=100%  border=0 cellspacing=0 cellpadding=0><tr><td></td> </tr></table>"
	Response.End
	End If
	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Sql="Select * From words"
	Rs.Open Sql,Conn,2,3
	Rs.AddNew
	Rs("name")=Server.HTMLEncode(Request.Form("name"))
	Rs("sex")=Server.HTMLEncode(Request.Form("sex"))
	Rs("head")=Server.HTMLEncode(Request.Form("head"))
	Rs("web")=Server.HTMLEncode(Request.Form("web"))
	Rs("email")=Server.HTMLEncode(Request.Form("email"))
	Rs("oicq")=Server.HTMLEncode(Request.Form("oicq"))
	Rs("words")=Server.HTMLEncode(Request.Form("words"))
	Rs("date")=Now()
	'Rs("replydate")=Now()
	Rs.Update
	
	Rs.Close
	Set Rs = Nothing
End Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'��֤����Ա��½

Sub Admin_Login_Execute()
	username = Server.HTMLEncode(Request.Form("username"))
	password = Server.HTMLEncode(Request.Form("password"))
	If username = "" OR password = "" Then
		Response.Write "<br>�������ͣ�&nbsp;�û�����������Ϊ��"
		Response.Write "<br>"
	    Response.Write "<a href=""index.asp?action=Admin_Login""><br>����</a><br><br><table width=100%  border=0 cellspacing=0 cellpadding=0><tr><td></td> </tr></table>"
		Response.End
	End If
	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Sql="Select * From admin"
	Rs.Open Sql,Conn,1,1
	If username = Rs("username") AND password = Rs("password") Then
		Session("Admin") = "Login"
		Else
		Response.Write "<br>�������ͣ�&nbsp;�û����������벻�ԣ���½ʧ��"
		Response.Write "<br>"
	    Response.Write "<a href=""index.asp?action=Admin_Login""><br>����</a><br><br><table width=100%  border=0 cellspacing=0 cellpadding=0><tr><td></td> </tr></table>"
		Response.End
	End If
	Rs.Close
	Set Rs = Nothing
End Sub
Sub EditPWD_Execute()
	oldusername=Server.HTMLEncode(Request.Form("oldusername"))
	username = Server.HTMLEncode(Request.Form("username"))
	username_c = Server.HTMLEncode(Request.Form("username_c"))
	oldpwd = Server.HTMLEncode(Request.Form("oldpwd"))
	newpwd = Server.HTMLEncode(Request.Form("newpwd"))
	newpwd_c = Server.HTMLEncode(Request.Form("newpwd_c"))
	If username = "" OR username_c="" Then
		Response.Write "�¾��û���������Ϊ��"
		Response.End
	End If
	If oldpwd = "" OR newpwd = "" OR newpwd_c="" Then
		Response.Write "�¾����������Ϊ��"
		Response.End
	End If
	If username<>username_c Then
		Response.Write "����д���������û�����һ�£���������д"
		Response.End
	End If
	If newpwd<>newpwd_c Then
		Response.Write "����д���������벻һ�£���������д"
		Response.End
	End If
	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Sql="Select * From admin"
	Rs.Open Sql,Conn,2,3
	If Rs("password")=oldpwd And Rs("username")=oldusername Then
		Rs("username")=username
		Rs("password")=newpwd
		Rs.Update
	Else
		Response.Write "��ľ�������д���Ի��߾��û������ԣ��޸Ĳ��ɹ�"
		Response.End
	End If
	Rs.Close
	Set Rs = Nothing
End Sub
Sub Exit_Admin()
  Session.Abandon
  response.redirect"index.asp"
End Sub
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'ɾ������
Sub Delete()
	'ɾ������
	Conn.Execute("Delete * From words Where id="&Request.QueryString("id"))
End Sub
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'�ظ�������ӵ����ݿ�

Sub Reply_Execute()
	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Sql="Select reply ,replydate From words Where id="&Request.Form("id")
	Rs.Open Sql,Conn,2,3
	Rs("reply") = Server.HTMLEncode(Request.Form("reply"))
	Rs("replydate")=Now()
	Rs.Update
	Rs.Close
	Set Rs=Nothing
End Sub
Sub Edit_Execute()
	Set Rs = Server.CreateObject("ADODB.RecordSet")
	Sql="Select * From words Where id="&Request.Form("id")
	Rs.Open Sql,Conn,2,3
	Rs("words") = Server.HTMLEncode(Request.Form("words"))
	Rs("reply") = Server.HTMLEncode(Request.Form("reply"))
	Rs("replydate")=Now()
	Rs.Update
	Rs.Close
	Set Rs=Nothing
End Sub

Conn.Close
Set Conn = Nothing
%>
<%
function unHtml(content)
unHtml=content
if content <> "" then
unHtml=replace(unHtml,"&","&amp;")
unHtml=replace(unHtml,"<","&lt;")
unHtml=replace(unHtml,">","&gt;")
unHtml=replace(unHtml,chr(34),"&quot;")
unHtml=replace(unHtml,chr(13),"<br>")
unHtml=replace(unHtml,chr(32),"&nbsp;")
'unHtml=ubb(unHtml)
end if
end function

function ubb(content)
ubb=content
    nowtime=now()
    UBB=Convert(ubb,"code")
    UBB=Convert(ubb,"html")
    UBB=Convert(ubb,"url")
    UBB=Convert(ubb,"color")
    UBB=Convert(ubb,"font")
    UBB=Convert(ubb,"size")
    UBB=Convert(ubb,"quote")
    UBB=Convert(ubb,"email")
    UBB=Convert(ubb,"img")
    UBB=Convert(ubb,"swf")

    UBB=AutoURL(ubb)
    ubb=replace(ubb,"[b]","<b>",1,-1,1)
    ubb=replace(ubb,"[/b]","</b>",1,-1,1)
    ubb=replace(ubb,"[i]","<i>",1,-1,1)
    ubb=replace(ubb,"[/i]","</i>",1,-1,1)
    ubb=replace(ubb,"[u]","<u>",1,-1,1)
    ubb=replace(ubb,"[/u]","</u>",1,-1,1)
    ubb=replace(ubb,"[blue]","<font color='#000099'>",1,-1,1)
    ubb=replace(ubb,"[/blue]","</font>",1,-1,1)
    ubb=replace(ubb,"[red]","<font color='#990000'>",1,-1,1)
    ubb=replace(ubb,"[/red]","</font>",1,-1,1)
    for i=1 to 28
    ubb=replace(ubb,"{:em"&i&"}","<IMG SRC=emot/emotface/em"&i&".gif></img>",1,6,1)
    ubb=replace(ubb,"{:em"&i&"}","",1,-1,1)
    next
    ubb=replace(ubb,"["&chr(176),"[",1,-1,1)
    ubb=replace(ubb,chr(176)&"]","]",1,-1,1)
    ubb=replace(ubb,"/"&chr(176),"/",1,-1,1)
'    ubb=replace(ubb,"{;em","{:em",1,-1,1)
end function


function Convert(ubb,CovT)
cText=ubb
startubb=1
do while Covt="url" or Covt="color" or Covt="font" or Covt="size"
startubb=instr(startubb,cText,"["&CovT&"=",1)
if startubb=0 then exit do
endubb=instr(startubb,cText,"]",1)
if endubb=0 then exit do
Lcovt=Covt
startubb=startubb+len(lCovT)+2
text=mid(cText,startubb,endubb-startubb)
codetext=replace(text,"[","["&chr(176),1,-1,1)
codetext=replace(codetext,"]",chr(176)&"]",1,-1,1)
'codetext=replace(codetext,"{:em","{;em",1,-1,1)
codetext=replace(codetext,"/","/"&chr(176),1,-1,1)
select case CovT
    case "color"
	cText=replace(cText,"[color="&text&"]","<font color='"&text&"'>",1,1,1)
	cText=replace(cText,"[/color]","</font>",1,1,1)
    case "font"
	cText=replace(cText,"[font="&text&"]","<font face='"&text&"'>",1,1,1)
	cText=replace(cText,"[/font]","</font>",1,1,1)
    case "size"
	if IsNumeric(text) then
	if text>6 then text=6
	if text<1 then text=1
	cText=replace(cText,"[size="&text&"]","<font size='"&text&"'>",1,1,1)
	cText=replace(cText,"[/size]","</font>",1,1,1)
	end if
    case "url"
	cText=replace(cText,"[url="&text&"]","<a href='"&codetext&"' target=_blank>",1,1,1)
	cText=replace(cText,"[/url]","</a>",1,1,1)
    case "email"
	cText=replace(cText,"["&CovT&"="&text&"]","<a href=mailto:"&text&">",1,1,1)
	cText=replace(cText,"[/"&CovT&"]","</a>",1,1,1)
end select
loop

startubb=1
do
startubb=instr(startubb,cText,"["&CovT&"]",1)
if startubb=0 then exit do
endubb=instr(startubb,cText,"[/"&CovT&"]",1)
if endubb=0 then exit do
Lcovt=Covt
startubb=startubb+len(lCovT)+2
text=mid(cText,startubb,endubb-startubb)
codetext=replace(text,"[","["&chr(176),1,-1,1)
codetext=replace(codetext,"]",chr(176)&"]",1,-1,1)
'codetext=replace(codetext,"{:em","{;em",1,-1,1)
codetext=replace(codetext,"/","/"&chr(176),1,-1,1)
select case CovT
    case "url"
	cText=replace(cText,"["&CovT&"]"&text,"<a href='"&codetext&"' target=_blank>"&codetext,1,1,1)
	cText=replace(cText,"<a href='"&codetext&"' target=_blank>"&codetext&"[/"&CovT&"]","<a href="&codetext&" target=_blank>"&codetext&"</a>",1,1,1)
    case "email"
	cText=replace(cText,"["&CovT&"]","<a href=mailto:"&text&">",1,1,1)
	cText=replace(cText,"[/"&CovT&"]","</a>",1,1,1)
    case "html"
	codetext=replace(codetext,"<br>",chr(13),1,-1,1)
	codetext=replace(codetext,"&nbsp;",chr(32),1,-1,1)
	Randomize
	rid="temp"&Int(100000 * Rnd)
	cText=replace(cText,"[html]"&text,"����Ƭ�����£�<TEXTAREA id="&rid&" rows=15 style='width:100%' class='bk'>"&codetext,1,1,1)
	cText=replace(cText,"����Ƭ�����£�<TEXTAREA id="&rid&" rows=15 style='width:100%' class='bk'>"&codetext&"[/html]","����Ƭ�����£�<TEXTAREA id="&rid&" rows=15 style='width:100%' class='bk'>"&codetext&"</TEXTAREA><INPUT onclick=runEx('"&rid&"') type=button value=���д˶δ��� name=Button1 class='Tips_bo'> <INPUT onclick=JM_cc('"&rid&"') type=button value=���Ƶ��ҵļ����� name=Button2 class='Tips_bo'>",1,1,1)
    case "img"
	cText=replace(cText,"[img]"&text,"<a href="&chr(34)&"about:<img src="&codetext&" border=0>"&chr(34)&" target=_blank><img src="&codetext,1,1,1)
	cText=replace(cText,"[/img]"," vspace=2 hspace=2 border=0 alt=::���ͼƬ���´����д�::></a>",1,1,1)
    case "code"
	cText=replace(cText,"[code]"&text,"��������Ϊ�������<hr noshade>"&codetext,1,1,1)
	cText=replace(cText,"��������Ϊ�������<hr noshade>"&codetext&"[/code]","��������Ϊ�������<hr noshade>"&codetext&"<hr noshade>",1,1,1)
    case "quote"
	atext=replace(text,"[img]","",1,-1,1)
	atext=replace(atext,"[/img]","",1,-1,1)
	atext=replace(atext,"[swf]","",1,-1,1)
	atext=replace(atext,"[/swf]","",1,-1,1)
	atext=replace(atext,"[html]","",1,-1,1)
	atext=replace(atext,"[/html]","",1,-1,1)
'	atext=replace(atext,"{:em","{;em",1,-1,1)
	atext=SplitWords(atext,350)
	atext=replace(atext,chr(32),"&nbsp;",1,-1,1)
	cText=replace(cText,"[quote]"&text,"<blockquote><hr noshade>"&atext,1,1,1)
	cText=replace(cText,"<blockquote><hr noshade>"&atext&"[/quote]","<blockquote><hr noshade>"&atext&"<hr noshade></blockquote>",1,1,1)
    case "swf"
	cText=replace(cText,"[swf]"&text,"ӰƬ��ַ:<br>"&text&"<br><object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0' width='500' height='500'><param name=movie value='"&codetext&"'><param name=quality value=high><embed src='"&codetext&"' quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width='500' height='500'>",1,1,1)
	cText=replace(cText,"<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0' width='500' height='500'><param name=movie value='"&codetext&"'><param name=quality value=high><embed src='"&codetext&"' quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width='500' height='500'>"&"[/swf]","<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0' width='500' height='500'><param name=movie value='"&codetext&"'><param name=quality value=high><embed src='"&codetext&"' quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width='500' height='500'>"&"</embed></object>",1,1,1)
end select
loop
Convert=cText
end function

function AutoURL(ubb)
cText=ubb
startubb=1
do
startubb=1
endubb_a=0
endubb_b=0
endubb=0
startubb=instr(startubb,cText,"http://",1)
if startubb=0 then exit do
endubb_b=instr(startubb,cText,"<",1)
endubb_a=instr(startubb,cText,"&nbsp;",1)

endubb=endubb_a

if endubb=0 then
endubb=endubb_b
end if

if endubb_b<endubb and endubb_b>0 then
endubb=endubb_b
end if

if endubb=0 then
lenc=ctext
endubb=len(lenc)+1
end if

'response.write startubb&","&endubb
if startubb>endubb then exit do
text=mid(cText,startubb,endubb-startubb)
'response.write text
'codetext=replace(text,"/","/"&chr(176),1,-1,1)
codetext=text
'response.write text&","
urllink="<a href='"&codetext&"' target=_blank>"&codetext&"</a> "
'response.write urllink
urllink=replace(urllink,"/","/"&chr(176),1,-1,1)
cText=replace(cText,text,urllink,1,1,1)
loop
AutoURL=cText
end function
%>
