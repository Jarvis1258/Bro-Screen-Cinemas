<%@ Page Language="C#" MasterPageFile="~/Admin/Staff.Master" AutoEventWireup="true" CodeBehind="AddMovie.aspx.cs" Inherits="Bro_Screen_Cinemas.AddMovie" %>

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
            <h1>Add a Movie</h1>
        </div>
        <fieldset>
            <legend class="auto-style1">Movie Information</legend>
            <asp:Label ID="lblMovieID" runat="server" Text="Movie ID:"></asp:Label>
            <asp:TextBox ID="txtMovieID" runat="server"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="lblTitle" runat="server" Text="Title:"></asp:Label>
            <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="lblReleaseDate" runat="server" Text="Release Date:"></asp:Label>
            <asp:TextBox ID="txtReleaseDate" runat="server"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="lblDuration" runat="server" Text="Duration:"></asp:Label>
            <asp:TextBox ID="txtDuration" runat="server"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="lblLanguage" runat="server" Text="Language:"></asp:Label>
            <asp:TextBox ID="txtLanguage" runat="server"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="lblSubtitle" runat="server" Text="Subtitle:"></asp:Label>
            <asp:TextBox ID="txtSubtitle" runat="server"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="lblGenre" runat="server" Text="Genre:"></asp:Label>
            <asp:TextBox ID="txtGenre" runat="server"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="lblClassification" runat="server" Text="Classification:"></asp:Label>
            <asp:TextBox ID="txtClassification" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblPoster" runat="server" Text="Movie Poster:"></asp:Label>
            <asp:FileUpload ID="filePoster" runat="server" /><br />
            <br />
            <p>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Movie" />
                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Cancel" />
            </p>
            <p>
                <asp:Label ID="lblStatus" runat="server"></asp:Label>
            </p>
        </fieldset>
    </div>
</asp:Content>
