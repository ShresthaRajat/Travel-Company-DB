<!DOCTYPE html>
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
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>
<body>
    <div id="header">
        <h1><a href="Dashboard.aspx">Tours & Travel</a></h1>
    </div>
    <div id="sidebar">
        <a href="Dashboard.aspx" class="visible-phone"><i class="icon icon-home"></i>Dashboard</a>
        <ul>
            <li class="submenu">
                <a href="Dashboard.aspx"><i class="icon icon-home"></i><span>Dashboard</span></a>
            </li>
            <li class="submenu active"><a href="#"><i class="icon icon-th-list"></i><span>Simple Forms</span> <span class="label label-important">5</span></a>
                <ul>
                    <li><a href="Staff.aspx">Staff Details</a></li>
                    <li><a href="Designation.aspx">Designation Details</a></li>
                    <li><a href="Customer.aspx">Customer Details</a></li>
                    <li><a href="Packages.aspx">Package Details</a></li>
                    <li><a href="Tour Guide.aspx">Tour Guide Details</a></li>
                </ul>
            </li>
            <li class="submenu"><a href="#"><i class="icon icon-info-sign"></i><span>Complex Forms</span> <span class="label label-important">3</span></a>
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
                <a href="#" title="Staff Details" class="tip-bottom"><i class="icon-home"></i>Staff</a>
            </div>
        </div>
        <!--End-breadcrumbs-->

        <!--Form-->
        <div class="container">
            <form id="form1" runat="server">
                <div>
                </div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" DeleteCommand="DELETE FROM &quot;STAFF&quot; WHERE &quot;STAFF_ID&quot; = :STAFF_ID" InsertCommand="INSERT INTO &quot;STAFF&quot; (&quot;STAFF_ID&quot;, &quot;FIRST_NAME&quot;, &quot;LAST_NAME&quot;, &quot;ADDRESS&quot;, &quot;PHONE_NO&quot;, &quot;ROLE_ID&quot;) VALUES (:STAFF_ID, :FIRST_NAME, :LAST_NAME, :ADDRESS, :PHONE_NO, :ROLE_ID)" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT * FROM &quot;STAFF&quot;" UpdateCommand="UPDATE &quot;STAFF&quot; SET &quot;FIRST_NAME&quot; = :FIRST_NAME, &quot;LAST_NAME&quot; = :LAST_NAME, &quot;ADDRESS&quot; = :ADDRESS, &quot;PHONE_NO&quot; = :PHONE_NO, &quot;ROLE_ID&quot; = :ROLE_ID WHERE &quot;STAFF_ID&quot; = :STAFF_ID">
                    <DeleteParameters>
                        <asp:Parameter Name="STAFF_ID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="STAFF_ID" Type="String" />
                        <asp:Parameter Name="FIRST_NAME" Type="String" />
                        <asp:Parameter Name="LAST_NAME" Type="String" />
                        <asp:Parameter Name="ADDRESS" Type="String" />
                        <asp:Parameter Name="PHONE_NO" Type="String" />
                        <asp:Parameter Name="ROLE_ID" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="FIRST_NAME" Type="String" />
                        <asp:Parameter Name="LAST_NAME" Type="String" />
                        <asp:Parameter Name="ADDRESS" Type="String" />
                        <asp:Parameter Name="PHONE_NO" Type="String" />
                        <asp:Parameter Name="ROLE_ID" Type="String" />
                        <asp:Parameter Name="STAFF_ID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ShresthaRajatConnection %>" ProviderName="<%$ ConnectionStrings:ShresthaRajatConnection.ProviderName %>" SelectCommand="SELECT &quot;ROLE_ID&quot;, &quot;DESCRIPTION&quot; FROM &quot;ROLE&quot;"></asp:SqlDataSource>
                <div style="margin:20px">
                </div>
                <asp:GridView ID="GridView1" CssClass="table table-bordered table-striped" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="STAFF_ID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" >
                            <ControlStyle CssClass="btn"></ControlStyle>
                        </asp:CommandField>
                        <asp:BoundField DataField="STAFF_ID" HeaderText="STAFF_ID" ReadOnly="True" SortExpression="STAFF_ID" />
                        <asp:BoundField DataField="FIRST_NAME" HeaderText="FIRST_NAME" SortExpression="FIRST_NAME" />
                        <asp:BoundField DataField="LAST_NAME" HeaderText="LAST_NAME" SortExpression="LAST_NAME" />
                        <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
                        <asp:BoundField DataField="PHONE_NO" HeaderText="PHONE_NO" SortExpression="PHONE_NO" />
                        <asp:TemplateField HeaderText="ROLE_ID" SortExpression="ROLE_ID">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ROLE_ID") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="DESCRIPTION" Enabled="false" DataValueField="ROLE_ID" SelectedValue='<%# Bind("ROLE_ID") %>'>
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                
                <button id="show" class="btn btn-success mt-2 " type="button">Add</button>
                <div id="dform" style="display: none" class="mb-2 mt-3">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="STAFF_ID" DataSourceID="SqlDataSource1" DefaultMode="Insert">
        <EditItemTemplate>
            STAFF_ID:
            <asp:Label ID="STAFF_IDLabel1" runat="server" Text='<%# Eval("STAFF_ID") %>' />
            <br />
            FIRST_NAME:
            <asp:TextBox ID="FIRST_NAMETextBox" runat="server" Text='<%# Bind("FIRST_NAME") %>' />
            <br />
            LAST_NAME:
            <asp:TextBox ID="LAST_NAMETextBox" runat="server" Text='<%# Bind("LAST_NAME") %>' />
            <br />
            ADDRESS:
            <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
            <br />
            PHONE_NO:
            <asp:TextBox ID="PHONE_NOTextBox" runat="server" Text='<%# Bind("PHONE_NO") %>' />
            <br />
            ROLE_ID:
            <asp:TextBox ID="ROLE_IDTextBox" runat="server" Text='<%# Bind("ROLE_ID") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            STAFF_ID:

            <asp:TextBox ID="STAFF_IDTextBox" class="form-control mt-2" runat="server" Text='<%# Bind("STAFF_ID") %>' />
            <br />
            FIRST_NAME:
            <asp:TextBox ID="FIRST_NAMETextBox" class="form-control mt-2"  runat="server" Text='<%# Bind("FIRST_NAME") %>' />
            <br />
            LAST_NAME:
            <asp:TextBox ID="LAST_NAMETextBox" class="form-control mt-2" runat="server" Text='<%# Bind("LAST_NAME") %>' />
            <br />
            ADDRESS:
            <asp:TextBox ID="ADDRESSTextBox" class="form-control mt-2" runat="server" Text='<%# Bind("ADDRESS") %>' />
            <br />
            PHONE_NO:
            <asp:TextBox ID="PHONE_NOTextBox" class="form-control mt-2" runat="server" Text='<%# Bind("PHONE_NO") %>' />
            <br />
            ROLE_ID:
            <asp:TextBox ID="ROLE_IDTextBox" class="form-control mt-2" runat="server" Text='<%# Bind("ROLE_ID") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" class="btn btn-success" style="margin-right:70px" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        
                        <button id="hide" class="btn btn-danger" type="button" style="display: none">Cancel</button>
        </InsertItemTemplate>
        <ItemTemplate>
            STAFF_ID:
            <asp:Label ID="STAFF_IDLabel" runat="server" Text='<%# Eval("STAFF_ID") %>' />
            <br />
            FIRST_NAME:
            <asp:Label ID="FIRST_NAMELabel" runat="server" Text='<%# Bind("FIRST_NAME") %>' />
            <br />
            LAST_NAME:
            <asp:Label ID="LAST_NAMELabel" runat="server" Text='<%# Bind("LAST_NAME") %>' />
            <br />
            ADDRESS:
            <asp:Label ID="ADDRESSLabel" runat="server" Text='<%# Bind("ADDRESS") %>' />
            <br />
            PHONE_NO:
            <asp:Label ID="PHONE_NOLabel" runat="server" Text='<%# Bind("PHONE_NO") %>' />
            <br />
            ROLE_ID:
            <asp:Label ID="ROLE_IDLabel" runat="server" Text='<%# Bind("ROLE_ID") %>' />
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
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
            });
        });

        

    </script>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    
</body>
</html>


