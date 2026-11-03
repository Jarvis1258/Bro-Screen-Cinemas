<%@ Page Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="Faq.aspx.cs" Inherits="Bro_Screen_Cinemas.Faq" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/faq.css" />
    <style>
        nav{
            position: relative;
        }
    </style>
</asp:Content>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="faq-section">
        <h1>ONLINE TICKET PURCHASE</h1>
        <div class="faq-item">
            <button type="button" class="faq-question">
                Can I select my ideal seats for my purchased movie session?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>Yes, you can select any available seats for your purchased movie session.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                What is the maximum ticket I can purchase?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>The maximum tickets you can purchase is 10.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                What payment methods can I use to purchase my movie tickets?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>You can use:
                    <ul>
                        <li>Touch&#39;n go</li>
                        <li>Credit card</li>
                        <li>Debit card</li>
                        <li>Online banking</li>

                    </ul>
                </p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                Will there be any additional charges for purchasing movie tickets?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>There will be no additional charges after the ticket purchasing payment process has been successfully completed.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                Where should I collect my movie tickets?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>You can print it out or you can collect it from the counter of the cinema.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                What should I do if I received an 'Unsuccessful' during my payment?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>Check whether your card/account was charged. If no, please proceed to repurchase the tickets. If yes, please check your transaction history page or check your email for the SelfPrint Ticket. Alternatively, please contact our Customer Relations at 6011234123 for assistance.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                Can I cancel my movie ticket booking?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>Yes, you can, but it should be 3 days before. After this period, it will not be allowed to cancel.</p>
            </div>
        </div>
    </section>

    <section class="faq-section">
        <h1>REWARDS</h1>
        <div class="faq-item">
            <button type="button" class="faq-question">
                What is BSC reward?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>BSC REWARDS is the all-new GSC loyalty programme for movie lovers to enjoy amazing benefits and exclusive deals at BSC! Just sign up and spend to start collecting BSCpoints, which you can then redeem for rewards!</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                How do I bocome a BSC reward member?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>You will need to register or activate online via the BSC mobile app or any counter of BSC cinema branches for FREE!</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                Any requirements for joining BSC rewards?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>Anyone who are over 18 years old by providing a valid email address and phone number are qualified to register as a BSC reward member.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                Where can I collect my membership card?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p> We do not provide any physical membership card anymore as we are using QR code which users can check through their BSC mobile app.</p>
            </div>
        </div>
    </section>

    <section class="faq-section">
        <h1>BSCPOINTS</h1>
        <div class="faq-item">
            <button type="button" class="faq-question">
                What is BSCpoints?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>Every purchase at BSC using BSC rewards earns you BSCpoints, which can be collected to redeem rewards.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                How do I collect BSCpoints?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p> You can earn GSCoins with every transaction made online or on-ground at all BSC. You are entitled to earn GSCoins with purchases such as movie tickets, concession items and F&B items.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                When can I start earning BSCpoints?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>You can begin earning BSCpoints immediately after you join / activate the BSC rewardS programme via the BSC mobile app.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                Can I earn BSCpoints for previously purchased tickets before I had enrolled as a BSC rewards member?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>No, you can only earn BSCpoints when you purchase movie tickets at BSC as a BSC rewards member. Past purchases prior to signing up as a member are not valid for BSCpoints collection.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                How do I check my BSCpoints balance?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>You can check your BSCpoints balance on the BSC mobile app by signing in to BSC rewards and checking your profile page. All BSCpoints earned will be credited into your account ONE (1) day after the date of movie, F&B or merchandise purchase.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                Do I still earn BSCpoints on the booking fee if I purchase movie tickets online?
                <span class="faq-icon">▼</span>
            </butto>
            <div class="faq-answer">
                <p>No, booking fees are not entitled for earning of BSCpoints.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                What and how can I redeem with my BSCpoints?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>Once you have earned sufficient BSCpoints for redemption, you able to redeem the rewards voucher of Free movie tickets and F&B Voucher via BSC mobile app.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                Where can I redeem with my BSCpoints?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>You are available to redeem the rewards voucher of Free movie tickets and F&B Voucher only online via BSCpoints mobile app.
                    You can utilize your redeemed rewards voucher at all channels available including BSC mobile app and cinema counter.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                Can I use my BSCpoints to redeem any movies on any days?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>Yes, you can use your accumulated GSCoins to redeem standard 2D movie tickets (excluding Special Screenings, Special Events and Film Festival screenings) for any day in any BSC outlet. </p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                Can I make partial redemption on my movie ticket with my accumulated BSCpoints?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>No partial redemption of movie tickets is allowed using BSCpoints.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                Can I transfer the BSCpoints from my account to another account?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>No, BSCpoints are non-transferrable.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                What happened if BSCpoints are not credited to my account?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>Kindly get in touch with our Customer Relations team at cs@bsc.com.my with your proof of purchase (i.e. digital receipt or ticket stub) within 7 days from the date of movie, or the date of F&B or merchandise purchased.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                Can I earn BSCoins after a transaction being made?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>Unfortunately no, In order to earn GSCoins as BSC Rewards member, kindly log in your BSC Rewards account before making transaction online via BSC Mobile App &amp; Website or scan your member QR code before making transaction at the e-kiosk or cinema counter.&nbsp;</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                Can I get a refund for my GSCoins after redemption?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>BSCoins are not refundable once they have been redeemed.</p>
            </div>
        </div>
    </section>

    <section class="faq-section">
        <h1>ACCOUNT MANAGEMENT</h1>
        <div class="faq-item">
            <button type="button" class="faq-question">
                Can I have more than one account? For instance, one account for business and another for personal use?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>No, every account requires a unique and valid phone number and email address, before you can proceed to register as a GSC REWARDS member.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                Is there an enrolment fee or annual fee?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>BSC REWARDS has no enrolment fee or annual fee. Once you signed up, you are entitled to a lifetime membership.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                Will my GSC REWARDS account expire?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>No, your BSC REWARDS account will not expire once you qualify as a member.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                Is my BSC REWARDS account transferable?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>No, your BSC REWARDS account is strictly non-transferrable.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                Must I bring my mobile phone with the GSC Mobile App installed to earn GSCoins when purchasing movie tickets / F&amp;B items?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>Yes, you are require to have the GSC Mobile App installed on your mobile phone / smartphone. GSC REWARDS features an e-card on the GSC Mobile App with a QR code, which is scanned when you are purchasing movie tickets or F&amp;B items at the e-kiosk or cinema counter.&nbsp;</p>
            </div>
        </div>
    </section>

    <section class="faq-section">
        <h1>GENERAL INFO</h1>
        <div class="faq-item">
            <button type="button" class="faq-question">
                I left my item in your cinema hall. How can I retrieve it?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>You can proceed to the cinema location or contact our Customer Relations at (603) 7713 7888 (Monday &ndash; Friday from 9am to 6pm excluding Public Holidays) or email to cs@gsc.com.my for assistance.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                I&rsquo;m interested to join GSC. Is there any vacancy?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>Please email your resume to hr@gsc.com.my. Our HR team will contact you directly if youa re shortlisted.</p>
            </div>
        </div>
    </section>

    <section class="faq-section">
        <h1>BSC SELFPRINT TICKET</h1>
        <div class="faq-item">
            <button type="button" class="faq-question">
                How does BSC Print Ticket work?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>BSC SelfPrint ticket works in the same way as a hardcopy version of the QR Code that you would received on your Mobile App. You may choose to print the SelfPrint ticket to use for cinema admission. Alternatively, you may collect your movie ticket(s) from the e-Payment counter with Confirmation ID.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                If I forget to bring the SelfPrint tickets, can I still collect the movie tickets?
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>Yes, you can collect the movie tickets purchased at the selected cinema by producing the Confirmation ID of the transaction at E-payment counter.</p>
            </div>
        </div>
        <div class="faq-item">
            <button type="button" class="faq-question">
                You can proceed to collect your movie ticket(s) form the E-Payment counter or proceed to the cinema checkpoint and the staff will scan the QR code for admission.
                <span class="faq-icon">▼</span>
            </button>
            <div class="faq-answer">
                <p>I do not receive the SelfPrint ticket in my email Inbox after successful transaction but I do have the confirmation ID / QR code. What should I do?</p>
            </div>
        </div>
    </section>
    <script src="js/script.js"></script>
</asp:Content>