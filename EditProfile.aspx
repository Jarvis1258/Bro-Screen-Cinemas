<%@ Page Language="C#" MasterPageFile="~/Account.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="Bro_Screen_Cinemas.EditProfile" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Form Labels and Inputs */
        input[type="text"],
        input[type="password"],
        input[type="date"],
        select,
        textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="date"]:focus,
        select:focus {
            border-color: #3498db;
            outline: none;
        }

        /* Buttons */
        button,
        input[type="submit"],
        input[type="button"] {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 15px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 5px 2px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

            button:hover,
            input[type="submit"]:hover,
            input[type="button"]:hover {
                background-color: #2980b9;
            }

        /* Status Label */
        label#lblStatus {
            display: block;
            font-size: 14px;
            margin-top: 10px;
        }

        /* Profile Picture Section */
        .image-container {
            text-align: center;
            margin-bottom: 20px;
        }

        /* Image Upload Section */
        .display-image-upload {
            display: block;
            margin-bottom: 20px;
        }

        .hide-image-upload {
            display: none;
            margin-bottom: 20px;
        }

        /* DropDown and CheckBoxList Styling */
        select {
            width: 100%;
        }

        .readOnly {
            background-color: rgb(150, 150, 150);
        }

        .payment-methods-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

            .payment-methods-table th,
            .payment-methods-table td {
                border-bottom: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            .payment-methods-table th {
                font-weight: bold;
                color: #ffdd60;
                text-align: center;
            }

            .payment-methods-table tr:hover {
                background-color: rgba(255,255,255,0.2);
            }

            .payment-methods-table button {
                padding: 5px 10px;
                margin: 0 5px;
                border: none;
                background-color: #007bff;
                color: white;
                border-radius: 4px;
                cursor: pointer;
            }

                .payment-methods-table button:hover {
                    background-color: #0056b3;
                }

        #ContentPlaceHolder1_btnAddPaymentMethod {
            display: block;
            margin: 20px auto;
            background-color: #28a745;
            color: #fff;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .contentRightInfo {
                padding: 15px;
            }

            input[type="text"],
            input[type="password"],
            input[type="date"],
            select,
            textarea {
                padding: 8px;
                font-size: 13px;
            }

            button,
            input[type="submit"],
            input[type="button"] {
                padding: 8px 12px;
                font-size: 13px;
            }

            .btnContainer {
                display: flex;
                justify-content: space-between;
                width: 100%;
            }
        }
    </style>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="contentRightInfo">
        <div class="contentRightHeader">
            <h2>Edit Profile</h2>
        </div>
        <div>
            <!-- Profile Picture Display -->
            <div class="image-container">
                <asp:Image ID="imgProfilePic" runat="server" Width="150px" Height="150px" />
                <br />
                <!-- Change Profile Picture Button -->
                <asp:Button ID="btnChangePic" runat="server" Text="Change Profile Picture" OnClientClick="changePic(); return false;"/>
            </div>

            <!-- Profile Picture Upload (Initially Hidden) -->
            <div class="hide-image-upload" id="imageUploadDiv" runat="server">
                <asp:Label ID="lblProfilePic" runat="server" Text="Profile Picture:"></asp:Label>
                <asp:FileUpload ID="fileProfilePic" runat="server" />
                <br />
            </div>

            <!-- Full Name -->
            <asp:Label ID="lblFullName" runat="server" Text="Full Name:"></asp:Label>
            <asp:TextBox ID="txtFullName" runat="server"></asp:TextBox>
            <br />

            <!-- Email -->
            <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            <br />

            <!-- Phone Number -->
            <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number:"></asp:Label>
            <asp:TextBox ID="txtPhoneNumber" runat="server"></asp:TextBox>
            <br />

            <!-- Date of Birth -->
            <asp:Label ID="lblDateOfBirth" runat="server" Text="Date of Birth:"></asp:Label>
            <asp:TextBox ID="txtDateOfBirth" runat="server" TextMode="Date"></asp:TextBox>
            <br />

            <!-- Favorite Genres -->
            <asp:Label ID="lblFavoriteGenres" runat="server" Text="Favorite Genres:"></asp:Label>
            <asp:CheckBoxList ID="chkFavoriteGenres" runat="server">
            </asp:CheckBoxList>
            <br />

            <!-- Preferred Cinema -->
            <asp:Label ID="lblPreferredCinema" runat="server" Text="Preferred Cinema:"></asp:Label>
            <asp:DropDownList ID="ddlPreferredCinema" runat="server">
                <asp:ListItem Text="Select Cinema" Value="" />
                <asp:ListItem Text="Cinema A" Value="CinemaA" />
                <asp:ListItem Text="Cinema B" Value="CinemaB" />
                <asp:ListItem Text="Cinema C" Value="CinemaC" />
            </asp:DropDownList>
            <br />

            <!-- Notification Preferences -->
            <asp:Label ID="lblNotificationPreferences" runat="server" Text="Notification Preferences:"></asp:Label>
            <asp:CheckBoxList ID="chkNotificationPreferences" runat="server">
                <asp:ListItem Text="Email Notifications" Value="Email" />
                <asp:ListItem Text="SMS Notifications" Value="SMS" />
                <asp:ListItem Text="Push Notifications" Value="Push" />
            </asp:CheckBoxList>

            <!-- Payment Method-->
            <div class="form-section">
                <h3>Payment Methods</h3>
                <table class="payment-methods-table">
                    <thead>
                        <tr>
                            <th>Payment Type</th>
                            <th>Details</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Sample Card Payment -->
                        <tr>
                            <td>Card Payment</td>
                            <td>
                                <strong>Cardholder Name:</strong> John Doe
                                <br />
                                <strong>Card Number:</strong> **** **** **** 1234
                                <br />
                                <strong>Expiry Date:</strong> 12/25
                            </td>

                            <td>
                                <button type="button" onclick="editPaymentMethod('Card', 1)">Edit</button>
                                <button type="button" onclick="deletePaymentMethod(1)">Delete</button>
                            </td>
                        </tr>
                        <!-- Sample Online Banking -->
                        <tr>
                            <td>Online Banking</td>
                            <td>
                                <strong>Bank Name:</strong> Bank A
                                <br />
                                <strong>Account Number:</strong> 987654321
                            </td>
                            <td>
                                <button type="button" onclick="editPaymentMethod('Banking', 2)">Edit</button>
                                <button type="button" onclick="deletePaymentMethod(2)">Delete</button>
                            </td>
                        </tr>
                        <!-- Sample E-Wallet -->
                        <tr>
                            <td>E-Wallet</td>
                            <td>
                                <strong>Provider:</strong> PayPal
                                <br />
                                <strong>Account:</strong> john.doe@example.com
                            </td>
                            <td>
                                <button type="button" onclick="editPaymentMethod('EWallet', 3)">Edit</button>
                                <button type="button" onclick="deletePaymentMethod(3)">Delete</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <asp:Button ID="btnAddPaymentMethod" runat="server" Text="+ Add Payment Method" />
            </div>

            <br />

            <asp:Label ID="lblAccountCreationDate" runat="server" Text="Account Creation Date:"></asp:Label>
            <asp:TextBox ID="txtAccountCreationDate" runat="server" ReadOnly="true" CssClass="readOnly"></asp:TextBox>
            <br />
            <br />

            <asp:Label ID="lblLastLoginDate" runat="server" Text="Last Login Date:"></asp:Label>
            <asp:TextBox ID="txtLastLoginDate" runat="server" ReadOnly="true" Text="1234" CssClass="readOnly"></asp:TextBox>
            <br />

            <!-- Submit and Cancel Buttons -->
            <div class="btnContainer">
                <asp:Button ID="btnSave" runat="server" Text="Save Changes" OnClientClick="return confirm('Are you sure you want to update the profile?')" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
            </div>
            <br />
            <br />

            <!-- Status Message -->
            <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
    <script>
        function changePic() {
            const imageUploadDiv = document.getElementById('ContentPlaceHolder1_imageUploadDiv');
            // Toggle the display property
            if (imageUploadDiv.classList.contains('display-image-upload')) {
                imageUploadDiv.classList.replace('display-image-upload', 'hide-image-upload');
            } else {
                imageUploadDiv.classList.replace('hide-image-upload', 'display-image-upload');
            }

        };
    </script>
</asp:Content>
