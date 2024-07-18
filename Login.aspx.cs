using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Elearning1
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();
        }
        protected void Button2_Click(object sender, EventArgs e)
        {

            string name = txtName.Text.ToString();
            string email = txtEmail.Text.ToString();
            string password = txtPassword.Text.ToString();
            string phone = txtPhone.Text.ToString();
            string role = "user";
            string q = $"exec new_user '{@name}','{@email}','{@password}','{@phone}','{@role}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            clear();

            Response.Write("<script>alert('Registration Successfull')</script>");
        }
        protected void clear()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtPhone.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int userid;
            string user_name=TextBox1.Text.ToString();
            string user_pass=TextBox2.Text.ToString();
            string q = $"exec login '{user_name}','{user_pass}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                while (rdr.Read())
                {
                    int user_id = Convert.ToInt32(rdr["user_id"]);

                    Session["user_id"] = user_id;

                    if (rdr["user_name"].Equals("admin") && rdr["user_pass"].Equals("admin"))
                    {
                        Response.Redirect("AddCourse.aspx");
                    }

                    if (rdr["user_name"].Equals(user_name) && rdr["user_pass"].Equals(user_pass) && rdr["user_role"].Equals("user"))
                    {
                        Response.Redirect("" +
                            "All.aspx");
                    }
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Credentials')</script>");
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ResetPass.aspx");
        }
    }
}