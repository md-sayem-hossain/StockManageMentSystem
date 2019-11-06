<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockOutUI.aspx.cs" Inherits="StockManagementSystemWebAPP.UI.StockOutUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

     <form id="form1" runat="server">
    <table>
     <tr>
      <td>Choose Category First  </td>
      <td>
          <asp:DropDownList ID="CompanyDropDownList" runat="server"  Width="168px"
              AutoPostBack="True" onselectedindexchanged="Category_SelectedIndexChanged" Height="19px">
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


    <asp:GridView ID="StockoutGridView" runat="server" AutoGenerateColumns="False" Width="532px">
        
        
         
        <Columns>
            
            <asp:TemplateField HeaderText="SL">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"><%#Eval("StockOut_Id")%></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"><%#Eval("Item_Name")%></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="Company">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"><%#Eval("Company_Name")%></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"><%#Eval("StockOut_Value")%></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>

                   <asp:CommandField SelectText="Select" ShowSelectButton="true" Visible="false" />

        </Columns>

    </asp:GridView>
    
 
    <asp:Button ID="SellButton" runat="server" Text="Sell" Height="31px" Width="94px" OnClick="SellButton_Click1" /><br/>
    <asp:Button ID="DamageButton" runat="server" Text="Damage" OnClick="DamageButton_Click1" /><br/>
    <asp:Button ID="LostButton" runat="server" Text="Lost" Width="94px" OnClick="LostButton_Click" />
    <a href="HomeUI.aspx">HomeUI.aspx</a>
         <asp:Label ID="messagelable" runat="server" Text="Label"></asp:Label>
     </form>
</body>
</html>
