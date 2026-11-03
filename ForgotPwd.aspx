<%@ Page Title="" Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="ForgotPwd.aspx.cs" Inherits="Bro_Screen_Cinemas.ForgotPwd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-2box">
        <div class="content-left">
            <div class="logo">
                <img src="image/titleIcon.png" alt="logo" />
            </div>
            <div class="password-recovery-container">
                <asp:PasswordRecovery ID="PasswordRecovery1" runat="server"
                    MailDefinition-From="zvontan11@gmail.com"
                    MailDefinition-Subject="Password Recovery"
                    OnSendingMail="PasswordRecovery1_SendingMail">
                    <UserNameTemplate>
                        <div class="recovery-card">
                            <h2 class="recovery-title">Recover Your Password</h2>
                            <div class="form-group">
                                <label for="UserName">User Name:</label>
                                <asp:TextBox ID="UserName" runat="server" CssClass="input-field"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." CssClass="error-message">*</asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">Back to Login</asp:HyperLink>
                                <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" Text="Submit" CssClass="recovery-button" />
                            </div>
                            <div class="error-message">
                                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                            </div>
                        </div>
                    </UserNameTemplate>
<MailDefinition From="zvontan11@gmail.com" Subject="Password Recovery"></MailDefinition>
                    <QuestionTemplate>
                        <div class="recovery-card">
                            <h2 class="recovery-title">Answer Security Question</h2>
                            <div class="form-group">
                                <label for="Question">Question:</label>
                                <asp:Label ID="Question" runat="server" CssClass="security-question"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label for="Answer">Answer:</label>
                                <asp:TextBox ID="Answer" runat="server" CssClass="input-field"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Answer is required." CssClass="error-message">*</asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="SubmitAnswerButton" runat="server" CommandName="Submit" Text="Submit" CssClass="recovery-button" />
                            </div>
                            <div class="error-message">
                                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                            </div>
                        </div>
                    </QuestionTemplate>
                    <SuccessTemplate>
                        <div class="recovery-card">
                            <h2 class="recovery-title">Password Reset Successful</h2>
                            <p>An email has been sent with your new password.</p>
                            <asp:Button ID="ContinueButton" runat="server" CommandName="Continue" Text="Continue" CssClass="recovery-button" />
                        </div>
                    </SuccessTemplate>
                </asp:PasswordRecovery>
            </div>
        </div>

        <div class="content-right">
        </div>
    </div>
</asp:Content>
