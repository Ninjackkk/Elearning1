using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Elearning1
{
    public partial class cart : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            double total = 0.0;
            
                int suser = Convert.ToInt32(Session["user_id"]);

                string q = "total";
                SqlCommand cmd = new SqlCommand(q, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@suser", suser);

                conn.Open();
                SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.Read())
                {
                    total = Convert.ToDouble(rdr["total"]);
                }

                rdr.Close();

                Session["total"] = total;

                Response.Redirect("order.aspx");   
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("All.aspx");
        }
    }
}