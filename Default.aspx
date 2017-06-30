<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication3._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body>
    <form id="form1" runat="server">
        <input id="input" runat="server"  readonly="readonly" />

        <asp:DropDownList ID="pageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="pageSize_changed">
            <asp:ListItem Value="5"> 5</asp:ListItem>
            <asp:ListItem Selected="True" Value="10">10</asp:ListItem>
             <asp:ListItem  Value="15" >15</asp:ListItem>
            <asp:ListItem  Value="20" >20</asp:ListItem>
        </asp:DropDownList>
        
       <asp:Button  ID="logout_btn" Text="Log out" runat="server" 
            OnClick="logout_click" Width="176px" />
        <div>

            <asp:GridView ID="GridView1" AllowPaging="true" runat="server" OnPageIndexChanging="GridView1_PageIndexChanging"
                AutoGenerateColumns="false" AllowSorting="True" OnSorting="GridView1_Sorting" >
                <asp:PagerSettings Mode="Numeric" FirstPageText="toFirstPage" LastPageText="toLastPage" NextPageText="ToNextPage"  />
               <Columns>
                <asp:BoundField ReadOnly="true" HeaderText="Name" SortExpression="Name" DataField="Name" />
                <asp:BoundField ReadOnly="true" HeaderText="Id" SortExpression="Id" DataField="Id"  />
                <asp:BoundField ReadOnly="true" HeaderText=" CaseNo" SortExpression="CaseNo" DataField= "CaseNo" />
                <asp:BoundField ReadOnly="true" HeaderText="BedCode" SortExpression="BedCode" DataField="BedCode" />
                <asp:BoundField ReadOnly="true" HeaderText="Dept" SortExpression="Dept" DataField="Dept" />
                <asp:BoundField ReadOnly="true" HeaderText="CurVisitStatus" SortExpression="CurVisitStatus" DataField="CurVisitStatus" />
                <asp:BoundField ReadOnly="true" HeaderText="Sex" SortExpression="Sex" DataField="Sex"  />
                <asp:BoundField ReadOnly="true" HeaderText="Age" SortExpression="Age" DataField="Age" />
                <asp:BoundField ReadOnly="true" HeaderText="BedId" SortExpression="BedId" DataField="BedId" />
                <asp:BoundField ReadOnly="true" HeaderText="AdmitDit" SortExpression="AdmitDit" DataField="AdmitDit" />
                <asp:BoundField ReadOnly="true" HeaderText="DischargeDt" SortExpression="DischargeDt" DataField="DischargeDt" />
                <asp:BoundField ReadOnly="true" HeaderText="CurNurseLevel" SortExpression="CurNurseLevel" DataField="CurNurseLevel" />
                <asp:BoundField ReadOnly="true" HeaderText="CostTotal" SortExpression="CostTotal" DataField="CostTotal" />
                <asp:BoundField ReadOnly="true" HeaderText="DepositTotal" SortExpression="DepositTotal" DataField="DepositTotal" />
                <asp:BoundField ReadOnly="true" HeaderText="LeaveDepositTotal" SortExpression="LeaveDepositTotal" DataField="LeaveDepositTotal" />
                <asp:BoundField ReadOnly="true" HeaderText="LeaveDepositTotal" SortExpression="LeaveDepositTotal" DataField="LeaveDepositTotal" />
                <asp:BoundField ReadOnly="true" HeaderText="InWstDiagnose" SortExpression="InWstDiagnose" DataField="InWstDiagnose" />
                <asp:BoundField ReadOnly="true" HeaderText="DeptId" SortExpression="DeptId" DataField="DeptId" />
               </Columns>
                <PagerTemplate>
                    <table>
                        <tr>
                            <td style="text-align: right">
                                第<asp:Label ID="lblPageIndex" runat="server" Text="<%#((GridView)Container.Parent.Parent).PageIndex + 1 %>"></asp:Label>页
                                共<asp:Label ID="lblPageCount" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageCount %>"></asp:Label>页
                                <asp:LinkButton ID="btnFirst" runat="server" CausesValidation="False" CommandArgument="First"
                                    CommandName="Page" Text="首页"></asp:LinkButton>
                                <asp:LinkButton ID="btnPrev" runat="server" CausesValidation="False" CommandArgument="Prev"
                                    CommandName="Page" Text="上一页"></asp:LinkButton>
                                <asp:LinkButton ID="btnNext" runat="server" CausesValidation="False" CommandArgument="Next"
                                    CommandName="Page" Text="下一页"></asp:LinkButton>
                                <asp:LinkButton ID="btnLast" runat="server" CausesValidation="False" CommandArgument="Last"
                                    CommandName="Page" Text="尾页"></asp:LinkButton>
                                <asp:TextBox ID="txtNewPageIndex" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1%>"
                                    Width="20px"></asp:TextBox>
                                <asp:LinkButton ID="btnGo" runat="server" CausesValidation="False" CommandArgument="-1"
                                    CommandName="Page" Text="GO"></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </PagerTemplate>
                
            </asp:GridView>
        <div>
             性别：
            <asp:DropDownList ID="sex_sl" runat="server">
            <asp:ListItem Selected="True" Value="all"> 全部</asp:ListItem>
            <asp:ListItem  Value="男">男性</asp:ListItem>
            <asp:ListItem  Value="女" >女性</asp:ListItem>
          
            </asp:DropDownList>
                         目前状态：
            <asp:DropDownList ID="curvisitstatus_sl" runat="server">
            <asp:ListItem Selected="True" Value="all"> 全部</asp:ListItem>
            <asp:ListItem  Value="出院未结算">出院未结算</asp:ListItem>
            <asp:ListItem  Value="已入科" >已入科</asp:ListItem>
            </asp:DropDownList>
            
            所属dept
            <asp:DropDownList ID="ward" runat="server" >
            <asp:ListItem Selected="True" Value="all" Text="全部" />
            </asp:DropDownList>
            
            <br />
            年龄： 处于
             <input id="minage_sl" runat="server" value="任意" size="5"/>
             岁和
             <input id="maxage_sl" runat="server" value="任意" size="5" />
             岁之间
             <br />
              Id： 处于
             <input id="minid_sl" runat="server" value="任意" size="5" />
             和
             <input id="maxid_sl" runat="server" value="任意"  size="5"/>
             之间
             <br />
             入院日期在
             <input id="earliest_in_sl" runat="server" value="yyyy/mm/dd" />
              和
              <input id="latest_in_sl" runat="server" value="yyyy/mm/dd" />
              之间
              <asp:CheckBox ID="in_hos" runat="server" Text="仍在住院" />
            
            <asp:Button ID="selapply" runat="server" OnClick="selapply_click" Text="APPLY" Visible="false" />
            <asp:Label ID="wrong" runat="server" Text="wrong type in filter!!!!!!" Visible="false" />
        </div>


        </div>
    </form>
</body>
</html>
