using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bro_Screen_Cinemas
{
    public partial class ForgotPwd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void PasswordRecovery1_SendingMail(object sender, MailMessageEventArgs e)
        {
            e.Message.From = new MailAddress("zvontan11@gmail.com");
        }
    }
}