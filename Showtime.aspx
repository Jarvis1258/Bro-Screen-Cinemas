<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Showtime.aspx.cs" Inherits="Bro_Screen_Cinemas.buynow" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/buynow.css" />
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
    <div class="movie-container">
        <div class="movie-details">
            <asp:Image ID="moviePoster" runat="server" />
            <h1><asp:Label ID="title" runat="server"></asp:Label></h1>
            <p>Release Date: <asp:Label ID="releaseDate" runat="server"></asp:Label></p>
            <p>Spoken Language: <asp:Label ID="language" runat="server"></asp:Label></p>
            <p>Duration: <asp:Label ID="duration" runat="server"></asp:Label></p>
            <p>Subtitles: <asp:Label ID="subtitles" runat="server"></asp:Label></p>
            <p>Genre: <asp:Label ID="genre" runat="server"></asp:Label></p>
            <p>Classification: <asp:Label ID="classification" runat="server"></asp:Label></p>
        </div>
        <div class="date-selector">
            <h2>Select Date</h2>
            <div id="dates"></div>
        </div>
    </div>

    <div class="cinema-showtimes">
        <h2>Select Cinemas & Time</h2>
        <div id="cinema-list"></div>
    </div>

    <script>
        // Function to update the cinema list based on selected date
        function updateCinemaList(date) {
            const cinemaList = document.getElementById('cinema-list');
            cinemaList.innerHTML = ''; // Clear previous entries

            if (showtimeData[date]) {
                // Group showtimes by cinema
                const cinemaGrouped = {};
                showtimeData[date].forEach(cinema => {
                    if (!cinemaGrouped[cinema.cinema]) {
                        cinemaGrouped[cinema.cinema] = [];
                    }
                    cinemaGrouped[cinema.cinema].push(cinema.time);
                });

                // Display showtimes grouped by cinema
                Object.keys(cinemaGrouped).forEach(cinemaName => {
                    const cinemaDiv = document.createElement('div');
                    cinemaDiv.className = 'cinema-category';

                    // Cinema Name
                    const cinemaHeader = document.createElement('h3');
                    cinemaHeader.textContent = cinemaName; // Cinema name and city
                    cinemaDiv.appendChild(cinemaHeader);

                    // Showtime container
                    const showtimeDiv = document.createElement('div');
                    showtimeDiv.className = 'showtimes';

                    cinemaGrouped[cinemaName].forEach(time => {
                        const formattedTime = convertTo12HourFormat(time); // Convert to 12-hour format
                        const timeDiv = document.createElement('div');
                        timeDiv.className = 'showtime';
                        timeDiv.textContent = formattedTime;

                        // Redirect to SeatSelection.aspx with query parameters
                        timeDiv.addEventListener('click', () => {
                            const queryString = window.location.search;
                            const urlParams = new URLSearchParams(queryString);
                            const MovieID = urlParams.get('MovieID');

                            window.location.href = `SeatSelection.aspx?MovieID=${MovieID}&Date=${date}&Time=${time}&Cinema=${cinemaName}`;
                        });

                        showtimeDiv.appendChild(timeDiv);
                    });

                    cinemaDiv.appendChild(showtimeDiv);
                    cinemaList.appendChild(cinemaDiv);
                });
            } else {
                const noShowtimes = document.createElement('p');
                noShowtimes.textContent = 'No showtimes available for this date.';
                cinemaList.appendChild(noShowtimes);
            }
        }

        // Helper function to convert time to 12-hour format
        function convertTo12HourFormat(time) {
            const [hour, minute] = time.split(':');
            let hours = parseInt(hour, 10);
            const suffix = hours >= 12 ? 'PM' : 'AM';
            hours = hours % 12 || 12; // Convert 0 to 12 for midnight
            return `${hours}:${minute} ${suffix}`;
        }

        // Generate selectable dates
        const today = new Date();
        for (let i = 0; i < 5; i++) {
            const date = new Date(today);
            date.setDate(today.getDate() + i);
            const dateDiv = document.createElement('div');
            const formattedDate = date.toISOString().split('T')[0];
            dateDiv.setAttribute('data-date', formattedDate);
            dateDiv.textContent = date.toLocaleDateString('en-US', { weekday: 'short', day: 'numeric', month: 'short' });
            document.getElementById('dates').appendChild(dateDiv);
        }

        // Event listener for date selection
        document.getElementById('dates').addEventListener('click', (e) => {
            if (e.target.tagName === 'DIV') {
                const selectedDate = e.target.getAttribute('data-date');
                updateCinemaList(selectedDate);
            }
        });
    </script>
</asp:Content>