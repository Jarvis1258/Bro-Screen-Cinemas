<%@ Page Language="C#" MasterPageFile="~/Admin/Staff.Master" AutoEventWireup="true" CodeBehind="EditMovie.aspx.cs" Inherits="Bro_Screen_Cinemas.Edit_Movie" %>

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
            <h1>Edit Movie</h1>
        </div>
        <fieldset>
            <legend class="auto-style1">Movie Information</legend>
            <div class="image-container">
                <asp:Image ID="imgPoster" runat="server" Width="100px" Height="150px" />
                <%-- <br /> <button type="button" id="btnChange" onclick="toggleUploadVisibility()">Change</button>--%>
            </div>
            <div class="image-upload" id="imageUploadDiv">
                <asp:Label ID="lblPoster" runat="server" Text="Movie Poster:"></asp:Label>
                <asp:FileUpload ID="filePoster" runat="server" />
                <br />
                <br />
            </div>

            <asp:Label ID="lblMovieID" runat="server" Text="Movie ID:"></asp:Label>
            <asp:TextBox ID="txtMovieID" runat="server" ReadOnly="true"></asp:TextBox>
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


            <asp:Button ID="btnUpdate" runat="server" Text="Update Movie" OnClientClick="return confirm('Are you sure you want to edit this movie?');" OnClick="btnUpdate_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
        </fieldset>
    </div>
</asp:Content>
