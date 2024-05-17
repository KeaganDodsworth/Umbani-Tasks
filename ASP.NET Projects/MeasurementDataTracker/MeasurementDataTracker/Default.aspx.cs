using MeasurementDataTracker.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MeasurementDataTracker
{
    public partial class _Default : Page
    {
        private string ConnectionString;
        string CurrentUserId;
        protected void Page_Load(object sender, EventArgs e)
        {
            CurrentUserId = User.Identity.GetUserId() ?? string.Empty;
            if (CurrentUserId == string.Empty)
            {
                Response.Redirect("/Account/Login.aspx");
            }
            else
            {
                ConnectionString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

                if (!IsPostBack)
                {
                    PopulateStatistics();
                    PopulateProductionLinesDropDown();
                    PopulateMeasurementObjects();
                }

            }


           
        }
        private void PopulateStatistics()
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("CalculateStats", connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            DataTable dt = new DataTable();
                            dt.Columns.Add("Statistic");
                            dt.Columns.Add("Temperature");
                            dt.Columns.Add("Humidity");
                            dt.Columns.Add("Weight");
                            dt.Columns.Add("Width");
                            dt.Columns.Add("Length");
                            dt.Columns.Add("Depth");

                            dt.Rows.Add("Max", reader["MaxTemp"], reader["MaxHumidity"], reader["MaxWeight"], reader["MaxWidth"], reader["MaxLength"], reader["MaxDepth"]);
                            dt.Rows.Add("Min", reader["MinTemp"], reader["MinHumidity"], reader["MinWeight"], reader["MinWidth"], reader["MinLength"], reader["MinDepth"]);
                            dt.Rows.Add("Variance", reader["VarianceTemp"], reader["VarianceHumidity"], reader["VarianceWeight"], reader["VarianceWidth"], reader["VarianceLength"], reader["VarianceDepth"]);
                            dt.Rows.Add("Mean", reader["MeanTemp"], reader["MeanHumidity"], reader["MeanWeight"], reader["MeanWidth"], reader["MeanLength"], reader["MeanDepth"]);
                            dt.Rows.Add("Total", reader["TotalTemp"], reader["TotalHumidity"], reader["TotalWeight"], reader["TotalWidth"], reader["TotalLength"], reader["TotalDepth"]);
                            dt.Rows.Add("Standard Deviation", reader["StandardDeviationTemp"], reader["StandardDeviationHumidity"], reader["StandardDeviationWeight"], reader["StandardDeviationWidth"], reader["StandardDeviationLength"], reader["StandardDeviationDepth"]);

                            GridView2.DataSource = dt;
                            GridView2.DataBind();
                        }
                    }
                }
            }
        }
        protected void PopulateProductionLinesDropDown()
        {
           
            string query = "SELECT ProductionLineID, ProductionLineName FROM ProductionLines";

            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataTable dt = new DataTable();

                connection.Open();
                adapter.Fill(dt);

                ddlProductionLine.DataSource = dt;
                ddlProductionLine.DataTextField = "ProductionLineName"; 
                ddlProductionLine.DataValueField = "ProductionLineID"; 
                ddlProductionLine.DataBind();
                
            }
        }
        protected void  PopulateMeasurementObjects()
        {
            MeasurementCollection measurements = new MeasurementCollection();

            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                connection.Open();

                string sqlQuery = "SELECT MeasurementData.*, AspNetUsers.UserName FROM MeasurementData INNER JOIN AspNetUsers ON MeasurementData.UserID = AspNetUsers.Id ORDER BY MeasurementID ";
                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Measurement newMeasurement = new Measurement();

                            newMeasurement.MeasurementID = (int)reader["MeasurementID"];
                            newMeasurement.Temperature = (int)reader["Temperature"];
                            newMeasurement.Humidity = (int)reader["Humidity"];
                            newMeasurement.Weight = (decimal)reader["Weight"];
                            newMeasurement.Width = (decimal)reader["Width"];
                            newMeasurement.Length = (decimal)reader["Length"];
                            newMeasurement.Depth = (decimal)reader["Depth"];
                            newMeasurement.ProductionLineID = (int)reader["ProductionLineID"];
                            newMeasurement.PassFail = (bool)reader["PassFail"];
                            newMeasurement.Timestamp = (DateTime)reader["TimestampUtc"];
                            newMeasurement.UserID = (string)reader["UserID"];
                            newMeasurement.UserName = (string)reader["UserName"];


                            measurements.Add(newMeasurement);
                        }
                    }
                }
            }
            
            GridView1.DataSource = measurements;

            GridView1.DataBind();

        }
        
        public void InsertData(Measurement newMeasurement)
        {

            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("InsertMeasurement", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Temperature", newMeasurement.Temperature);
                    command.Parameters.AddWithValue("@Humidity", newMeasurement.Humidity);
                    command.Parameters.AddWithValue("@Weight", newMeasurement.Weight);
                    command.Parameters.AddWithValue("@Width", newMeasurement.Width);
                    command.Parameters.AddWithValue("@Length", newMeasurement.Length);
                    command.Parameters.AddWithValue("@Depth", newMeasurement.Depth);
                    command.Parameters.AddWithValue("@ProductionLineID", newMeasurement.ProductionLineID);
                    command.Parameters.AddWithValue("@PassFail", newMeasurement.PassFail);
                    command.Parameters.AddWithValue("@TimestampUtc", newMeasurement.Timestamp);
                    command.Parameters.AddWithValue("@UserID", newMeasurement.UserID);
                    command.ExecuteNonQuery();

                    //int rowsAffected = command.ExecuteNonQuery();


                    //if (rowsAffected > 0)
                    //{
                    //    Response.Write("Data inserted successfully.");
                    //}
                    //else
                    //{
                    //    Response.Write("Failed to insert data.");
                    //}
                }
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            

            Measurement newMeasurement = new Measurement();
            newMeasurement.MeasurementID = Convert.ToInt32(ViewState["MeasurementID"]);

            newMeasurement.Temperature = int.Parse(txtTemperature.Text);
            newMeasurement.Humidity = int.Parse(txtHumidity.Text);
            newMeasurement.Weight = decimal.Parse(txtWeight.Text);
            newMeasurement.Width = decimal.Parse(txtWidth.Text);
            newMeasurement.Length = decimal.Parse(txtLength.Text);
            newMeasurement.Depth = decimal.Parse(txtDepth.Text);
            newMeasurement.ProductionLineID = int.Parse(ddlProductionLine.SelectedItem.Value);
            newMeasurement.PassFail = cbPassFail.Checked;
            newMeasurement.Timestamp = DateTime.UtcNow;
            newMeasurement.UserID = CurrentUserId;

            if (newMeasurement.MeasurementID == 0)
            {
                InsertData(newMeasurement);

            }
            else
            {
                UpdateData(newMeasurement);
            }
            ClearInputFields();
            PopulateStatistics();
            PopulateProductionLinesDropDown();

            Response.Redirect(Request.Url.AbsoluteUri);
        }

        public void UpdateData(Measurement newMeasurement)
        {
            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                connection.Open();

                

                using (SqlCommand command = new SqlCommand("UpdateMeasurement", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@MeasurementID", newMeasurement.MeasurementID);
                    command.Parameters.AddWithValue("@Temperature", newMeasurement.Temperature);
                    command.Parameters.AddWithValue("@Humidity", newMeasurement.Humidity);
                    command.Parameters.AddWithValue("@Weight", newMeasurement.Weight);
                    command.Parameters.AddWithValue("@Width", newMeasurement.Width);
                    command.Parameters.AddWithValue("@Length", newMeasurement.Length);
                    command.Parameters.AddWithValue("@Depth", newMeasurement.Depth);
                    command.Parameters.AddWithValue("@ProductionLineID", newMeasurement.ProductionLineID);
                    command.Parameters.AddWithValue("@PassFail", newMeasurement.PassFail);
                    command.Parameters.AddWithValue("@TimestampUtc", newMeasurement.Timestamp);
                    command.Parameters.AddWithValue("@UserID", newMeasurement.UserID);
                    command.ExecuteNonQuery();

                    //int rowsAffected = command.ExecuteNonQuery();


                    //if (rowsAffected > 0)
                    //{
                    //    Response.Write("Data inserted successfully.");
                    //}
                    //else
                    //{
                    //    Response.Write("Failed to insert data.");
                    //}
                }
            }
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;

            GridViewRow row = (GridViewRow)btn.NamingContainer;

           
            txtTemperature.Text = row.Cells[1].Text;
            txtHumidity.Text = row.Cells[2].Text;    
            txtWeight.Text = row.Cells[3].Text;      
            txtWidth.Text = row.Cells[4].Text;       
            txtLength.Text = row.Cells[5].Text;      
            txtDepth.Text = row.Cells[6].Text;      
            ddlProductionLine.SelectedValue = row.Cells[7].Text;
            cbPassFail.Checked = row.Cells[8].Text == "True";    

            
            ViewState["MeasurementID"] = row.Cells[0].Text;
        }




        protected void btnDelete_Click(object sender, EventArgs e)
        {

            Button btn = (Button)sender;

            GridViewRow row = (GridViewRow)btn.NamingContainer;

            ViewState["MeasurementID"] = row.Cells[0].Text;         

            using (SqlConnection connection = new SqlConnection(ConnectionString))
            {
                connection.Open();



                using (SqlCommand command = new SqlCommand("DeleteMeasurement", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@MeasurementID", ViewState["MeasurementID"]);
                    command.ExecuteNonQuery();


                }
            }
            PopulateStatistics();
            PopulateMeasurementObjects();


        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string userId = DataBinder.Eval(e.Row.DataItem, "UserID").ToString();

                bool currentUserOwnsRecord = (userId == CurrentUserId);

                Button btnEdit = (Button)e.Row.FindControl("btnEdit");
                Button btnDelete = (Button)e.Row.FindControl("btnDelete");

                btnEdit.Visible = currentUserOwnsRecord;
                btnDelete.Visible = currentUserOwnsRecord;
            }
        }
        private void ClearInputFields()
        {
            txtTemperature.Text = "";
            txtHumidity.Text = "";
            txtWeight.Text = "";
            txtWidth.Text = "";
            txtLength.Text = "";
            txtDepth.Text = "";
            ddlProductionLine.SelectedIndex = 0;
            cbPassFail.Checked = false;
        }

    }

}
