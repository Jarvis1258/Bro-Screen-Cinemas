using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bro_Screen_Cinemas
{
    public partial class RoleManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnGetUsers_Click(object sender, EventArgs e)
        {
            ddlUsers.DataSource = Membership.GetAllUsers();
            ddlUsers.DataBind();

        }

        protected void btnCreateRole_Click(object sender, EventArgs e)
        {
            try
            {
                string roleName = txtRole.Text; // Assuming you have a TextBox to input role name
                Debug.WriteLine(roleName);

                if (!Roles.RoleExists(roleName))
                {
                    Roles.CreateRole(roleName);
                    lblMessage.Text = "Role created successfully!";
                }
                else
                {
                    lblMessage.Text = "Role already exists.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = $"Error: {ex.Message}";
            }
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {


            Roles.AddUserToRole(txtUserName.Text, txtRoleName.Text);
        }

        protected void btnGetRoles_Click(object sender, EventArgs e)
        {
            ddlRoles.DataSource = Roles.GetAllRoles();
            ddlRoles.DataBind();

        }

        protected void ddlUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtUserName.Text = ddlUsers.SelectedItem.ToString();

        }

        protected void ddlRoles_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtRoleName.Text = ddlRoles.SelectedItem.ToString();
        }

        protected void btnGetUsersinRole_Click(object sender, EventArgs e)
        {
            lstUsers.DataSource = Roles.GetUsersInRole(ddlRoles.SelectedItem.ToString());
            lstUsers.DataBind();
        }
    }
}