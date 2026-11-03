<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Staff.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Bro_Screen_Cinemas.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>   
        .report-summary {
            display: flex;
            justify-content: space-between;
            margin: 30px;
        }

        .summary-card {
            background-color: #fff;
            width: 23%;
            padding: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
            transition: transform 0.2s;
        }

            .summary-card:hover {
                transform: translateY(-5px);
            }

            .summary-card h3 {
                font-size: 18px;
                color: #555;
            }

            .summary-card p {
                font-size: 24px;
                color: #007bff;
            }

        .report-section {
            margin-bottom: 30px;
        }

            .report-section h3 {
                margin-bottom: 15px;
                color: #333;
                font-size: 22px;
            }

            .report-section .data-table {
                background-color: #fff;
                width: 100%;
                border-collapse: collapse;
                border-radius: 10px;
                overflow: hidden;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

        .data-table th, .data-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        .data-table th {
            background-color: #007bff;
            color: #fff;
        }

        .data-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .data-table tr:hover {
            background-color: #f1f1f1;
        }

        .report-form label {
            font-size: 1rem;
            color: #555;
        }

        .report-form input,
        .report-form select,
        .report-form button {
            padding: 10px 20px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            outline: none;
        }

            .report-form input[type="date"],
            .report-form select {
                width: 15%;
            }

        .report-form button {
            width: 15%;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

            .report-form button:hover {
                background-color: #45a049;
            }

        /* Revenue Report Section Styling */
        .revenue-details {
            margin-top: 20px;
            background-color: #eef7ef;
            padding: 15px;
            border-radius: 8px;
            border: 1px solid #c4e0c1;
        }

            .revenue-details h4 {
                font-size: 1.25rem;
                color: #333;
                margin-bottom: 10px;
            }

            .revenue-details p {
                font-size: 1rem;
                color: #555;
                margin: 5px 0;
            }

                .revenue-details p:first-of-type {
                    font-weight: bold;
                }

        .report-chart {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

            .report-chart h3 {
                font-size: 22px;
                color: #333;
                margin-bottom: 20px;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content">
        <div class="header">
            <h1>Reports</h1>
        </div>

        <div class="report-summary">
            <div class="summary-card">
                <h3>Daily Revenue</h3>
                <p>$1,500</p>
            </div>
            <div class="summary-card">
                <h3>Monthly Revenue</h3>
                <p>$45,000</p>
            </div>
            <div class="summary-card">
                <h3>Total Tickets Sold</h3>
                <p>10,200</p>
            </div>
            <div class="summary-card">
                <h3>Total Users</h3>
                <p>2,000</p>
            </div>
        </div>

        <div class="report-section">
            <h3>Revenue Breakdown</h3>
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Total Revenue</th>
                        <th>Tickets Sold</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>2024-12-23</td>
                        <td>$1,500</td>
                        <td>300</td>
                    </tr>
                    <tr>
                        <td>2024-12-22</td>
                        <td>$1,400</td>
                        <td>280</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="report-section">
            <h3>Top Performing Movies</h3>
            <table class="data-table">
                <thead>
                    <tr>
                        <th>Movie Title</th>
                        <th>Revenue</th>
                        <th>Tickets Sold</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Avengers</td>
                        <td>$10,000</td>
                        <td>500</td>
                    </tr>
                    <tr>
                        <td>Inception</td>
                        <td>$8,000</td>
                        <td>400</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <div class="report-section">
            <h3>Generate Custom Report</h3>
            <form class="report-form">
                <label for="start-date">Start Date:</label>
                <input type="date" id="start-date">

                <label for="end-date">End Date:</label>
                <input type="date" id="end-date">

                <label for="movie">Movie:</label>
                <select id="movie">
                    <option value="all">All Movies</option>
                    <option value="movie1">Movie 1</option>
                    <option value="movie2">Movie 2</option>
                </select>

                <label for="theater">Theater:</label>
                <select id="theater">
                    <option value="all">All Theaters</option>
                    <option value="theater1">Theater 1</option>
                    <option value="theater2">Theater 2</option>
                </select>

                <button type="submit">Generate Report</button>
            </form>
        </div>

        <div class="report-chart">
            <h3>Booking Chart</h3>
            <canvas id="report-chart"></canvas>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        var ctx = document.getElementById('report-chart').getContext('2d');
        var bookingChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
                datasets: [{
                    label: 'Bookings This Week',
                    data: [10, 19, 3, 5, 2, 3, 7],
                    borderColor: 'rgba(75, 192, 192, 1)',
                    tension: 0.1
                }]
            }
        });
    </script>
</asp:Content>
