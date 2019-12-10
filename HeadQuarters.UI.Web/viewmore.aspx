<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewmore.aspx.cs" Inherits="HeadQuarters.UI.Web.viewmore" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View More</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
     <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'/>
    <link href='https://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'/>
	<link rel="stylesheet" type="text/css" href="fonts/fonts.css" />
	<link rel="stylesheet" href="css/material.min.css" />
	<link href = "css/bootstrap.min.css" rel = "stylesheet" />
	<link rel="stylesheet" type="text/css" href="css/custom.css" />
</head>
<body>
    <form id="form1" runat="server">        
	<div class="container">
	  <div class="row">
		  	<div class="col-xs-12 ">
				<div class="form-card-wide mdl-card mdl-shadow--2dp">
				  <div class="mdl-card__supporting-text">
					    <div  class="form-horizontal">
                            <h2>Reservation Details</h2>
                            <div class="form-group">
			                   <label for="txtreserID" class="col-sm-2 control-label">Reservation ID:</label>
			                   <div class="col-sm-10">
                                  <asp:TextBox CssClass="form-control" ID="txtreserID" runat="server"></asp:TextBox>                               
			                   </div>
		                    </div>
		                    <div class="form-group">
			                   <label for="txtPickAdd" class="col-sm-2 control-label">Pick Up Address</label>
			                   <div class="col-sm-10">
				                  <asp:TextBox CssClass="form-control" ID="txtPickAdd" runat="server"></asp:TextBox>                
			                   </div>
		                   </div>
                           <div class="form-group">
			                   <label for="txtDest" class="col-sm-2 control-label">Destination</label>
			                   <div class="col-sm-10">
				                   <asp:TextBox CssClass="form-control" ID="txtDest" runat="server"></asp:TextBox>       
			                   </div>
		                  </div>
		                  <div class="form-group">
			                  <label for="txtPickDate" class="col-sm-2 control-label">Pick Up Date</label>
			                  <div class="col-sm-10">
				                 <asp:TextBox CssClass="form-control" ID="txtPickDate" runat="server"></asp:TextBox>
			                  </div>
		                  </div>
                          <div class="form-group">
			                  <label for="txtDropDate" class="col-sm-2 control-label">Drop Date</label>
			                  <div class="col-sm-10">
				                 <asp:TextBox CssClass="form-control" ID="txtDropDate" runat="server"></asp:TextBox>
			                  </div>
		                  </div>
                          <div class="form-group">
			                  <label for="txtDistance" class="col-sm-2 control-label">Distance</label>
			                  <div class="col-sm-10">
				                 <asp:TextBox CssClass="form-control" ID="txtDistance" runat="server"></asp:TextBox>
			                  </div>
		                  </div>
                         <div class="form-group">
			                  <label for="txtClientName" class="col-sm-2 control-label">Client Name</label>
			                  <div class="col-sm-10">
				                 <asp:TextBox CssClass="form-control" ID="txtClientName" runat="server"></asp:TextBox>
			                  </div>
		                  </div>
                        <div class="form-group">
			                  <label for="txtClientNo" class="col-sm-2 control-label">Client No</label>
			                  <div class="col-sm-10">
				                 <asp:TextBox CssClass="form-control" ID="txtClientNo" runat="server"></asp:TextBox>
			                  </div>
		                  </div>
                        <div class="form-group">
			                  <label for="txtCab" class="col-sm-2 control-label">Cab No</label>
			                  <div class="col-sm-10">
				                 <asp:TextBox CssClass="form-control" ID="txtCab" runat="server"></asp:TextBox>
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
