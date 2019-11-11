<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CategoryUI.aspx.cs" Inherits="StockManagementSystemWebAPP.UI.CompanyUI"  EnableEventValidation="false"%>


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
        <script src="../js/date.js"></script>

    <script>
        

        $(document).ready(function () {
            $("#categoryGridview th:first-child").hide();
            $("#categoryGridview td:first-child").hide();
        });
    </script>
    

    <style type="text/css">
        .auto-style1 {
            width: 164px;
        }
        .auto-style2 {
            width: 229px;
        }
    </style>
    
    <script>
        setTimeout(function () {
            $("#messagelabel").hide(1000).empty();
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
					<li class="colorlib-active"><a href="CategoryUI.aspx">Category</a></li>
					<li><a href="CompanyUI.aspx">Company</a></li>
					<li><a href="ItemUI.aspx">Item</a></li>
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
							<h2 class="colorlib-heading">Save Cayegory</h2>
						</div>
					</div>
					<div class="row">
						
						<div class="col-md-7 col-md-push-1">
							<div class="row">
								<div class="col-md-10 col-md-offset-1 col-md-pull-1 animate-box" data-animate-effect="fadeInLeft">
									<form id="form1" runat="server">
									 
                                        
                               <!--========================================      Main Code      ================================== -->

                                                <div>
                                                <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
                                                    <asp:TextBox ID="categoryTextBox" runat="server" class="form-control textbox" placeholder="Name" required="true"></asp:TextBox>
                                                   <div id="messagelable">
                                                     <asp:Label ID="messagelabel" runat="server" Text=""></asp:Label>
<br/>                                                     </div>

                                                    <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" class="btn btn-primary"/>
                                                    <asp:Button ID="UpdateButton" runat="server" Text="Update" class="btn btn-primary" OnClick="UpdateButton_Click"/>
                                                 
                                                 
                                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


                                                    <div id="selecteditemongrid">
                                                         
                                                     <asp:GridView ID="categoryGridview" runat="server" AutoGenerateColumns="False" Width="268px" CssClass="table" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnRowDataBound="categoryGridview_RowDataBound" OnRowCommand="categoryGridview_RowCommand" >
        
                                            <Columns>
                                                
                                                <asp:BoundField DataField ="Id" HeaderText="Id"/>

                                                <asp:BoundField DataField="Name" HeaderText="Name"/>
                                                 
                                                <asp:TemplateField>

                                                       <ItemTemplate>

                                                            <asp:LinkButton ID="lnkBtnClk" runat="server" CommandName="clk" Text="click">

                                                            </asp:LinkButton>

                                                       </ItemTemplate>

                                                       <ItemStyle CssClass="hide"/>

                                                  </asp:TemplateField>

                                                  <asp:TemplateField>

                                                       <ItemTemplate>

                                                            <asp:LinkButton ID="lnkBtnDblClk" runat="server" CommandName="dblClk" Text="dblClick">

                                                            </asp:LinkButton>

                                                       </ItemTemplate>

                                                       <ItemStyle CssClass="hide"/>

                                                  </asp:TemplateField>
                                          
                                            </Columns>

                                                         <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                                         <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                                         <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                                         <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                                         <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                                         <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                                         <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                                         <SortedDescendingHeaderStyle BackColor="#242121" />
                                                              <SelectedRowStyle BackColor="#AFC2DA" Font-Bold="True" ForeColor="#333333"/>


                                        </asp:GridView>
                                         <asp:Label ID="idlabel" runat="server" Text=""></asp:Label>

                                                    
                                                        
                                                        <!--==========================================================-->

                                                        
                                                 </div>
                                                   
                                                </div>
                                  <!--========================================      Main Code      ================================== -->

									</form>
                                
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
