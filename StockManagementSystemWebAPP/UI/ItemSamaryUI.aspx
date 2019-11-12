<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemSamaryUI.aspx.cs" Inherits="StockManagementSystemWebAPP.UI.ItemSamaryUI" %>

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
					<li><a href="CompanyUI.aspx">Company</a></li>
					<li><a href="ItemUI.aspx">Item</a></li>
					<li><a href="StockInUI.aspx">Stock In</a></li>
					<li><a href="StockOutUI.aspx">Stock Out</a></li>
					<li class="colorlib-active"><a href="ItemSamaryUI.aspx">Search & View</a></li>
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
							<span class="heading-meta">Stock Manegement System</span>
							<h2 class="colorlib-heading">Item Sumurry</h2>
						</div>
					</div>
					<div class="row">
						
						<div class="col-md-7 col-md-push-1">
							<div class="row">
								<div class="col-md-10 col-md-offset-1 col-md-pull-1 animate-box" data-animate-effect="fadeInLeft">
								    
								    <!--=======================================================-->

                                <form id="form1" runat="server">
                                <div>
                                <table>
                                 <tr>
                                  <td>Choose Comapany&nbsp;&nbsp; </td>
                                  <td>
                                      <asp:DropDownList ID="CompanyDropDownList" runat="server"  class="form-control textbox" 
                                        AutoPostBack="False" required="true" >
                                      </asp:DropDownList>
                                  </td>
                                 </tr>
                                 <tr>
                                 <td class="auto-style1">Choose Item</td>
                                  <td class="auto-style1">
                                      <asp:DropDownList ID="categoryDropDown" runat="server"  class="form-control textbox"  AutoPostBack="False"  required="true" >
                                      </asp:DropDownList>
 
                                  </td>
                                 </tr>
                                    </table>
        
                                        <asp:Button ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click"  class="btn btn-primary" />

        
                                </div>
        
                                    <div>
                                        <asp:GridView ID="sumurryGridView" runat="server" AutoGenerateColumns="False" CssClass="table" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                
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


                                                     <FooterStyle BackColor="#CCCCCC" />
                                                     <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                                     <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                                     <RowStyle BackColor="White" />
                                                     <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                     <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                     <SortedAscendingHeaderStyle BackColor="#808080" />
                                                     <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                     <SortedDescendingHeaderStyle BackColor="#383838" />


                                        </asp:GridView>

                                    </div>
                                    <br/>
                                     <br/>
                                    
                                    
                                    <br />
                                    <asp:Button ID="pdfbutton" runat="server" Text="pdf" CssClass="btn btn-primary" OnClick="pdfbutton_Click"/>
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
