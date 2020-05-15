<!DOCTYPE html>
<script runat="server">

    Protected Sub Page_Load(sender As Object, e As EventArgs)

    End Sub
</script>

<html lang="en">
<head>
    <title> Staff Details</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="css/fullcalendar.css" />
    <link rel="stylesheet" href="css/matrix-style.css" />
    <link rel="stylesheet" href="css/matrix-media.css" />
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/jquery.gritter.css" />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>
<body>
    <div id="header">
        <h1><a href="Dashboard.html">Tours & Travel</a></h1>
    </div>
    <div id="sidebar">
        <a href="Dashboard.html" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
        <ul>
            <li class="submenu"><a href="Dashboard.html"><i class="icon icon-home"></i> <span>Dashboard</span></a> </li>
            <li class="submenu">
                <a href="#"><i class="icon icon-th-list"></i> <span>Simple Forms</span> <span class="label label-important">5</span></a>
                <ul>
                    <li><a href="Staff.aspx">Staff Details</a></li>
                    <li><a href="Designation.aspx">Designation Details</a></li>
                    <li><a href="Customer.aspx">Customer Details</a></li>
                    <li><a href="Packages.aspx">Package Details</a></li>
                    <li><a href="Tour Guide.aspx">Tour Guide Details</a></li>
                </ul>
            </li>
            <li class="submenu active">
                <a href="#"><i class="icon icon-info-sign"></i> <span>Complex Forms</span> <span class="label label-important">3</span></a>
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
                <a href="Dashboard.html" title="Go to Dashboard" class="tip-bottom"><i class="icon-home"></i>Dashboard</a>
                <a href="#" title="Go to Complex Forms" class="tip-bottom"><i class="icon-home"></i>Complex Forms</a>
                <a href="#" title="Package-Activity Schedule" class="tip-bottom"><i class="icon-home"></i>Package-Activity Schedule</a>
            </div>
        </div>
        <!--End-breadcrumbs-->
       
            <!--Form-->
    <form id="form1" runat="server">
        <div>
            <div class="container">
            <div style="margin:20px">
                </div>
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1" DataTextField="PACKAGE_ID" DataValueField="PACKAGE_ID" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT DISTINCT &quot;PACKAGE_ID&quot; FROM &quot;DAY_ACTIVITIES&quot;"></asp:SqlDataSource>
            <div style="margin:20px">
            </div>
            <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="DAY" HeaderText="DAY" SortExpression="DAY" />
                    <asp:BoundField DataField="PACKAGE_ID" HeaderText="PACKAGE_ID" SortExpression="PACKAGE_ID" />
                    <asp:BoundField DataField="TRAVEL_DETAILS" HeaderText="TRAVEL_DETAILS" SortExpression="TRAVEL_DETAILS" />
                    <asp:BoundField DataField="TRAVEL_MODE" HeaderText="TRAVEL_MODE" SortExpression="TRAVEL_MODE" />
                    <asp:BoundField DataField="ACTIVITY_ID" HeaderText="ACTIVITY_ID" SortExpression="ACTIVITY_ID" />
                    <asp:BoundField DataField="ACTIVITY_NAME" HeaderText="ACTIVITY_NAME" SortExpression="ACTIVITY_NAME" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" FilterExpression="PACKAGE_ID= '{0}'" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT d.day,i.package_id, i.travel_details, a.travel_mode, d.activity_id, a.activity_name 
        FROM day_activities d JOIN itinerary i 
        ON d.package_id = i.package_id and d.day = i.day 
        JOIN activity a 
        ON d.activity_id = a.activity_id">
                <FilterParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="newparameter" PropertyName="SelectedValue" DefaultValue="GAND8" />
                </FilterParameters>
            </asp:SqlDataSource>
        </div>
            </div>
    </form>
            <!--End-Form-->
        </div>
    </div>

    <!--end-main-container-part-->
    <!--Footer-part-->

    <div class="row-fluid">
        <div id="footer" class="span12"> 2020 &copy; Rajat Shrestha. Brought to you by <a href="https://shrestharajat.github.io/">shrestharajat.github.io</a> </div>
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

    