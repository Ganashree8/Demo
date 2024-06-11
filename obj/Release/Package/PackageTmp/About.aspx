<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="BloodDonorPage.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="Assets/About.css">
    <!DOCTYPE html>
    <html>

    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>

        <div class="about-section">
            <h1>About Us</h1>
            <p>We are committed to saving lives by providing a seamless and efficient platform for blood donation management. Our mission is to bridge the gap between donors and recipients, ensuring that every blood donation counts in the fight against blood-related illnesses and emergencies.</p>
            <p>Our blood donor management system is a comprehensive solution designed to streamline the blood donation process from registration to donation to distribution. With user-friendly interfaces for donors, blood banks, and hospitals, our platform revolutionizes the way blood donations are managed and utilized.</p>
        </div>
        <br />



        <div class="heading"><h2 style="text-align: center">Our Team</h2></div>
        <div class="row">

            <div class="column">
                <div class="card">
                    <img src="../Assets/Images/Logo.png" alt="Center" style="height:230px;width: 100%" />          
                    <div class="container">
                        <h2>Center</h2>
                        <p class="title">Blood Donation Center</p>
                        <p>Please contact for any queries</p>
                        <p> Contact us via email: <a href="mailto:Office@blooddonation.com">Office@blooddonation.com</a></p>
                        <p>
                            <button class="button">Contact</button>
                        </p>
                    </div>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <img src="../Assets/Images/About_Image1.jpg" alt="Jane" style="width: 100%">
                    <div class="container">
                        <h2>Jane Doe</h2>
                        <p class="title">Manager</p>
                        <p>IRCS, KSB</p>
                        <p>Contact via email: <a href="mailto:jane@bloaddonation.com">jane@bloaddonation.com</a></p>
                        <p>
                            <button class="button">Contact</button>
                        </p>
                    </div>
                </div>
            </div>

            <div class="column">
                <div class="card">
                    <img src="../Assets/Images/About_Image2.jpg" alt="Mike" style="width: 100%">
                    <div class="container">
                        <h2>Mike Ross</h2>
                        <p class="title">Assistant Manager</p>
                        <p>IRCS, KSB</p>
                        <p> Contact via email: <a href="mailto:mike@bloaddonation.com">mike@blooddonation.com</a></p>
                        <p>
                            <button class="button">Contact</button>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </body>
    </html>
</asp:Content>
