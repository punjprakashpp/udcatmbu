using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using ClosedXML.Excel;

public partial class UploadStudentData : System.Web.UI.Page
{
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (fileUpload.HasFile)
        {
            try
            {
                string filePath = Server.MapPath("~/Uploads/") + Path.GetFileName(fileUpload.PostedFile.FileName);
                fileUpload.SaveAs(filePath);

                DataTable dtExcelData = new DataTable();
                dtExcelData.Columns.AddRange(new DataColumn[10] {
                    new DataColumn("Session", typeof(string)),
                    new DataColumn("RollNo", typeof(string)),
                    new DataColumn("RegNo", typeof(string)),
                    new DataColumn("RegYear", typeof(string)),
                    new DataColumn("FirstName", typeof(string)),
                    new DataColumn("MidName", typeof(string)),
                    new DataColumn("LastName", typeof(string)),
                    new DataColumn("DOB", typeof(DateTime)),
                    new DataColumn("Gender", typeof(string)),
                    new DataColumn("EntryDate", typeof(DateTime))
                });

                using (var workbook = new XLWorkbook(filePath))
                {
                    var worksheet = workbook.Worksheet(1); // Assuming first sheet
                    bool firstRow = true;

                    foreach (var row in worksheet.Rows())
                    {
                        if (firstRow)
                        {
                            firstRow = false;
                            continue; // Skip header row
                        }

                        // Read data from Excel row
                        string session = row.Cell(1).Value.ToString();
                        string rollNo = row.Cell(2).Value.ToString();
                        string regNo = row.Cell(3).Value.ToString();
                        string regYear = row.Cell(4).Value.ToString();
                        string firstName = row.Cell(5).Value.ToString();
                        string midName = row.Cell(6).Value.ToString();
                        string lastName = row.Cell(7).Value.ToString();
                        string dobString = row.Cell(8).Value.ToString();
                        string gender = row.Cell(9).Value.ToString();
                        string entryDateString = row.Cell(13).Value.ToString();

                        DateTime dob;
                        DateTime entryDate;

                        // Try parsing dates
                        if (!DateTime.TryParse(dobString, out dob))
                        {
                            dob = DateTime.MinValue; // Default if invalid date
                        }

                        if (!DateTime.TryParse(entryDateString, out entryDate))
                        {
                            entryDate = DateTime.MinValue; // Default if invalid date
                        }

                        // Add the row to DataTable
                        dtExcelData.Rows.Add(session, rollNo, regNo, regYear, firstName, midName, lastName, dob, gender, entryDate);
                    }
                }

                // SQL connection and bulk copy operation
                string consString = ConfigurationManager.ConnectionStrings["WebsiteConnectionString"].ConnectionString;
                using (SqlConnection con = new SqlConnection(consString))
                {
                    using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                    {
                        sqlBulkCopy.DestinationTableName = "dbo.Student";

                        // Column mappings (ensure the column names in database match exactly)
                        sqlBulkCopy.ColumnMappings.Add("Session", "Session");
                        sqlBulkCopy.ColumnMappings.Add("RollNo", "Roll");
                        sqlBulkCopy.ColumnMappings.Add("RegNo", "RegNo");
                        sqlBulkCopy.ColumnMappings.Add("RegYear", "RegYear");
                        sqlBulkCopy.ColumnMappings.Add("FirstName", "FirstName");
                        sqlBulkCopy.ColumnMappings.Add("MidName", "MidName");
                        sqlBulkCopy.ColumnMappings.Add("LastName", "LastName");
                        sqlBulkCopy.ColumnMappings.Add("DOB", "DOB");
                        sqlBulkCopy.ColumnMappings.Add("Gender", "Gender");
                        sqlBulkCopy.ColumnMappings.Add("EntryDate", "EntryDate");

                        con.Open();
                        sqlBulkCopy.WriteToServer(dtExcelData);
                        lblmsg.Text = "Student Data Added Successfully!";
                        lblmsg.ForeColor = System.Drawing.Color.Green;  // Success message color
                    }
                }
            }
            catch (Exception ex)
            {
                lblmsg.Text = "Error: " + ex.Message; // Display error message if any
                lblmsg.ForeColor = System.Drawing.Color.Red;  // Error message color
            }
        }
        else
        {
            lblmsg.Text = "Please upload a file!";
            lblmsg.ForeColor = System.Drawing.Color.Red;  // Error message color
        }
    }
}