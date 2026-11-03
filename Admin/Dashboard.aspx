<%@ Page Language="C#" MasterPageFile="~/Admin/Staff.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Bro_Screen_Cinemas.Dashboard" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .cards {
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
        }

        .card {
            background-color: #ecf0f1;
            padding: 20px;
            width: 23%;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .dashboard-table {
            display: flex;
            justify-content: space-between;
        }

        .table-left, .table-right {
            width: 48%;
        }

        .dashboard-table h3 {
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #bdc3c7;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        thead {
            background-color: #34495e;
            color: #ecf0f1;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="main-content">
        <div class="header">
            <h1>Dashboard</h1>
            <div class="user-info">
                <asp:Label ID="lblUsername" runat="server"></asp:Label>
                <asp:LoginStatus ID="LoginStatus1" runat="server" />
            </div>
        </div>
        <div class="cards">
            <div class="card">
                <h3>Total Movies</h3>
                <p>120</p>
            </div>
            <div class="card">
                <h3>Total Bookings</h3>
                <p>350</p>
            </div>
            <div class="card">
                <h3>Total Users</h3>
                <p>200</p>
            </div>
            <div class="card">
                <h3>Revenue</h3>
                <p>$15,000</p>
            </div>
        </div>
        <div class="dashboard-table">
            <div class="table-left">
                <h3>Recent Bookings
                </h3>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BookingID" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="BookingID" HeaderText="BookingID" ReadOnly="True" SortExpression="BookingID" />
                        <asp:BoundField DataField="Seats" HeaderText="Seats" SortExpression="Seats" />
                        <asp:BoundField DataField="TotalAmount" HeaderText="TotalAmount" SortExpression="TotalAmount" />
                        <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" SortExpression="BookingDate" />
                    </Columns>
                    </asp:GridView>
            </div>
            <div class="table-right">
                <h3>Upcoming Movies</h3>
                <asp:GridView ID="gvMovies" runat="server" AutoGenerateColumns="False" CssClass="table" DataKeyNames="MovieID" DataSourceID="SqlDataSource2">
                    <Columns>
                        <asp:BoundField DataField="MovieID" HeaderText="MovieID" ReadOnly="True" SortExpression="MovieID" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:BoundField DataField="ReleaseDate" HeaderText="ReleaseDate" SortExpression="ReleaseDate" />
                        <asp:BoundField DataField="Genre" HeaderText="Genre" SortExpression="Genre" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [MovieID], [Title], [ReleaseDate], [Genre] FROM [Movie] WHERE ([Availability] = @Availability)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Upcoming" Name="Availability" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [BookingID], [Seats], [TotalAmount], [BookingDate] FROM [Bookings]">
                </asp:SqlDataSource>
            </div>
        </div>
        <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>

    </div>
</asp:Content>
