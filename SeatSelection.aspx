<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="SeatSelection.aspx.cs" Inherits="Bro_Screen_Cinemas.SeatSelection" %>



<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/SeatSelection.css">
    <style>
        nav {
            opacity: 0;
            z-index: -10;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: black;
            color: white;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .seatContent {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            width: 1500px;
        }

        h1, h2 {
            margin-top: 20px;
            color: white;
            text-align: center;
            width: 100%;
        }

        .screen {
            position: relative;
            width: 80%;
            height: 50px;
            background: radial-gradient(circle, #ffffff, #444444);
            text-align: center;
            color: white;
            font-size: 1.2rem;
            margin: 20px 10%;
            border-radius: 20px 20px 0 0;
        }

        .curve {
            position: absolute;
            width: 100%;
            height: 10px;
            background: white;
            top: -10px;
            border-radius: 50%;
        }

        .seat-layout {
            display: grid;
            grid-template-columns: repeat(4, 1fr) 1fr repeat(6, 1fr) 1fr repeat(4, 1fr); /* Left 4 + Spacer + Middle 6 + Spacer + Right 4 */
            gap: 10px;
            justify-content: center;
            width: 50%;
            margin: 0 25%;
        }

        .seat {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #333;
            border-radius: 5px;
            transition: background 0.3s;
        }

            .seat input[type="checkbox"] {
                display: none;
            }

            .seat label {
                color: white;
                cursor: pointer;
                font-size: 0.8rem;
                text-align: center;
            }

            .seat input[type="checkbox"]:checked + label {
                background-color: #9b59b6;
                color: white;
                border-radius: 5px;
                padding: 5px;
            }

        .spacer {
            grid-column: span 1; /* Spacer for aisles */
        }

        .legend {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            gap: 20px;
            width: 100%;
        }

        .legend-item {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .legend-color {
            width: 20px;
            height: 20px;
            border: 1px solid white;
        }

        .available {
            background-color: grey;
        }

        .selected {
            background-color: #9b59b6;
        }

        .occupied {
            background-color: #d35400;
        }

        .selected-seats {
            margin: 20px 10%;
            width: 80%;
            padding: 10px;
            background-color: #333;
            border-radius: 5px;
            display: none;
            justify-content: space-between;
            color: white;
        }

        .confirm-button {
            padding: 10px 20px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }

            .confirm-button:hover {
                background-color: #388e3c;
            }
    </style>
</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1"
    runat="Server">
    <div>
        <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" ShowStartingNode="True" />
        <asp:SiteMapPath ID="Breadcrumb" runat="server"/>
    </div>
    <div class="seatContent">
        <h1>Choose Your Seat</h1>
        <div class="screen">
            <div class="curve"></div>
        </div>
        <h2>SCREEN</h2>
        <div class="seat-layout">
            <!-- Dynamic seat layout will be injected here -->
        </div>
        <div class="legend">
            <div class="legend-item">
                <div class="legend-color available"></div>
                <span>Available</span>
            </div>
            <div class="legend-item">
                <div class="legend-color selected"></div>
                <span>Selected</span>
            </div>
            <div class="legend-item">
                <div class="legend-color occupied"></div>
                <span>Occupied</span>
            </div>
        </div>
        <div class="selected-seats">
            <h3>Selected Seats:</h3>
            <p id="selected-seats-list">No seats selected</p>
            <asp:Button ID="btnConfirm" runat="server" Text="Confirm" CssClass="confirm-button" OnClientClick="confirmSelection(); return false;"/>
        </div>
    </div>

<script>
    const rows = 10; // Number of rows
    const layout = [4, 6, 4]; // 4 columns left, 6 columns middle, 4 columns right

    const seatLayout = document.querySelector('.seat-layout');

    function updateSelectedSeats() {
        const selected = document.querySelectorAll('.seat input[type="checkbox"]:checked');
        const selectedSeatNumbers = Array.from(selected).map(seat => seat.nextElementSibling.textContent);

        if (selectedSeatNumbers.length > 0) {
            document.querySelector('.selected-seats').style.display = 'flex';
            document.getElementById('<%= btnConfirm.ClientID %>').style.display = 'block';
            document.getElementById('selected-seats-list').textContent = selectedSeatNumbers.join(', ');
        } else {
            document.querySelector('.selected-seats').style.display = 'none';
            document.getElementById('<%= btnConfirm.ClientID %>').style.display = 'none';
            document.getElementById('selected-seats-list').textContent = "No seats selected";
        }
    }

    function confirmSelection() {
        const selectedSeats = document.getElementById('selected-seats-list').textContent;
        localStorage.setItem('selectedSeats', selectedSeats);

        // Redirect to PeopleType.aspx with query parameters
        const queryString = window.location.search;
        const urlParams = new URLSearchParams(queryString);
        const MovieID = urlParams.get('MovieID');
        const date = urlParams.get('Date');
        const time = urlParams.get('Time');
        const cinema = urlParams.get('Cinema');

        window.location.href = `PeopleType.aspx?MovieID=${MovieID}&Date=${date}&Time=${time}&Cinema=${cinema}`;
    }

    function generateSeats() {
        for (let row = 1; row <= rows; row++) {
            let seatCounter = 1; // Start seat counter for each row

            layout.forEach((group, groupIndex) => {
                if (groupIndex > 0) {
                    // Add spacer between seat groups
                    const spacer = document.createElement('div');
                    spacer.className = 'spacer'; // Spacer for aisles
                    seatLayout.appendChild(spacer);
                }

                for (let seat = 1; seat <= group; seat++) {
                    const seatId = `row${row}-group${groupIndex + 1}-${seat}`; // Unique seat ID
                    const seatDiv = document.createElement('div');
                    seatDiv.className = 'seat';

                    seatDiv.innerHTML = `
                        <input type="checkbox" id="${seatId}" onchange="updateSelectedSeats()">
                        <label for="${seatId}">${row}-${seatCounter}</label>
                    `;
                    seatLayout.appendChild(seatDiv);

                    seatCounter++; // Increment seat number for the row
                }
            });
        }
    }

    function markOccupiedSeats() {
        const allSeats = Array.from(document.querySelectorAll('.seat input[type="checkbox"]'));
        const totalSeats = allSeats.length;
        const occupiedSeatsCount = Math.floor(totalSeats * 0.1); // 10% of seats as occupied
        const occupiedIndices = new Set();

        while (occupiedIndices.size < occupiedSeatsCount) {
            const randomIndex = Math.floor(Math.random() * allSeats.length);
            occupiedIndices.add(randomIndex);
        }

        occupiedIndices.forEach(index => {
            const seat = allSeats[index];
            seat.disabled = true;
            seat.nextElementSibling.style.backgroundColor = '#ff4d4d'; // Occupied seat color
            seat.nextElementSibling.style.color = 'white';
        });
    }

    // Generate the seat layout dynamically and mark some seats as occupied
    window.onload = () => {
        generateSeats();
        markOccupiedSeats();
    };
</script>

</asp:Content>
