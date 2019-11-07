<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemUI.aspx.cs" Inherits="StockManagementSystemWebAPP.UI.ItemUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table>
            <tr>
                <td>Category</td>
                <td></td>
                <td>
                    <asp:DropDownList ID="CategoryDropDown" runat="server" Height="16px" Width="213px">
                    </asp:DropDownList></td>
            </tr>
             <tr>
                <td>Company</td>
                <td></td>
                <td>
                    <asp:DropDownList ID="CompanyDropDown" runat="server" Width="213px">
                    </asp:DropDownList></td>
            </tr>
              <tr>
                <td>Item</td>
                <td></td>
                <td>
                    <asp:TextBox ID="itemTextBox" runat="server" Width="203px"></asp:TextBox>
                   </td>
            </tr>
             <tr>
                <td>Reorder Level</td>
                <td></td>
                <td>
                    <asp:TextBox ID="reorderTextBox" runat="server" Width="203px"></asp:TextBox>
                   </td>
            </tr>
            
             <tr>
                <td></td>
                <td></td>
                <td>
                    <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" />
                   </td>
            </tr>
        </table>
        
        <a href="HomeUI.aspx">HomeUI.aspx</a>

        <asp:Label ID="messageLabel" runat="server" Text="Label"></asp:Label>
    </div>
    </form>
</body>
</html>
