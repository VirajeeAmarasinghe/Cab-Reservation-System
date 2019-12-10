<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="book.aspx.cs" Inherits="ClientReservation.UI.Web.book" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta name="description" content=""/>
	<title> Veloce cars</title>
	 
	<link href="css/bootstrap.css" rel="stylesheet"/>
	 
	<link href="css/main.css" rel="stylesheet"/>
 <link href="css/homecss.css" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css" />
 
	<link rel="shortcut icon" href="images/favicon.png"/>
	<script src="js/pace.js"></script>
 
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,600' rel='stylesheet' type='text/css'/>
</head>

<body>
	<div class="preloader"></div>
	
    
<header id="top" class="masthead" role="main">
		<div class="container">
			<div class="logo"> <a href="index.html#"><img src="images/logo.png" alt="logo"/></a>
			</div>
 
			<h1>Quick Response</h1>
			<h1>Fair Prices </h1>
 
			<div class="row"></div>
 
				<a  class="scrollto">
				<p>SCROLL DOWN TO EXPLORE</p>
				<p class="scrollto--arrow"><img src="images/scroll_down.png" alt="scroll down arrow"/></p>
				</a>
		</div>

	</header>
 
    <form id="res" runat="server" >
   
<div class="container" id="explore">
 
		<div class="section-title">
			<h2>Prepsonal Details</h2>
			<h4>Enter your personal deatails.</h4>
                <div class="form-horizontal panel-heading ">
							 <div class="form-group">
							    <label for="input2" class="col-sm-2 control-label">First Name</label>
							    <div class="col-sm-10">
                                     <asp:TextBox CssClass="form-control" ID="txtFname" runat="server"></asp:TextBox>
							    </div>
				  </div>
							   <div class="form-group">
							    <label for="input3" class="col-sm-2 control-label">Last Name</label>
							    <div class="col-sm-10">
							      <asp:TextBox CssClass="form-control" ID="txtLname" runat="server"></asp:TextBox>
							    </div>
							  </div>

							  

							  <div class="form-group">
							    <label for="input4" class="col-sm-2 control-label">Phone No.</label>
							    <div class="col-sm-10">
							      <asp:TextBox CssClass="form-control" ID="txtPhone" runat="server"></asp:TextBox>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="input4" class="col-sm-2 control-label">Email</label>
							    <div class="col-sm-10">
							      <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server"></asp:TextBox>
							    </div>
							  </div>
						
					
	
		  </div>

           </div> 
	  </div> 
		<div class="container">
 
			<div class="section-title">
				<h2>Type</h2>
				<h4>Select Your Preferred Vehicle</h4>
			</div>
			<section class="row breath planpricing">
			
				<div class="col-md-4">
					<div class="pricing color1">
						<div class="planname">CAR</div>
						<div class="price"> <span class="curr">Rs.</span>14/KM</div>
						<div class="billing">packgade detail</div>
					</div><! --/pricing -->
				</div><! --/col-md-4-->
				
				<div class="col-md-4">
					<div class="pricing color2">
						<div class="planname">VAN</div>
						<div class="price"> <span class="curr">Rs.</span>49/KM</div>
						<div class="billing">Package Details</div>
					</div><! --/pricing -->
				</div><! --/col-md-4-->
				
				<div class="col-md-4">
					<div class="pricing color3">
						<div class="planname">BUS</div>
						<div class="price"> <span class="curr">Rs.</span>99/KM<span class="per"></span></div>
						<div class="billing">package details</div>
					</div><! --/pricing -->
				</div><! --/col-md-4-->
			</section>
 

	     
 
		<div class="section-title">
			<h5>Reservation Details</h5>
	<div class="form-horizontal panel-heading ">
                                <div class="form-group">
							    <label for="input4" class="col-sm-2 control-label"> Vehical Type</label>
							    <div class="col-sm-10">
							      <asp:TextBox CssClass="form-control" ID="txtType" runat="server"></asp:TextBox>
							    </div>
						        </div>
                                <div class="form-group">
							    <label for="input4" class="col-sm-2 control-label">Capacity</label>
							    <div class="col-sm-10">
							        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox>
							    </div>
						        </div>
                           
                          <div class="form-group">

							    <label for="input2" class="col-sm-2 control-label">Destination</label>
							    <div class="col-sm-10">
							       <asp:TextBox CssClass="form-control" ID="txtAds" runat="server"></asp:TextBox>
							    </div>
							  </div>

		
							   <div class="form-group">
							    <label for="input1" class="col-sm-2 control-label">Reservation Start</label>
							    <div class="col-sm-10">
						<asp:TextBox CssClass="form-control" ID="TxtStart" runat="server"></asp:TextBox>
                                    
							    </div>
						  </div>
                        <div class="form-group">
							    <label for="input1" class="col-sm-2 control-label">Reservation End</label>
							    <div class="col-sm-10">
							     <asp:TextBox CssClass="form-control" ID="txtEnd" runat="server"></asp:TextBox>
							    </div>
						  </div>
							   <div class="form-group">
							    <label for="input3" class="col-sm-2 control-label">Branch</label>
							    <div class="col-sm-10">
							      <asp:TextBox CssClass="form-control" ID="txtBranch" runat="server"></asp:TextBox>
							    </div>
						  </div>
                     </div>
                   </div>
		</div>
 <div class="container">
			<section class="row breath">
				<div class="col-md-12 footerlinks">
					<p>&copy; 2016 Veloce cars.co. All Rights Reserved</p>
				</div>
			</section>
		</div>
 
 </form>
 
 
<script src="js/jquery.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.datetimepicker.full.min.js"></script>
<script>

    $('#TxtStart,#txtEnd').datetimepicker();

</script>

 
</body>
</html>    