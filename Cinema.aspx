<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Cinema.aspx.cs" Inherits="Bro_Screen_Cinemas.Cinema" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        nav{
            position: relative;
        }
    </style>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #121212;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 20px;
            background-color: #222;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h1 {
            color: #ffee60;
            margin-bottom: 10px;
        }

        .header p {
            color: #ffee60;
        }

        .cinema-list {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
        }

        .cinema-card {
            background-color: #ffd800;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            transition: transform 0.2s;
            margin-bottom:5px;

        }

        .cinema-card:hover {
            transform: scale(1.05);
        }

        .cinema-card h2 {
            margin: 0 0 10px;
            font-size: 20px;
            color: #007bff;
        }

        .cinema-card p {
            margin: 5px 0;
            color: #555;
        }

        .cinema-card .facilities {
            margin-top: 10px;
            font-style: italic;
        }
    </style>
</asp:Content>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="header">
            <h1>Our Cinema Locations</h1>
            <p>Discover our cinema outlets and facilities across the country!</p>
        </div>
            <asp:Repeater ID="CinemaRepeater" runat="server">
                <ItemTemplate>
                    <div class="cinema-card">
                        <h2><%# Eval("Outlet") %> - <%# Eval("City") %></h2>
                        <div class="cinema-details">
                            <p><span>Address:</span> <%# Eval("Address") %></p>
                            <p><span>Contact Number:</span> <%# Eval("ContactNumber") %></p>
                            <p><span>Opening Hours:</span> <%# Eval("OpeningHours") %></p>
                            <p><span>Facilities:</span> <%# Eval("Facilities") %></p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
    </div>
</asp:Content>