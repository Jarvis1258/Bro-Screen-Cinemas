<%@ Page Language="C#" MasterPageFile="~/Admin/Staff.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Bro_Screen_Cinemas.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>User Management</title>
    <style>
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .table th,
        .table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .table th {
            background-color: #f8f9fa;
            color: #333;
        }

        .table tr:hover {
            background-color: #f1f1f1;
        }

        section {
            margin-bottom: 40px;
        }

        section h2 {
            font-size: 20px;
            color: #333;
            margin-bottom: 10px;
        }

        .view-details-btn, .edit-btn, .delete-btn, .promote-btn {
            padding: 8px 12px;
            margin-right: 5px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: #fff;
        }

        .view-details-btn {
            background-color: #17a2b8;
        }

        .view-details-btn:hover {
            background-color: #138496;
        }

        .edit-btn {
            background-color: #007bff;
        }

        .edit-btn:hover {
            background-color: #0056b3;
        }

        .delete-btn {
            background-color: #dc3545;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }

        .promote-btn {
            background-color: #28a745;
        }

        .promote-btn:hover {
            background-color: #218838;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content">
        <header>
            <h1>User Management</h1>
        </header>
        <main>
            <!-- Admin Users Table -->
            <section>
                <h2>Admins</h2>
                <asp:GridView ID="gvAdmins" runat="server" AutoGenerateColumns="False" CssClass="table" GridLines="None" OnRowCommand="gvAdmins_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="AdminID" HeaderText="Admin ID" />
                        <asp:BoundField DataField="UserName" HeaderText="Username" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                        <asp:BoundField DataField="Role" HeaderText="Role" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <button type="button" class="edit-btn" onclick="location.href='EditAdmin.aspx?AdminID=<%# Eval("AdminID") %>'">Edit</button>
                                <asp:Button ID="btnDeleteAdmin" runat="server" Text="Delete" CssClass="delete-btn"
                                    CommandName="DeleteAdmin" CommandArgument='<%# Eval("AdminID") %>' OnClientClick="return confirm('Are you sure you want to delete this admin?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </section>

            <!-- Customer Users Table -->
            <section>
                <h2>Customers</h2>
                <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" CssClass="table" GridLines="None" OnRowCommand="gvCustomers_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="FormattedCustomerID" HeaderText="Customer ID" />
                        <asp:BoundField DataField="UserName" HeaderText="Username" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="FullName" HeaderText="Full Name" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <button type="button" class="view-details-btn" onclick="location.href='ViewCustomerDetails.aspx?CustomerID=<%# Eval("FormattedCustomerID") %>'">View Details</button>
                                <button type="button" class="edit-btn" onclick="location.href='EditCustomer.aspx?CustomerID=<%# Eval("FormattedCustomerID") %>'">Edit</button>
                                 <asp:Button ID="btnPromoteCustomer" runat="server" Text="Promote to Admin" CssClass="promote-btn"
                                    CommandName="PromoteCustomer" CommandArgument='<%# Eval("FormattedCustomerID") %>' />
                                <asp:Button ID="btnDeleteCustomer" runat="server" Text="Delete" CssClass="delete-btn"
                                    CommandName="DeleteCustomer" CommandArgument='<%# Eval("FormattedCustomerID") %>' OnClientClick="return confirm('Are you sure you want to delete this customer?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </section>
        </main>
    </div>
</asp:Content>
