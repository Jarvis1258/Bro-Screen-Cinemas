<%@ Page Language="C#" MasterPageFile="~/Admin/Staff.Master" AutoEventWireup="true" CodeBehind="EditCustomer.aspx.cs" Inherits="Bro_Screen_Cinemas.EditCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Edit Customer</title>
    <style>
        .form-container {
            width: 50%;
            margin: auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-container h1 {
            text-align: center;
        }
        .form-container label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        .form-container input[type="text"], 
        .form-container input[type="email"], 
        .form-container input[type="tel"],
        .form-container input[type="date"],
        .form-container select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .form-container button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-container .btn-submit {
            background-color: #28a745;
            color: #fff;
        }
        .form-container .btn-cancel {
            background-color: #dc3545;
            color: #fff;
            margin-left: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <h1>Edit Customer</h1>
        <asp:Label ID="lblStatus" runat="server" Text="" />
        <asp:HiddenField ID="hfCustomerID" runat="server" />

        <label for="txtUsername">Username:</label>
        <asp:TextBox ID="txtUsername" runat="server" />

        <label for="txtFullName">Full Name:</label>
        <asp:TextBox ID="txtFullName" runat="server" />

        <label for="txtEmail">Email:</label>
        <asp:TextBox ID="txtEmail" runat="server" />

        <label for="txtPhoneNumber">Phone Number:</label>
        <asp:TextBox ID="txtPhoneNumber" runat="server" />

        <label for="txtDateOfBirth">Date of Birth:</label>
        <asp:TextBox ID="txtDateOfBirth" runat="server" TextMode="Date" />

        <label for="txtFavoriteGenres">Favorite Genres:</label>
        <asp:TextBox ID="txtFavoriteGenres" runat="server" />

        <label for="ddlPreferredCinema">Preferred Cinema:</label>
        <asp:DropDownList ID="ddlPreferredCinema" runat="server">
            <asp:ListItem Text="Select Cinema" Value="" />
            <asp:ListItem Text="Setapak Centra" Value="Setapak Centra" />
            <asp:ListItem Text="Mid Valley Megamall" Value="Mid Valley Megamall" />
            <asp:ListItem Text="1 Utama" Value="1 Utama" />
            <asp:ListItem Text="Paradigm Mall" Value="Paradigm Mall" />
        </asp:DropDownList>

        <div>
            <asp:Button ID="btnSubmit" runat="server" Text="Update" CssClass="btn-submit" OnClick="btnSubmit_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn-cancel" OnClick="btnCancel_Click" />
        </div>
    </div>
</asp:Content>
