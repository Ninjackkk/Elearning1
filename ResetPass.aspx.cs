using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Elearning1
{
    public partial class ResetPass : System.Web.UI.Page
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
            string username = TextBox1.Text;
            string New_pass = TextBox2.Text;
            string q = $"select user_name from users where user_name='{username}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                rdr.Close();
                string q1 = $"update users set user_pass='{New_pass}' where user_name='{username}'";
                SqlCommand c = new SqlCommand(q1, conn);
                c.ExecuteNonQuery();
            }

            else
            {
                Response.Write("<script>alert('Password Update Failed')</script)");
                Response.Redirect("ResetPass.aspx");
            }

            Response.Write("<script>alert('Password Updated successfully')</script>");

            Response.Redirect("Login.aspx");

        }
    }
}