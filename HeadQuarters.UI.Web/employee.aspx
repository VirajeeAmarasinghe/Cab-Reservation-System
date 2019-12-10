<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="employee.aspx.cs" Inherits="HeadQuarters.UI.Web.employee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee</title>
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
    <link rel="stylesheet" href="css/customformat.css" />
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
						  	 <div class="form-group">
							    <label for="input1" class="col-sm-2 control-label">Employee ID</label>
							    <div class="col-sm-10">
                                   <asp:TextBox ReadOnly="True" CssClass="form-control" ID="txtID" runat="server"></asp:TextBox>
							    </div>
							  </div>

                            <div class="form-group">
							    <label for="input2" class="col-sm-2 control-label">First Name</label>
							    <div class="col-sm-10">
							      <asp:TextBox CssClass="form-control" ID="txtFirstName" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator runat="server" id="reqFirstName" controltovalidate="txtFirstName" errormessage="Please enter First Name!"/>
							    </div>
							  </div>

                            <div class="form-group">
							    <label for="input3" class="col-sm-2 control-label">Last Name</label>
							    <div class="col-sm-10">
							      <asp:TextBox CssClass="form-control" ID="txtLastName" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator runat="server" id="reqLastName" controltovalidate="txtLastName" errormessage="Please enter Last Name!"/>
							    </div>
							  </div>
                             <div class="form-group">
							    <label for="input5" class="col-sm-2 control-label">NIC No</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ID="txtNIC" runat="server"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" id="reqNIC" controltovalidate="txtNIC" errormessage="Please enter NIC No!"/>                                   
							    </div>
							  </div>

                            <div class="form-group">
							    <label for="input5" class="col-sm-2 control-label">Date Of Birth</label>
							    <div class="col-sm-10">
							      <asp:TextBox CssClass="form-control" ID="txtDateOfBirth" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator runat="server" id="reqDOB" controltovalidate="txtDateOfBirth" errormessage="Please enter Date of Birth!"/>                                  
							    </div>
							  </div>

                            <div class="form-group">
							    <label for="input6" class="col-sm-2 control-label">Phone No.</label>
							    <div class="col-sm-10">
							      <asp:TextBox CssClass="form-control" ID="txtPhone" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator runat="server" id="reqPhone" controltovalidate="txtPhone" errormessage="Please enter valid phone no!"/>
                                  <asp:RegularExpressionValidator runat="server" id="regPhone" controltovalidate="txtPhone" 
       validationexpression="^[0-9]{2}-[0-9]{6}$" errormessage="Please enter valid phone no!"/>
							    </div>
							  </div>

                            <div class="form-group">
							    <label for="input7" class="col-sm-2 control-label">Username</label>
							    <div class="col-sm-10">
							      <asp:TextBox CssClass="form-control" ReadOnly="True" ID="txtUsername" runat="server"></asp:TextBox>
							    </div>
							  </div>


                            <div class="form-group">
							    <label for="input8" class="col-sm-2 control-label">Password</label>
							    <div class="col-sm-10">
							      <asp:TextBox TextMode="Password" CssClass="form-control" ID="txtPassword" runat="server" ReadOnly="true"></asp:TextBox>
							    </div>
							  </div>

                            <div class="form-group">
							    <label for="input9" class="col-sm-2 control-label">Job Title</label>
							    <div class="col-sm-10">
							      <asp:DropDownList ID="drop_down_list_job" runat="server" CssClass="form-control">            
    </asp:DropDownList>
							    </div>

                            <div class="form-group">
							    <label for="drop_down_list_branch" class="col-sm-2 control-label" id="lb_branch">Branch</label>
							    <div class="col-sm-10">
                                   <asp:DropDownList ID="drop_down_list_branch" runat="server" CssClass="form-control">              
    </asp:DropDownList>
							    </div>
							  </div> 
                                
                                <div class="form-group" id="label_error_message">
                                  <asp:Label ID="lbl_error_message" runat="server" Text=""></asp:Label>
                                </div>              

                            	                
							  <div class="form-group">
							    <div class="col-sm-offset-2 col-sm-10">
                                     <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
							         <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                                     <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" CausesValidation="False"/>
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
				    <asp:GridView  Cssclass="table table-bordered table-hover table-ex" ID="dgvEmployee" GridLines="None" runat="server" AutoGenerateColumns="False" DataKeyNames="employee_id" EmptyDataText="There are no data records to display." OnRowCommand="dgvEmployee_RowCommand" OnRowCreated="dgvEmployee_RowCreated">
                        <Columns>
                            <asp:TemplateField HeaderText="Employee ID" SortExpression="employee_id">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("employee_id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("employee_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField  HeaderText="First Name"  SortExpression="first_name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("first_name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("first_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Name" SortExpression="last_name">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("last_name") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("last_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="NIC" SortExpression="nic">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("nic") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("nic") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date Of Birth" SortExpression="date_of_birth">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("date_of_birth","{0:d}") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("date_of_birth", "{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Phone Number" SortExpression="contact_number" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("contact_number") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("contact_number") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Username" SortExpression="username" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("username") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("username") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Password" SortExpression="password" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Position" SortExpression="job_id" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("job_id") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("job_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Branch" SortExpression="branch_id" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("branch_id") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("branch_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnEdit" runat="server" CommandName="cmdEdit" ImageUrl="~/images/tool.png" CausesValidation="False"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnDelete" runat="server" CommandName="cmdDelete" ImageUrl="~/images/cross.png" CausesValidation="False"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField Visible="False">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnView" runat="server" CommandName="cmdView" ImageUrl="~/images/eye.png" CausesValidation="False"/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
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
        document.getElementById("main-title").innerHTML = "Employee";
    </script>

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.datetimepicker.full.min.js"></script>

    <script>
        jQuery('#txtDateOfBirth').datetimepicker({
        timepicker: false,
        format: 'Y/m/d'
        });

        $("#txtDateOfBirth").keypress(function (event) { event.preventDefault(); });
   </script>

</body>
</html>

