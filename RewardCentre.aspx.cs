using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bro_Screen_Cinemas
{
    public partial class RewardCentre : System.Web.UI.Page
    {
        private const int DefaultPoints = 50000; // Default starting points

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize user's points in Session if not already set
                if (Session["UserPoints"] == null)
                {
                    Session["UserPoints"] = DefaultPoints;
                }

                // Display the user's current points
                lblCurrentPoints.Text = Session["UserPoints"].ToString();
            }
        }

        protected void RedeemReward(object sender, EventArgs e)
        {
            // Get the reward cost and details from the clicked button
            Button clickedButton = (Button)sender;
            int rewardCost = int.Parse(clickedButton.CommandArgument);

            // Retrieve user's current points from Session
            int userPoints = (int)Session["UserPoints"];

            // Check if user has enough points
            if (userPoints >= rewardCost)
            {
                // Deduct the reward cost
                userPoints -= rewardCost;

                // Update Session with the new points value
                Session["UserPoints"] = userPoints;

                // Update the displayed points
                lblCurrentPoints.Text = userPoints.ToString();

                // Retrieve the reward details dynamically
                Label rewardNameLabel = clickedButton.Parent.FindControl("lblRewardDesc" + clickedButton.ID.Substring(clickedButton.ID.Length - 1)) as Label;
                Image rewardImageControl = clickedButton.Parent.FindControl("Image" + clickedButton.ID.Substring(clickedButton.ID.Length - 1)) as Image;

                string rewardName = rewardNameLabel != null ? rewardNameLabel.Text : "Unknown Reward";
                string rewardImage = rewardImageControl != null ? rewardImageControl.ImageUrl : string.Empty;

                // Create a new history item
                var rewardHistory = new RewardHistory
                {
                    Name = rewardName,
                    ImageUrl = rewardImage,
                    Cost = rewardCost
                };

                // Save to session history
                var historyList = Session["RewardHistory"] as List<RewardHistory> ?? new List<RewardHistory>();
                historyList.Add(rewardHistory);
                Session["RewardHistory"] = historyList;

                // Notify the user of successful redemption
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Redemption successful!');", true);
            }
            else
            {
                // Notify the user if they don't have enough points
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Not enough points to redeem this item.');", true);
            }
        }
        public class RewardHistory
        {
            public string Name { get; set; }
            public string ImageUrl { get; set; }
            public int Cost { get; set; }
        }
    }
}