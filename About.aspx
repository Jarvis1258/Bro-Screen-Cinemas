<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Bro_Screen_Cinemas.About" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/about.css" />
    <style>
        nav{
            position: relative;
        }
    </style>
</asp:Content>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <section class="about-us">
            <div class="container">
                <h1>About Us</h1>
                <img src="image/about.jpg" alt="About Us Banner" class="about-banner">
                <p>
                    Welcome to <strong>Bro Screen Cinemas</strong>, your ultimate destination for a remarkable cinematic experience. 
                    Since our inception, we have been dedicated to bringing the magic of movies to life for audiences across Malaysia. 
                </p>
                <h2>Our Vision</h2>
                <p>
                    At Bro Screen Cinemas, we aim to redefine moviegoing by offering state-of-the-art facilities, 
                    exceptional customer service, and a diverse selection of films that cater to all tastes.
                </p>
                <h2>Our Journey</h2>
                <p>
                    Starting from a single cinema in Kuala Lumpur, we have grown into a nationwide network of 
                    theaters known for cutting-edge technology and unparalleled comfort.
                </p>
                <h2>Why Choose Us?</h2>
                <ul>
                    <li>Immersive Dolby Atmos sound systems for an extraordinary audio experience.</li>
                    <li>Comfortable seating with spacious legroom for every guest.</li>
                    <li>A wide variety of snacks and beverages to complement your viewing experience.</li>
                    <li>Dedicated customer support to ensure your satisfaction.</li>
                </ul>
                <h2>Contact Us</h2>
                <p>
                    Got questions? Need help planning your next movie night? Reach out to us anytime. 
                    We’re here to make your visit memorable!
                </p>
            </div>
        </section>
    </main>
</asp:Content>