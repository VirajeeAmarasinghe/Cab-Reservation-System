<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="HeadQuarters.UI.Web.main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Veloce Cars</title>
	<meta charset = "utf-8" />
	<meta http-equiv = "X-UA-Compatible" content = "IE = edge" />
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
     <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" type="text/css" href="fonts/fonts.css" />
	<link rel="stylesheet" href="css/material.min.css" />
	<link href = "css/bootstrap.min.css" rel = "stylesheet" />
	<link rel="stylesheet" type="text/css" href="css/custom.css" />
</head>
<body>
   
      <!--#include file="layout/nav.html"-->

	<div class="container">
	  <div class="row">
		  	<div class="col-xs-4 ">


				<div class="form-card-wide mdl-card mdl-shadow--2dp">
				  <div class="mdl-card__supporting-text center-this">

					   <i class="fa fa-car fa-5x"></i>
                       <br />
                      <div class="main-text-style"><a href="driver.aspx">Driver</a></div> 


				  </div>
				</div>
			</div>

         

          <div class="col-xs-4 ">


				<div class="form-card-wide mdl-card mdl-shadow--2dp">
				  <div class="mdl-card__supporting-text center-this">


					   <i class="fa fa-user fa-5x"></i>
                      <br />
                     <div class="main-text-style"><a href="partner.aspx">Partner</a></div>

				  </div>
				</div>
			</div>


          <div class="col-xs-4 ">


				<div class="form-card-wide mdl-card mdl-shadow--2dp">
				  <div class="mdl-card__supporting-text center-this">


					   <i class="fa fa-building fa-5x"></i>
                       <br />
                      <div class="main-text-style"><a href="branch.aspx">Branch</a></div> 


				  </div>
				</div>
			</div>


		</div>

        <div class="row">
            <div class="col-xs-4 ">


				<div class="form-card-wide mdl-card mdl-shadow--2dp">
				  <div class="mdl-card__supporting-text center-this">


					   <i class="fa fa-users fa-5x"></i>
                      <br />
                     <div class="main-text-style"><a href="employee.aspx">Employee</a></div> 

				  </div>
				</div>
			</div>


            <div class="col-xs-4 ">


				<div class="form-card-wide mdl-card mdl-shadow--2dp">
				  <div class="mdl-card__supporting-text center-this">


					   <i class="fa fa-database fa-5x"></i>
                       <br />
                     <div class="main-text-style"><a href="reservation.aspx">Reservation</a></div> 


				  </div>
				</div>
			</div>


            <div class="col-xs-4 ">
				<div class="form-card-wide mdl-card mdl-shadow--2dp">
				  <div class="mdl-card__supporting-text center-this">
					   <i class="fa fa-cogs fa-5x"></i>
                       <br />
                        <div class="main-text-style"><a href="settings.aspx">Settings</a></div> 
				  </div>
				</div>
			</div>
             <div class="col-xs-4 ">
				<div class="form-card-wide mdl-card mdl-shadow--2dp">
				  <div class="mdl-card__supporting-text center-this">
					   <i class="fa fa-cogs fa-5x"></i>
                       <br />
                        <div class="main-text-style"><a href="ViewComplaintsAndComments.aspx">View Comments and Complaints</a></div> 
				  </div>
				</div>
			</div>
            <div class="col-xs-4 ">
				<div class="form-card-wide mdl-card mdl-shadow--2dp">
				  <div class="mdl-card__supporting-text center-this">
					   <i class="fa fa-cogs fa-5x"></i>
                       <br />
                        <div class="main-text-style"><a href="viewreservationhistory.aspx">View Reservation History</a></div> 
				  </div>
				</div>
			</div>
            <div class="col-xs-4 ">


				<div class="form-card-wide mdl-card mdl-shadow--2dp">
				  <div class="mdl-card__supporting-text center-this">

					   <i class="fa fa-car fa-5x"></i>
                       <br />
                      <div class="main-text-style"><a href="cab.aspx">Cab Details</a></div> 


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