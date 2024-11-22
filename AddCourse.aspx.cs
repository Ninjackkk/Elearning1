using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Elearning1
{
    public partial class AddCourse : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string subcourse_img = "";
            string cname = txtCourseName.Text;
            string scname = txtSubcourseName.Text;
            if (FileUpload1.HasFile)
            {
                string fileName = Path.GetFileName(FileUpload1.FileName);
                string uploadFolder = Server.MapPath("~/img/");
                string filePath = Path.Combine(uploadFolder, fileName);

                Directory.CreateDirectory(uploadFolder);

                FileUpload1.SaveAs(filePath);

                subcourse_img = "~/img/" + fileName;

            }
            else
            {
                Response.Write("<script> alert('Please select a subcourse image.')</script>");
            }
            double price = double.Parse(txtPrice.Text);
            string query = $"exec fetchcourse '{@cname}','{@scname}'";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Read();
                if (rdr["course_name"].Equals(cname) && rdr["subcourse"].Equals(scname))
                {
                    Response.Write("<script>alert('Course/Subcourse already exists')</script>");
                    rdr.Close();
                }
            }
            else
            {
                rdr.Close();
                string q = $"exec new_course '{@cname}','{@scname}','{@subcourse_img}','{@price}'";
                SqlCommand cmdd = new SqlCommand(q, conn);
                cmdd.ExecuteNonQuery();
                Response.Write("<script>alert('Course Added Successfully')</script>");
            }
        }
    }
}


