<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Bro_Screen_Cinemas.Contact" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/contact.css" />
    <style>
        nav{
            position: relative;
        }
    </style>
</asp:Content>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <div class="contact-info">
            <h2>Contact Information</h2>
            <p>Whether you're curious about our cinemas, in love with our service, or have feedback for us &ndash; we'd love to hear from you.</p>
            <p><strong>Email Support:</strong> <a href="mailto:bcs@gsc.com.my">bcs@gsc.com.my</a></p>
            <p><strong>Customer Hotline:</strong> +603-7713 7888</p>
            <p><strong>Service Hours:</strong> Mon to Fri, 9:00am to 6:00pm</p>
            <div class="social-icons">
                <a href="#" target="_blank">Facebook</a>
                <a href="#" target="_blank">Instagram</a>
                <a href="#" target="_blank">TikTok</a>
                <a href="#" target="_blank">YouTube</a>
            </div>
        </div>
        <div class="contact-form">
            <h2>Send Us a Message</h2>
            <form action="#" method="#" enctype="multipart/form-data">
                <label for="name">Name *</label>
                <input type="text" id="name" name="name" required>
                
                <label for="contact-number">Contact Number *</label>
                <input type="text" id="contact-number" name="contact-number" required>
                
                <label for="email">Email *</label>
                <input type="email" id="email" name="email" required>
                
                <label for="subject">Subject *</label>
                <select id="subject" name="subject" required>
                    <option value="" disabled selected>Select a subject</option>
                    <option value="general">General Inquiry</option>
                    <option value="feedback">Feedback</option>
                    <option value="support">Support</option>
                </select>
                
                <label for="category">Category *</label>
                <select id="category" name="category" required>
                    <option value="" disabled selected>Select a category</option>
                    <option value="ticketing">Ticketing</option>
                    <option value="events">Events</option>
                    <option value="promotions">Promotions</option>
                </select>
                
                <label for="location">Cinema Location</label>
                <select id="location" name="location">
                    <option value="" disabled selected>Select a location</option>
                    <option value="Setapak Central">Setapak Central</option>
                    <option value="Mid Valley Megamall">Mid Valley Megamall</option>
                    <option value="1 Utama">1 Utama</option>
                    <option value="Paradigm Mall">Paradigm Mall</option>
                </select>
                
                <label for="message">Tell Us More *</label>
                <textarea id="message" name="message" required></textarea>
                
                <label for="attachment">Attachment</label>
                <input type="file" id="attachment" name="attachment">
                
                <label>
                    <input type="checkbox" name="confirmation" required> I hereby confirm that all information provided is accurate and up-to-date.
                </label>
                <br>
                <br>
                <button type="submit">Submit</button>
            </form>
        </div>
    </main>
</asp:Content>