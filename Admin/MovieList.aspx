<%@ Page Language="C#" MasterPageFile="~/Admin/Staff.Master" AutoEventWireup="true" CodeBehind="MovieList.aspx.cs" Inherits="Bro_Screen_Cinemas.MovieList" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .add-movie-btn {
            padding: 10px 20px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .movies {
            border: 1px solid #ddd;
            padding: 10px;
            margin: 10px;
            display: inline-block;
            text-align: center;
            width: 250px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="main-content">
        <div class="header">
            <h1>Movie List</h1>
            <asp:Button ID="btnAddMovie" runat="server" Text="Add New Movie" CssClass="add-movie-btn" OnClick="btnAddMovie_Click" />
        </div>
        <div>
            <asp:Repeater ID="rptMovies" runat="server" OnItemDataBound="rptMovies_ItemDataBound" OnItemCommand="rptMovies_ItemCommand">
                <ItemTemplate>
                    <div class="movies">
                        <asp:Image ID="imgPoster" runat="server" Width="100px" Height="150px" />
                        <h3><%# Eval("Title") %></h3>
                        <p>Genre: <%# Eval("Genre") %></p>
                        <p>Duration: <%# Eval("Duration") %></p>
                        <p>
                            Status:
                                    <asp:DropDownList ID="ddlAvailability" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlAvailability_SelectedIndexChanged">
                                        <asp:ListItem Text="Available" Value="Available" />
                                        <asp:ListItem Text="Unavailable" Value="Unavailable" />
                                        <asp:ListItem Text="Upcoming" Value="Upcoming" />
                                    </asp:DropDownList>
                        </p>
                        <asp:HyperLink ID="EditLink" runat="server" NavigateUrl='<%# "EditMovie.aspx?MovieID=" + Eval("MovieID") %>' Text="Edit" />
                        <asp:LinkButton ID="btnDelete" runat="server"
                            CommandName="Delete"
                            CommandArgument='<%# Eval("MovieID") %>'
                            OnClientClick="return confirm('Are you sure you want to delete this movie?');">
                                Delete
                        </asp:LinkButton>
                        <asp:Label ID="lblMovieID" runat="server" Text='<%# Eval("MovieID") %>' Visible="false" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

</asp:Content>
