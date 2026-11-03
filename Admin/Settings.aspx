<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Staff.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="Bro_Screen_Cinemas.Settings1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border: none;
        }

        /* Section styles */
        .settings-section {
            margin-bottom: 30px;
            padding: 20px;
            background-color: #ecf0f1;
            border-radius: 5px;
        }

            .settings-section h3 {
                font-size: 24px;
                margin-bottom: 20px;
                color: #34495e;
                cursor: pointer;
            }

            .settings-section .active {
                color: #1abc9c;
            }

        .section-content {
            display: none;
        }

            .section-content.hidden {
                display: block;
            }

        /* Form styles */
        .settings-form label {
            display: block;
            font-size: 16px;
            margin-bottom: 8px;
            color: #2c3e50;
        }

        .settings-form input,
        .settings-form select,
        .settings-form button {
            width: 99%;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #bdc3c7;
        }

        .settings-form button {
            width: auto;
        }

        .settings-form input[type="file"],
        .settings-form input[type="checkbox"] {
            width: auto;
            display: inline-block;
        }

        .settings-form button {
            background-color: #1abc9c;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

            .settings-form button:hover {
                background-color: #16a085;
            }

        /* Danger button for maintenance actions */
        .danger-button {
            background-color: #e74c3c;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

            .danger-button:hover {
                background-color: #c0392b;
            }

        /* List for existing categories or keys */
        .settings-section ul {
            list-style-type: none;
            padding: 0;
        }

            .settings-section ul li {
                background-color: #ffffff;
                padding: 10px;
                margin-bottom: 8px;
                border-radius: 5px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border: 1px solid #bdc3c7;
            }

                .settings-section ul li button {
                    background-color: #3498db;
                    color: white;
                    border: none;
                    padding: 5px 10px;
                    border-radius: 5px;
                    cursor: pointer;
                }

                    .settings-section ul li button:hover {
                        background-color: #2980b9;
                    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content">
        <div class="header">
            <h1>Settings</h1>
            <div class="user-info">
                <img src="image/profile.png" width="25" />
                <asp:Label ID="lblUsername" runat="server"></asp:Label>
                <asp:LoginStatus ID="LoginStatus1" runat="server" />
            </div>
        </div>

        <!-- Profile Settings -->
        <div class="settings-section">
            <h3 class="section-header">Profile Settings</h3>
            <div class="section-content">
                <div class="settings-form">
                    <label for="profile-picture">Profile Picture:</label>
                    <input type="file" id="profile-picture">

                    <label for="admin-name">Full Name:</label>
                    <input type="text" id="admin-name" value="Admin Name">

                    <label for="admin-email">Email:</label>
                    <input type="email" id="admin-email" value="admin@example.com">

                    <button type="submit">Update Profile</button>
                </div>
            </div>
        </div>

        <!-- Change Password -->
        <div class="settings-section">
            <h3 class="section-header">Change Password</h3>
            <div class="section-content">
                <div class="settings-form">
                    <label for="current-password">Current Password:</label>
                    <input type="password" id="current-password" placeholder="Enter current password">

                    <label for="new-password">New Password:</label>
                    <input type="password" id="new-password" placeholder="Enter new password">

                    <label for="confirm-password">Confirm New Password:</label>
                    <input type="password" id="confirm-password" placeholder="Confirm new password">

                    <button type="submit">Change Password</button>
                </div>
            </div>
        </div>

        <!-- System Preferences -->
        <div class="settings-section">
            <h3 class="section-header">System Preferences</h3>
            <div class="section-content">
                <div class="settings-form">
                    <label for="timezone">Timezone:</label>
                    <select id="timezone">
                        <option value="UTC">UTC</option>
                        <option value="PST">PST</option>
                        <option value="EST">EST</option>
                    </select>

                    <label for="currency">Currency:</label>
                    <select id="currency">
                        <option value="USD">USD</option>
                        <option value="EUR">EUR</option>
                        <option value="GBP">GBP</option>
                    </select>

                    <button type="submit">Save Preferences</button>
                </div>
            </div>
        </div>

        <!-- Notification Settings -->
        <div class="settings-section">
            <h3 class="section-header">Notification Settings</h3>
            <div class="section-content">
                <div class="settings-form">
                    <label>
                        <input type="checkbox" checked>
                        Email Notifications
                    </label>
                    <label>
                        <input type="checkbox">
                        SMS Notifications
                    </label>
                    <label>
                        <input type="checkbox" checked>
                        Push Notifications
                    </label>
                    <button type="submit">Update Notifications</button>
                </div>
            </div>
        </div>

        <!-- Maintenance -->
        <div class="settings-section">
            <h3 class="section-header">Maintenance</h3>
            <div class="section-content">
                <button class="danger-button">Clear Cache</button>
                <button class="danger-button">Reset Database</button>
            </div>
        </div>

    </div>

    <script>
        // JavaScript to toggle visibility of section content
        const headers = document.querySelectorAll('.section-header');

        headers.forEach(header => {
            header.addEventListener('click', () => {
                const content = header.nextElementSibling;
                content.classList.toggle('hidden');
                header.classList.toggle('active');
            });
        });
    </script>
</asp:Content>
