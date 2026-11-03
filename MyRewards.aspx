<%@ Page Language="C#" MasterPageFile="~/Account.Master" AutoEventWireup="true" CodeBehind="MyRewards.aspx.cs" Inherits="Bro_Screen_Cinemas.MyRewards" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* General Layout */
        .contentRightInfo {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .contentRightHeader h2 {
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            color: #ffee60;
            margin-bottom: 20px;
        }

        /* No Record Message */
        .norecord {
            text-align: center;
            margin: 30px 0;
            color: #666;
        }

        .norecord img {
            width: 150px;
            margin-bottom: 15px;
        }

        .norecord span {
            font-size: 18px;
            font-weight: bold;
        }

        /* Reward Items */
        .rewardItemRow {
            display: flex;
            align-items: center;
            border: 1px solid #ddd;
            padding: 15px;
            margin: 15px 0;
            border-radius: 8px;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .rewardItemRow:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.15);
        }

        .rewardItemRow img {
            width: 80px;
            height: 80px;
            border-radius: 8px;
            object-fit: cover;
            border: 1px solid #ddd;
        }

        .rewardDetails {
            flex-grow: 1;
            margin-left: 15px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .rewardName {
            font-size: 16px;
            font-weight: bold;
            color: white;
            margin-bottom: 8px;
        }

        .rewardCost {
            font-size: 16px;
            font-weight: bold;
            color: #e67e22;
            margin-bottom: 5px;
        }

        .rewardExpire {
            font-size: 14px;
            color: #1abc9c;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .rewardItemRow {
                flex-direction: column;
                align-items: flex-start;
            }

            .rewardItemRow img {
                margin-bottom: 10px;
            }

            .rewardDetails {
                margin-left: 0;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="contentRightInfo">
        <div class="contentRightHeader">
            <h2>My Rewards</h2>
        </div>

        <!-- No record message -->
        <div id="noRecordDiv" runat="server" visible="false">
            <div class="norecord">
                <img src="image/norecord.png" alt="No Record">
                <span>No record found</span>
            </div>
        </div>

        <!-- Reward history -->
        <asp:Repeater ID="rewardHistoryRepeater" runat="server">
            <ItemTemplate>
                <div class="rewardItemRow">
                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Name") %>' />
                    <div class="rewardDetails">
                        <span class="rewardName"><%# Eval("Name") %></span>
                        <span class="rewardCost"><%# Eval("Cost") %> Bscoins</span>
                        <span class="rewardExpire">Active</span>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>