<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Privacy.aspx.cs" Inherits="Bro_Screen_Cinemas.Privacy" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/privacy.css" />
    <style>
        nav{
            position: relative;
        }
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 0;
            color: #ffffff;
            background-color: #121212;
        }

        main {
            padding: 20px;
            max-width: 800px;
            margin: 0 auto;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h1, h2, h3 {
            color: #ffee60;
        }
        a {
            color: #0066cc;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</asp:Content>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <h1>Privacy Policy and Personal Data Notice</h1>
        <p>The privacy and personal data policy and practices of BSC Cinemas Sdn. Bhd., BSC Movies Sdn Bhd, and its
            affiliated/related companies (BSC) set out in this Privacy Policy and Personal Data Notice apply to all
            personal data provided to BSC, whether in electronic form or otherwise.</p>
        <p>By visiting and/or using <a href="http://www.bsc.com.my">www.bsc.com.my</a> and <a
                href="http://www.bscmovies.com.my">www.bscmovies.com.my</a> (BSC’s Website), any mobile applications run
            and maintained by BSC (BSC Mobile Application), and other services provided by BSC as well as by providing
            personal data to BSC, you agree to be bound by the terms and conditions of this Privacy Policy and Personal
            Data Notice. If you do not agree to such terms and conditions, please do not use or access BSC’s Website or
            BSC Mobile Application, use the services provided by BSC, or provide any personal data to BSC.</p>

        <h2>Notice</h2>
        <p>This written notice serves to inform you that your personal data is being processed by or on behalf of BSC.
            For the purposes of this written notice, the terms “personal data” and “processing” shall have the meaning
            assigned to them in the Personal Data Protection Act 2010 (hereinafter referred to as the “PDPA”).</p>

        <h2>Description of Your Personal Data</h2>
        <ul>
            <li>Your personal details such as name, gender, identification documents (e.g., NRIC or passport number),
                date of birth, race, nationality, marital status, occupation, and contact details.</li>
            <li>Your feedback information gathered from multiple sources such as email, phone, and written
                correspondence.</li>
            <li>Details of your visits to BSC’s Websites or Mobile Application.</li>
            <li>Your personal interests and preferences.</li>
            <li>Images recorded via CCTV cameras when you visit BSC cinemas.</li>
            <li>Your curriculum vitae or resume when applying for a career with BSC.</li>
            <li>Information provided voluntarily during promotions or activities.</li>
        </ul>

        <h2>Purposes for Processing Your Personal Data</h2>
        <p>BSC may process your personal data for the following purposes:</p>
        <ul>
            <li>To verify your identity and communicate with you.</li>
            <li>To process communications and resolve complaints or feedback.</li>
            <li>To notify you of updates, events, promotions, or changes to services.</li>
            <li>To conduct marketing activities and surveys.</li>
            <li>To comply with laws and regulations.</li>
        </ul>

        <h2>Source of Your Personal Data</h2>
        <p>Your personal data is collected directly from you when you:</p>
        <ul>
            <li>Interact with BSC’s events or platforms.</li>
            <li>Register or subscribe for services or newsletters.</li>
            <li>Participate in surveys, promotions, or contests.</li>
            <li>Lodge complaints or provide feedback to BSC.</li>
        </ul>

        <h2>Your Rights</h2>
        <p>You have the following rights in relation to your personal data:</p>
        <ul>
            <li>To request information about your personal data being processed.</li>
            <li>To correct any inaccurate, incomplete, or misleading data.</li>
            <li>To limit the processing of your personal data.</li>
            <li>To request the removal of your personal data.</li>
        </ul>
        <p>To exercise your rights, contact:</p>
        <p>
            <strong>Customer Relations</strong><br>
            Phone: (6) 03 - 7713 7888<br>
            Email: <a href="mailto:cs@bsc.com.my">cs@bsc.com.my</a>
        </p>

        <h2>Security of Your Personal Data</h2>
        <p>BSC takes practical steps to protect your personal data using safeguards like encryption and secure socket
            layers. However, BSC cannot provide absolute assurance of data security and shall not be responsible for
            unauthorized access incidents.</p>

        <h2>Retention of Your Personal Data</h2>
        <p>BSC will retain your personal data for as long as necessary to fulfill the purposes outlined in this policy.
        </p>

        <h2>Cookies</h2>
        <p>Cookies are text files used to store your preferences and enhance your experience when using BSC’s Website or
            Mobile Application.</p>
    </main>
</asp:Content>