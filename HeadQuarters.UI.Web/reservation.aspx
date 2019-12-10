<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reservation.aspx.cs" Inherits="HeadQuarters.UI.Web.reservation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reservation</title>
	<meta charset = "utf-8" />
	<meta http-equiv = "X-UA-Compatible" content = "IE = edge" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
     <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'/>
	<link rel="stylesheet" type="text/css" href="fonts/fonts.css" />
	<link rel="stylesheet" href="css/material.min.css" />
	<link href = "css/bootstrap.min.css" rel = "stylesheet" />
	<link rel="stylesheet" type="text/css" href="css/custom.css" />
    <link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css" />
</head>
<body>
        <!--#include file="layout/nav.html"-->
    <form id="form1" runat="server">
        
	<div class="container">
	  <div class="row">
		  	<div class="col-xs-12 ">


				<div class="form-card-wide mdl-card mdl-shadow--2dp">
				  <div class="mdl-card__supporting-text">


					    <div  class="form-horizontal">
                            <h2>Client Details</h2>
                            <div class="form-group">
			 <label for="txtFname" class="col-sm-2 control-label">First Name</label>
			 <div class="col-sm-10">
                <asp:TextBox CssClass="form-control" ID="txtFname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="txtFname" errormessage="Please enter First Name!" CssClass="error_message"/>
			 </div>
		  </div>
		  <div class="form-group">
			 <label for="txtLname" class="col-sm-2 control-label">Last Name</label>
			 <div class="col-sm-10">
				<asp:TextBox CssClass="form-control" ID="txtLname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator2" controltovalidate="txtLname" errormessage="Please enter Last Name!" CssClass="error_message"/>
			 </div>
		  </div>
          <div class="form-group">
			  <label for="txtPhone" class="col-sm-2 control-label">Phone No.</label>
			  <div class="col-sm-10">
				 <asp:TextBox CssClass="form-control" ID="txtPhone" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator3" controltovalidate="txtPhone" errormessage="Please enter Phone No!" CssClass="error_message"/>
                 <asp:RegularExpressionValidator runat="server" id="RegularExpressionValidator1" controltovalidate="txtPhone" 
       validationexpression="^[0-9]{2}-[0-9]{6}$" errormessage="Please enter valid phone number!" CssClass="error_message"/>
			  </div>
		  </div>
		  <div class="form-group">
			  <label for="input4" class="col-sm-2 control-label">Email</label>
			  <div class="col-sm-10">
				 <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server"></asp:TextBox>
			  </div>
		  </div>
                            <h2>Reservation Details</h2>
						  	 
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
                        <asp:DropDownList CssClass="form-control" ID="dropDownList_branch" runat="server" DataSourceID="SqlDataSource3" DataTextField="location" DataValueField="branch_id">
                        <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [branch_address], [location], [branch_id] FROM [Branch]"></asp:SqlDataSource>
				    </div>
			    </div>
                            <div class="form-group">
					<label for="txtReservID" class="col-sm-2 control-label">Reservation ID</label>
					<div class="col-sm-8">
				        <asp:TextBox CssClass="form-control" ID="txtReservID" runat="server"></asp:TextBox>
					</div>
                    
				</div>
                            <div class="form-group">
					<label for="txtEmpID" class="col-sm-2 control-label">Employee ID</label>
					<div class="col-sm-8">
				        <asp:TextBox CssClass="form-control" ID="txtEmpID" runat="server"></asp:TextBox>
					</div>
                    
				</div>
                            <div class="form-group">
					<label for="txtCabID" class="col-sm-2 control-label">Cab ID</label>
					<div class="col-sm-8">
				        <asp:TextBox CssClass="form-control" ID="txtCabID" runat="server"></asp:TextBox>
					</div>
                    
				</div>
                
                <div class="col-sm-offset-2 col-sm-10" id="label_error_message">
                    <asp:Label ID="lbl_error_message" runat="server" Text=""></asp:Label>
                </div> 
                           




							  <div class="form-group">
							    <div class="col-sm-offset-2 col-sm-10">
                                     <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" ID="btnSub" runat="server" Text="Add" OnClick="btnAdd_Click" />
							         <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CausesValidation="false" />
							    </div>
							  </div>
						</div>


				  </div>
				</div>
			</div>
		</div>


        <div class="row">
		  	<div class="col-xs-12 ">


				<div class="form-card-wide margin-overwrite mdl-card mdl-shadow--2dp">
			

				

			

				
				  

				

				



				

				


				
				    <asp:GridView  Cssclass="table table-bordered table-hover table-ex" ID="dgvReservation" runat="server" AutoGenerateColumns="False" DataKeyNames="reservation_id"  EmptyDataText="There are no data records to display." OnRowCommand="dgvReservation_RowCommand" OnRowCreated="dgvReservation_RowCreated">
                        <Columns>
                            <asp:TemplateField HeaderText="Reservation ID" SortExpression="reservation_id">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("reservation_id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("reservation_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cab ID" SortExpression="cab_id">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("cab_id") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label13" runat="server" Text='<%# Bind("cab_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Pick Up Address" SortExpression="pick_up_address">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pick_up_address") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("pick_up_address") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Drop Address" SortExpression="destination">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("destination") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("destination") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Distance" SortExpression="distance">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox14" runat="server" Text='<%# Bind("distance") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label15" runat="server" Text='<%# Bind("distance") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Pick Up Time" SortExpression="pick_up_date_time">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("pick_up_date_time") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("pick_up_date_time") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Drop Time" SortExpression="drop_date_time">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("drop_date_time") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("drop_date_time") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total" SortExpression="total">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("total") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("total") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Additional Distance" SortExpression="additional_distance" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("additional_distance") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("additional_distance") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status" SortExpression="status" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Branch" SortExpression="branch_id" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("branch_id") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("branch_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Driver" SortExpression="employee_id" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("employee_id") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("employee_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Client" SortExpression="client_id" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("client_id") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("client_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Partner" SortExpression="partner_id" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("partner_id") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("partner_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Feedback" SortExpression="feedback" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("feedback") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label14" runat="server" Text='<%# Bind("feedback") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnEdit" runat="server" CommandName="cmdEdit" ImageUrl="~/images/tool.png" CausesValidation="false"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnDelete" runat="server" CommandName="cmdDelete" ImageUrl="~/images/cross.png" CausesValidation="false"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnView" runat="server" CommandName="cmdView" ImageUrl="~/images/eye.png" CausesValidation="false"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
			

				

			

				
				  

				

				



				

				


				
				</div>
			</div>
		</div>


	</div>

</form>
	<!-- Jquery -->
	 <script src="js/jquery-2.2.1.min.js"></script>

	<!-- Bootstrap -->
	 <script src = "/js/bootstrap.min.js"></script>

	<!-- Material Design -->
	<script src="js/material.min.js"></script>

    <!-- Title -->
    <script>
        document.getElementById("main-title").innerHTML = "Reservation";


    </script>

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


