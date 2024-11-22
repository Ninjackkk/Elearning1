using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using Razorpay.Api;
using System.Drawing.Printing;
using System.IO;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text;

namespace Elearning1
{
    public partial class test2 : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

        //    Button2.Visible = false;

        //    Label3.Text = "Inv" + FetchInvoiceId().ToString();
        //    Label4.Text = "Test Address";
        //    //Label5.Text = Session["Total"].ToString();
        //    if (!IsPostBack)
        //    {
        //        FetchPlaceData();
        //    }
        //}

        //public int FetchInvoiceId()
        //{
        //    Random random = new Random();
        //    return random.Next(10, 99);
        //}

        //public void FetchPlaceData()
        //{

        //    string q = $"select * from placeorder where suser='{Session["myuser"].ToString()}'";
        //    SqlDataAdapter ada = new SqlDataAdapter(q, conn);
        //    DataSet ds = new DataSet();
        //    ada.Fill(ds);

        //    GridView1.DataSource = ds;
        //    GridView1.DataBind();

        //    PushingData();
        //}

        //public void PushingData()
        //{
        //    string q = $"insert into orderhistory(pname,pcat,pimg,price,qty,totalPrice,dt,suser) select pname,pcat,pimg,price,qty,totalPrice,dt,suser from placeorder where suser='{Session["myuser"].ToString()}'";
        //    SqlCommand c = new SqlCommand(q, conn);
        //    int row = c.ExecuteNonQuery();
        //    if (row > 0)
        //    {
        //        string query = $"delete from placeorder where suser='{Session["myuser"].ToString()}'";
        //        SqlCommand cm = new SqlCommand(query, conn);
        //        cm.ExecuteNonQuery();

        //    }
        //
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string keyId = "rzp_test_Kl7588Yie2yJTV";
            string keySecret = "6dN9Nqs7M6HPFMlL45AhaTgp";

            RazorpayClient razorpayClient = new RazorpayClient(keyId, keySecret);

            double amount = 889;

            // Create an order
            Dictionary<string, object> options = new Dictionary<string, object>();
            options.Add("amount", amount * 100); // Amount should be in paisa (multiply by 100 for rupees)
            options.Add("currency", "INR");
            options.Add("receipt", "order_receipt_123");
            options.Add("payment_capture", 1); // Auto capture payment

            Razorpay.Api.Order order = razorpayClient.Order.Create(options);

            string orderId = order["id"].ToString();

            // Set the generated order ID to the label on the page
            lblOrderId.Text = orderId;

            // Store order ID in session for later use, if needed
            Session["OrderId"] = orderId;

            // Set total amount label (if needed)
            lblTotalAmount.Text = (amount * 100).ToString(); // Assuming you want to display in paisa

            // Generate Razorpay script and register it
            string razorpayScript = $@"
        <script src='https://checkout.razorpay.com/v1/checkout.js'></script>
        <script>
            var options = {{
                'key': '{keyId}',
                'amount': {amount * 100},
                'currency': 'INR',
                'name': 'SoloLearn',
                'description': 'Checkout Payment',
                'order_id': '{orderId}',
                'handler': function(response) {{
                    // Handle successful payment response
                    alert('Payment successful. Payment ID: ' + response.razorpay_payment_id);
                    window.location.href='mycourses.aspx';
                }},
                'prefill': {{
                    'name': 'Krish Kheloji',
                    'email': 'khelojikrish@gmail.com',
                    'contact': '7208921898'
                }},
                'theme': {{
                    'color': '#F37254'
                }}
            }};
            var rzp1 = new Razorpay(options);
            rzp1.on('payment.failed', function (response) {{
                alert(response.error.description);
            }});
            rzp1.open();
        </script>";

            // Register the script on the page
            ClientScript.RegisterStartupScript(this.GetType(), "razorpayScript", razorpayScript);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=OrderInvoice.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter writer = new HtmlTextWriter(sw);
            Panel1.RenderControl(writer);
            StringReader stringReader = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 100f, 0f);
            HTMLWorker worker = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            worker.Parse(stringReader);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }
    }
}
