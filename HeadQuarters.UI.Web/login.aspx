<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="HeadQuarters.UI.Web.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Login</title>
	<meta charset = "utf-8" />
	<meta http-equiv = "X-UA-Compatible" content = "IE = edge" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
     <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'/>
	<link rel="stylesheet" type="text/css" href="fonts/fonts.css" />
	<link rel="stylesheet" href="css/material.min.css" />
	<link href = "css/bootstrap.min.css" rel = "stylesheet" />
	<link rel="stylesheet" type="text/css" href="css/custom.css" />
</head>
<body>
    <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
		  <header class="mdl-layout__header">
		    <div class="mdl-layout__header-row">
		      <!-- Title -->
		      <span id="main-title" class="mdl-layout-title">Veloce Cars</span>
		      <!-- Add spacer, to align navigation to the right -->
		      <div class="mdl-layout-spacer"></div>
		      <!-- Navigation. We hide it in small screens. -->
		      <nav class="mdl-navigation mdl-layout--large-screen-only">
		      </nav>
		    </div>
		  </header>
			  <div class="mdl-layout__drawer">
			    <span class="mdl-layout-title">Veloce Cars</span>
			    <nav class="mdl-navigation">
			    </nav>
			  </div>
		 
	</div>

	<div class="container">
	  <div class="row">
		  	<div class="col-xs-12 ">


				<div class="form-card-wide mdl-card mdl-shadow--2dp">
				  <div class="mdl-card__supporting-text">


					    <form id="form1" runat="server" class="form-horizontal">


						  	 <div class="form-group">
							    <label for="input1" class="col-sm-2 control-label">Username</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ID="txtUsername" runat="server"></asp:TextBox>
							    </div>
							  </div>


                             <div class="form-group">
							    <label for="input1" class="col-sm-2 control-label">Password</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ID="txtPassword" runat="server" TextMode="password"></asp:TextBox>
							    </div>
							  </div>

                            <div class="form-group" id="label_error_message">
                                  <asp:Label ID="lbl_error_message" runat="server" Text=""></asp:Label>
                                </div>
                   
						
							  <div class="form-group">
							    <div class="col-sm-offset-2 col-sm-10">
                                     <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" ID="btnLog" runat="server" Text="Login" OnClick="btnAdd_Click" /> 
							    </div>
							  </div>
						</form>


				  </div>
				</div>
			</div>
		</div>
	</div>

	<!-- Jquery -->
	 <script src="js/jquery-2.2.1.min.js"></script>

	<!-- Bootstrap -->
	 <script src = "/js/bootstrap.min.js"></script>

	<!-- Material Design -->
	<script src="js/material.min.js"></script>




</body>

  </html>