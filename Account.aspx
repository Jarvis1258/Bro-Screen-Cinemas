<%@ Page Language="C#" MasterPageFile="~/Account.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="Bro_Screen_Cinemas.Account" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* My tickets */
        .ticketDetails, .ticket > h3 {
            width: 100%;
            margin-left: 30px;
        }

        .ticket {
            background-image: url(/image/ticketbg.png);
            background-repeat: no-repeat;
            width: 400px;
            height: 620px;
            margin: 0 10px;
        }

            .ticket img {
                width: 100px;
                height: 100px;
                display: block;
                margin: auto;
            }

        .ticketDetails {
            display: flex;
            flex-wrap: wrap;
            line-height: normal;
        }

            .ticketDetails > div {
                width: 100%;
                margin-top: 10px;
            }

                .ticketDetails > div:nth-of-type(1) {
                    margin-bottom: 20px;
                }

                .ticketDetails > div:nth-of-type(2), .ticketDetails > div:nth-of-type(3) {
                    width: 50%;
                }

                .ticketDetails > div > span {
                    color: rgba(255, 255, 255, 0.3);
                    line-height: 2;
                }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="contentRightInfo">
        <div class="contentRightHeader">
            <h2>My Tickets</h2>
        </div>
        <div class="ticket">
            <h3>Death Whisperer 2</h3>
            <div>
                <img src="image/qrcode.png" alt="qrcode" />
            </div>
            <div class="ticketDetails">
                <div class="cinema">
                    <span>Cinema</span>
                    <br />
                    Kuala Lumpur - Melawati
                <br />
                </div>
                <div class="date">
                    <span>Date</span><br />
                    Sun 01 Dec<br />
                </div>
                <div class="time">
                    <span>Time</span><br />
                    4:55PM<br />
                </div>
                <div class="hall">
                    <span>Hall</span><br />
                    HALL 3<br />
                </div>
                <div class="type">
                    <span>Ticket Type</span><br />
                    Adult-MBR : 4<br />
                </div>
                <div class="seat">
                    <span>Seat(s)</span><br />
                    E02,E03,E04,E05<br />
                </div>
            </div>
        </div>
        <div class="ticket">
            <h3>Death Whisperer 2</h3>
            <img src="image/qrcode.png" alt="qrcode" />
            <div class="ticketDetails">
                <div class="cinema">
                    <span>Cinema</span>
                    <br />
                    Kuala Lumpur - Melawati
                <br />
                </div>
                <div class="date">
                    <span>Date</span><br />
                    Sun 01 Dec<br />
                </div>
                <div class="time">
                    <span>Time</span><br />
                    4:55PM<br />
                </div>
                <div class="hall">
                    <span>Hall</span><br />
                    HALL 3<br />
                </div>
                <div class="type">
                    <span>Ticket Type</span><br />
                    Adult-MBR : 4<br />
                </div>
                <div class="seat">
                    <span>Seat(s)</span><br />
                    E02,E03,E04,E05<br />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
