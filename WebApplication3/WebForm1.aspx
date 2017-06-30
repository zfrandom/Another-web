<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication3.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>

</head>
<body >
    <form id="form1" runat="server">
    <div>
    账号：
    <input id="userName_input" runat="server" onkeypress="un_onKeyPress" onclick="userName_input_onclick" />
    
    <asp:Button id="gbt_GetDept" runat="server" onclick="getDept_click" Text="get dept name"/> 
    
    <br />
    部门：
   <asp:DropDownList ID="dept_ddl" runat="server" />
   <br />
    密码：
    <input id="pwd_input" runat="server" type="password"/>
    <br />
    <asp:Button ID="sub" runat="server" OnClick="sub_click" Text="submit" />
    <br />
    <asp:CheckBox runat="server" Checked="false" Text="Remember user" ID="rmb_pwd" />
    <asp:label ID="wrong" Visible="false" runat="server"  Text="wrong!"/>
    </div>
    </form>
</body>
</html>
