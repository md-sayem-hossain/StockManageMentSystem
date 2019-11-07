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

	<!-- Modernizr JS -->
	<script src="../js/modernizr-2.6.2.min.js"></script>
    

    
    
    

</head>
<body>
    
        
        <!--============================================================================================= -->
      
        <div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="border js-fullheight">
			<h1 id="colorlib-logo"><a href="index.html">Balay</a></h1>
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li class="colorlib-active"><a href="index.html">Home</a></li>
					<li><a href="work.html">Project</a></li>
					<li><a href="about.html">About</a></li>
					<li><a href="services.html">Services</a></li>
					<li><a href="blog.html">Blog</a></li>
					<li><a href="contact.html">Contact</a></li>
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
							<span class="heading-meta">Read</span>
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
                                                    <asp:TextBox ID="categoryTextBox" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                                                    <br/>

                                                    <asp:Button ID="SaveButton" runat="server" Text="Save" OnClick="SaveButton_Click" class="btn btn-primary"/>
                                                     <asp:GridView ID="categoryGridview" runat="server" AutoGenerateColumns="False" Width="268px" CssClass="table" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" >
        
                                            <Columns>
                                                
                                                <asp:TemplateField HeaderText="SL" >
                                                    
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server"><%#Eval("Id")%></asp:Label>
                                                    </ItemTemplate>

                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server"><%#Eval("Name")%></asp:Label>
                                                    </ItemTemplate>

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

                                        </asp:GridView>
                                                 
s                                                    <a href="HomeUI.aspx">HomeUI.aspx</a>

                                                </div>
                                                    <asp:Label ID="messagelabel" runat="server" Text="ggg"></asp:Label>

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
