<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="booking.aspx.cs" Inherits="HeadQuarters.UI.Web.booking" %>

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
    <link href="css/custom.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/customformat.css"/>
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
			 <label for="txtFname" class="col-sm-2 control-label">First Name</label>
			 <div class="col-sm-10">
                <asp:TextBox CssClass="form-control" ID="txtFname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" id="reqFirstName" controltovalidate="txtFname" errormessage="Please enter First Name!" CssClass="error_message"/>
			 </div>
		  </div>
		  <div class="form-group">
			 <label for="txtLname" class="col-sm-2 control-label">Last Name</label>
			 <div class="col-sm-10">
				<asp:TextBox CssClass="form-control" ID="txtLname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" id="reqLastName" controltovalidate="txtLname" errormessage="Please enter Last Name!" CssClass="error_message"/>
			 </div>
		  </div>
          <div class="form-group">
			  <label for="txtPhone" class="col-sm-2 control-label">Phone No.</label>
			  <div class="col-sm-10">
				 <asp:TextBox CssClass="form-control" ID="txtPhone" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator runat="server" id="reqPhone" controltovalidate="txtPhone" errormessage="Please enter Phone No!" CssClass="error_message"/>
                 <asp:RegularExpressionValidator runat="server" id="rexNumber" controltovalidate="txtPhone" 
       validationexpression="^[0-9]{2}-[0-9]{6}$" errormessage="Please enter valid phone number!" CssClass="error_message"/>
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
						<div class="planname">CAR (4 seats)</div>
						<div class="price"> <span class="curr">$</span>2.00/KM</div>
						<div class="billing">$1.20 per hour</div>
					</div><! --/pricing -->
				</div><! --/col-md-4-->
				
				<div class="col-md-4">
					<div class="pricing color2">
						<div class="planname">VAN (15 Seats)</div>
						<div class="price"> <span class="curr">$</span>5.00/KM</div>
						<div class="billing">$1.50 per hour</div>
					</div><! --/pricing -->
				</div><! --/col-md-4-->
				
				<div class="col-md-4">
					<div class="pricing color3">
						<div class="planname">VAN (25 Seats)</div>
						<div class="price"> <span class="curr">$</span>7.00/KM<span class="per"></span></div>
						<div class="billing">$2.00 per hour</div>
					</div><! --/pricing -->
				</div><! --/col-md-4-->
			</section>



            <section class="row breath planpricing">
			
				<div class="col-md-4">
					<div class="pricing color1">
						<div class="planname">BUS (70 seats)</div>
						<div class="price"> <span class="curr">$</span>9.00/KM</div>
						<div class="billing">$6.50 per hour</div>
					</div><! --/pricing -->
				</div><! --/col-md-4-->
				
				<div class="col-md-4">
					<div class="pricing color2">
						<div class="planname">BUS (30 seats)</div>
						<div class="price"> <span class="curr">$</span>7.50/KM</div>
						<div class="billing">$5.00 per hour</div>
					</div><! --/pricing -->
				</div><! --/col-md-4-->
				
				<div class="col-md-4">
					<div class="pricing color3">
						<div class="planname">BUS (35 seats)</div>
						<div class="price"> <span class="curr">$</span>8.00/KM<span class="per"></span></div>
						<div class="billing">$5.50 per hour</div>
					</div><! --/pricing -->
				</div><! --/col-md-4-->
			</section>

	     
 
		<div class="section-title">
			<h5>Reservation Details</h5>
	            <div class="form-horizontal panel-heading ">
                    <div class="form-group">
			            <label for="dropDownList_vehicleType" class="col-sm-2 control-label"> Vehical Type</label>
					    <div class="col-sm-10">	
                           <asp:DropDownList CssClass="form-control" ID="dropDownList_vehicleType" runat="server" DataSourceID="SqlDataSource2" DataTextField="type" DataValueField="type_id">
                           </asp:DropDownList>
                           <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [type_id], [type] FROM [Type]"></asp:SqlDataSource>
			            </div>
		            </div>       
                    <div class="form-group">
						<label for="txtPickUpAddress" class="col-sm-2 control-label">Pick Up Address</label>
					    <div class="col-sm-10">
							<asp:TextBox CssClass="form-control" ID="txtPickUpAddress" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" id="reqPickUpAdd" controltovalidate="txtPickUpAddress" errormessage="Please enter pick up address!" CssClass="error_message"/>
						</div>
				    </div>                           
                    <div class="form-group">
					    <label for="txtDropAddress" class="col-sm-2 control-label">Drop Address</label>
						<div class="col-sm-10">
					       <asp:TextBox CssClass="form-control" ID="txtDropAddress" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator runat="server" id="reqDropAdd" controltovalidate="txtDropAddress" errormessage="Please enter drop address!" CssClass="error_message"/>
						</div>
					</div>
                    <div class="form-group">
					    <label for="txtDistance" class="col-sm-2 control-label">Km</label>
					    <div class="col-sm-8">
							<asp:TextBox CssClass="form-control" ID="txtDistance" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" id="reqDistance" controltovalidate="txtDistance" errormessage="Please enter distance!" CssClass="error_message"/>
						</div>
                        <div class="col-sm-2"> 
							<input type="button" class="form-control add-color" value="Get Distance" onclick="getDistance()" />						        
						</div>
				    </div>
                    <div class="form-group">
					    <label for="input1" class="col-sm-2 control-label">Pick Up Date</label>
					    <div class="col-sm-10">
						    <asp:TextBox  CssClass="form-control" ID="txtPickUpDate" runat="server"></asp:TextBox> 
                            <asp:RequiredFieldValidator runat="server" id="reqPickUpDate" controltovalidate="txtPickUpDate" errormessage="Please enter pick up date!" CssClass="error_message"/>                                   
						</div>
				   </div>		
				  <div class="form-group">
					    <label for="txtPickUpTime" class="col-sm-2 control-label">Pick Up Time</label>
					    <div class="col-sm-10">
						   <asp:TextBox CssClass="form-control" ID="txtPickUpTime" runat="server"></asp:TextBox> 
                           <asp:RequiredFieldValidator runat="server" id="reqPickUpTime" controltovalidate="txtPickUpTime" errormessage="Please enter pick up time!" CssClass="error_message"/>                                   
						</div>
				 </div>
                 <div class="form-group">
					<label for="txtDropDate" class="col-sm-2 control-label">Drop Date</label>
					<div class="col-sm-10">
						<asp:TextBox  CssClass="form-control" ID="txtDropDate" runat="server"></asp:TextBox> 
                        <asp:RequiredFieldValidator runat="server" id="reqDropDate" controltovalidate="txtDropDate" errormessage="Please enter drop date!" CssClass="error_message"/>                                   
				    </div>
				</div>
                <div class="form-group">
					<label for="txtDropTime" class="col-sm-2 control-label">Drop Time</label>
					<div class="col-sm-10">
					    <asp:TextBox CssClass="form-control"  ID="txtDropTime" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" id="reqDropTime" controltovalidate="txtDropTime" errormessage="Please enter drop time!" CssClass="error_message"/>
					</div>
				</div>
                <div class="form-group">
					<label for="txtTotHrs" class="col-sm-2 control-label">Total Hrs</label>
					<div class="col-sm-8">
					    <asp:TextBox CssClass="form-control" ID="txtTotHrs" runat="server"></asp:TextBox>
					</div>
                    <div class="col-sm-2"> 
					    <asp:Button CssClass="form-control add-color" ID="btnTotHrs" runat="server" Text="Get Total Hrs" CausesValidation="False" OnClick="btnTotHrs_Click"/>						        
				    </div>
				</div>
                <div class="form-group">
					<label for="txtTot" class="col-sm-2 control-label">Subtotal</label>
					<div class="col-sm-8">
				        <asp:TextBox CssClass="form-control" ID="txtTot" runat="server"></asp:TextBox>
					</div>
                    <div class="col-sm-2"> 
					    <asp:Button CssClass="form-control add-color" ID="btnTot" runat="server" Text="Get Sub Total" CausesValidation="False" OnClick="btnTot_Click"/>						        
				    </div>
				</div>
				<div class="form-group">
					<label for="dropDownList_branch" class="col-sm-2 control-label">Nearest Branch</label>
					<div class="col-sm-10">
                        <asp:DropDownList CssClass="form-control" ID="dropDownList_branch" runat="server" DataSourceID="SqlDataSource1" DataTextField="location" DataValueField="branch_id">
                        <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [branch_address], [location], [branch_id] FROM [Branch]"></asp:SqlDataSource>
				    </div>
			    </div>
                <div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
                        <asp:Button CssClass="form-control color-sub" ID="btnSub" runat="server" Text="Reserve" OnClick="btnAdd_Click" />							         
					</div>
				</div>
                <div class="col-sm-offset-2 col-sm-10" id="label_error_message">
                    <asp:Label ID="lbl_error_message" runat="server" Text=""></asp:Label>
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



    jQuery('#txtPickUpDate,#txtDropDate').datetimepicker({
        timepicker: false,
        format: 'd/m/Y'
    });

    jQuery('#txtDropTime,#txtPickUpTime').datetimepicker({
        datepicker: false,
        format: 'H:i'
    });


    $("#txtPickUpDate,#txtDropDate,#txtDropTime,#txtPickUpTime").keypress(function (event) { event.preventDefault(); });

</script>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp"></script>
<script>


    function getDistance() {

        var directionsService = new google.maps.DirectionsService();

        var start = document.getElementById("txtPickUpAddress").value;
        var end = document.getElementById("txtDropAddress").value;


        var request = {

            origin: start, // a city, full address, landmark etc
            destination: end,
            travelMode: google.maps.DirectionsTravelMode.DRIVING

        };

        directionsService.route(request, function (response, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                document.getElementById("txtDistance").value = Math.round((response.routes[0].legs[0].distance.value) / 1000);
            }
            else {
                alert("The pick up address or destination address is incorrect.")
            }
        });

    }


</script>


<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places"></script>
    <script type="text/javascript">
        google.maps.event.addDomListener(window, 'load', function () {

            var options = {
                componentRestrictions: { country: "it" }
            };

            new google.maps.places.Autocomplete(document.getElementById('txtPickUpAddress'), options);
            new google.maps.places.Autocomplete(document.getElementById('txtDropAddress'), options);
            
        });
    </script>


 
</body>
</html>    