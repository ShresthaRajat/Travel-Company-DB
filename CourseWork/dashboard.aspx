<!DOCTYPE html>
<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<script runat="server">

    Protected Sub Page_Load(sender As Object, e As EventArgs)

    End Sub
</script>

<html lang="en">
<head>
    <title>Staff Details</title>
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
    <style>
        table {
            FONT-SIZE: 20px;
            border: #fffafa00;
            text-align: center;
            width: 100%;
            background: azure;
        }
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
                <li class="submenu active">
                    <a href="Dashboard.aspx"><i class="icon icon-home"></i><span>Dashboard</span></a>
                </li>

                <li class="submenu">
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
                </div>
            </div>
            <!--End-breadcrumbs-->
            <!--Action boxes-->
            <div class="container-fluid">
                <div class="quick-actions_homepage">
                    <ul class="quick-actions">
                        <li class="bg_lb"><a href="Dashboard.aspx"><i class="icon-dashboard"></i>My Dashboard </a></li>
                        <li class="bg_lr"><a href="Staff.aspx"><i class="icon-info-sign"></i>Staff </a></li>
                        <li class="bg_lo"><a href="Customer.aspx"><i class="icon-info-sign"></i>Customer </a></li>
                        <li class="bg_lb"><a href="Designation.aspx"><i class="icon-info-sign"></i>Designation </a></li>
                        <li class="bg_lg"><a href="Packages.aspx"><i class="icon-info-sign"></i>Packages </a></li>
                        <li class="bg_ly"><a href="Tour Guide.aspx"><i class="icon-info-sign"></i>Guides </a></li>

                        <li class="bg_lg span3"><a href="Package-Activity.aspx"><i class="icon-signal"></i>Package Activity Details</a> </li>
                        <li class="bg_lo span3"><a href="Staff-Role-Mapping.aspx"><i class="icon-th-list"></i>Staff-Role mappings</a> </li>
                        <li class="bg_lg span3"><a href="Customer-Schedule.aspx"><i class="icon-signal"></i>Customer-Schedule Details</a> </li>
                    </ul>
                    <p>
                        &nbsp;
                    </p>
                    <p>
                        <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource5" Width="424px">
                            <Titles>
                                <asp:Title Font="Arial, 12pt, style=Bold" Name="Title1"
                                    Text="Staff Type Count">
                                </asp:Title>
                            </Titles>
                            <Series>
                                <asp:Series Name="Series1" XValueMember="ROLE_ID" YValueMembers="COUNT(STAFF_ID)">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        <asp:Chart ID="Chart2" runat="server" DataSourceID="SqlDataSource6" Width="435px">
                            <Titles>
                                <asp:Title Font="Arial, 12pt, style=Bold" Name="Title2"
                                    Text="Customer Booking Count by package">
                                </asp:Title>
                            </Titles>
                            <Series>
                                <asp:Series ChartType="Pie" Legend="Legend1" Name="Series1" XValueMember="PACKAGE_ID" YValueMembers="COUNT(CUSTOMER_ID)">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                            <Legends>
                                <asp:Legend Name="Legend1">
                                </asp:Legend>
                            </Legends>
                        </asp:Chart>
                    </p>
                </div>
                <!--End-Action boxes-->
                <!--Form-->
                <!--End-Form-->
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="COUNT(ACTIVITY_ID)" HeaderText="Activities" SortExpression="COUNT(ACTIVITY_ID)" />
                    </Columns>
                </asp:GridView>
                <asp:GridView ID="GridView11" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="Destinations" HeaderText="Destinations" SortExpression="Destinations" />
                    </Columns>
                </asp:GridView>
                <asp:GridView ID="GridView12" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
                    <Columns>
                        <asp:BoundField DataField="Day-Activities" HeaderText="Day-Activities" SortExpression="Day-Activities" />
                    </Columns>
                </asp:GridView>
                <asp:GridView ID="GridView10" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource7">
                    <Columns>
                        <asp:BoundField DataField="itinerary" HeaderText="Itinerary" SortExpression="itinerary" />
                    </Columns>
                </asp:GridView>
                <asp:GridView ID="GridView13" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource8">
                    <Columns>
                        <asp:BoundField DataField="Packages" HeaderText="Packages" SortExpression="Packages" />
                    </Columns>
                </asp:GridView>
                <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource12">
                    <Columns>
                        <asp:BoundField DataField="Customers" HeaderText="Customers" SortExpression="Customers" />
                    </Columns>
                </asp:GridView>
                <asp:GridView ID="GridView17" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource10">
                    <Columns>
                        <asp:BoundField DataField="Staff" HeaderText="Staff" SortExpression="Staff" />
                    </Columns>
                </asp:GridView>
                <asp:GridView ID="GridView18" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource11">
                    <Columns>
                        <asp:BoundField DataField="Tour-Guide" HeaderText="Tour-Guide" SortExpression="Tour-Guide" />
                    </Columns>
                </asp:GridView>
                <asp:GridView ID="GridView14" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource9">
                    <Columns>
                        <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role" />
                    </Columns>
                </asp:GridView>
                &nbsp;<br />

                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT COUNT(package_id) as &quot;Itinerary&quot; FROM itinerary"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT COUNT(package_id) as &quot;Packages&quot; FROM packages"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT COUNT(role_id) as &quot;Role&quot; FROM role"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT COUNT(staff_id) as &quot;Staff&quot;  FROM staff"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT COUNT(staff_id) as &quot;Tour-Guide&quot; FROM package_guide"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT COUNT(customer_id) as &quot;Customers&quot; FROM customer"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT COUNT(customer_id) as &quot;Customer-Packages&quot; FROM customer_package"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT COUNT(package_id) as &quot;Day-Activities&quot; FROM day_activities"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT COUNT(destination) as &quot;Destinations&quot; FROM destination"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT COUNT(activity_id) FROM activity"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT role_id, COUNT(staff_ID) FROM staff GROUP BY role_id"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT package_id, COUNT(Customer_ID)
        FROM customer_package JOIN customer USING (customer_id) JOIN packages USING (package_id) GROUP BY package_id
"></asp:SqlDataSource>
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


