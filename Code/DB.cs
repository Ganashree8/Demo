using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Collections;
using System.Security.Cryptography.X509Certificates;
using System.EnterpriseServices.Internal;

namespace BloodDonorPage.Code
{
    public class DB
    {
        
        public DataTable GetData(string query, bool isSP)
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
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                return null;
            }
        }

        public DataTable GetDonorData()

        {
            try
            {
                SqlConnection sql = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "GetDonors";
                cmd.Connection = sql;

                cmd.CommandType = CommandType.StoredProcedure;
                
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public void AddDonors(Parameter cParams)
        {
            SqlConnection sql = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "AddDonorsSP";
            cmd.Connection = sql;
            cmd.CommandType = CommandType.StoredProcedure;

            List<SqlParameter> lstPar = new List<SqlParameter>();
            lstPar.Add(new SqlParameter("@FirstName", cParams.FirstName));
            lstPar.Add(new SqlParameter("@LastName", cParams.LastName));
            lstPar.Add(new SqlParameter("@BloodGroup", cParams.BloodGroup));
            lstPar.Add(new SqlParameter("@Age", cParams.Age));
            lstPar.Add(new SqlParameter("@DateOfBirth", cParams.DateofBirth));
            lstPar.Add(new SqlParameter("@Email", cParams.Email));
            lstPar.Add(new SqlParameter("@Phone", cParams.Phone));
            lstPar.Add(new SqlParameter("@Address", cParams.Address));
            lstPar.Add(new SqlParameter("@Gender", cParams.Gender));
            lstPar.Add(new SqlParameter("@EntryDate", cParams.EntryDate));
            lstPar.Add(new SqlParameter("@Country", cParams.Country));
            lstPar.Add(new SqlParameter("@State", cParams.State));

            foreach (SqlParameter p in lstPar)
            {
                cmd.Parameters.Add(p);
            }
            sql.Open();
            cmd.ExecuteNonQuery();
            sql.Close();

            
        }


        public void UpdateDonorDetails(Parameter cParams, int DonorID)
        {
            try
            {
                SqlConnection sql = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "UpdateDonorDetails";
                cmd.Connection = sql;
                cmd.CommandType = CommandType.StoredProcedure;

                List<SqlParameter> lstPar = new List<SqlParameter>();
                lstPar.Add(new SqlParameter("@DonorID", DonorID));
                lstPar.Add(new SqlParameter("@FirstName", cParams.FirstName));
                lstPar.Add(new SqlParameter("@LastName", cParams.LastName));
                lstPar.Add(new SqlParameter("@BloodGroup", cParams.BloodGroup));
                lstPar.Add(new SqlParameter("@Age", cParams.Age));
                lstPar.Add(new SqlParameter("@DateOfBirth", cParams.DateofBirth));
                lstPar.Add(new SqlParameter("@Email", cParams.Email));
                lstPar.Add(new SqlParameter("@Phone", cParams.Phone));
                lstPar.Add(new SqlParameter("@Address", cParams.Address));
                lstPar.Add(new SqlParameter("@Gender", cParams.Gender));
                lstPar.Add(new SqlParameter("@EntryDate", cParams.EntryDate));
                lstPar.Add(new SqlParameter("@Country", cParams.Country));
                lstPar.Add(new SqlParameter("@State", cParams.State));
                


                foreach (SqlParameter p in lstPar)
                {
                    cmd.Parameters.Add(p);
                }
                sql.Open();
                cmd.ExecuteNonQuery();
                sql.Close();
            }catch(Exception ex)
            {
                Console.WriteLine(ex);
            }
        }
        
        public void DeleteDonor(int DonorID)
        {
            SqlConnection sql = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "DeleteDonor";
            cmd.Connection = sql;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@DonorID", DonorID);
            sql.Open();
            cmd.ExecuteNonQuery();
            sql.Close();
        }

        public DataTable getAdminCredentials(string query)
        {
            DataTable dt = new DataTable();

            try
            {
                SqlConnection sql = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = query;
                cmd.Connection = sql;              
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                
                adapter.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                return null;
            }

            
        }
        
    }
}