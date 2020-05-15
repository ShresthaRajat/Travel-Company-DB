<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Role.aspx.vb" Inherits="CourseWork.Role" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ROLE_ID" DataSourceID="SqlDataSource1" DefaultMode="Insert" Width="295px">
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
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM &quot;ROLE&quot; WHERE &quot;ROLE&quot; = :ROLE" InsertCommand="INSERT INTO &quot;ROLE&quot; (&quot;ROLE&quot;, &quot;DESCRIPTION&quot;) VALUES (:ROLE, :DESCRIPTION)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM &quot;ROLE&quot;" UpdateCommand="UPDATE &quot;ROLE&quot; SET &quot;DESCRIPTION&quot; = :DESCRIPTION WHERE &quot;ROLE&quot; = :ROLE">
            <DeleteParameters>
                <asp:Parameter Name="ROLE" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ROLE" Type="String" />
                <asp:Parameter Name="DESCRIPTION" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="DESCRIPTION" Type="String" />
                <asp:Parameter Name="ROLE" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ROLE_ID" DataSourceID="SqlDataSource1" Width="913px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="ROLE_ID" HeaderText="ROLE_ID" ReadOnly="True" SortExpression="ROLE_ID" />
                <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" SortExpression="DESCRIPTION" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
