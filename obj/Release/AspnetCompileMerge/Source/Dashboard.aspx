<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="BloodDonorPage.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%@ Import Namespace="System.Data" %>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>

    <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>

    <link rel="stylesheet" type="text/css" href="Assets/Dashboard.css">
    <body>
        <br />
        <asp:Literal runat="server" ID="cards">
     
     <div class="row">
         <!-- Card 1 -->
         <div class="col-md-3">
             <div class="card" style="background-color:lavenderblush;box-shadow: 0 0 10px rgba(0, 0, 0, 0.5)">
                 <div class="card-body" style="height:200px;box-shadow: 0 0 10px rgba(0, 0, 0, 0.5)">
                     <h5 class="card-title">Around world</h5>
                     <p class="card-text">Blood donation practices vary globally due to cultural differences and healthcare infrastructure disparities.</p>
             </div>
                 </div> 
         </div>
         <!-- Card 2 -->
         <div class="col-md-3">
             <div class="card" style="background-color:pink;box-shadow: 0 0 10px rgba(0, 0, 0, 0.5)">
                 <div class="card-body" style="height:200px;box-shadow: 0 0 10px rgba(0, 0, 0, 0.5)">
                     <h5 class="card-title">Around country</h5>
                     <p class="card-text">Donation rates fluctuate within states based on factors like population density and urbanization.</p>
                 </div>
             </div>
         </div>
         <!-- Card 3 -->
         <div class="col-md-3">
             <div class="card" style="background-color:lightpink;box-shadow: 0 0 10px rgba(0, 0, 0, 0.5)">
                 <div class="card-body" style="height:200px;box-shadow: 0 0 10px rgba(0, 0, 0, 0.5)">
                     <h5 class="card-title">Based on daily donation </h5>
                     <p class="card-text">Daily donation rates impact blood supply stability and are influenced by factors such as seasonal demand and awareness campaigns.</p>
                 </div>
             </div>
         </div>
         <!-- Card 4 -->
         <div class="col-md-3">
             <div class="card" style="background-color:hotpink; box-shadow: 0 0 10px rgba(0, 0, 0, 0.5)">
                 <div class="card-body" style="height:200px;box-shadow: 0 0 10px rgba(0, 0, 0, 0.5)">
                     <h5 class="card-title">Based on blood groups</h5>
                     <p class="card-text">The percentage of blood donors varies globally by blood group, influenced by regional demographics and donation campaigns.</p>
                 </div>
             </div>
         </div>
     </div>
     <br />
        </asp:Literal>
        <div class="container2" style="box-shadow: 0 0 10px rgba(0, 0, 0, 0.5)">
            <div>
                <br />
                <div>
                    <h6 style="padding-left: 20px; margin-left: 150px; color: darkslategrey; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif">Number of people based on countries:</h6>
                    <br />
                    <div style="display: flex; padding-left: 20px; margin-left: 10px">
                        <asp:Literal ID="bar" runat="server"></asp:Literal>
                        <div class="cardChart" style="margin-left: 40px">
                            <div class="card1" id="card1">
                                <div class="card-body" style="height: 100px; width: 300px">
                                    <h5 class="card-title"></h5>

                                    <div style="padding: 30px">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>Country Name</th>
                                                    <th style="padding-left: 30px;">Count of Donors</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% if (ViewState["Card1Data"] != null)
                                                    {
                                                        DataTable card1 = (DataTable)ViewState["Card1Data"];
                                                        foreach (DataRow row in card1.Rows)
                                                        { %>
                                                <tr>
                                                    <td><%= row["Country Name"] %></td>
                                                    <td style="padding-left: 30px;"><%= row["Count of Donors"] %></td>
                                                </tr>
                                                <% }
                                                    } %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <hr />
                <div>
                    <h6 style="padding-left: 20px; margin-left: 150px; color: darkslategrey; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif">Number of people based on blood group:</h6>
                    <div style="display: flex; padding-left: 20px; margin-left: 10px">
                        <asp:Literal ID="pie" runat="server"></asp:Literal>
                        <div class="cardChart" style="margin-left: 40px">
                            <div class="card1 card2">
                                <div class="card-body" style="height: 200px; width: 300px">
                                    <h5 class="card-title"></h5>
                                    <div style="padding: 20px">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>Blood Group</th>

                                                    <th style="padding-left: 30px;">Count of Donors</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% if (ViewState["Card2Data"] != null)
                                                    {
                                                        DataTable card2 = (DataTable)ViewState["Card2Data"];
                                                        foreach (DataRow row in card2.Rows)
                                                        { %>
                                                <tr>
                                                    <td><%= row["Blood Group"] %></td>
                                                    <td style="padding-left: 30px;"><%= row["Count of Donor"] %></td>
                                                </tr>
                                                <% }
                                                    } %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
                <hr />
                <div>
                    <h6 style="padding-left: 20px; margin-left: 150px; color: darkslategrey; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif">Count of blood donors per year:</h6>
                    <div style="display: flex; padding-left: 20px; margin-left: 10px">
                        <asp:Literal ID="doughnut" runat="server"></asp:Literal>
                        <div class="cardChart" style="margin-left: 40px">
                            <div class="card1 card3">
                                <div class="card-body" style="height: 200px; width: 300px">
                                    <h5 class="card-title"></h5>
                                    <div style="padding: 30px">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>Year</th>

                                                    <th style="padding-left: 30px">Count of Donors</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% if (ViewState["Card3Data"] != null)
                                                    {
                                                        DataTable card3 = (DataTable)ViewState["Card3Data"];
                                                        foreach (DataRow row in card3.Rows)
                                                        { %>
                                                <tr>

                                                    <td><%= row["Year"] %></td>
                                                    <td style="padding-left: 30px;"><%= row["Count"] %></td>

                                                </tr>
                                                <% }
                                                    } %>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br />
            </div>
        </div>
    </body>
</asp:Content>


