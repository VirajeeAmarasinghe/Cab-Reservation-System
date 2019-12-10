<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="branch.aspx.cs" Inherits="HeadQuarters.UI.Web.branch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Branch</title>
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
							    <label for="input1" class="col-sm-2 control-label">Branch ID</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ReadOnly="True" ID="txtID" runat="server"></asp:TextBox>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="input2" class="col-sm-2 control-label">Address</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" id="reqAddress" controltovalidate="txtAddress" errormessage="Please enter Address!" CssClass="error_message"/>
							    </div>
							  </div>
							   <div class="form-group">
							    <label for="input3" class="col-sm-2 control-label">City</label>
							    <div class="col-sm-10">
							      <asp:TextBox CssClass="form-control" ID="txtCity" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator runat="server" id="reqCity" controltovalidate="txtCity" errormessage="Please enter City!" CssClass="error_message"/>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="input4" class="col-sm-2 control-label">Phone No.</label>
							    <div class="col-sm-10">
							      <asp:TextBox CssClass="form-control" ID="txtPhone" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator runat="server" id="reqPhone" controltovalidate="txtPhone" errormessage="Please enter Phone No!" CssClass="error_message"/>
                                  <asp:RegularExpressionValidator runat="server" id="rexNumber" controltovalidate="txtPhone" 
       validationexpression="^[0-9]{2}-[0-9]{6}$" errormessage="Please enter valid phone number!" CssClass="error_message"/>
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
				      <asp:GridView ID="dgvBranch" GridLines="None" Cssclass="table table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="branch_id"  EmptyDataText="There are no data records to display." OnRowCommand="dgvBranch_RowCommand" OnRowCreated="dgvBranch_RowCreated">
                          <Columns>
                              <asp:TemplateField HeaderText="Branch ID" SortExpression="branch_id">
                                  <EditItemTemplate>
                                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("branch_id") %>'></asp:Label>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="labId" runat="server" Text='<%# Bind("branch_id") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Address" SortExpression="branch_address">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("branch_address") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label2" runat="server" Text='<%# Bind("branch_address") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="City" SortExpression="location">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("location") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label3" runat="server" Text='<%# Bind("location") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Phone Number" SortExpression="contact_no">
                                  <EditItemTemplate>
                                      <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("contact_no") %>'></asp:TextBox>
                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label4" runat="server" Text='<%# Bind("contact_no") %>'></asp:Label>
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:TemplateField>
                                  <ItemTemplate>
                                      <asp:ImageButton ImageUrl="images/tool.png" ID="btnEdit" runat="server" CommandName="cmdEdit" CausesValidation="False"/>
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:TemplateField>
                                  <ItemTemplate>
                                      <asp:ImageButton ImageUrl="images/cross.png" ID="btnDelete" runat="server" CommandName="cmdDelete" CausesValidation="False"/>
                                  </ItemTemplate>
                              </asp:TemplateField>
                          </Columns>
                      </asp:GridView>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Branch] WHERE [branch_id] = @branch_id" InsertCommand="INSERT INTO [Branch] ([branch_address], [location], [contact_no]) VALUES (@branch_address, @location, @contact_no)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [branch_id], [branch_address], [location], [contact_no] FROM [Branch]" UpdateCommand="UPDATE [Branch] SET [branch_address] = @branch_address, [location] = @location, [contact_no] = @contact_no WHERE [branch_id] = @branch_id">
                          <DeleteParameters>
                              <asp:Parameter Name="branch_id" Type="Int32" />
                          </DeleteParameters>
                          <InsertParameters>
                              <asp:Parameter Name="branch_address" Type="String" />
                              <asp:Parameter Name="location" Type="String" />
                              <asp:Parameter Name="contact_no" Type="String" />
                          </InsertParameters>
                          <UpdateParameters>
                              <asp:Parameter Name="branch_address" Type="String" />
                              <asp:Parameter Name="location" Type="String" />
                              <asp:Parameter Name="contact_no" Type="String" />
                              <asp:Parameter Name="branch_id" Type="Int32" />
                          </UpdateParameters>
                      </asp:SqlDataSource>


				


				
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
        document.getElementById("main-title").innerHTML = "Branch";
    </script>




        </body>
</html>
