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
    public partial class test1 : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            string course_name, subcourse, subcourse_img;
            double price;
            int suser;
            if (Session["user_id"] != null)
            {
                suser = Convert.ToInt32(Session["user_id"]);
            }
            else
            {
                Response.Redirect("Login.aspx");
                return;
            }
            if (e.CommandName == "addtocart")
            {
                string course_id = e.CommandArgument.ToString();
                string q = "  exec findcoursebyid '" + course_id + "'  ";
                SqlCommand cmd = new SqlCommand(q, conn);
                SqlDataReader rdr = cmd.ExecuteReader();
                if (rdr.HasRows)
                {
                    rdr.Read();
                    course_name = rdr["course_name"].ToString();
                    subcourse = rdr["subcourse"].ToString();
                    subcourse_img = rdr["subcourse_img"].ToString();
                    price = double.Parse(rdr["price"].ToString());
                    rdr.Close();
                    string ql = "exec addtocart '" + course_name + "','" + subcourse + "','" + subcourse_img + "','" + price + "','" + suser + "'";
                    SqlCommand c = new SqlCommand(ql, conn);
                    c.ExecuteNonQuery();
                    Response.Redirect("cart.aspx");
                }
            }

        }
    }
}