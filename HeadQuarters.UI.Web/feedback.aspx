<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="HeadQuarters.UI.Web.feedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Feedback</title>
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
							    <label for="txtClientName" class="col-sm-2 control-label">Client Name</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ID="txtClientName" runat="server"></asp:TextBox>
							    </div>
							  </div>

                            <div class="form-group">
							    <label for="txtEmail" class="col-sm-2 control-label">Email</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server"></asp:TextBox>
							    </div>
							  </div>                        


						  	 <div class="form-group">
							    <label for="input1" class="col-sm-2 control-label">FeedBack</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control"  ID="txtFeed" TextMode="MultiLine" runat="server"></asp:TextBox>
							    </div>
							  </div>

							  <div class="form-group">
							    <div class="col-sm-offset-2 col-sm-10">
                                     <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" ID="btnSub" runat="server" Text="Submit" OnClick="btnAdd_Click" />
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
        document.getElementById("main-title").innerHTML = "FeedBack";
    </script>



</body>
</html>

