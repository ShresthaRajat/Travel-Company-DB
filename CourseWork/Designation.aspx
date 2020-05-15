<!DOCTYPE html>
<script runat="server">

    Protected Sub Page_Load(sender As Object, e As EventArgs)

    End Sub
</script>

<html lang="en">
<head>
    <title>Designation Details</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="css/fullcalendar.css" />
    <link rel="stylesheet" href="css/matrix-style.css" />
    <link rel="stylesheet" href="css/matrix-media.css" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>
<body>

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
                <a href="#" title="Designation Details" class="tip-bottom"><i class="icon-home"></i>Designation</a>
            </div>
        </div>
        <!--End-breadcrumbs-->

        <!--Form-->
        <div class="container">

            <form id="form1" runat="server">
                <div style="margin: 20px">
                </div>
                <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ROLE_ID" DataSourceID="SqlDataSource1" Width="687px">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True">
                            <ControlStyle CssClass="btn"></ControlStyle>
                        </asp:CommandField>
                        <asp:BoundField DataField="ROLE_ID" HeaderText="ROLE_ID" ReadOnly="True" SortExpression="ROLE_ID" />
                        <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="DESCRIPTION" />
                    </Columns>
                </asp:GridView>
                <button id="show" class="btn btn-success mt-2 " type="button">Add</button>
                <div id="dform" style="display: none" class="mb-2 mt-3">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT * FROM &quot;ROLE&quot;" DeleteCommand="DELETE FROM &quot;ROLE&quot; WHERE &quot;ROLE_ID&quot; = :ROLE_ID" InsertCommand="INSERT INTO &quot;ROLE&quot; (&quot;ROLE_ID&quot;, &quot;DESCRIPTION&quot;) VALUES (:ROLE_ID, :DESCRIPTION)" UpdateCommand="UPDATE &quot;ROLE&quot; SET &quot;DESCRIPTION&quot; = :DESCRIPTION WHERE &quot;ROLE_ID&quot; = :ROLE_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="ROLE_ID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ROLE_ID" Type="String" />
                        <asp:Parameter Name="DESCRIPTION" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DESCRIPTION" Type="String" />
                        <asp:Parameter Name="ROLE_ID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="ROLE_ID" DataSourceID="SqlDataSource1" DefaultMode="Insert" Width="478px">
                    <EditItemTemplate>
                        ROLE_ID:
                <asp:Label ID="ROLE_IDLabel1" runat="server" Text='<%# Eval("ROLE_ID") %>' />
                        <br />
                        DESCRIPTION:
                <asp:TextBox ID="DESCRIPTIONTextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        ROLE_ID:
                <asp:TextBox ID="ROLE_IDTextBox" runat="server" Text='<%# Bind("ROLE_ID") %>' />
                        <br />
                        DESCRIPTION:
                <asp:TextBox ID="DESCRIPTIONTextBox" runat="server" Text='<%# Bind("DESCRIPTION") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" class="btn btn-success" style="margin-right:70px" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        
                        <button id="hide" class="btn btn-danger" type="button" style="display: none">Cancel</button>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        ROLE_ID:
                <asp:Label ID="ROLE_IDLabel" runat="server" Text='<%# Eval("ROLE_ID") %>' />
                        <br />
                        DESCRIPTION:
                <asp:Label ID="DESCRIPTIONLabel" runat="server" Text='<%# Bind("DESCRIPTION") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                    </div>
            </form>
            <!--End-Form-->
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
</body>
</html>


