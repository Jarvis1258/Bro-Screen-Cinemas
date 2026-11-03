using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Bro_Screen_Cinemas.RewardCentre;

namespace Bro_Screen_Cinemas
{
    public partial class MyRewards : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadRewardHistory();
            }
        }

        private void LoadRewardHistory()
        {
            var historyList = Session["RewardHistory"] as List<RewardHistory>;

            if (historyList != null && historyList.Count > 0)
            {
                noRecordDiv.Visible = false; // Hide "No Record" message
                rewardHistoryRepeater.DataSource = historyList;
                rewardHistoryRepeater.DataBind();
            }
            else
            {
                noRecordDiv.Visible = true; // Show "No Record" message
            }
        }
    }
}