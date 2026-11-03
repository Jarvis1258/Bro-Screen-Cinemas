<%@ Page Language="C#" MasterPageFile="~/Account.Master" AutoEventWireup="true" CodeBehind="RewardCentre.aspx.cs" Inherits="Bro_Screen_Cinemas.RewardCentre" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .contentRightHeader {
            text-align: center;
            margin-bottom: 20px;
        }

        .currentPoints {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: rgba(128, 128, 128, 0.2);
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            width: 60%;
            margin: 0 auto 30px auto;
        }

        .currentPoints p {
            margin: 5px 0;
            font-size: 18px;
            font-weight: bold;
            color: white;
        }

        .currentPoints #CoinsCurrent {
            font-size: 24px;
            font-weight: bold;
            color: #ffee60;
            margin-bottom: 5px;
        }

        .validDate {
            color: white;
            font-size: 16px;
        }

        .rewardsContainer {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 0 10px;
        }

        .rewards {
            position: relative;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            text-align: center;
            width: 250px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .rewards:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.2);
        }

        .rewardDesc {
            display: block;
            margin: 10px 0;
            font-size: 16px;
            font-weight: bold;
            color: white;
        }

        .rewardCoin {
            color: #f39c12;
            font-size: 14px;
            font-weight: bold;
            position: absolute;
            bottom: 10px;
            left: 10px;
        }

        .redeemButton {
            position: absolute;
            bottom: 10px;
            right: 10px;
            padding: 8px 16px;
            background-color: #ffee60;
            color: black;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .redeemButton:hover {
            background-color: #f39c12;
            color: #fff;
        }

        .redeemButton:disabled {
            background-color: #bdc3c7;
            cursor: not-allowed;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="contentRightInfo">
        <div class="contentRightHeader">
            <h2>Rewards Centre</h2>
        </div>
        <!-- Current Points Display -->
        <div class="currentPoints">
            <p id="CoinsCurrent">Current BSCoins: 
                <asp:Label ID="lblCurrentPoints" runat="server" Text="50000"></asp:Label>
            </p>
            <p>Valid Until <span class="validDate">23 May 2025</span></p>
        </div>
        <!-- Reward items -->
        <div class="rewardsContainer">
            <div class="rewards">
                <asp:Image ID="Image1" runat="server" ImageUrl="image/reward.png" />
                <span class="rewardDesc">
                    <asp:Label ID="lblRewardDesc1" runat="server" Text="One (1) 2D Standard Ticket"></asp:Label>
                </span><br />
                <span class="rewardCoin">2000 Bscoins</span>
                <asp:Button ID="btnRedeem1" runat="server" Text="Redeem" CssClass="redeemButton" OnClick="RedeemReward" CommandArgument="2000" />
            </div>
            <div class="rewards">
                <asp:Image ID="Image2" runat="server" ImageUrl="image/reward2.png" />
                <span class="rewardDesc">
                    <asp:Label ID="lblRewardDesc2" runat="server" Text="One (1) Special Format Ticket"></asp:Label>
                </span><br />
                <span class="rewardCoin">3000 Bscoins</span>
                <asp:Button ID="btnRedeem2" runat="server" Text="Redeem" CssClass="redeemButton" OnClick="RedeemReward" CommandArgument="3000" />
            </div>
            <div class="rewards">
                <asp:Image ID="Image3" runat="server" ImageUrl="image/reward3.png" />
                <span class="rewardDesc">
                    <asp:Label ID="lblRewardDesc3" runat="server" Text="One (1) PLAY Ticket"></asp:Label>
                </span><br />
                <span class="rewardCoin">3000 Bscoins</span>
                <asp:Button ID="btnRedeem3" runat="server" Text="Redeem" CssClass="redeemButton" OnClick="RedeemReward" CommandArgument="3000" />
            </div>
            <div class="rewards">
                <asp:Image ID="Image4" runat="server" ImageUrl="image/reward4.png" />
                <span class="rewardDesc">
                    <asp:Label ID="lblRewardDesc4" runat="server" Text="One (1) Getha Lux Suite Pass"></asp:Label>
                </span><br />
                <span class="rewardCoin">13000 Bscoins</span>
                <asp:Button ID="btnRedeem4" runat="server" Text="Redeem" CssClass="redeemButton" OnClick="RedeemReward" CommandArgument="13000" />
            </div>
            <div class="rewards">
                <asp:Image ID="Image5" runat="server" ImageUrl="image/reward5.png" />
                <span class="rewardDesc">
                    <asp:Label ID="lblRewardDesc5" runat="server" Text="One (1) Escape Studio Pass"></asp:Label>
                </span><br />
                <span class="rewardCoin">13500 Bscoins</span>
                <asp:Button ID="btnRedeem5" runat="server" Text="Redeem" CssClass="redeemButton" OnClick="RedeemReward" CommandArgument="13500" />
            </div>
            <div class="rewards">
                <asp:Image ID="Image6" runat="server" ImageUrl="image/reward6.png" />
                <span class="rewardDesc">
                    <asp:Label ID="lblRewardDesc6" runat="server" Text="One (1) ScreenX Pass"></asp:Label>
                </span><br />
                <span class="rewardCoin">6500 Bscoins</span>
                <asp:Button ID="btnRedeem6" runat="server" Text="Redeem" CssClass="redeemButton" OnClick="RedeemReward" CommandArgument="6500" />
            </div>
        </div>
    </div>
</asp:Content>