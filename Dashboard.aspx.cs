using BloodDonorPage.Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BloodDonorPage
{
    public partial class Dashboard : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        DataSet ds = new DataSet();
        Code.Charts chart = new Code.Charts();
        protected void Page_Load(object sender, EventArgs e)
        {

            DataSet ds = chart.GetChartData("ChartsSP");
            DataTable dt = ds.Tables[0];
            bar.Text = chart.ChartData(dt, 1);

            DataTable dt1 = ds.Tables[1];
            pie.Text = chart.ChartData(dt1, 2);

            DataTable dt2 = ds.Tables[2];
            doughnut.Text = chart.ChartData(dt2, 3);


            DataTable card1 = new DataTable();
            card1.Columns.Add("Country Name");
            card1.Columns.Add("Count of Donors");

            // ----------For Count and country Name in card1-----------------//
            foreach (DataRow row in dt.Rows)
            {
                card1.Rows.Add(row["Country Name"], row["Count"]);
            }

            // Bind the DataTable to the ASP.NET control
            ViewState["Card1Data"] = card1;


            //-------------For Count and Blood Group Name in card2-------------//

            DataTable card2 = new DataTable();
            card2.Columns.Add("Blood Group");
            card2.Columns.Add("Count of Donor");

            foreach (DataRow row in dt1.Rows)
            {
                card2.Rows.Add(row["Blood Group"], row["Count"]);
            }

            // Bind the DataTable to the ASP.NET control
            ViewState["Card2Data"] = card2;

            //-------------For Count and Year in card3-------------//

            DataTable card3 = new DataTable();
            card3.Columns.Add("Year");
            card3.Columns.Add("Count");
            foreach (DataRow row in dt2.Rows)
            {
                card3.Rows.Add(row["Year"], row["Count"]);
            }

            // Bind the DataTable to the ASP.NET control
            ViewState["Card3Data"] = card3;
        }

        public string ConvertDataTableToHTML(DataTable dt)
        {
            string html = "<table><thead><tr><th>Country Name</th><th>Count of Donors</th></tr></thead><tbody>";

            foreach (DataRow row in dt.Rows)
            {
                html += "<tr><td>" + row["Country Name"] + "</td><td>" + row["Count of Donor"] + "</td></tr>";
            }

            html += "</tbody></table>";

            return html;
        }

        public string ConvertDataTableToHTML1(DataTable dt1)
        {
            string html = "<table><thead><tr><th>Blood Group</th><th>Count of Donor</th></tr></thead><tbody>";

            foreach (DataRow row in dt1.Rows)
            {
                html += "<tr><td>" + row["Blood Group"] + "</td><td>" + row["Count of Donors"] + "</td></tr>";
            }

            html += "</tbody></table>";

            return html;
        }

        public string ConvertDataTableToHTML2(DataTable dt2)
        {
            string html = "<table><thead><tr><th>Year</th><th>Count</th></tr></thead><tbody>";

            foreach (DataRow row in dt2.Rows)
            {
                html += "<tr><td>" + row["Year"] + "</td><td>" + row["Count"] + "</td></tr>";
            }

            html += "</tbody></table>";

            return html;
        }

    }
}