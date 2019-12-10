<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="driver.aspx.cs" Inherits="HeadQuarters.UI.Web.driver" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Driver</title>
	<meta charset = "utf-8" />
	<meta http-equiv = "X-UA-Compatible" content = "IE = edge" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
     <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'/>
	<link rel="stylesheet" type="text/css" href="fonts/fonts.css" />
	<link rel="stylesheet" href="css/material.min.css" />
	<link href = "css/bootstrap.min.css" rel = "stylesheet" />
	<link rel="stylesheet" type="text/css" href="css/custom.css" />
</head>
<body>
        <!--#include file="layout/nav.html"-->
    <form id="form1" runat="server" >
	<div class="container">
	  <div class="row">
		  	<div class="col-xs-12 ">
				<div class="form-card-wide mdl-card mdl-shadow--2dp">
				  <div class="mdl-card__supporting-text">
					    <div class="form-horizontal">
						  	 <div class="form-group">
							    <label for="txtID" class="col-sm-2 control-label">Reservation ID</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ID="txtID" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" id="reqReservID" controltovalidate="txtID" errormessage="Please enter Reservation ID!" CssClass="error_message"/>
							    </div>
							  </div>
                              <div class="form-group">
							    <label for="txtAddDis" class="col-sm-2 control-label">Additional Distance</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ID="txtAddDis" runat="server"></asp:TextBox>
							    </div>
							  </div>
                              <div class="form-group">
					              <label for="txtTot" class="col-sm-2 control-label">Total</label>
					              <div class="col-sm-8">
							          <asp:TextBox CssClass="form-control" ID="txtTot" runat="server" ReadOnly="true"></asp:TextBox>                                      
						          </div>
                                  <div class="col-sm-2"> 
							          <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" ID="btnTotal" runat="server" Text="Get Total" OnClick="btnTotal_Click"/>					        
						          </div>
				              </div>
                            <div class="form-group">
							    <label for="ddl_status" class="col-sm-2 control-label">Status</label>
							    <div class="col-sm-10">
                                   <asp:DropDownList ID="ddl_status" runat="server" CssClass="form-control">
                                   <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                   <asp:ListItem Text="Completed" Value="Completed"></asp:ListItem>                                 
                                   </asp:DropDownList>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="txtFeedback" class="col-sm-2 control-label">Feedback</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ID="txtFeedback" runat="server" TextMode="MultiLine"></asp:TextBox>
							    </div>
							  </div>	
                              <div class="form-group" id="label_error_message">
                                  <asp:Label ID="lbl_error_message" runat="server" Text=""></asp:Label>
                              </div>	
							  <div class="form-group">
							    <div class="col-sm-offset-2 col-sm-10">
							         <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"/>                                     
							    </div>
							  </div>
						</div>
				  </div>
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
        document.getElementById("main-title").innerHTML = "Cab";
    </script>
    
    
</body>
</html>

