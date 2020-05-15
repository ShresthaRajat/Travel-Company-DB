<!DOCTYPE html>
<script runat="server">

    Protected Sub Page_Load(sender As Object, e As EventArgs)

    End Sub
</script>

<html lang="en">
<head>
    <title>Package Details</title>
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
                <a href="#" title="Package Details" class="tip-bottom"><i class="icon-home"></i>Packages</a>
            </div>
        </div>
        <!--End-breadcrumbs-->

        <!--Form-->

        <div class="container">
            <div style="margin:20px">
                </div>
        <form id="form1" runat="server">
            <div>
                <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PACKAGE_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" >
                            <ControlStyle CssClass="btn"></ControlStyle>
                        </asp:CommandField>
                        <asp:BoundField DataField="PACKAGE_ID" HeaderText="PACKAGE_ID" ReadOnly="True" SortExpression="PACKAGE_ID" />
                        <asp:BoundField DataField="PACKAGE_NAME" HeaderText="PACKAGE_NAME" SortExpression="PACKAGE_NAME" />
                        <asp:BoundField DataField="TOTAL_DAYS" HeaderText="TOTAL_DAYS" SortExpression="TOTAL_DAYS" />
                        <asp:BoundField DataField="START_DATE" HeaderText="START_DATE" SortExpression="START_DATE" />
                        <asp:BoundField DataField="END_DATE" HeaderText="END_DATE" SortExpression="END_DATE" />
                        <asp:BoundField DataField="DIFFICULTY" HeaderText="DIFFICULTY" SortExpression="DIFFICULTY" />
                    </Columns>
                </asp:GridView>
            </div>
            <button id="show" class="btn btn-success mt-2 " type="button">Add</button>
                <div id="dform" style="display: none" class="mb-2 mt-3">

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="PACKAGE_ID" DataSourceID="SqlDataSource1" DefaultMode="Insert">
                <EditItemTemplate>
                    PACKAGE_ID:
                <asp:Label ID="PACKAGE_IDLabel1" runat="server" Text='<%# Eval("PACKAGE_ID") %>' />
                    <br />
                    PACKAGE_NAME:
                <asp:TextBox ID="PACKAGE_NAMETextBox" runat="server" Text='<%# Bind("PACKAGE_NAME") %>' />
                    <br />
                    TOTAL_DAYS:
                <asp:TextBox ID="TOTAL_DAYSTextBox" runat="server" Text='<%# Bind("TOTAL_DAYS") %>' />
                    <br />
                    START_DATE:
                <asp:TextBox ID="START_DATETextBox" runat="server" Text='<%# Bind("START_DATE") %>' />
                    <br />
                    END_DATE:
                <asp:TextBox ID="END_DATETextBox" runat="server" Text='<%# Bind("END_DATE") %>' />
                    <br />
                    DIFFICULTY:
                <asp:TextBox ID="DIFFICULTYTextBox" runat="server" Text='<%# Bind("DIFFICULTY") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    <button id="show" class="btn btn-success mt-2 " type="button">Add</button>
                <div id="dform" style="display: none" class="mb-2 mt-3">
                </EditItemTemplate>
                <InsertItemTemplate>
                    PACKAGE_ID:
                <asp:TextBox ID="PACKAGE_IDTextBox" runat="server" Text='<%# Bind("PACKAGE_ID") %>' />
                    <br />
                    PACKAGE_NAME:
                <asp:TextBox ID="PACKAGE_NAMETextBox" runat="server" Text='<%# Bind("PACKAGE_NAME") %>' />
                    <br />
                    TOTAL_DAYS:
                <asp:TextBox ID="TOTAL_DAYSTextBox" runat="server" Text='<%# Bind("TOTAL_DAYS") %>' />
                    <br />
                    START_DATE:
                <asp:TextBox ID="START_DATETextBox" runat="server" Text='<%# Bind("START_DATE") %>' />
                    <br />
                    END_DATE:
                <asp:TextBox ID="END_DATETextBox" runat="server" Text='<%# Bind("END_DATE") %>' />
                    <br />
                    DIFFICULTY:
                <asp:TextBox ID="DIFFICULTYTextBox" runat="server" Text='<%# Bind("DIFFICULTY") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" class="btn btn-success" style="margin-right:70px" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    <button id="hide" class="btn btn-danger" type="button" style="display: none">Cancel</button>
                </InsertItemTemplate>
                <ItemTemplate>
                    PACKAGE_ID:
                <asp:Label ID="PACKAGE_IDLabel" runat="server" Text='<%# Eval("PACKAGE_ID") %>' />
                    <br />
                    PACKAGE_NAME:
                <asp:Label ID="PACKAGE_NAMELabel" runat="server" Text='<%# Bind("PACKAGE_NAME") %>' />
                    <br />
                    TOTAL_DAYS:
                <asp:Label ID="TOTAL_DAYSLabel" runat="server" Text='<%# Bind("TOTAL_DAYS") %>' />
                    <br />
                    START_DATE:
                <asp:Label ID="START_DATELabel" runat="server" Text='<%# Bind("START_DATE") %>' />
                    <br />
                    END_DATE:
                <asp:Label ID="END_DATELabel" runat="server" Text='<%# Bind("END_DATE") %>' />
                    <br />
                    DIFFICULTY:
                <asp:Label ID="DIFFICULTYLabel" runat="server" Text='<%# Bind("DIFFICULTY") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
                </div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" DeleteCommand="DELETE FROM &quot;PACKAGES&quot; WHERE &quot;PACKAGE_ID&quot; = :PACKAGE_ID" InsertCommand="INSERT INTO &quot;PACKAGES&quot; (&quot;PACKAGE_ID&quot;, &quot;PACKAGE_NAME&quot;, &quot;TOTAL_DAYS&quot;, &quot;DIFFICULTY&quot;, &quot;START_DATE&quot;, &quot;END_DATE&quot;, &quot;TOUR_GUIDE&quot;) VALUES (:PACKAGE_ID, :PACKAGE_NAME, :TOTAL_DAYS, :DIFFICULTY, :START_DATE, :END_DATE, :TOUR_GUIDE)" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT * FROM &quot;PACKAGES&quot;" UpdateCommand="UPDATE &quot;PACKAGES&quot; SET &quot;PACKAGE_NAME&quot; = :PACKAGE_NAME, &quot;TOTAL_DAYS&quot; = :TOTAL_DAYS, &quot;DIFFICULTY&quot; = :DIFFICULTY, &quot;START_DATE&quot; = :START_DATE, &quot;END_DATE&quot; = :END_DATE, &quot;TOUR_GUIDE&quot; = :TOUR_GUIDE WHERE &quot;PACKAGE_ID&quot; = :PACKAGE_ID">
                <DeleteParameters>
                    <asp:Parameter Name="PACKAGE_ID" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PACKAGE_ID" Type="String" />
                    <asp:Parameter Name="PACKAGE_NAME" Type="String" />
                    <asp:Parameter Name="TOTAL_DAYS" Type="Decimal" />
                    <asp:Parameter Name="DIFFICULTY" Type="String" />
                    <asp:Parameter Name="START_DATE" Type="DateTime" />
                    <asp:Parameter Name="END_DATE" Type="DateTime" />
                    <asp:Parameter Name="TOUR_GUIDE" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PACKAGE_NAME" Type="String" />
                    <asp:Parameter Name="TOTAL_DAYS" Type="Decimal" />
                    <asp:Parameter Name="DIFFICULTY" Type="String" />
                    <asp:Parameter Name="START_DATE" Type="DateTime" />
                    <asp:Parameter Name="END_DATE" Type="DateTime" />
                    <asp:Parameter Name="TOUR_GUIDE" Type="String" />
                    <asp:Parameter Name="PACKAGE_ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        
        </form>
        </div>
        </div>
    
        <!--End-Form-->

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


