<%@ Page Language="C#" MasterPageFile="~/Login.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Bro_Screen_Cinemas.Register" %>

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
            <div class="register-container">
                <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" ContinueDestinationPageUrl="~/Login.aspx" CreateUserButtonText="Sign Up" OnCreatedUser="CreateUserWizard1_CreatedUser">
                    <CreateUserButtonStyle CssClass="register-button" />
                    <WizardSteps>
                        <asp:CreateUserWizardStep runat="server">
                            <ContentTemplate>
                                <div class="register-card">
                                    <h2 class="register-title">Create Your Account</h2>
                                    <div class="form-group">
                                        <label for="UserName">User Name:</label>
                                        <asp:TextBox ID="UserName" runat="server" CssClass="input-field"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." CssClass="error-message">*</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label for="Password">Password:</label>
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="input-field"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." CssClass="error-message">*</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label for="ConfirmPassword">Confirm Password:</label>
                                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="input-field"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." CssClass="error-message">*</asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" ErrorMessage="Passwords must match." CssClass="error-message"></asp:CompareValidator>
                                    </div>
                                    <div class="form-group">
                                        <label for="Email">E-mail:</label>
                                        <asp:TextBox ID="Email" runat="server" CssClass="input-field"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." CssClass="error-message">*</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label for="Question">Security Question:</label>
                                        <asp:TextBox ID="Question" runat="server" CssClass="input-field"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." CssClass="error-message">*</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label for="Answer">Security Answer:</label>
                                        <asp:TextBox ID="Answer" runat="server" CssClass="input-field"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." CssClass="error-message">*</asp:RequiredFieldValidator>
                                    </div>
                                    <div class="register-link">
                                        Already have an account?
                                        <asp:HyperLink ID="backLogin" runat="server" NavigateUrl="~/Login.aspx">Back to Login</asp:HyperLink>
                                    </div>
                                    <div class="error-message">
                                        <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:CreateUserWizardStep>
                        <asp:CompleteWizardStep runat="server">
                            <ContentTemplate>
                                <div class="register-complete">
                                    <h2 class="register-title">Account Created!</h2>
                                    <p>Your account has been created successfully.</p>
                                    <asp:Button ID="ContinueButton" runat="server" CommandName="Continue" Text="Continue" CssClass="register-button" />
                                </div>
                            </ContentTemplate>
                        </asp:CompleteWizardStep>
                    </WizardSteps>
                </asp:CreateUserWizard>

            </div>
        </div>

        <div class="content-right">
        </div>
    </div>
</asp:Content>
