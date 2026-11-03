<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Staff.Master" AutoEventWireup="true" CodeBehind="Bookings.aspx.cs" Inherits="Bro_Screen_Cinemas.Bookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Bookings Management</title>
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

        .delete-btn {
            padding: 8px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: #dc3545;
            color: #fff;
        }

        .delete-btn:hover {
            background-color: #c82333;
        }

        .add-booking-btn {
            padding: 10px 20px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        .add-booking-btn:hover {
            background-color: #218838;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content">
        <header>
            <h1>Bookings Management</h1>
            <button type="button" class="add-booking-btn" onclick="location.href='AddBooking.aspx'">Add New Booking</button>
        </header>
        <main>
            <section>
                <h2>Bookings</h2>
                <asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="False" CssClass="table" GridLines="None" OnRowCommand="gvBookings_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="BookingID" HeaderText="Booking ID" />
                        <asp:BoundField DataField="Seats" HeaderText="Seats" />
                        <asp:BoundField DataField="Food" HeaderText="Food" />
                        <asp:BoundField DataField="People" HeaderText="People" />
                        <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" DataFormatString="{0:C}" />
                        <asp:BoundField DataField="PaymentMethod" HeaderText="Payment Method" />
                        <asp:BoundField DataField="BookingDate" HeaderText="Booking Date" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="delete-btn"
                                    CommandName="gvBookings_RowDeleting" CommandArgument='<%# Eval("BookingID") %>' OnClientClick="return confirm('Are you sure you want to delete this booking?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </section>
        </main>
    </div>
</asp:Content>
