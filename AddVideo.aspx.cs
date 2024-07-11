using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Elearning1
{
    public partial class AddVideo : System.Web.UI.Page
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
            string cname, scname, video_name, video_desc, video_img="", video_src;
            int video_num;
            cname = DropDownList1.SelectedValue.ToString();
            scname = DropDownList2.SelectedValue.ToString();
            video_name = TextBox1.Text.ToString();
            video_desc = TextBox2.Text.ToString();
            if (FileUpload1.HasFile)
            {
                string filename = Path.GetFileName(FileUpload1.FileName);
                string imgPath = "~/img/" + filename;

                string filePath = Server.MapPath(imgPath);
                FileUpload1.SaveAs(filePath);

                video_img = imgPath;

            }
            else
            {
                Response.Write("<script> alert('Please select a video image.')</script>");
            }
            video_src=TextBox4.Text.ToString();
            video_num=int.Parse(TextBox5.Text.ToString());

            string q = $"exec newvideo '{@cname}','{@scname}','{@video_name}','{@video_desc}','{@video_img}','{@video_src}','{video_num}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('Video Added Successfully')</script>");
        }
    }
}