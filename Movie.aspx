<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Movie.aspx.cs" Inherits="Bro_Screen_Cinemas.Movie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Movies</title>
    <style>
        nav{
            position: relative;
        }

        #sessionHead {
            text-align: center;
            color: #ffee60;
            margin-top: 30px;
        }

        #sessionHead::after {
            content: "";
            height: 2px;
            width: 6%;
            background-color: #ffee60;
            position: absolute;
            left: 47%;
            margin-top: 45px;
        }

        .filter-container {
            text-align: center;
            margin: 20px 0;
        }

        .filter-container select {
            padding: 8px 12px;
            margin-right: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .filter-container button {
            padding: 8px 20px;
            background-color: #ffee60;
            border: none;
            border-radius: 5px;
            color: #000;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .filter-container button:hover {
            background-color: #ffcc00;
        }

        .poster-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            padding: 20px;
            margin: 0 auto;
        }

        .poster {
            position: relative;
            overflow: hidden;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            cursor: pointer;
            background-color: #000;
            max-width: 300px;
            margin: auto;
        }

        .poster img {
            width: 100%;
            height: auto;
            display: block;
            transition: transform 0.3s ease;
        }

        .poster:hover img {
            transform: scale(1.1);
        }

        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.8);
            opacity: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 20px;
            transition: opacity 0.3s ease;
        }

        .poster:hover .overlay {
            opacity: 1;
        }

        .overlay h2 {
            margin: 0 0 10px;
            font-size: 1.5em;
            color: #ffee60;
        }

        .overlay p {
            margin: 5px 0;
            font-size: 1em;
            color: #fff;
        }

        button {
            background-color: #ffee60;
            color: #000000;
            border: none;
            padding: 10px 20px;
            font-size: 1em;
            cursor: pointer;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #ffcc00;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 id="sessionHead">Movies</h1>

    <div class="filter-container">
        <asp:DropDownList ID="ddlFilter" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlFilter_SelectedIndexChanged">
            <asp:ListItem Text="Available" Value="Available" />
            <asp:ListItem Text="Upcoming" Value="Upcoming" />
        </asp:DropDownList>
    </div>

    <main class="poster-grid">
        <asp:Repeater ID="rptMovies" runat="server">
            <ItemTemplate>
                <div class="poster">
                    <asp:Image ID="imgPoster" runat="server" />
                    <div class="overlay">
                        <h2><%# Eval("Title") %></h2>
                        <p><strong>Genre:</strong> <%# Eval("Genre") %></p>
                        <p><strong>Subtitle:</strong> <%# Eval("Subtitle") %></p>
                        <p><strong>Duration:</strong> <%# Eval("Duration") %> minutes</p>
                        <p><strong>Status:</strong> <%# Eval("Availability") %></p>
                        <asp:PlaceHolder ID="phBuyNow" runat="server">
                            <button onclick="location.href='Showtime.aspx?MovieID=<%# Eval("MovieID") %>'">Buy Now</button>
                        </asp:PlaceHolder>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </main>
</asp:Content>