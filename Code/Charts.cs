using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace BloodDonorPage.Code
{
    public class Charts
    {
        public DataSet GetChartData(String query, bool isSP = true)

        {
            try
            {
                SqlConnection sql = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = sql;

                if (isSP)
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                }
                else
                {
                    cmd.CommandType = CommandType.Text;
                }
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                adapter.Fill(ds);
                return ds;

            }
            catch (Exception ex)
            {
                return null;
            }
        }



        public string ChartData(DataTable dt, int count)
        {
            //DataTable dt = new DataTable();
            String Value1 = "";
            String Value2 = "";
            String charts = "";
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (i > 0)
                {
                    Value1 += ",";
                    Value2 += ",";
                }
                Value1 += "'" + dt.Rows[i][1].ToString() + "'";
                Value2 += dt.Rows[i][0].ToString();
            }

            if (count == 1)
            {
                charts = "<canvas id=\"barChart" + count + "\" style=\"width:100%;max-width:600px\"></canvas>" +
                        "<script>\r\nconst xValuesBar = [" + Value1 + "];\r\nconst yValuesBar = [" + Value2 + "];\r\n\r\nnew Chart(\"barChart" + count + "\", {\r\n    type: \"bar\",\r\n    data: {\r\n        labels: xValuesBar,\r\n        datasets: [{\r\n            backgroundColor: [\"rgba(255,0,0,1.0)\", \"rgba(0,255,0,1.0)\", \"rgba(0,0,255,1.0)\"], // Set different colors here\r\n            data: yValuesBar\r\n        }]\r\n    },\r\n    options: {\r\n        legend: { display: false },\r\n        scales: {\r\n            yAxes: [{ ticks: { min: 0, max: 12 } }],\r\n        }\r\n    }\r\n});\r\n</script>";
            }
            else if (count == 2)
            {
                charts = "<canvas id=\"pieChart" + count + "\" style=\"width:100%;max-width:600px\"></canvas>\r\n\r\n<script>\r\nvar xValuesPie = [" + Value1 + "];\r\nvar yValuesPie = [" + Value2 + "];\r\nvar barColors = [\r\n  \"#b91d47\",\r\n  \"#00aba9\",\r\n  \"#2b5797\"\r\n];\r\n\r\nnew Chart(\"pieChart" + count + "\", {\r\n  type: \"pie\",\r\n  data: {\r\n    labels: xValuesPie,\r\n    datasets: [{\r\n      backgroundColor: barColors,\r\n      data: yValuesPie\r\n    }]\r\n  },\r\n  options: {\r\n    title: {\r\n      display: true,\r\n      text: \"\"\r\n    }\r\n  }\r\n});\r\n</script>";
            }
            else if (count == 3)
            {
                charts = "<canvas id=\"myDoughnutChart" + count + "\" style=\"width:100%;max-width:600px\"></canvas>\r\n<script>\r\n  var xValues = [" + Value1 + "];\r\n  var yValues = [" + Value2 + "];\r\n  var doughnutColors = [\"#b91d47\", \"#00aba9\", \"#2b5797\"];\r\n\r\n  new Chart(\"myDoughnutChart" + count + "\", {\r\n    type: \"doughnut\",\r\n    data: {\r\n      labels: xValues,\r\n      datasets: [{\r\n        backgroundColor: doughnutColors,\r\n        data: yValues\r\n      }]\r\n    },\r\n    options: {\r\n      title: {\r\n        display: true,\r\n        text: \"\"\r\n      }\r\n    }\r\n  });\r\n</script>\r\n";
            }
            
            return charts;
        }

        
    }
}