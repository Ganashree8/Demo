using BloodDonorPage.Code;
using Microsoft.AspNet.FriendlyUrls;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Windows.Forms;
using MessageBox = System.Windows.Forms.MessageBox;

namespace BloodDonorPage
{

    public partial class _Default : Page
    {
        DB data = new DB();

        #region PageLoad
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PopulateCountries();
                PopulateStates();
                GetAllDonors();
                EntryDateTextBox.Text = DateTime.Today.Date.ToString("yyyy/MM/dd");
            }           
        }

        #endregion

        #region Methods

        private void PopulateCountries()
        {


            DataTable country = new DataTable();
            country.Columns.Add("CountryName");
            country.Columns.Add("ID");
            DB countries = new DB();
            country = countries.GetData("Select * from Country", false);

            DropDownCountry.DataSource = country;
            DropDownCountry.DataTextField = "CountryName";
            DropDownCountry.DataValueField = "ID";
            DropDownCountry.DataBind();      
          //  DropDownCountry.Items.Insert(0, new ListItem("Select Country", ""));
            

        }

       
        private void PopulateStates()
        {

            
            DataTable state = new DataTable();
            state.Columns.Add("StateName");
            state.Columns.Add("ID");

            DB states = new DB();
            state = states.GetData($"Select * FROM States WHERE CountryID= {DropDownCountry.SelectedValue}", false);

            DropDownState.DataSource = state;
            DropDownState.DataTextField = "StateName";
            DropDownState.DataValueField = "ID";
            DropDownState.DataBind();
           // DropDownState.Items.Insert(0, new ListItem("Select State", ""));
        }

        void GetAllDonors()
        {
            DataTable donors = data.GetData("GetDonors", false);
            if (donors == null || donors.Rows.Count > 0)
            {
                if (grd.Rows.Count == 0)
                {
                    FnBindGridviewColumns(donors);
                }
                grd.DataSource = donors;
                grd.DataBind();

            }
        }

        void FnBindGridviewColumns(DataTable dt)
        {
            try
            {
                int columnsCount = dt.Columns.Count;
                for (int i = 0; i < columnsCount; i++)
                {
                    BoundField boundField = new BoundField();
                    boundField.DataField = dt.Columns[i].ColumnName;
                    boundField.HeaderText = dt.Columns[i].ColumnName;
                    grd.Columns.Add(boundField);
                }
                ButtonField buttonField = new ButtonField();
                buttonField.ButtonType = ButtonType.Image;
                buttonField.Text = "Edit";
                buttonField.ImageUrl = "~/Assets/Images/Edit_.png";
                buttonField.ControlStyle.Height = 20;
                buttonField.ControlStyle.Width = 20;
                buttonField.CommandName = "upd";
                grd.Columns.Add(buttonField);

                buttonField = new ButtonField();
                buttonField.ButtonType = ButtonType.Image;
                buttonField.Text = "delete";
                buttonField.ImageUrl = "~/Assets/Images/Delete_.png";
                buttonField.ControlStyle.Height = 20;
                buttonField.ControlStyle.Width = 20;
                buttonField.CommandName = "del";
                grd.Columns.Add(buttonField);
            }
            catch (Exception ex)
            { }
        }


        void clearForm()
        {
            firstname.Text = string.Empty;
            lastname.Text = string.Empty;
            DropDownBloodGroup.Text = string.Empty;
            age.Text = string.Empty;
            DoB.Text = string.Empty;
            email.Text = string.Empty;
            txtContactNumber.Text = string.Empty;
            address.Text = string.Empty;
            gender.Text = string.Empty;
            EntryDateTextBox.Text = DateTime.Today.Date.ToString("yyyy/MM/dd");
            DropDownCountry.Text = string.Empty;
            DropDownCountry.Text = string.Empty;
        }


        private string GenerateCsvData(DataTable dataTable)
        {
            StringBuilder csvData = new StringBuilder();

            // Add column headers
            foreach (DataColumn column in dataTable.Columns)
            {
                csvData.Append(column.ColumnName + ",");
            }
            csvData.Append(Environment.NewLine);

            // Add data rows
            foreach (DataRow row in dataTable.Rows)
            {
                foreach (object item in row.ItemArray)
                {
                    csvData.Append(item.ToString() + ",");
                }
                csvData.Append(Environment.NewLine);
            }

            return csvData.ToString();
        }

        #endregion

        #region RowCommand
        protected void grd_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            DB updateOrDelete = new DB();
            try
            {

                if (e.CommandName == "upd")
                {
                    panelAddNewDonor.Visible = true;
                    pnlGetDonors.Visible = false;
                    btnAddAndDownload.Visible = false;
                    btnSubmit.Text = "Update";
                    int rowIndex = int.Parse(e.CommandArgument.ToString());
                    ViewState["DonorID"] = grd.Rows[rowIndex].Cells[0].Text.ToString();
                    firstname.Text = grd.Rows[rowIndex].Cells[1].Text.ToString();
                    lastname.Text = grd.Rows[rowIndex].Cells[2].Text.ToString();
                    DropDownBloodGroup.SelectedValue = grd.Rows[rowIndex].Cells[3].Text.ToString();
                    age.Text = grd.Rows[rowIndex].Cells[4].Text.ToString();
                    DoB.Text = grd.Rows[rowIndex].Cells[5].Text.ToString();
                    email.Text = grd.Rows[rowIndex].Cells[6].Text.ToString();
                    txtContactNumber.Text = grd.Rows[rowIndex].Cells[7].Text.ToString();
                    address.Text = grd.Rows[rowIndex].Cells[8].Text.ToString();
                    gender.Text = grd.Rows[rowIndex].Cells[9].Text.ToString();
                    EntryDateTextBox.Text = grd.Rows[rowIndex].Cells[10].Text.ToString();
                    DropDownCountry.SelectedValue = grd.Rows[rowIndex].Cells[11].Text.ToString();
                    DropDownState.SelectedValue = grd.Rows[rowIndex].Cells[12].Text.ToString();
                    

                }
                else if (e.CommandName == "del")
                {
                    int rowIndex = int.Parse(e.CommandArgument.ToString());
                    ViewState["DonorID"] = grd.Rows[rowIndex].Cells[0].Text.ToString();
                    popupDelete.Show();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
        #endregion

        #region Buttons
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DB donors = new DB();
            // Assuming entryDate is a DateTime variable representing the EntryDate received from the database
            try
            {
                bool res = isvalid();
                if (res == false)
                {
                    Code.Parameter cParams = new Code.Parameter
                    {   
                    FirstName = firstname.Text,
                    LastName = lastname.Text,
                    BloodGroup = DropDownBloodGroup.SelectedValue,
                    Age = Convert.ToInt32(age.Text),
                    DateofBirth = Convert.ToDateTime(DoB.Text),
                    Email = email.Text,
                    Phone = txtContactNumber.Text,
                    Address = address.Text,
                    Gender = gender.SelectedValue,
                    EntryDate = Convert.ToDateTime(EntryDateTextBox.Text),
                    Country = Convert.ToInt32(DropDownCountry.Text),
                    State = Convert.ToInt32(DropDownState.Text),

                    };

                    
                    if (btnSubmit.Text == "Submit")
                    {
                        donors.AddDonors(cParams);
                        Response.Write("Form submitted successfully!");
                        panelAddNewDonor.Visible = false;
                        pnlGetDonors.Visible = true;
                        btnAddAndDownload.Visible = true;
                        clearForm();
                        GetAllDonors();

                    }
                    else if (btnSubmit.Text == "Update")
                    {

                        int DonorID = Convert.ToInt32(ViewState["DonorID"]);
                        donors.UpdateDonorDetails(cParams, DonorID);
                        Response.Write("Form updated successfully!");
                        panelAddNewDonor.Visible = false;
                        pnlGetDonors.Visible = true;
                        btnAddAndDownload.Visible = true;

                        clearForm();
                        btnSubmit.Text = "Submit";
                        GetAllDonors();
                    }
                    lblErrorMessage.Text = "";
                    lblErrorMessage.Visible = false;
                }
                else
                {
                    //Console.WriteLine("Error");
                    lblErrorMessage.Visible = true;
                    lblErrorMessage.Text = "";

                    //lblErrorMessage.Visible = false;

                    //MessageBox.Show("Validation failed. Please check your input and try again.", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                //MessageBox.Show("An error occurred: " + ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                lblErrorMessage.Text += ex.Message;
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            firstname.Text = string.Empty;
            lastname.Text = string.Empty;
            DropDownBloodGroup.Text = string.Empty;
            age.Text = string.Empty;
            DoB.Text = string.Empty;
            email.Text = string.Empty;
            txtContactNumber.Text = string.Empty;
            address.Text = string.Empty;
            gender.Text = string.Empty;
            lblErrorMessage.Text = "";
            lblErrorMessage.Visible = false;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void DropDownCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            PopulateStates();
        }

        protected void btnAddDonor_Click(object sender, EventArgs e)
        {
            btnAddAndDownload.Visible = false;
            pnlGetDonors.Visible = false;
            panelAddNewDonor.Visible = true;

        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            DB db = new DB();
            DataTable donorData = db.GetDonorData();


            // Generate CSV data
            string csvData = GenerateCsvData(donorData);

            // Prompt the user to download the CSV file
            Response.Clear();
            Response.ContentType = "text/csv";
            Response.AddHeader("Content-Disposition", "attachment; filename=DonorList.csv");
            Response.Write(csvData);
            Response.End();

        }

        protected void btnViewDonors_Click(object sender, EventArgs e)
        {
            pnlGetDonors.Visible = true;
            btnAddAndDownload.Visible = false;

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {

        }

        #endregion

        #region Event
        protected void DropDownCountry_SelectedIndexChanged1(object sender, EventArgs e)
        {
            // Retrieve selected country ID
            int countryId = int.Parse(DropDownCountry.SelectedValue);

            // Populate states dropdown list based on selected country
            PopulateStates();
        }

        protected void yespopup_Click(object sender, EventArgs e)
        {

            DB updateOrDelete = new DB();
            int donorIDToDelete = Convert.ToInt32(ViewState["DonorID"].ToString());
            updateOrDelete.DeleteDonor(donorIDToDelete);
            pnlGetDonors.Visible = true;
            btnAddAndDownload.Visible = true;
            Response.Write("Record deleted successfully!");
            GetAllDonors();
            popupDelete.Hide(); // Hide the confirmation dialog after deletion
        }

        protected void cancelpopup_Click(object sender, EventArgs e)
        {
            popupDelete.Hide();
            Response.Redirect("~/Default.aspx");
        }

        #endregion

        protected void btnBack_Click1(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }


        protected void CustomValidator1_ServerValidate1(object source, ServerValidateEventArgs args)
        {
            DateTime dob;
            if (DateTime.TryParseExact(DoB.Text, "yyyy/MM/dd", CultureInfo.InvariantCulture, DateTimeStyles.None, out dob))
            {
                TimeSpan ageDifference = DateTime.Today - dob;
                args.IsValid = (ageDifference.TotalDays >= (365.25 * 18)); // Assuming 365.25 days per year for better accuracy with leap years
            }
            else
            {
                args.IsValid = false; // Validation fails if the entered date of birth is not in the correct format
            }
        }

        //protected void GridView1_PageIndexChanged1(object sender, GridViewPageEventArgs e)
        //{
        //    GridView1.PageIndex = e.NewPageIndex;
        //    DataTable dt = (DataTable)ViewState["DonorID"];
        //    GridView1.DataSource = dt;
        //    GridView1.DataBind();
        //}

        public bool isvalid()
        {
            bool status=false;
            string namepattern = "^[a-zA-Z]{1,14}$";
            //string lastnamepattern = "^[a-zA-Z]{1,14}$";
            string yearpattern = @"^\d{4}/(0[1-9]|1[0-2])/(0[1-9]|[12]\d|3[01])$";
            if (firstname.Text == "")
            {
                lblErrorMessage.Text = "First name is required";
                status = true;
            }
            else if (Convert.ToInt32(firstname.Text.Length) > 15)
            {
                lblErrorMessage.Text = "First name maximum length is 15 characters";
                status = true;
            }
            else if (Convert.ToInt32(firstname.Text.Length) < 3)
            {
                lblErrorMessage.Text = "First name minimum length is 15 characters";
                status = true;
            }
            else if (!(Regex.IsMatch(firstname.Text, namepattern)))
            {
                //string formattedFirstName = char.ToUpper(firstname.Text[0]) + firstname.Text.Substring(1).ToLower();
                lblErrorMessage.Text = "Firstname should contain only characters";
                status = true;
            }
            else if ((Regex.IsMatch(firstname.Text, namepattern)))
            {
                string formattedFirstName = char.ToUpper(firstname.Text[0]) + firstname.Text.Substring(1).ToLower();
                firstname.Text = formattedFirstName;
            }
            else if (lastname.Text == "")
            {
                lblErrorMessage.Text = "Last name is required";
                status = true;
            }
            else if (Convert.ToInt32(lastname.Text.Length) > 15)
            {
                lblErrorMessage.Text = "Lastname maximum length is 15 characters";
                status = true;
            }
           
            //else if (!(Regex.IsMatch(lastname.Text, lastnamepattern)))
            //{
            //    //string formattedFirstName = char.ToUpper(firstname.Text[0]) + firstname.Text.Substring(1).ToLower();
            //    lblErrorMessage.Text = "Lastname should contain only characters";
            //    status = true;
            //}
            //else if ((Regex.IsMatch(lastname.Text, lastnamepattern)))
            //{
            //    string formattedLastName = char.ToUpper(lastname.Text[0]) + lastname.Text.Substring(1).ToLower();
            //    lastname.Text = formattedLastName;
            //}

            else if (DropDownBloodGroup.Text == "")
            {
                lblErrorMessage.Text = "Blood group name is required";
                status = true;
            }
            else if (age.Text == "")
            {
                lblErrorMessage.Text = "Age is required";
                status = true;
            } else if (DoB.Text == "")
            {
                lblErrorMessage.Text = "Date of birth is required";
                status = true;
            }
            else if (!Regex.IsMatch(DoB.Text, yearpattern)) {
                lblErrorMessage.Text = "Invalid date of birth";
                status = true;
            }
            else if (email.Text == "")
            {
                lblErrorMessage.Text = "Email is required";
                status = true;
            } else if (txtContactNumber.Text == "")
            {
                lblErrorMessage.Text = "Contact number is required";
                status = true;
            } else if (DropDownCountry.Text == "")
            {
                lblErrorMessage.Text = "Please select country";
                status = true;
            } else if (DropDownState.Text == "")
            {
                lblErrorMessage.Text = "Please select state";
                status = true;
            }
            else
            {
                status = false;
            }
            return status;
        }

       
       
    }
}