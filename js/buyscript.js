// Sample data for cinemas and showtimes
const showtimeData = {
    "2024-12-26": [
        {
            cinema: "Kuala Lumpur - Mid Valley Megamall",
            showtimes: ["2:05PM", "6:10PM", "10:15PM"]
        },
        {
            cinema: "Kuala Lumpur - LaLaport BBCC",
            showtimes: ["2:40PM", "9:00PM"]
        }
    ],
    "2024-12-27": [
        {
            cinema: "Kuala Lumpur - EkoCheras Mall",
            showtimes: ["1:20PM", "8:00PM"]
        },
        {
            cinema: "Kuala Lumpur - MyTown",
            showtimes: ["3:50PM", "7:50PM"]
        }
    ],
    "2024-12-28": [
        {
            cinema: "Kuala Lumpur - Setapak Central",
            showtimes: ["7:25PM"]
        },
        {
            cinema: "Petaling Jaya - 1 Utama",
            showtimes: ["4:00PM"]
        }
    ],
    "2024-12-29": [
        {
            cinema: "Kuala Lumpur - Mid Valley Megamall",
            showtimes: ["2:05PM", "6:10PM", "10:15PM"]
        },
        {
            cinema: "Kuala Lumpur - LaLaport BBCC",
            showtimes: ["2:40PM", "9:00PM"]
        }
    ],
    "2024-12-30": [
        {
            cinema: "Kuala Lumpur - Setapak Central",
            showtimes: ["7:25PM"]
        },
        {
            cinema: "Petaling Jaya - 1 Utama",
            showtimes: ["4:00PM"]
        }
    ]
};

// Function to update cinemas and showtimes
function updateCinemaList(date) {
    const cinemaList = document.getElementById('cinema-list');
    cinemaList.innerHTML = ''; // Clear previous entries

    if (showtimeData[date]) {
        showtimeData[date].forEach(cinema => {
            const cinemaDiv = document.createElement('div');
            cinemaDiv.className = 'cinema';

            const cinemaName = document.createElement('h3');
            cinemaName.textContent = cinema.cinema;
            cinemaDiv.appendChild(cinemaName);

            const showtimeDiv = document.createElement('div');
            showtimeDiv.className = 'showtimes';

            cinema.showtimes.forEach(time => {
                const timeDiv = document.createElement('div');
                timeDiv.className = 'showtime';
                timeDiv.textContent = time;

                // Add click event to redirect with selected details
                timeDiv.addEventListener('click', () => {
                    //const queryParams = new URLSearchParams({
                    //    MovieID: MovieID
                    //});

                    // Redirect to nextPage.html with query parameters
                    window.location.href = `SeatSelection.aspx?MovieID=M001`;
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

// Event listener for date selection
document.getElementById('dates').addEventListener('click', (e) => {
    if (e.target.tagName === 'DIV') {
        const selectedDate = e.target.getAttribute('data-date');
        updateCinemaList(selectedDate);
    }
});

// Generate selectable dates with data-date attributes
const today = new Date();
for (let i = 0; i < 5; i++) {
    const date = new Date(today);
    date.setDate(today.getDate() + i);
    const dateDiv = document.createElement('div');
    const formattedDate = date.toISOString().split('T')[0]; // Format as YYYY-MM-DD
    dateDiv.setAttribute('data-date', formattedDate);
    dateDiv.textContent = date.toLocaleDateString('en-US', { weekday: 'short', day: 'numeric', month: 'short' });
    document.getElementById('dates').appendChild(dateDiv);
}
