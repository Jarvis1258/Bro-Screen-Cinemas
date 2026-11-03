<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Experiences.aspx.cs" Inherits="Bro_Screen_Cinemas.Experiences" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/experiences.css" />
    <style>
        nav{
            position: relative;
        }
    </style>
</asp:Content>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Experiences</h1>
    <div id="container">
        <div class="experience-grid">
            <div class="experience-card" style="background-image: url('image/exp1.jpg');">
                <div class="overlay">
                    <h3>VELVET</h3>
                    <p>An all-in-one spot to enjoy the spectacle of a night out, whether it&rsquo;s dinner, drinks, or a movie.</p>
                </div>
            </div>
            <div class="experience-card" style="background-image: url('image/exp2.jpg');">
                <div class="overlay">
                    <h3>Getha Lux Suites</h3>
                    <p>Designed for those seeking the ultimate experience in extravagant cinema comfort</p>
                </div>
            </div>
            <div class="experience-card" style="background-image: url('image/exp3.jpg');">
                <div class="overlay">
                    <h3>Comfort Cabin</h3>
                    <p>For those who seek the classic Gold Class experience, the Comfort Cabins are refined, elegant, and timeless.</p>
                </div>
            </div>
            <div class="experience-card" style="background-image: url('image/exp4.jpg');">
                <div class="overlay">
                    <h3>Escape Studios</h3>
                    <p>Packed with a variety of seating options, the youthful Escape Studio halls are distinctively themed</p>
                </div>
            </div>
            <div class="experience-card" style="background-image: url('image/exp5.jpg');">
                <div class="overlay">
                    <h3>Private Screen</h3>
                    <p>A reserved space for you</p>
                </div>
            </div>
            <div class="experience-card" style="background-image: url('image/exp6.jpg');">
                <div class="overlay">
                    <h3>IMAX</h3>
                    <p>Experience films to the fullest with the world's most immersive movie experience.</p>
                </div>
            </div>
            <div class="experience-card" style="background-image: url('image/exp7.jpg');">
                <div class="overlay">
                    <h3>4DX</h3>
                    <p>Malaysia's first 4DX experience available exclusively in GSC.</p>
                </div>
            </div>
            <div class="experience-card" style="background-image: url('image/exp8.jpg');">
                <div class="overlay">
                    <h3>D-BOX</h3>
                    <p>D-BOX simulators are the next Dimension of your cinematic experience.</p>
                </div>
            </div>
            <div class="experience-card" style="background-image: url('image/exp9.jpg');">
                <div class="overlay">
                    <h3>MX4D</h3>
                    <p>MX4D® theatre seats move in-sync with the movie sequence, while special EFX generators recreate the excitement through motion, jolts, pokes, wind, water, scents and even more!</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>