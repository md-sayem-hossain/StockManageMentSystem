<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockOutUI.aspx.cs" Inherits="StockManagementSystemWebAPP.UI.StockOutUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    
    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href="https://fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
	<!-- Animate.css -->
	<link rel="stylesheet" href="../css/animate.css">

	<!-- Icomoon Icon Fonts-->
	<link rel="stylesheet" href="../css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="../css/bootstrap.css">
	<!-- Flexslider  -->
	<link rel="stylesheet" href="../css/flexslider.css">
	<!-- Flaticons  -->
	<link rel="stylesheet" href="../fonts/flaticon/font/flaticon.css">
	<!-- Owl Carousel -->
	<link rel="stylesheet" href="../css/owl.carousel.min.css">
	<link rel="stylesheet" href="../css/owl.theme.default.min.css">
	<!-- Theme style  -->
	<link rel="stylesheet" href="../css/style.css">
    <link href="../css/Actioncss.css" rel="stylesheet" />

	<!-- Modernizr JS -->
	<script src="../js/modernizr-2.6.2.min.js"></script>
    
     <script>
         setTimeout(function () {
             $("#messagelable").hide(1000).empty();
         }, 5000);
    </script>

</head>
<body>
   <!--============================================================================================= -->
      
        <div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="border js-fullheight">
			<h1 id="colorlib-logo"><a href="index.html">Promak</a></h1>
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li><a href="CategoryUI.aspx">Category</a></li>
					<li ><a href="CompanyUI.aspx">Company</a></li>
					<li><a href="ItemUI.aspx">Item</a></li>
					<li><a href="StockInUI.aspx">Stock In</a></li>
					<li  class="colorlib-active"><a href="StockOutUI.aspx">Stock Out</a></li>
					<li><a href="ItemSamaryUI.aspx">Search & View</a></li>
					<li><a href="ViewSalesUI.aspx">View Sales</a></li>
					<li><a href="LoginUI.aspx">Log Out</a></li>

				</ul>
			</nav>

		</aside>
        </div>
          
        


      <!--============================================================================================= -->
    
    <div id="colorlib-main">

			<div class="colorlib-contact">
				<div class="colorlib-narrow-content">
					<div class="row">
						<div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
							<span class="heading-meta">Stock Management System</span>
							<h2 class="colorlib-heading">Stock Out</h2>
						</div>
					</div>
					<div class="row">
						
						<div class="col-md-7 col-md-push-1">
							<div class="row">
								<div class="col-md-10 col-md-offset-1 col-md-pull-1 animate-box" data-animate-effect="fadeInLeft">
								    
								    <!--=======================================================-->

    

                                                         <form id="form1" runat="server">
                                                        <table>
                                                         <tr>
                                                          <td>Choose Company&nbsp;&nbsp;</td>
                                                          <td>
                                                              <asp:DropDownList ID="CompanyDropDownList" runat="server"
                                                                  AutoPostBack="True" onselectedindexchanged="Category_SelectedIndexChanged"  class="form-control textbox" required="true">
                                                              </asp:DropDownList>
                                                          </td>
                                                         </tr>
                                                         <tr>
                                                         <td class="auto-style1">Choose Item</td>
                                                          <td class="auto-style1">
                                                              <asp:DropDownList ID="ItemDropDownList" required="true" runat="server" class="form-control textbox" OnSelectedIndexChanged="ItemDropDownList_SelectedIndexChanged" AutoPostBack="True">
                                                              </asp:DropDownList>
 
                                                          </td>
                                                         </tr>

                                                         <tr>
                                                         <td> Reorder Label</td>
                                                          <td>
                                                              <asp:TextBox ID="reorderLabelTextxBox"  placeholder="0" class="form-control textbox" runat="server" OnTextChanged="reorderLabelTextxBox_TextChanged"></asp:TextBox>
 
                                                          </td>
                                                         </tr>    
        
        
                                                         <tr>
                                                         <td>Available Quantity</td>
                                                          <td>
                                                              <asp:TextBox ID="AvailabelQuantityTextBox" runat="server"   class="form-control textbox" placeholder="0"></asp:TextBox>
 
                                                          </td>
                                                         </tr> 
        
                                                         <tr>
                                                         <td>Stock Out Quantity</td>
                                                          <td>
                                                              <asp:TextBox ID="StockOutTextBox" runat="server"   onkeypress='return event.charCode>=48 && event.charCode<=57' required="true" class="form-control textbox" placeholder="0" ></asp:TextBox>
 
                                                          </td>
                                                         </tr> 
        
        
        

                                                         <tr>
                                                             <td></td>
                                                             
                                                          
                                                             <td colspan="2"> <br />
                                                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                                                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <asp:Button ID="SaveButton" runat="server" Text="Save"
                                                                  onclick="SaveButton_Click" CssClass="btn  btn-primary" />
                                                                 <br/>
                                                          </td>
                                                         </tr>
                                                         <tr>
                                                          <td colspan="2">
                                                           <asp:Label ID="lbl_display" runat="server"></asp:Label>
                                                          </td>
                                                         </tr>
                                                        </table>


                                                        <asp:GridView ID="StockoutGridView" runat="server" AutoGenerateColumns="False"   CssClass="table">
        
        
         
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
                                                             <br/>
                                                           
                                                             <div id="ActionButton">
                                                        
                                                                <asp:Button ID="SellButton" runat="server" Text="Sell" Height="31px" Width="100px" OnClick="SellButton_Click1"  CssClass="btn  btn-primary"/>&nbsp;&nbsp;
                                                                <asp:Button ID="DamageButton" runat="server" Text="Damage" OnClick="DamageButton_Click1"  CssClass="btn  btn-primary" Height="31px" Width="100px"/>&nbsp;&nbsp;
                                                                <asp:Button ID="LostButton" runat="server" Text="Lost" OnClick="LostButton_Click" Height="31px" Width="100px" CssClass="btn  btn-primary" />
                                                                     <br />
                                                            </div>
                                                             <asp:Label ID="messagelable" runat="server" Text="Label"></asp:Label>
                                                         </form>
                                    
                                     <!--=======================================================-->


                                    </div>
								
							</div>
						</div>
					</div>
				</div>
			</div>

			
	</div>
    
    
    
    
    <!-- jQuery -->
	<script src="../js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="../js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="../js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="../js/jquery.waypoints.min.js"></script>
	<!-- Flexslider -->
	<script src="../js/jquery.flexslider-min.js"></script>
	<!-- Sticky Kit -->
	<script src="../js/sticky-kit.min.js"></script>
	<!-- Owl carousel -->
	<script src="../js/owl.carousel.min.js"></script>
	<!-- Counters -->
	<script src="../js/jquery.countTo.js"></script>
	
	
	<!-- MAIN JS -->
	<script src="../js/main.js"></script>
</body>
</html>
