<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSalesUI.aspx.cs" Inherits="StockManagementSystemWebAPP.UI.ViewSalesUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <link href="../css/datepicker.css" rel="stylesheet" />
    <script src="../js/datepickerjs.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script>
	    $(function () {
	        $('.dates #usr1').datepicker({
	            'format': 'yyyy-mm-dd',
	            'autoclose': true
	        });
	        $('.dates #usr2').datepicker({
	            'format': 'yyyy-mm-dd',
	            'autoclose': true
	        });
	    });
			</script>
</head>
<body>
    <form id="form1" runat="server">
	<div class="dates">
    <label>Choose DOB</label>

        <asp:TextBox ID="usr1" Width ="180px" runat="server"  class="form-control" name="event_date" placeholder="YYYY-MM-DD" autocomplete="off" ></asp:TextBox>
        <asp:TextBox ID="usr2" Width ="180px" runat="server"  class="form-control" name="event_date" placeholder="YYYY-MM-DD" autocomplete="off" ></asp:TextBox>
  </div>
        <div>
            <asp:Button ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click" />
        </div>
        <div>
            <asp:GridView ID="SalesGridView" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="SalesGridView_SelectedIndexChanged">
                  
        <Columns>
            
            <asp:TemplateField HeaderText="SL">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"><%#Eval("Id")%></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Item">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"><%#Eval("Item_Name")%></asp:Label>
                </ItemTemplate>

            </asp:TemplateField>
            
             <asp:TemplateField HeaderText="Sale Quantity">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server"><%#Eval("Sale_Quantity")%></asp:Label>
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
