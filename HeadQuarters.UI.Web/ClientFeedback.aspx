<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientFeedback.aspx.cs" Inherits="HeadQuarters.UI.Web.ClientFeedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Client Feedback</title>
    <meta charset = "utf-8" />
	<meta http-equiv = "X-UA-Compatible" content = "IE = edge" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
	<link rel="stylesheet" type="text/css" href="fonts/fonts.css" />
    <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'/>
	<link rel="stylesheet" href="css/material.min.css" />
	<link href = "css/bootstrap.min.css" rel = "stylesheet" />
	<link rel="stylesheet" type="text/css" href="css/custom.css" />  
    <link rel="stylesheet" href="css/customformat.css"/>
    <link href="css/bootstrap.css" rel="stylesheet"/>	 
	<link href="css/main.css" rel="stylesheet"/>
    <link href="css/homecss.css" rel="stylesheet"/>
    <link href="css/custom.css" rel="stylesheet"/>
	<link rel="stylesheet" type="text/css" href="css/jquery.datetimepicker.css" />
 
	<link rel="shortcut icon" href="images/favicon.png"/>
	<script src="js/pace.js"></script>
 
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,600' rel='stylesheet' type='text/css'/>  
</head>
<body>
    <header id="top" class="masthead" role="main">
		<div class="container">
			<div class="logo"> <a href="index.html#"><img src="images/logo.png" alt="logo"/></a>
			</div>		
		</div>

	</header>
    <form id="form1" runat="server">
    <div class="container">
	  <div class="row">
		  	<div class="col-xs-12 ">
				<div class="form-card-wide mdl-card mdl-shadow--2dp">
				  <div class="mdl-card__supporting-text">                     
					    <div class="form-horizontal">
						  	 <div class="form-group">
							    <label for="txtContent" class="col-sm-2 control-label">Content</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ID="txtContent" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator runat="server" id="reqContent" controltovalidate="txtContent" errormessage="Please enter Content!" CssClass="error_message"/>
							    </div>
							  </div>							  
							   <div class="form-group">
							    <label for="txtClientName" class="col-sm-2 control-label">Name</label>
							    <div class="col-sm-10">
							      <asp:TextBox CssClass="form-control" ID="txtClientName" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator runat="server" id="reqClientName" controltovalidate="txtClientName" errormessage="Please enter Your Name!" CssClass="error_message"/>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="txtEmail" class="col-sm-2 control-label">Email</label>
							    <div class="col-sm-10">
							      <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator runat="server" id="reqEmail" controltovalidate="txtEmail" errormessage="Please enter Email Address!" CssClass="error_message"/>
                                  <asp:RegularExpressionValidator runat="server" id="rexEmail" controltovalidate="txtEmail" 
       validationexpression="^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" errormessage="Please enter valid email!" CssClass="error_message"/>
							    </div>
							  </div>
                            <div class="form-group" id="label_error_message">
                                  <asp:Label ID="lbl_error_message" runat="server" Text=""></asp:Label>
                              </div>
                            <div class="form-group">
							    <div class="col-sm-offset-2 col-sm-10">
                                     <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click"/>							         
							    </div>
							  </div>
                            </div>
                      </div>
                    </div>
                  </div>
          </div>
        </div>
    </form>
</body>
</html>
