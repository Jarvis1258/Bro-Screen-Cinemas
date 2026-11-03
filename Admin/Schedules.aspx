<%@ Page Language="C#" MasterPageFile="~/Admin/Staff.Master" AutoEventWireup="true" CodeBehind="Schedules.aspx.cs" Inherits="Bro_Screen_Cinemas.ManageSchedules" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<style>
    .main-container {
        display: flex;
        flex-wrap: wrap; /* Ensures responsiveness by wrapping elements */
        gap: 20px;
        margin-top: 20px;
        justify-content: space-between; /* Adds equal spacing between elements */
    }

    .schedule-section, .add-schedule-section {
        flex: 1; /* Makes both sections responsive and takes up available space */
        min-width: 300px; /* Ensures sections don't shrink too small on small screens */
        max-width: 48%; /* Limits section width to 48% for better spacing on larger screens */
        box-sizing: border-box; /* Includes padding and borders in the width */
    }

    h2, h3 {
        color: #333;
        text-align: center;
        font-family: 'Arial', sans-serif;
    }

    .card {
        border: 1px solid #ddd;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Adds a subtle shadow */
        background-color: #fff;
    }

    .card-header {
        background-color: #007bff;
        color: white;
        font-weight: bold;
        padding: 10px;
        text-align: center;
        font-size: 1.2rem;
    }

    .table {
        margin-top: 15px;
        font-size: 0.95rem;
        text-align: center;
        table-layout: fixed; /* Prevents the table from expanding */
        width: 100%; /* Ensures table width stays within the card */
    }

    .table th, .table td {
        vertical-align: middle; /* Center content vertically */
        white-space: nowrap; /* Prevent content from wrapping */
        text-overflow: ellipsis; /* Add ellipsis for long content */
        overflow: hidden; /* Prevent content overflow */
    }

    .table .form-control {
        max-width: 100%; /* Ensures inputs fit within their cells */
        box-sizing: border-box; /* Includes padding and border in width */
    }

    .card-body {
        max-height: 400px; /* Limit the height of the table */
        overflow-y: auto; /* Add vertical scrolling if rows exceed the height */
        overflow-x: auto; /* Add horizontal scrolling for wide content */
        margin-bottom: 15px; /* Add space between sections */
    }

    .table thead th {
        position: sticky;
        top: 0;
        z-index: 2; /* Ensure headers are above other content when scrolling */
        background-color: #f8f9fa; /* Match header background */
    }

    .table tbody tr {
        height: 50px; /* Set a consistent row height */
    }

    .btn {
        border-radius: 5px;
        padding: 10px 15px;
        font-size: 1rem;
    }

    .btn-primary {
        background-color: #007bff;
        border-color: #007bff;
    }

    .btn-primary:hover {
        background-color: #0056b3;
        border-color: #004a99;
    }

    .btn-success {
        background-color: #28a745;
        border-color: #28a745;
    }

    .btn-success:hover {
        background-color: #218838;
        border-color: #1e7e34;
    }

    .btn-danger {
        background-color: #dc3545;
        border-color: #dc3545;
    }

    .btn-danger:hover {
        background-color: #bd2130;
        border-color: #b21f2d;
    }

    .form-control, .form-select {
        border-radius: 5px;
        padding: 10px;
        font-size: 1rem;
    }

    .table {
        margin-top: 15px;
        font-size: 0.95rem;
        text-align: center;
    }

    .table th {
        background-color: #f8f9fa;
        color: #333;
        font-weight: bold;
    }

    .table-bordered {
        border: 1px solid #ddd;
    }

    .text-danger {
        text-align: center;
        margin: 10px 0;
        font-weight: bold;
    }

    /* Mobile responsiveness */
    @media (max-width: 768px) {
        .card-body {
            overflow-x: auto; /* Ensure horizontal scrolling on smaller screens */
        }

        .table {
            font-size: 0.8rem; /* Reduce font size for smaller screens */
        }
    }
</style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h2 class="text-center mb-4">Manage Schedules</h2>

        <!-- Select Date Section -->
        <div class="row mb-4">
            <div class="col-md-6">
                <label for="txtDate" class="form-label">Select Date:</label>
                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" placeholder="yyyy-MM-dd" type="date"></asp:TextBox>
            </div>
            <div class="col-md-6 d-flex align-items-end">
                <asp:Button ID="btnViewSchedules" runat="server" Text="View Schedules" CssClass="btn btn-primary w-100" OnClick="btnViewSchedules_Click" />
            </div>
        </div>

        <div class="main-container">
            <!-- Schedules Section -->
            <div class="schedule-section">
                <div class="card">
                    <div class="card-header text-center">
                        <h3>Schedules</h3>
                    </div>
                    <div class="card-body">
                        <asp:Panel ID="pnlSchedules" runat="server" Visible="false">
                            <asp:GridView ID="gvSchedules" runat="server" AutoGenerateColumns="false"
                                CssClass="table table-bordered table-hover table-striped"
                                GridLines="None" DataKeyNames="ShowtimeID"
                                OnRowEditing="gvSchedules_RowEditing"
                                OnRowCancelingEdit="gvSchedules_RowCancelingEdit"
                                OnRowUpdating="gvSchedules_RowUpdating"
                                OnRowDeleting="gvSchedules_RowDeleting">
                                <Columns>
                                    <asp:BoundField DataField="MovieTitle" HeaderText="Movie" />
                                    <asp:BoundField DataField="Outlet" HeaderText="Cinema" />
                                    <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                                    <asp:BoundField DataField="Time" HeaderText="Time" />
                                    <asp:CommandField ShowEditButton="true" />
                                    <asp:ButtonField Text="Delete" CommandName="Delete" />
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                        <asp:Label ID="lblNoSchedules" runat="server" CssClass="text-danger" 
                            Text="No schedules found for the selected date." Visible="false">
                        </asp:Label>
                    </div>
                </div>
            </div>

            <!-- Add New Schedule Section -->
            <div class="add-schedule-section">
                <div class="card">
                    <div class="card-header text-center">
                        <h3>Add New Schedule</h3>
                    </div>
                    <div class="card-body">
                        <div class="form-group mb-3">
                            <label for="ddlMovies" class="form-label">Select Movie:</label>
                            <asp:DropDownList ID="ddlMovies" runat="server" class="form-select">
                                <asp:ListItem Text="Please Select a Movie" Value="" Selected="True" Enabled="False" />
                            </asp:DropDownList>
                        </div>

                        <div class="form-group mb-3">
                            <label for="ddlCinemas" class="form-label">Select Cinema:</label>
                            <asp:DropDownList ID="ddlCinemas" runat="server" class="form-select">
                                <asp:ListItem Text="Please Select a Cinema" Value="" Selected="True" Enabled="False" />
                            </asp:DropDownList>
                        </div>

                        <div class="form-group mb-3">
                            <label for="txtNewDate" class="form-label">Date:</label>
                            <asp:TextBox ID="txtNewDate" runat="server" class="form-control" placeholder="yyyy-MM-dd" type="date"></asp:TextBox>
                        </div>

                        <div class="form-group mb-3">
                            <label for="txtNewTime" class="form-label">Time:</label>
                            <asp:TextBox ID="txtNewTime" runat="server" class="form-control" placeholder="HH:mm" type="time"></asp:TextBox>
                        </div>

                        <asp:Button ID="btnAddSchedule" runat="server" Text="Add Schedule" class="btn btn-success w-100" OnClick="btnAddSchedule_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>