<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="settings.aspx.cs" Inherits="HeadQuarters.UI.Web.type" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Settings</title>
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
        <!--#include file="layout/nav.html"-->

	<div class="container">
	  <div class="row">
		  	<div class="col-xs-12 ">


				<div class="form-card-wide mdl-card mdl-shadow--2dp">
				  <div class="mdl-card__supporting-text">


					    <form id="form1" runat="server" class="form-horizontal">
						  	 <div class="form-group">
							    <label for="input1" class="col-sm-2 control-label">Type ID</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ID="txtID" runat="server" ReadOnly="true"></asp:TextBox>
							    </div>
							  </div>
                             <div class="form-group">
							    <label for="input1" class="col-sm-2 control-label">Type</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ID="txtType" runat="server"></asp:TextBox>
							    </div>
							  </div>
                            <div class="form-group">
							    <label for="input1" class="col-sm-2 control-label">KM Rate</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ID="txtKm" runat="server"></asp:TextBox>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="input2" class="col-sm-2 control-label">Hourly Rate</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ID="txtHours" runat="server"></asp:TextBox>
							    </div>
							  </div>
                              <div class="form-group" id="label_error_message">
                                  <asp:Label ID="lbl_error_message" runat="server" Text=""></asp:Label>
                              </div>		
							  <div class="form-group">
							    <div class="col-sm-offset-2 col-sm-10">
                                     <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
							         <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" />
                                     <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" ID="btnRefresh" runat="server" Text="Refresh" CausesValidation="False" OnClick="btnRefresh_Click"/>
							    </div>
							  </div>
           				  </div>
				     </div>
			    </div>
		</div>
	
    <div class="row">
    <div class="col-xs-12 ">
	<div class="form-card-wide margin-overwrite mdl-card mdl-shadow--2dp">
    <asp:GridView ID="dgv_type" Cssclass="table table-bordered table-hover" runat="server" AutoGenerateColumns="False" EmptyDataText="There are no data records to display." OnRowCommand="dgv_type_RowCommand" OnRowCreated="dgv_type_RowCreated">
        <Columns>
            <asp:TemplateField HeaderText="Type ID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("type_id") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("type_id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Type">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("type") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="km Rate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("km_rate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("km_rate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Hourly Rate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("hourly_rate") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("hourly_rate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="btn_edit" runat="server" CausesValidation="false" CommandName="btn_edit" ImageUrl="~/images/tool.png" Text="Edit" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:ImageButton ID="btn_delete" runat="server" CausesValidation="false" CommandName="btn_delete" ImageUrl="~/images/cross.png" Text="" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Type] WHERE [type_id] = @type_id" InsertCommand="INSERT INTO [Type] ([type], [km_rate], [hourly_rate]) VALUES (@type, @km_rate, @hourly_rate)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [type_id], [type], [km_rate], [hourly_rate] FROM [Type]" UpdateCommand="UPDATE [Type] SET [type] = @type, [km_rate] = @km_rate, [hourly_rate] = @hourly_rate WHERE [type_id] = @type_id">
        <DeleteParameters>
            <asp:Parameter Name="type_id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="type" Type="String" />
            <asp:Parameter Name="km_rate" Type="Decimal" />
            <asp:Parameter Name="hourly_rate" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="type" Type="String" />
            <asp:Parameter Name="km_rate" Type="Decimal" />
            <asp:Parameter Name="hourly_rate" Type="Decimal" />
            <asp:Parameter Name="type_id" Type="Int32" />
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




</body>
</html>