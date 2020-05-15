<!DOCTYPE html>
<script runat="server">

    Protected Sub Page_Load(sender As Object, e As EventArgs)

    End Sub

    Protected Sub FormView1_PageIndexChanging(sender As Object, e As FormViewPageEventArgs)

    End Sub
</script>

<html lang="en">
<head>
    <title>Tour Guide Details</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="css/fullcalendar.css" />
    <link rel="stylesheet" href="css/matrix-style.css" />
    <link rel="stylesheet" href="css/matrix-media.css" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/jquery.gritter.css" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
    <style type="text/css">
        .table-striped {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="header">
        <h1><a href="Dashboard.aspx">Tours & Travel</a></h1>
    </div>
    <div id="sidebar">
        <a href="Dashboard.aspx" class="visible-phone"><i class="icon icon-home"></i>Dashboard</a>
        <ul>
            <li class="submenu"><a href="Dashboard.aspx"><i class="icon icon-home"></i><span>Dashboard</span></a> </li>
            <li class="submenu active">
                <a href="#"><i class="icon icon-th-list"></i><span>Simple Forms</span> <span class="label label-important">5</span></a>
                <ul>
                    <li><a href="Staff.aspx">Staff Details</a></li>
                    <li><a href="Designation.aspx">Designation Details</a></li>
                    <li><a href="Customer.aspx">Customer Details</a></li>
                    <li><a href="Packages.aspx">Package Details</a></li>
                    <li><a href="Tour Guide.aspx">Tour Guide Details</a></li>
                </ul>
            </li>
            <li class="submenu">
                <a href="#"><i class="icon icon-info-sign"></i><span>Complex Forms</span> <span class="label label-important">3</span></a>
                <ul>
                    <li><a href="Customer-Schedule.aspx">Customer-Package Schedule</a></li>
                    <li><a href="Staff-Role-Mapping.aspx">Staff-Role Mapping Form</a></li>
                    <li><a href="Package-Activity.aspx">Package-Activity Schedule</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div id="content">
        <!--breadcrumbs-->
        <div id="content-header">
            <div id="breadcrumb">
                <a href="Dashboard.aspx" title="Go to Dashboard" class="tip-bottom"><i class="icon-home"></i>Dashboard</a>
                <a href="#" title="Go to Simple Forms" class="tip-bottom"><i class="icon-home"></i>Simple Forms</a>
                <a href="#" title="Tour Guide Details" class="tip-bottom"><i class="icon-home"></i>Tour-Guide</a>
            </div>
        </div>
        <!--End-breadcrumbs-->

        <!--Form-->
        <div class="container">
            <div style="margin:20px">
                </div>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" DeleteCommand="DELETE FROM &quot;PACKAGE_GUIDE&quot; WHERE &quot;PACKAGE_ID&quot; = :PACKAGE_ID AND &quot;STAFF_ID&quot; = :STAFF_ID" InsertCommand="INSERT INTO &quot;PACKAGE_GUIDE&quot; (&quot;PACKAGE_ID&quot;, &quot;STAFF_ID&quot;) VALUES (:PACKAGE_ID, :STAFF_ID)" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT * FROM &quot;PACKAGE_GUIDE&quot;">
                <DeleteParameters>
                    <asp:Parameter Name="PACKAGE_ID" Type="String" />
                    <asp:Parameter Name="STAFF_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PACKAGE_ID" Type="String" />
                    <asp:Parameter Name="STAFF_ID" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="PACKAGE_ID,STAFF_ID" DataSourceID="SqlDataSource1" Width="676px">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" >
                            <ControlStyle CssClass="btn"></ControlStyle>
                        </asp:CommandField>
                    <asp:TemplateField HeaderText="PACKAGE" SortExpression="PACKAGE_ID">
                        <EditItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("PACKAGE_ID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            
                            <asp:DropDownList ID="DropDownList1" runat="server" Enabled="False" DataSourceID="SqlDataSource2" DataTextField="PACKAGE_NAME" DataValueField="PACKAGE_ID" SelectedValue='<%# Bind("PACKAGE_ID") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="STAFF" SortExpression="STAFF">
                        <EditItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("STAFF_ID") %>'></asp:Label>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" Enabled="false" DataSourceID="SqlDataSource3" DataTextField="FIRST_NAME" DataValueField="STAFF_ID">
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <button id="show" class="btn btn-success mt-2 " type="button">Add</button>
                <div id="dform" style="display: none" class="mb-2 mt-3">
            <asp:FormView ID="FormView2" runat="server" DataKeyNames="PACKAGE_ID,STAFF_ID" DataSourceID="SqlDataSource1" DefaultMode="Insert">
                <EditItemTemplate>
                    PACKAGE_ID:
                    <asp:Label ID="PACKAGE_IDLabel1" runat="server" Text='<%# Eval("PACKAGE_ID") %>' />
                    <br />
                    STAFF_ID:
                    <asp:Label ID="STAFF_IDLabel1" runat="server" Text='<%# Eval("STAFF_ID") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    PACKAGE_ID:
                    <asp:TextBox ID="PACKAGE_IDTextBox" runat="server" Text='<%# Bind("PACKAGE_ID") %>' />
                    <br />
                    STAFF_ID:
                    <asp:TextBox ID="STAFF_IDTextBox" runat="server" Text='<%# Bind("STAFF_ID") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" class="btn btn-success" style="margin-right:70px" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                       
                        <button id="hide" class="btn btn-danger" type="button" style="display: none">Cancel</button>
                </InsertItemTemplate>
                <ItemTemplate>
                    PACKAGE_ID:
                    <asp:Label ID="PACKAGE_IDLabel" runat="server" Text='<%# Eval("PACKAGE_ID") %>' />
                    <br />
                    STAFF_ID:
                    <asp:Label ID="STAFF_IDLabel" runat="server" Text='<%# Eval("STAFF_ID") %>' />
                    <br />
                    <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
                    </div>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT DISTINCT &quot;PACKAGE_ID&quot;, &quot;PACKAGE_NAME&quot; FROM &quot;PACKAGES&quot;"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT DISTINCT &quot;STAFF_ID&quot;, &quot;FIRST_NAME&quot; FROM &quot;STAFF&quot;"></asp:SqlDataSource>
            
        </div>
    </div>

    <!--end-main-container-part-->
    <!--Footer-part-->

    <div class="row-fluid">
        <div id="footer" class="span12">2020 &copy; Rajat Shrestha. Brought to you by <a href="https://shrestharajat.github.io/">shrestharajat.github.io</a> </div>
    </div>

    <!--end-Footer-part-->

    <script src="js/excanvas.min.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.ui.custom.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.flot.min.js"></script>
    <script src="js/jquery.flot.resize.min.js"></script>
    <script src="js/jquery.peity.min.js"></script>
    <script src="js/fullcalendar.min.js"></script>
    <script src="js/matrix.js"></script>
    <script src="js/matrix.dashboard.js"></script>
    <script src="js/jquery.gritter.min.js"></script>
    <script src="js/matrix.interface.js"></script>
    <script src="js/matrix.chat.js"></script>
    <script src="js/jquery.validate.js"></script>
    <script src="js/matrix.form_validation.js"></script>
    <script src="js/jquery.wizard.js"></script>
    <script src="js/jquery.uniform.js"></script>
    <script src="js/select2.min.js"></script>
    <script src="js/matrix.popover.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/matrix.tables.js"></script>

    <script type="text/javascript">
        // This function is called from the pop-up menus to transfer to
        // a different page. Ignore if the value returned is a null string:
        function goPage(newURL) {

            // if url is empty, skip the menu dividers and reset the menu selection to default
            if (newURL != "") {

                // if url is "-", it is this page -- reset the menu:
                if (newURL == "-") {
                    resetMenu();
                }
                // else, send page to designated URL
                else {
                    document.location.href = newURL;
                }
            }
        }

        // resets the menu selection upon entry to this page:
        function resetMenu() {
            document.gomenu.selector.selectedIndex = 2;
        }
    </script>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    </form>
</body>
</html>


