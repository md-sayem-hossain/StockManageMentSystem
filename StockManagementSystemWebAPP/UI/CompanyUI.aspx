<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyUI.aspx.cs" Inherits="StockManagementSystemWebAPP.UI.CompanyUI1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <asp:Label ID="Label3" runat="server" Text="Name"></asp:Label>
        <asp:TextBox ID="companyTextBox" runat="server"></asp:TextBox>


        <asp:Button ID="SaveCompany" runat="server" Text="Save" OnClick="SaveCompany_Click" />
        <asp:GridView ID="companyGridview" runat="server" AutoGenerateColumns="False">
        
        <Columns>
            
            <asp:TemplateField HeaderText="SL">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"><%#Eval("Id")%></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"><%#Eval("Name")%></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
           
        </Columns>

    </asp:GridView>
        
        
        

        <a href="HomeUI.aspx">HomeUI.aspx</a>


        <asp:Label ID="messageLabel" runat="server" Text="Label"></asp:Label>
    </div>
    </form>
</body>
</html>
