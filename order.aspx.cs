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
    public partial class order : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            //string course_name, subcourse, subcourse_img, video_name, video_desc, video_pic, video_src, videonum;
            //int price;
           
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
     
            if (!IsPostBack)
            {
                if (Session["total"] != null)
                {
                    double total = Convert.ToDouble(Session["total"]);
                    LabelTotal.Text = $"Total: {total}"; 
                }
                else
                {
                    LabelTotal.Text = "Total: N/A"; 
                }
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("cart.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            Response.Redirect("payment.aspx");
        }
    }
}