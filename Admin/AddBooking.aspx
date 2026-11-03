<%@ Page Language="C#" MasterPageFile="~/Admin/Staff.Master" AutoEventWireup="true" CodeBehind="AddBooking.aspx.cs" Inherits="Bro_Screen_Cinemas.AddBooking" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        fieldset {
            margin-top: 15px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="main-content">
        <div class="header">
            <h1>Add a Booking</h1>
        </div>
        <fieldset>
            <legend class="auto-style1">Booking Information</legend>
            <asp:Label ID="lblSeats" runat="server" Text="Seats:"></asp:Label>
            <asp:TextBox ID="txtSeats" runat="server"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="lblFood" runat="server" Text="Food:"></asp:Label>
            <asp:TextBox ID="txtFood" runat="server"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="lblPeople" runat="server" Text="People:"></asp:Label>
            <asp:TextBox ID="txtPeople" runat="server"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="lblTotalAmount" runat="server" Text="Total Amount (RM):"></asp:Label>
            <asp:TextBox ID="txtTotalAmount" runat="server"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="lblPaymentMethod" runat="server" Text="Payment Method:"></asp:Label>
            <asp:DropDownList ID="ddlPaymentMethod" runat="server">
                <asp:ListItem Text="Credit Card" Value="Credit Card"></asp:ListItem>
                <asp:ListItem Text="Online Banking" Value="Online Banking"></asp:ListItem>
                <asp:ListItem Text="E-Wallet" Value="E-Wallet"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />

            <p>
                <asp:Button ID="btnAddBooking" runat="server" OnClick="btnAddBooking_Click" Text="Add Booking" />
                <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
            </p>
            <p>
                <asp:Label ID="lblStatus" runat="server"></asp:Label>
            </p>
        </fieldset>
    </div>
</asp:Content>