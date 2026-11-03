<%@ Page Title="" Language="C#" MasterPageFile="~/Staff.Master" AutoEventWireup="true" CodeBehind="RoleManagement.aspx.cs" Inherits="Bro_Screen_Cinemas.RoleManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table style="width: 100%;">
            <tr>
                <td colspan="3">Membership and Role Management</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">Users:</td>
                <td colspan="2">
                    <asp:DropDownList ID="ddlUsers" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlUsers_SelectedIndexChanged">
                    </asp:DropDownList>
                    &nbsp;&nbsp;
                        <asp:Button ID="btnGetUsers" runat="server" OnClick="btnGetUsers_Click" Text="Get Users" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">Create Role:</td>
                <td colspan="2">
                    <asp:TextBox ID="txtRole" runat="server"></asp:TextBox>
                    &nbsp;<asp:Button ID="btnCreateRole" runat="server" OnClick="btnCreateRole_Click" Text="Create Role" />
                    <asp:Label ID="lblMessage" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">Roles:</td>
                <td colspan="2">
                    <asp:DropDownList ID="ddlRoles" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlRoles_SelectedIndexChanged">
                    </asp:DropDownList>
                    &nbsp;&nbsp;
                        <asp:Button ID="btnGetRoles" runat="server" OnClick="btnGetRoles_Click" Text="Get Roles" />
                    &nbsp;
                        <asp:Button ID="btnGetUsersinRole" runat="server" OnClick="btnGetUsersinRole_Click" Text="Get User in Role" />
                    <br />
                    <br />
                    <asp:ListBox ID="lstUsers" runat="server"></asp:ListBox>
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Assign Role to user</td>
                <td colspan="2">
                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                    &nbsp;<asp:TextBox ID="txtRoleName" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;
                        <asp:Button ID="btnAssign" runat="server" OnClick="btnAssign_Click" Text="Assign" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td colspan="2">&nbsp;</td>
            </tr>
        </table>
    </div>

</asp:Content>
