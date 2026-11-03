<%@ Page Language="C#" MasterPageFile="~/Admin/Staff.Master" AutoEventWireup="true" CodeBehind="ViewCustomerDetails.aspx.cs" Inherits="Bro_Screen_Cinemas.ViewCustomerDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Customer Details</title>
    <style>
        .details-container {
            max-width: 600px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
            font-family: Arial, sans-serif;
        }

        .details-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .details-header h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 5px;
        }

        .details-header p {
            color: #555;
            font-size: 14px;
        }

        .details-content {
            margin-top: 20px;
        }

        .details-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }

        .details-row:last-child {
            border-bottom: none;
        }

        .details-label {
            font-weight: bold;
            color: #555;
        }

        .details-value {
            color: #333;
            text-align: right;
        }

        .details-profile {
            text-align: center;
            margin-top: 20px;
        }

        .details-profile img {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            border: 3px solid #007bff;
        }

        .btn-back {
            display: block;
            margin: 20px auto 0;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            width: fit-content;
        }

        .btn-back:hover {
            background-color: #0056b3;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="details-container">
        <div class="details-header">
            <h1>Customer Details</h1>
            <p>View detailed information about the customer</p>
        </div>
        
        <div class="details-profile">
            <asp:Image ID="imgProfilePic" runat="server" />
        </div>

        <div class="details-content">
            <div class="details-row">
                <span class="details-label">Customer ID:</span>
                <span class="details-value"><asp:Label ID="lblCustomerID" runat="server"></asp:Label></span>
            </div>
            <div class="details-row">
                <span class="details-label">Username:</span>
                <span class="details-value"><asp:Label ID="lblUsername" runat="server"></asp:Label></span>
            </div>
            <div class="details-row">
                <span class="details-label">Full Name:</span>
                <span class="details-value"><asp:Label ID="lblFullName" runat="server"></asp:Label></span>
            </div>
            <div class="details-row">
                <span class="details-label">Email:</span>
                <span class="details-value"><asp:Label ID="lblEmail" runat="server"></asp:Label></span>
            </div>
            <div class="details-row">
                <span class="details-label">Phone Number:</span>
                <span class="details-value"><asp:Label ID="lblPhoneNumber" runat="server"></asp:Label></span>
            </div>
            <div class="details-row">
                <span class="details-label">Date of Birth:</span>
                <span class="details-value"><asp:Label ID="lblDateOfBirth" runat="server"></asp:Label></span>
            </div>
            <div class="details-row">
                <span class="details-label">Favorite Genres:</span>
                <span class="details-value"><asp:Label ID="lblFavoriteGenres" runat="server"></asp:Label></span>
            </div>
            <div class="details-row">
                <span class="details-label">Preferred Cinema:</span>
                <span class="details-value"><asp:Label ID="lblPreferredCinema" runat="server"></asp:Label></span>
            </div>
            <div class="details-row">
                <span class="details-label">Notifications:</span>
                <span class="details-value"><asp:Label ID="lblNotification" runat="server"></asp:Label></span>
            </div>
        </div>

        <a href="Users.aspx" class="btn-back">Back to Users</a>
    </div>
</asp:Content>
