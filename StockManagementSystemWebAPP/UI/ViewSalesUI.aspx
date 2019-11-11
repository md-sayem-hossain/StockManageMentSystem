<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewSalesUI.aspx.cs" Inherits="StockManagementSystemWebAPP.UI.ViewSalesUI" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <link href="../css/datepicker.css" rel="stylesheet" />
    <script src="../js/datepickerjs.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
					<li ><a href="ItemSamaryUI.aspx">Search & View</a></li>
					<li class="colorlib-active"><a href="ViewSalesUI.aspx">View Sales</a></li>
					<li><a href="LoginUI.aspx">Log Out</a></li>

				</ul>
			</nav>

		</aside>
        </div>
     <div id="colorlib-main">

			<div class="colorlib-contact">
				<div class="colorlib-narrow-content">
					<div class="row">
						<div class="col-md-12 animate-box" data-animate-effect="fadeInLeft">
							<span class="heading-meta">Stock Manegement System</span>
							<h2 class="colorlib-heading">View Sales</h2>
						</div>
					</div>
					<div class="row">
						
						<div class="col-md-7 col-md-push-1">
							<div class="row">
								<div class="col-md-10 col-md-offset-1 col-md-pull-1 animate-box" data-animate-effect="fadeInLeft">
								    
								    <!--=======================================================-->

                                <form id="form1" runat="server">
	                            <div class="dates">
                                <label>Choose DOB</label>

                                    <asp:TextBox ID="usr1" Width ="180px" runat="server"  class="form-control textbox" name="event_date" placeholder="YYYY-MM-DD" autocomplete="off"  ></asp:TextBox>
                                    <asp:TextBox ID="usr2" Width ="180px" runat="server"  class="form-control textbox" name="event_date" placeholder="YYYY-MM-DD" autocomplete="off" ></asp:TextBox>
                              </div>
                                    <div>
                                        <br/>
                                        <asp:Button ID="SearchButton" runat="server" Text="Search" OnClick="SearchButton_Click" CssClass="btn btn-primary"/>
                                    </div>
                                    <div>
                                        <asp:GridView ID="SalesGridView" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="SalesGridView_SelectedIndexChanged" CssClass="table">
                  
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
<%--	<script src="../js/jquery.min.js"></script>--%>
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
