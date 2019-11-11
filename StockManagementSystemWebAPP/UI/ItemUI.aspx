<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemUI.aspx.cs" Inherits="StockManagementSystemWebAPP.UI.ItemUI" %>

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
					<li class="colorlib-active"><a href="ItemUI.aspx">Item</a></li>
					<li><a href="StockInUI.aspx">Stock In</a></li>
					<li><a href="StockOutUI.aspx">Stock Out</a></li>
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
							<span class="heading-meta">Stock Manegement System</span>
							<h2 class="colorlib-heading">Save Item</h2>
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
                                                                    <td>Category</td>
                                                                    <td></td>
                                                                    <td>
                                                                        <asp:DropDownList ID="CategoryDropDown" runat="server" Height="50px" Width="203px" class="form-control textbox"  required="true" >
                                                                        </asp:DropDownList></td>
                                                                </tr>
                            
                                                                
                                                                 <tr>
                                                                    <td>Company</td>
                                                                    <td></td>
                                                                    <td>
                                                                        <asp:DropDownList ID="CompanyDropDown" runat="server" Height="50px"  Width="203px" class="form-control textbox"  required="true" >
                                                                        </asp:DropDownList></td>
                                                                     
                                                                </tr>
                                                                
                                                                  <tr>
                                                                    <td>Item</td>
                                                                    <td></td>
                                                                    <td>
                                                                        <asp:TextBox ID="itemTextBox" runat="server" Width="203px" class="form-control textbox" placeholder="Item"  required="true" ></asp:TextBox>
                                                                       </td>
                                                                </tr>
                                                                 <tr>
                                                                    <td>Reorder Level&nbsp;&nbsp;</td>
                                                                    <td></td>
                                                                    <td>
                                                                        <asp:TextBox ID="reorderTextBox"  onkeypress='return event.charCode>=48 && event.charCode<=57' runat="server" Width="203px" class="form-control textbox" placeholder="0"></asp:TextBox>
                                                                       </td>
                                                                </tr>
                                                                      
                                                                 <tr>
                                                                    <td></td>
                                                                    <td></td>
                                                                     
                                                                    <td><br />
                                                                        <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" class="btn btn-primary"/>
                                                                       </td>
                                                                </tr>
                                                            </table>
        

                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                          
                                                            <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label>
                                                        </div>
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
