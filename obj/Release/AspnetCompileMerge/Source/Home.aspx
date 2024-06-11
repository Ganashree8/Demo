<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BloodDonorPage.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" type="text/css" href="Assets/Home.css">
<body>
    <div class="Home" id="homePage" runat="server">
    <asp:Literal runat="server" ID="cards"></asp:Literal>
    <div class="HomePage" style="box-shadow: 0 0 10px rgba(0, 0, 0, 0.5)">
        <div class="Info-Text">
            <h1 style="font-family: 'Roboto Slab'; color: darkred">Spring Into Action:
            Give Blood!</h1>

            <p style="font-family: 'Roboto Slab'; color: black; font-size: 20px">
                The most precious gift that one can give to another person is the gift of life i.e. blood.
        Your blood saves more than one life when it is separated into its components (red blood cells, plasma etc.).
        Blood is needed regularly for patients with diseases such as thalassemia and hemophilia, 
        and also for the treatment of injuries after an accident, major surgeries, anemia, etc.
            </p>
            <p style="font-family: 'Roboto Slab'; color: black; font-size: 20px">
                Embrace the opportunity to make a difference in the lives of others by donating blood regularly. 
        As you give, remember these words: "A single pint can save three lives." 
        It's not just an act of generosity; it's a lifeline for those in need. 
        So, let's join hands and make a positive impact together.
            </p>
        </div>
        <br />

        <div class="container">
            <div class="row">
                <!-- Card 1 -->
                <div class="col-md-3">
                    <div class="card" style="background-color: lightblue; box-shadow: 0 0 10px rgba(0, 0, 0, 0.5)">
                        <div class="card-body" style="height: 350px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.5)">
                            <h5 class="card-title" style="font-family: 'Roboto Slab'; color: darkred">Who can donate?</h5>
                            <p class="card-text">
                                Are you eligible for blood donation? Find out about the eligibility requirements to donate blood today. Learn about general health, travel, medications, tattoos, and more.
                        <a href="https://www.who.int/campaigns/world-blood-donor-day/2018/who-can-give-blood#:~:text=Below%20are%20some%20basic%20eligibility,that%20appropriate%20consent%20is%20obtained." alt="Know More">Know More</a>
                            </p>
                        </div>
                    </div>
                </div>
                <!-- Card 2 -->
                <div class="col-md-3">
                    <div class="card" style="background-color: lightpink; box-shadow: 0 0 10px rgba(0, 0, 0, 0.5)">
                        <div class="card-body" style="height: 350px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.5)">
                            <h5 class="card-title" style="font-family: 'Roboto Slab'; color: darkred">Help sickle patient</h5>
                            <p class="card-text">
                                Blood donors who are Black play a critical role in helping sickle cell disease patients receive the most compatible blood match. Donors needed to meet this urgent need.
                            <a href="https://www.mayoclinic.org/diseases-conditions/sickle-cell-anemia/symptoms-causes/syc-20355876" alt="Know More">Know More</a>
                            </p>
                        </div>
                    </div>
                </div>
                <!-- Card 3 -->
                <div class="col-md-3">
                    <div class="card" style="background-color: hotpink; box-shadow: 0 0 10px rgba(0, 0, 0, 0.5)">
                        <div class="card-body" style="height: 350px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.5)">
                            <h5 class="card-title" style="font-family: 'Roboto Slab'; color: darkred">Benifits of donating blood </h5>
                            <p class="card-text">
                                <ul>
                                    <li>Helps Save Lives</li>
                                    <li>Health Check</li>
                                    <li>Reduces Risk of Heart Disease</li>
                                    <li>Stimulates Blood Cell Production</li>
                                </ul>
                            </p>
                        </div>
                    </div>
                </div>
                <!-- Card 4 -->
                <div class="col-md-3">
                    <div class="card" style="background-color: burlywood; box-shadow: 0 0 10px rgba(0, 0, 0, 0.5)">
                        <div class="card-body" style="height: 350px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.5)">
                            <h5 class="card-title" style="font-family: 'Roboto Slab'; color: darkred">Blood donation rate</h5>
                            <p class="card-text">The median blood donation rate in high-income countries is 31.5 donations per 1000 people. This compares with 16.4 donations per 1000 people in upper-middle-income countries, 6.6 donations per 1000 people in lower-middle-income countries, and 5.0 donations per 1000 people in low-income countries.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <br />
    </div>
        </div>
    </body>
</asp:Content>

