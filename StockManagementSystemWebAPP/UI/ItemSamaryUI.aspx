<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemSamaryUI.aspx.cs" Inherits="StockManagementSystemWebAPP.UI.ItemSamaryUI" %>

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
      <td>Choose Comapany First  </td>
      <td>
          <asp:DropDownList ID="CompanyDropDownList" runat="server"  Width="168px"
            AutoPostBack="False" Height="19px">
          </asp:DropDownList>
      </td>
     </tr>
     <tr>
     <td class="auto-style1">Choose Item</td>
      <td class="auto-style1">
          <asp:DropDownList ID="categoryDropDown" runat="server" Width="165px" Height="20px" AutoPostBack="False" >
          </asp:DropDownList>
 
      </td>
     </tr>
        </table>
        
            <asp:Button ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click" />

        
    </div>
        
        <div>
            <asp:GridView ID="sumurryGridView" runat="server" AutoGenerateColumns="False">
                
                         <Columns>
            
                    <asp:TemplateField HeaderText="SL">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server"><%#Eval("Id")%></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Item">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server"><%#Eval("Item")%></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
                             <asp:TemplateField HeaderText="Company">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server"><%#Eval("CompanyName")%></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Category">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server"><%#Eval("CategoryName")%></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
                             <asp:TemplateField HeaderText="Available Quantity">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server"><%#Eval("AvailableQuanatity")%></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Reorder">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server"><%#Eval("ReorderLabel")%></asp:Label>
                        </ItemTemplate>

                    </asp:TemplateField>
           
                </Columns>


            </asp:GridView>

        </div>
        <br/>
        <a href="HomeUI.aspx">HomeUI.aspx</a>
    </form>
</body>
</html>
