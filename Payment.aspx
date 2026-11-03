<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Bro_Screen_Cinemas.Payment" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Page</title>
    <link rel="stylesheet" href="css/Payment.css?v=<%= DateTime.Now.Ticks %>">
</head>

<body>
    <form id="form1" runat="server">
        <div class="movie-description">
            <asp:Image ID="moviePoster" runat="server" />
            <div class="movie-info">
                <h2>
                    <asp:Label ID="lblTitle" runat="server"></asp:Label></h2>
                <p>
                    <asp:Label ID="lblDuration" runat="server"></asp:Label>
                    |
                    <asp:Label ID="lblGenre" runat="server"></asp:Label></p>
                <p>
                    <asp:Label ID="lblClassification" runat="server"></asp:Label></p>
                <div class="details">
                    <p><strong>Location: </strong>
                        <asp:Label ID="lblLocation" runat="server"></asp:Label></p>
                    <p><strong>Date & Time: </strong>
                        <asp:Label ID="lblDate" runat="server"></asp:Label></p>
                </div>
            </div>
        </div>

        <section class="section" id="seats-section">
            <h2>Chosen Seats</h2>
            <p id="chosen-seats">Loading...</p>
            <input type="hidden" id="hiddenSeat" name="hiddenSeat" />
        </section>

        <div class="section">
            <h2>Food & Beverage</h2>
            <ul id="food-list" class="item-list"></ul>
            <input type="hidden" id="hiddenFood" name="hiddenFood" />
        </div>

        <div class="section">
            <h2>People Types</h2>
            <ul id="people-list" class="people-list"></ul>
            <input type="hidden" id="hiddenPeople" name="hiddenPeople" />
        </div>

        <section class="section">
            <div class="payment-methods">
                <h2>Payment Methods</h2>
                <div class="payment-method">
                    <input type="radio" name="payment-method" id="credit-card" value="Credit Card" onchange="selectPaymentMethod(this)">
                    <label for="credit-card">Credit/Debit Card</label>
                    <div class="payment-details" id="credit-card-details">
                        <label>Card Number:</label>
                        <input type="text" placeholder="1234 5678 9012 3456">
                        <label>Expiry Date:</label>
                        <input type="text" placeholder="MM/YY">
                        <label>CVV:</label>
                        <input type="text" placeholder="123">
                    </div>
                </div>
                <div class="payment-method">
                    <input type="radio" name="payment-method" id="online-banking" value="Online Banking" onchange="selectPaymentMethod(this)">
                    <label for="online-banking">Online Banking</label>
                    <div class="payment-details" id="online-banking-details">
                        <label>Select Bank:</label>
                        <select>
                            <option value="maybank">Maybank</option>
                            <option value="cimb">CIMB</option>
                            <option value="rhb">RHB</option>
                        </select>
                    </div>
                </div>
                <div class="payment-method">
                    <input type="radio" name="payment-method" id="e-wallet" value="E-Wallet" onchange="selectPaymentMethod(this)">
                    <label for="e-wallet">E-Wallet</label>
                    <div class="payment-details" id="e-wallet-details">
                        <label>Select E-Wallet:</label>
                        <select>
                            <option value="grabpay">GrabPay</option>
                            <option value="touchngo">Touch 'n Go</option>
                            <option value="boost">Boost</option>
                        </select>
                    </div>
                </div>
            </div>
        </section>

        <div class="total-container">
            <div class="total-line"></div>
            <div class="total-row">
                <span class="total-label">Total</span>
                <span class="total-amount">RM <span id="grand-total">0.00</span></span>
            </div>
            <div class="total-line"></div>
        </div>

        <input type="hidden" id="grandTotal" name="grandTotal" />
        <input type="hidden" id="payment-method" name="payment-method" />

        <div id="button-container">
            <asp:Button ID="btnConfirm" runat="server" Text="Confirm Payment" OnClientClick="confirmPayment()" OnClick="btnConfirm_Click" CssClass="confirm-button" />
            <button type="button" class="cancel-button" OnClick="cancelPayment()">Cancel Payment</button>
        </div>

    </form>

    <script>
        function selectPaymentMethod(input) {
            document.querySelectorAll('.payment-details').forEach(detail => {
                detail.style.display = 'none';
            });

            const selectedDetailsId = `${input.id}-details`;
            const selectedDetails = document.getElementById(selectedDetailsId);

            if (selectedDetails) {
                selectedDetails.style.display = 'block';
            }
        }

        function loadPaymentDetails() {
            // Retrieve selected seats from localStorage
            const seats = localStorage.getItem('selectedSeats') || 'No seats selected';
            document.getElementById('chosen-seats').textContent = seats;
            document.getElementById('hiddenSeat').value = seats;

            // Retrieve food items from localStorage
            const foodCart = JSON.parse(localStorage.getItem('cart')) || [];
            const foodList = document.getElementById('food-list');
            foodList.innerHTML = ''; // Clear the list
            let foodSummary = [];
            let foodTotal = 0;

            foodCart.forEach(item => {
                const li = document.createElement('li');
                li.textContent = `${item.name} x ${item.quantity} - RM ${(item.price * item.quantity).toFixed(2)}`;
                foodList.appendChild(li);
                foodSummary.push(`${item.name} x ${item.quantity}`);
                foodTotal += item.price * item.quantity;
            });

            document.getElementById('hiddenFood').value = foodSummary.join(', ');

            // Retrieve people types from localStorage
            const peopleTypes = JSON.parse(localStorage.getItem('peopleTypes')) || [];
            const peopleList = document.getElementById('people-list');
            peopleList.innerHTML = ''; // Clear the list
            let peopleSummary = [];
            let peopleTotal = 0;

            peopleTypes.forEach(person => {
                if (person.quantity > 0) {
                    const li = document.createElement('li');
                    li.textContent = `${person.type} x ${person.quantity} - RM ${(person.price * person.quantity).toFixed(2)}`;
                    peopleList.appendChild(li);
                    peopleSummary.push(`${person.type} x ${person.quantity}`);
                    peopleTotal += person.price * person.quantity;
                }
            });

            document.getElementById('hiddenPeople').value = peopleSummary.join(', ');

            // Calculate grand total
            const grandTotal = foodTotal + peopleTotal;
            document.getElementById('grand-total').textContent = grandTotal.toFixed(2);
            document.getElementById('grandTotal').value = grandTotal.toFixed(2);
        }

        function confirmPayment() {
            const selectedPaymentMethod = document.querySelector('input[name="payment-method"]:checked');
            if (!selectedPaymentMethod) {
                alert('Please select a payment method before confirming.');
                return;
            }

            alert(`Payment confirmed using ${selectedPaymentMethod.value}!`);
            localStorage.removeItem('visitedFoodMenu');
            localStorage.clear();
            window.location.href = 'homepage.aspx';
        }

        function cancelPayment() {
            if (confirm('Are you sure you want to cancel the payment? All selections will be cleared.')) {
                localStorage.removeItem('visitedFoodMenu');
                localStorage.clear();
                alert('Payment has been canceled.');
                window.location.href = 'homepage.aspx';
            }
        }

        // Load data when the page is loaded
        window.addEventListener('load', function () {
            loadPaymentDetails();
        });
    </script>
</body>

</html>
