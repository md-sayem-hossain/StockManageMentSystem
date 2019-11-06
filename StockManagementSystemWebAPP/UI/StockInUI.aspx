<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockInUI.aspx.cs" Inherits="StockManagementSystemWebAPP.UI.StockInUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 29px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table>
     <tr>
      <td>Choose Comapany First  </td>
      <td>
          <asp:DropDownList ID="CompanyDropDownList" runat="server"  Width="168px"
              AutoPostBack="True" onselectedindexchanged="Company_SelectedIndexChanged" Height="19px">
          </asp:DropDownList>
      </td>
     </tr>
     <tr>
     <td class="auto-style1">Choose Item</td>
      <td class="auto-style1">
          <asp:DropDownList ID="ItemDropDownList" runat="server" Width="165px" Height="20px" OnSelectedIndexChanged="ItemDropDownList_SelectedIndexChanged" AutoPostBack="True">
          </asp:DropDownList>
 
      </td>
     </tr>

     <tr>
     <td> Reorder Label</td>
      <td>
          <asp:TextBox ID="reorderLabelTextxBox" runat="server" OnTextChanged="reorderLabelTextxBox_TextChanged"></asp:TextBox>
 
      </td>
     </tr>    
        
        
     <tr>
     <td>Available Quantity</td>
      <td>
          <asp:TextBox ID="AvailabelQuantityTextBox" runat="server"></asp:TextBox>
 
      </td>
     </tr> 
        
     <tr>
     <td>Stock In Quantity</td>
      <td>
          <asp:TextBox ID="StockInTextBox" runat="server"></asp:TextBox>
 
      </td>
     </tr> 
        
        
        

     <tr>
      <td colspan="2">
        <asp:Button ID="SaveButton" runat="server" Text="Save"
              onclick="SaveButton_Click" />
      </td>
     </tr>
     <tr>
      <td colspan="2">
       <asp:Label ID="lbl_display" runat="server"></asp:Label>
      </td>
     </tr>
    </table>

    </form>
    <a href="HomeUI.aspx">HomeUI.aspx</a>
</body>
</html>
