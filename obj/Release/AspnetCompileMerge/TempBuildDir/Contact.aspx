<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="BloodDonorPage.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="Assets/Contact.css">
    <body>
        <div class="container">
            <div class="heading">
                <center>
                    <h3>Contact Us</h3>
                </center>
            </div>
            <center>
                <form action="#" name="contact_form">
                    <div class="contactbox">
                        <div class="form-group">
                            <label for="first_name">First Name</label>
                            <input name="first_name" type="text" class="form-control" required placeholder="John" />
                        </div>
                        <div class="form-group">
                            <label for="last_name">Last Name</label>
                            <input name="last_name" type="text" class="form-control" required placeholder="Doe" />
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <input name="email" type="email" class="form-control" required placeholder="you@domain.com" />
                        </div>
                        <div class="form-group">
                            <label for="message">Message</label>
                            <textarea name="message" class="form-control" rows="5" required placeholder="Enter your message here ..."></textarea>
                        </div>
                    </div>
                    <div class="text-center">
                        <input type="submit" class="btn btn-primary" value="Submit">
                    </div>
                </form>
            </center>
        </div>
    </body>
</asp:Content>
