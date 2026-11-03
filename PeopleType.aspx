<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="PeopleType.aspx.cs" Inherits="Bro_Screen_Cinemas.PeopleType" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/PeopleType.css?v=<%= DateTime.Now.Ticks %>" />
    <style>
        nav {
            opacity: 0;
            z-index: -10;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" ShowStartingNode="True" />
        <asp:SiteMapPath ID="Breadcrumb" runat="server"/>
    </div>
    <main id="PeopleType-body">
        <div>
            <h1>Please Select Your Category</h1>
            <div class="selected-seats">
                <h3>Your Selected Seats:</h3>
                <p id="selected-seats-list">No seats selected.</p>
            </div>
            <div class="people-types" id="people-types">
                <!-- People Type Selection -->
                <div class="people-type">
                    <span>Adult <span class="price">(RM20)</span></span>
                    <div>
                        <button type="button" onclick="adjustCount('adult', -1)">-</button>
                        <span id="adult-count">0</span>
                        <button type="button" onclick="adjustCount('adult', 1)">+</button>
                    </div>
                </div>
                <div class="people-type">
                    <span>Children <span class="price">(RM10)</span></span>
                    <div>
                        <button type="button" onclick="adjustCount('children', -1)">-</button>
                        <span id="children-count">0</span>
                        <button type="button" onclick="adjustCount('children', 1)">+</button>
                    </div>
                </div>
                <div class="people-type">
                    <span>Senior <span class="price">(RM10)</span></span>
                    <div>
                        <button type="button" onclick="adjustCount('senior', -1)">-</button>
                        <span id="senior-count">0</span>
                        <button type="button" onclick="adjustCount('senior', 1)">+</button>
                    </div>
                </div>
                <div class="people-type">
                    <span>OKU <span class="price">(RM10)</span></span>
                    <div>
                        <button type="button" onclick="adjustCount('oku', -1)">-</button>
                        <span id="oku-count">0</span>
                        <button type="button" onclick="adjustCount('oku', 1)">+</button>
                    </div>
                </div>
            </div>
            <div class="total-amount" id="total-amount">Total Amount: RM0</div>
            <div class="confirmContainer">
                <button type="button" id="fnb" class="confirm-button" onclick="confirmAllocation('FoodMenu.aspx?MovieID=')">Fnb Add Ons</button>
                <button type="button" id="noFnb" class="confirm-button" onclick="confirmAllocation('Payment.aspx?MovieID=')">Proceed without FnB</button>
            </div>
        </div>

        <script>
            // Retrieve selected seats and initialize totalSeats
            const selectedSeats = localStorage.getItem('selectedSeats') || "";
            const totalSeats = selectedSeats.split(',').filter(seat => seat.trim() !== "").length;

            // Display selected seats
            const displayElement = document.getElementById('selected-seats-list');
            displayElement.textContent = selectedSeats || "No seats selected.";

            // Initialize counts and prices
            const counts = { adult: 0, children: 0, senior: 0, oku: 0 };
            const prices = { adult: 20, children: 10, senior: 10, oku: 10 };

            // Update total amount
            function updateTotalAmount() {
                const totalAmount = Object.keys(counts).reduce((sum, type) => sum + counts[type] * prices[type], 0);
                document.getElementById('total-amount').textContent = `Total Amount: RM${totalAmount}`;
            }

            // Adjust count for a specific type
            function adjustCount(type, delta) {
                const currentTotal = Object.values(counts).reduce((sum, value) => sum + value, 0);

                if (delta > 0 && currentTotal >= totalSeats) {
                    alert('You cannot allocate more than the total number of seats selected.');
                    return;
                }

                if (counts[type] + delta >= 0) {
                    counts[type] += delta;
                    document.getElementById(`${type}-count`).textContent = counts[type];
                    updateTotalAmount();
                }
            }

            // Confirm allocation and navigate
            function confirmAllocation(page) {
                const currentTotal = Object.values(counts).reduce((sum, value) => sum + value, 0);

                if (currentTotal < totalSeats) {
                    alert(`You have allocated only ${currentTotal} out of ${totalSeats} seats. Please adjust.`);
                    return;
                }

                const peopleSelection = {
                    adult: counts.adult,
                    children: counts.children,
                    senior: counts.senior,
                    oku: counts.oku
                };

                localStorage.setItem('peopleTypes', JSON.stringify([
                    { type: 'Adult', quantity: counts.adult, price: prices.adult },
                    { type: 'Children', quantity: counts.children, price: prices.children },
                    { type: 'Senior', quantity: counts.senior, price: prices.senior },
                    { type: 'OKU', quantity: counts.oku, price: prices.oku }
                ]));

                const queryString = window.location.search;
                const urlParams = new URLSearchParams(queryString);
                const MovieID = urlParams.get('MovieID');
                const date = urlParams.get('Date');
                const time = urlParams.get('Time');
                const cinema = urlParams.get('Cinema');

                window.location.href = page + MovieID + "&Date=" + date + "&Time=" + time + "&Cinema=" + cinema;
            }

            // Initialize total amount on load
            updateTotalAmount();
        </script>
    </main>
</asp:Content>