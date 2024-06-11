<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dummy.aspx.cs" Inherits="Create_Ticket.Dummy" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ Register Assembly="System.Web.DataVisualization" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div runat="server">
        <style>
            .card-container-MDash {
                background-color: #F7F7FF; /* Full white background color */
                background-color: antiquewhite;
                padding: 10px; /* Adjust padding to create a box around the text */
                margin: 20px;
                border: 1px solid #ddd; /* Add a border to create a card-like appearance */
                border-radius: 5px; /* Add border-radius for rounded corners */
                box-shadow: 0 3px 6px rgba(1, 1, 1, 0.5);
                height: 100%;
            }

                .card-container-MDash:hover {
                    background-color: #EFEFEF; /* Slightly darker background color on hover */
                    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.5); /* Enhanced shadow effect */
                    transform: translateY(-5px); /* Slight lift effect */
                }

            .card-content {
                display: flex;
                flex-direction: column;
                /*justify-content: space-between;*/
                flex-grow: 1;
                text-align: center;
                overflow: hidden;
                width: 100%;
            }

            .ticket-details {
                text-align: center; /* Centers the text within the container */
                padding: 10px;
                border: 1px solid #dee2e6; /* Optional: adds a border around the container */
                border-radius: 8px; /* Optional: adds rounded corners to the container */
                background-color: #ffffff; /* Optional: sets a background color for the container */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Optional: adds a subtle shadow */
                width: 200px;
                border: 2px solid #6c757d; /* Adds a darker border around the container */
                border-radius: 12px; /* Adds rounded corners to the container */
                background-color: #FFE4E1; /* Sets a white background color for the container */
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }

                .ticket-details h6 {
                    font-size: 20px; /* Sets the font size */
                    color: #333; /* Sets the text color */
                }
        </style>

        <center>
            <div class="ticket-details">
                <h6>Ticket Details</h6>
            </div>
        </center>
        <div style="display: flex" class="card-container-MDash">


            <asp:Repeater runat="server" ID="repeater">
                <ItemTemplate>

                    <div class="card-content card-container-MDash" <%--style="height: 150px"--%> style="background-color: #F7F7FF;">
                        <h5><%# Eval("Title") %></h5>
                        <p><%# Eval("Description") %></p>


                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

          <div style="display: flex; margin-top: 30px; align-items: center; justify-content: center; background-color: antiquewhite">
       <div class="card-container-MDash" style="background-color: #FFE4E1;">
           <asp:Literal ID="barchartLit1" runat="server"></asp:Literal>
           <button onclick="downloadChartAsPNG('barchart', 'bar-chart.png')" class="btn btn-primary">PNG</button>
           <button onclick="downloadChartAsPDF('barchart', 'bar-chart.pdf')" class="btn btn-primary">PDF</button>
       </div>
       <div class="card-container-MDash" style="background-color: #FFE4E1;">
           <asp:Literal ID="piechartLit1" runat="server"></asp:Literal>
           <button onclick="downloadChartAsPNG('piechart', 'pie-chart.png')" class="btn btn-primary">PNG</button>
           <button onclick="downloadChartAsPDF('piechart', 'pie-chart.pdf')" class="btn btn-primary">PDF</button>
       </div>
       <div class="card-container-MDash" style="background-color: #FFE4E1;">
           <asp:Literal ID="linechartLit1" runat="server"></asp:Literal>
           <button onclick="downloadChartAsPNG('linechart', 'line-chart.png')" class="btn btn-primary">PNG</button>
           <button onclick="downloadChartAsPDF('linechart', 'line-chart.pdf')" class="btn btn-primary">PDF</button>
       </div>
   </div>

                 <div style="display: flex" class="card-container-MDash">
      <asp:Repeater runat="server" ID="repeater1">
          <ItemTemplate>
              <div class="card-content card-container-MDash" style="height: 150px; background-color: #F7F7FF;">
                  <h5><%# Eval("Title") %></h5>
                  <p><%# Eval("Description") %></p>
              </div>
          </ItemTemplate>
      </asp:Repeater>
  </div>
 <asp:Button ID="btnDownload" runat="server" Text="Download Chart" OnClick="btnDownload_Click" />
       <asp:Chart ID="Chart1" runat="server" Width="600px" Height="400px">
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
            </ChartAreas>
            <Series>
                <asp:Series Name="Series1" ChartType="Bar">
                    <Points>
                        <asp:DataPoint AxisLabel="Red" YValues="12"></asp:DataPoint>
                        <asp:DataPoint AxisLabel="Blue" YValues="19"></asp:DataPoint>
                        <asp:DataPoint AxisLabel="Yellow" YValues="3"></asp:DataPoint>
                        <asp:DataPoint AxisLabel="Green" YValues="5"></asp:DataPoint>
                        <asp:DataPoint AxisLabel="Purple" YValues="2"></asp:DataPoint>
                        <asp:DataPoint AxisLabel="Orange" YValues="3"></asp:DataPoint>
                    </Points>
                </asp:Series>
            </Series>
        </asp:Chart>
    </div>
</asp:Content>
