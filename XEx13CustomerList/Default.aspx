<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="XEx13CustomerList.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Ch13: Customer List</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header class="jumbotron"><%-- image set in site.css --%></header>
    <main>
        <form id="form1" runat="server" class="form-horizontal">
            <div class="form-group">
                <label id="lblState" for="ddlState" 
                    class="col-xs-4 col-sm-offset-1 col-sm-3 control-label">
                    Choose a state:</label>
                <div class="col-xs-8 col-sm-5">
                    <%-- state drop-down goes here --%>
                    <asp:DropDownList ID="ddlstates" runat="server" CssClass="form-control"
                        DataSourceID="sds_states" 
                        DataTextField="StateName" 
                        DataValueField="StateCode"
                        AutoPostBack="true">
                        </asp:DropDownList>

                    <asp:SqlDataSource ID="sds_states" runat="server" 
                        ConnectionString='<%$ ConnectionStrings:cs_halloween %>' 
                        SelectCommand="SELECT [StateCode], [StateName] FROM [States]">

                    </asp:SqlDataSource>
                </div>
            </div>

            <div class="form-group">
                <div class="col-xs-12 col-sm-offset-1 col-sm-10">
                    <asp:DataList ID="DataList2" runat="server"></asp:DataList>
                    <%-- customer data list goes here --%> 
                    <asp:DataList ID="dl_customers" runat="server" DataKeyField="Email" DataSourceID="sds_customers" CssClass="table table-condensed table-bordered table-striped">
                        <HeaderTemplate>
                          <span class="col-sm-3"> LastName: </span>
                          <span class="col-sm-3"> FirstName:</span>
                          <span class="col-sm-3"> State:    </span>
                          <span class="col-sm-3"> Email:    </span>

                        </HeaderTemplate>
                        <HeaderStyle CssClass="bg-halloween" />
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("LastName") %>' runat="server" ID="LastNameLabel"   CssClass="col-sm-3"/>
                            <asp:Label Text='<%# Eval("FirstName") %>' runat="server" ID="FirstNameLabel" CssClass="col-sm-3" />
                            <asp:Label Text='<%# Eval("State") %>' runat="server" ID="StateLabel"         CssClass="col-sm-3" />
                            <asp:Label Text='<%# Eval("Email") %>' runat="server" ID="EmailLabel"         CssClass="col-sm-3" />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource runat="server" ID="sds_customers" 
                        ConnectionString='<%$ ConnectionStrings:cs_halloween %>' 
                        SelectCommand="SELECT [LastName], [FirstName], [State], [Email] 
                        FROM [Customers] WHERE ([State] = @State)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlstates" PropertyName="SelectedValue" Name="State" Type="String"></asp:ControlParameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>  
            </div>

        </form>
    </main>
</div>
</body>
</html>