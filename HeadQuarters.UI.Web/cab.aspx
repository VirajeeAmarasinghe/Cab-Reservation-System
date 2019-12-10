<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cab.aspx.cs" Inherits="HeadQuarters.UI.Web.cab" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cab</title>
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
							    <label for="input1" class="col-sm-2 control-label">Cab ID</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ReadOnly="True" ID="txtID" runat="server"></asp:TextBox>
							    </div>
							  </div>
                            <div class="form-group">
							    <label for="input1" class="col-sm-2 control-label">Cab No.</label>
							    <div class="col-sm-10">
                                   <asp:TextBox CssClass="form-control" ID="txtNo" runat="server"></asp:TextBox>
                                   <asp:RequiredFieldValidator runat="server" id="reqCabNo" controltovalidate="txtNo" errormessage="Please enter Cab Registration Number!"/>
                                   <asp:RegularExpressionValidator runat="server" id="rexNumber" controltovalidate="txtNo" 
       validationexpression="^[A-Z]{2,3}-[0-9]{4}$" errormessage="Please enter valid cab number!"/>
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="input2" class="col-sm-2 control-label">Type</label>
							    <div class="col-sm-10">
                                   <asp:DropDownList ID="drop_down_list_type" runat="server" CssClass="form-control">                
    </asp:DropDownList>
							    </div>
							  </div>		
							  <div class="form-group">
							    <label for="input4" class="col-sm-2 control-label">Branch</label>
							    <div class="col-sm-10">
							      <asp:DropDownList ID="drop_down_list_branch" runat="server" CssClass="form-control">                  
    </asp:DropDownList>
							    </div>
                                <div class="form-group" id="label_error_message">
                                  <asp:Label ID="lbl_error_message" runat="server" Text=""></asp:Label>
                                </div>
							  </div>
							  <div class="form-group">
							    <div class="col-sm-offset-2 col-sm-10">
                                     <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
							         <asp:Button CssClass="mdl-button mdl-js-button mdl-button--raised mdl-button--colored mdl-js-ripple-effect" ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click1" />
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
				    <asp:GridView Cssclass="table table-bordered table-hover" ID="dgvCab" runat="server" AutoGenerateColumns="False" DataKeyNames="cab_id"  EmptyDataText="There are no data records to display." OnRowCommand="dgvCab_RowCommand" OnRowCreated="dgvCab_RowCreated">
                        <Columns>
                            <asp:TemplateField HeaderText="Cab ID" SortExpression="cab_id">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("cab_id") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("cab_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type ID" SortExpression="type_id">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("type_id") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("type_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Cab Number" SortExpression="cab_registration_no">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("cab_registration_no") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("cab_registration_no") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Branch" SortExpression="branch_id">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("branch_id") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("branch_id") %>'></asp:Label>
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Cab] WHERE [cab_id] = @cab_id" InsertCommand="INSERT INTO [Cab] ([type_id], [cab_registration_no], [branch_id]) VALUES (@type_id, @cab_registration_no, @branch_id)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [cab_id], [type_id], [cab_registration_no], [branch_id] FROM [Cab]" UpdateCommand="UPDATE [Cab] SET [type_id] = @type_id, [cab_registration_no] = @cab_registration_no, [branch_id] = @branch_id WHERE [cab_id] = @cab_id">
                        <DeleteParameters>
                            <asp:Parameter Name="cab_id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="type_id" Type="Int32" />
                            <asp:Parameter Name="cab_registration_no" Type="String" />
                            <asp:Parameter Name="branch_id" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="type_id" Type="Int32" />
                            <asp:Parameter Name="cab_registration_no" Type="String" />
                            <asp:Parameter Name="branch_id" Type="Int32" />
                            <asp:Parameter Name="cab_id" Type="Int32" />
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
        document.getElementById("main-title").innerHTML = "Cab";
    </script>



</body>
</html>

<script type="text/javascript">
    function checkDelete() {
        if (confirm('Are you sure you want to delete ?')) {
            return true;
        }
        else {
            return false;
        }
    }
</script>
