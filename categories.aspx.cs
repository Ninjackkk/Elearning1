using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Elearning1
{
    public partial class test : System.Web.UI.Page
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
            string cname, scname;
            cname = DropDownList1.SelectedValue.ToString();
            scname = DropDownList2.SelectedValue.ToString();
            string q = $"exec filter '{@cname}','{@scname}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            System.Data.DataTable dt = new System.Data.DataTable();
            adapter.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();

        }
        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    string cname = DropDownList1.SelectedValue;
        //    string scname = DropDownList2.SelectedValue;

        //    string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
        //    using (SqlConnection conn = new SqlConnection(cs))
        //    {
        //        conn.Open();
        //        string query = "SELECT * FROM videos WHERE course_name = @cname AND subcourse = @scname";
        //        SqlCommand cmd = new SqlCommand(query, conn);
        //        cmd.Parameters.AddWithValue("@cname", cname);
        //        cmd.Parameters.AddWithValue("@scname", scname);

        //        SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        //        System.Data.DataTable dt = new System.Data.DataTable();
        //        adapter.Fill(dt);

        //        DataList1.DataSource = dt;
        //        DataList1.DataBind();
        //    }
        //}

    }
}