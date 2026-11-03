<%@ Page Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Bro_Screen_Cinemas.Login" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>

    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="content-2box">
        <div class="content-left">
            <div class="logo">
                <img src="image/titleIcon.png" alt="logo" />
            </div>
            <div class="login-container">
                <asp:Login ID="Login1" runat="server" DestinationPageUrl="MovieList.aspx" OnLoggedIn="Login1_LoggedIn">
                    <LayoutTemplate>

                        <div class="login-card">
                            <h2 class="login-title">Log In</h2>
                            <div class="form-group">
                                <label for="UserName">User Name:</label>
                                <asp:TextBox ID="UserName" runat="server" CssClass="input-field"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." CssClass="error-message" ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <label for="Password">Password:</label>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="input-field"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." CssClass="error-message" ValidationGroup="Login1">*</asp:RequiredFieldValidator>

                            </div>
                            <div class="remember-forgot">
                                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember Me" CssClass="remember-me" />
                                <asp:HyperLink ID="ForgotPwd" runat="server" NavigateUrl="~/ForgotPwd.aspx">Forgot Password?</asp:HyperLink>
                            </div>
                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" CssClass="login-button" ValidationGroup="Login1" />

                            <div class="register-link">
                                <p>
                                    Not a member yet?
                                    <asp:HyperLink ID="Register" runat="server" NavigateUrl="~/Register.aspx">Register</asp:HyperLink>
                                </p>
                            </div>
                            <div class="failure-text">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </div>
                        </div>
                    </LayoutTemplate>
                </asp:Login>
            </div>
        </div>

        <div class="content-right">
        </div>
    </div>

</asp:Content>

