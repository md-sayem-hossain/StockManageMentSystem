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

         $().ready(function () {
             $("#form1").validate({
                 rules: {
                     StockInTextBox: {
                         required: true
                     },
                 

                     messages: {
                         StockInTextBox: {
                             required: "Please provide a password",
                         },
                         
                     }
                 }
             });
         });
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
					<li class="colorlib-active"><a href="StockInUI.aspx">Stock In</a></li>
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
							<h2 class="colorlib-heading">Stock In</h2>
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
                                              <td>Choose Comapany &nbsp;&nbsp;</td>
                                              <td>
                                                  <asp:DropDownList ID="CompanyDropDownList" runat="server" 
                                                      AutoPostBack="True" onselectedindexchanged="Company_SelectedIndexChanged"  Height="50px" Width="231px" class="form-control" required="true">
                                                  </asp:DropDownList>
                                              </td>
                                             </tr>
                                             <tr>
                                             <td class="auto-style1">Choose Item</td>
                                              <td class="auto-style1">
                                                  <asp:DropDownList ID="ItemDropDownList" runat="server"  OnSelectedIndexChanged="ItemDropDownList_SelectedIndexChanged" AutoPostBack="True"  class="form-control textbox" required="true">
                                                  </asp:DropDownList>
 
                                              </td>
                                             </tr>

                                             <tr>
                                             <td> Reorder Label</td>
                                              <td>
                                                  <asp:TextBox ID="reorderLabelTextxBox" runat="server" OnTextChanged="reorderLabelTextxBox_TextChanged"  class="form-control textbox" placeholder="0" ReadOnly="True"></asp:TextBox>
 
                                              </td>
                                             </tr>    
        
        
                                             <tr>
                                             <td>Available Quantity</td>
                                              <td>
                                                  <asp:TextBox ID="AvailabelQuantityTextBox" runat="server"  class="form-control textbox" placeholder="0" ReadOnly="True"></asp:TextBox>
 
                                              </td>
                                             </tr> 
        
                                             <tr>
                                             <td>Stock In Quantity</td>
                                              <td>
                                                  <asp:TextBox ID="StockInTextBox" runat="server" onkeypress='return event.charCode>=48 && event.charCode<=57' class="form-control textbox" placeholder="0" required="true"></asp:TextBox>
 
                                              </td>
                                             </tr> 
        
        
        

                                             <tr>
                                              <td colspan="2">
                                                  <br/>
                                                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                <asp:Button ID="SaveButton" runat="server" Text="Save"
                                                      onclick="SaveButton_Click" class="btn btn-primary"/>
                                              </td>
                                             </tr>
                                             <tr>
                                              <td colspan="2">
                                                   &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                               <asp:Label ID="messageLabel" runat="server" Text=""></asp:Label>
                                              </td>
                                             </tr>
                                            </table>

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
    <a href="HomeUI.aspx">HomeUI.aspx</a>
</body>
</html>
