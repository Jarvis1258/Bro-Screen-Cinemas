<%@ Page Language="C#" MasterPageFile="~/Admin/Staff.Master" AutoEventWireup="true" CodeBehind="EditAdmin.aspx.cs" Inherits="Bro_Screen_Cinemas.EditAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Edit Admin</title>
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
        <h1>Edit Admin</h1>
        <asp:Label ID="lblAdminID" runat="server" Text="" />
        <asp:HiddenField ID="hfAdminID" runat="server" />

        <label for="txtUserName">Username:</label>
        <asp:TextBox ID="txtUserName" runat="server" />

        <label for="txtFullName">Full Name:</label>
        <asp:TextBox ID="txtFullName" runat="server" />

        <label for="txtEmail">Email:</label>
        <asp:TextBox ID="txtEmail" runat="server" />

        <label for="txtPhoneNumber">Phone Number:</label>
        <asp:TextBox ID="txtPhoneNumber" runat="server" />

        <label for="ddlCinemaID">Cinema:</label>
        <asp:DropDownList ID="ddlCinemaID" runat="server">
            <asp:ListItem Text="Select Cinema" Value="" />
            <asp:ListItem Text="Cinema A" Value="A" />
            <asp:ListItem Text="Cinema B" Value="B" />
        </asp:DropDownList>

        <label for="ddlRole">Role:</label>
        <asp:DropDownList ID="ddlRole" runat="server">
            <asp:ListItem Text="Select Role" Value="" />
            <asp:ListItem Text="Admin" Value="Admin" />
            <asp:ListItem Text="Super Admin" Value="SuperAdmin" />
        </asp:DropDownList>

        <div>
            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn-submit" OnClick="btnSave_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn-cancel" PostBackUrl="Users.aspx" />
        </div>
    </div>
</asp:Content>
