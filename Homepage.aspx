<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Homepage.aspx.cs" Inherits="Bro_Screen_Cinemas.Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="css/homepage.css?v=<%= DateTime.Now.Ticks %>" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <main>
        <div class="header_background">
            <img src="image/header1.jpg" alt="header1">
            <img src="image/header2.jpg" alt="header2">
            <img src="image/header3.jpg" alt="header3">
            <img src="image/header4.jpg" alt="header4">
        </div>

        <h2 class="sessionHead reveal">Showtime</h2>

        <div class="slider-container">
            <asp:Button ID="Button1" runat="server" Text="<" CssClass="nav prev" OnClientClick="slideToPrev(); return false;" />

            <div class="content-4box slider">
                <asp:Repeater ID="rptMovies" runat="server">
                    <ItemTemplate>
                        <div class="content-4">
                            <!-- Movie Poster -->
                            <asp:Image ID="imgPoster" runat="server" CssClass="movie-poster" />

                            <!-- Movie Details -->
                            <div class="content-down">
                                <h2><%# Eval("Title") %></h2>
                                <ul>
                                    <li>Release Date: <%# Eval("ReleaseDate", "{0:dd MMMM yyyy}") %></li>
                                    <li>Running Time: <%# Eval("Duration") %></li>
                                    <li>Genre: <%# Eval("Genre") %></li>
                                    <li>Classification: <%# Eval("Classification") %></li>
                                </ul>
                            </div>

                            <!-- Booking Link -->
                            <div class="content-booking">
                                <asp:HyperLink ID="BuyNow" runat="server" NavigateUrl='<%# "Showtime.aspx?MovieID=" + Eval("MovieID") %>'>BUY NOW</asp:HyperLink>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
            <asp:Button ID="btnNext" runat="server" Text=">" CssClass="nav next" OnClientClick="slideToNext(); return false;" />
        </div>

        <h1 class="sessionHead reveal">Top 10</h1>
        <div class="top-10-container">
            <div class="movie-row">
                <div class="movie-number">1</div>
                <div class="movie-title">Moana 2</div>
                <a href="Showtime.aspx?MovieID=M006">Buy Now</a>
            </div>
            <div class="movie-row">
                <div class="movie-number">2</div>
                <div class="movie-title">The Story of Tarcians</div>
                <a href="Showtime.aspx?MovieID=M010">Buy Now</a>
            </div>
            <div class="movie-row">
                <div class="movie-number">3</div>
                <div class="movie-title">Lembayung</div>
                <a href="Showtime.aspx?MovieID=M001">Buy Now</a>

            </div>
            <div class="movie-row">
                <div class="movie-number">4</div>
                <div class="movie-title">Wicked</div>
                <a href="Showtime.aspx?MovieID=M005">Buy Now</a>

            </div>
            <div class="movie-row">
                <div class="movie-number">5</div>
                <div class="movie-title">Red One</div>
                <a href="Showtime.aspx?MovieID=M008">Buy Now</a>

            </div>
            <div class="movie-row">
                <div class="movie-number">6</div>
                <div class="movie-title">Kraven The Hunter</div>
                <a href="Showtime.aspx?MovieID=M007">Buy Now</a>

            </div>
            <div class="movie-row">
                <div class="movie-number">7</div>
                <div class="movie-title">(Rerun) Spirited Away</div>
                <a href="Showtime.aspx?MovieID=M009">Buy Now</a>

            </div>
            <div class="movie-row">
                <div class="movie-number">8</div>
                <div class="movie-title">Haunting Call</div>
                <a href="Showtime.aspx?MovieID=M002">Buy Now</a>

            </div>
            <div class="movie-row">
                <div class="movie-number">9</div>
                <div class="movie-title">Kutukan Calon Arang</div>
                <a href="Showtime.aspx?MovieID=M003">Buy Now</a>

            </div>
            <div class="movie-row">
                <div class="movie-number">10</div>
                <div class="movie-title">Pulau Hantu</div>
                <a href="Showtime.aspx?MovieID=M004">Buy Now</a>

            </div>
        </div>



        <h2 class="sessionHead reveal">Promotions</h2>
        <div id="promo" class="reveal">
            <i class="fa-solid fa-chevron-left" id="promoLeft"></i>
            <i class="fa-solid fa-chevron-right" id="promoRight"></i>
            <div id="promoBox">
                <div id="promoSlide">
                    <div class="promoImg">
                        <img src="/image/promo1.jpg" alt="promo1">
                    </div>
                    <div class="promoImg">
                        <img src="/image/promo2.jpg" alt="promo2">
                    </div>
                    <div class="promoImg">
                        <img src="/image/promo3.jpg" alt="promo3">
                    </div>
                    <div class="promoImg">
                        <img src="/image/promo4.jpg" alt="promo4">
                    </div>
                    <div class="promoImg">
                        <img src="/image/promo5.jpg" alt="promo5">
                    </div>

                    <div id="promoTxt">
                        <p>Wonda Kluang Coffee</p>
                        <p>3 Fun-sized Meals To Say Yes To!</p>
                        <p>Aurum Limited-Time Promo, From RM55 Per Seat At TRX</p>
                        <p>Exclusive Offer for Mastercard Credit, Debit and Prepaid Card Cardholders</p>
                        <p>Special Ticket Prices for Kids / Seniors Citizens / OKU</p>
                    </div>
                </div>
            </div>
        </div>

    </main>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="Server">
    <script type="text/javascript">
        const slider = document.querySelector('.slider');

        let currentIndex = 0;
        const slideWidth = document.querySelector('.content-4').offsetWidth + 20; // Card width + margin
        const totalSlides = document.querySelectorAll('.content-4').length;

        function slideToNext() {
            if (currentIndex < totalSlides - 4) { // Adjust based on visible slides (4 in this case)
                currentIndex++;
            } else {
                currentIndex = 0; // Reset to first slide
            }
            slider.style.transform = `translateX(-${currentIndex * slideWidth}px)`;
        }

        function slideToPrev() {
            if (currentIndex > 0) {
                currentIndex--;
            } else {
                currentIndex = totalSlides - 4; // Adjust based on visible slides
            }
            slider.style.transform = `translateX(-${currentIndex * slideWidth}px)`;
        }

        var promoLeft = document.querySelector('#promoLeft');
        var promoRight = document.querySelector('#promoRight');
        var promoSlide = document.querySelector('#promoSlide');
        var margin = 0;

        promoLeft.addEventListener('click', () => {
            if (margin == 0) {
                margin = 400;
            } else {
                margin -= 100;
            }

            promoSlide.style.marginLeft = '-' + margin + '%';
        })

        promoRight.addEventListener('click', () => {
            if (margin == 400) {
                margin = 0;
            } else {
                margin += 100;
            }

            promoSlide.style.marginLeft = '-' + margin + '%';
        })

        function setSource(source) {
            localStorage.setItem('navigationSource', source);
        }
    </script>
</asp:Content>
