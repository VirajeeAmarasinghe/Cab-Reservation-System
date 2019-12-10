<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="partner.aspx.cs" Inherits="HeadQuarters.UI.Web.partner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Partner</title>
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
							    <label for="input1" class="col-sm-2 control-label">Partner ID</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ReadOnly="True" ID="txtID" runat="server"></asp:TextBox>
							    </div>
							  </div>
                            <div class="form-group">
							    <label for="input1" class="col-sm-2 control-label">About</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ID="txtAbout" runat="server"></asp:TextBox>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="input2" class="col-sm-2 control-label">Phone No.</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ID="txtPhone" runat="server" ></asp:TextBox>
							    </div>
							  </div>		
							  <div class="form-group">
							    <label for="input4" class="col-sm-2 control-label">Address</label>
							    <div class="col-sm-10">
							      <asp:TextBox TextMode="MultiLine" CssClass="form-control" ID="txtAddress" runat="server"></asp:TextBox>
							    </div>
							  </div>
							  <div class="form-group">
							    <div class="col-sm-offset-2 col-sm-10">
                                     <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
							         <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click1" />
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
						
				    <asp:GridView Cssclass="table table-bordered table-hover"  ID="dgvPartner" runat="server" AutoGenerateColumns="False" DataKeyNames="partner_id" EmptyDataText="There are no data records to display." OnRowCommand="dgvPartner_RowCommand" OnRowCreated="dgvPartner_RowCreated">
                        <Columns>
                            <asp:TemplateField HeaderText="Partner ID" SortExpression="partner_id">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("partner_id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("partner_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="About" SortExpression="about">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("about") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("about") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Phone Number" SortExpression="contact_number">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("contact_number") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("contact_number") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Address" SortExpression="address">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnEdit" runat="server" CommandName="cmdEdit" ImageUrl="~/images/tool.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnDelete" runat="server" CommandName="cmdDelete" ImageUrl="~/images/cross.png" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Partner] WHERE [partner_id] = @partner_id" InsertCommand="INSERT INTO [Partner] ([about], [contact_number], [address]) VALUES (@about, @contact_number, @address)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [partner_id], [about], [contact_number], [address] FROM [Partner]" UpdateCommand="UPDATE [Partner] SET [about] = @about, [contact_number] = @contact_number, [address] = @address WHERE [partner_id] = @partner_id">
                        <DeleteParameters>
                            <asp:Parameter Name="partner_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="about" Type="String" />
                            <asp:Parameter Name="contact_number" Type="String" />
                            <asp:Parameter Name="address" Type="String" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="about" Type="String" />
                            <asp:Parameter Name="contact_number" Type="String" />
                            <asp:Parameter Name="address" Type="String" />
                            <asp:Parameter Name="partner_id" Type="Int32" />
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
        document.getElementById("main-title").innerHTML = "Partner";
    </script>



</body>
</html>
