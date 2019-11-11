using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;
using System.Web.UI.WebControls;
using StockManagementSystemWebAPP.BLL;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.UI
{
    public partial class ViewSalesUI : System.Web.UI.Page
    {



        private SqlConnection con;
        private SqlCommand com;
        private string constr, query;  








        ViewSalesManager aViewSalesManager = new ViewSalesManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("LoginUI.aspx");
            }
        }

        public void pageload(string date1,string date2)
        {
            List<ViewSalesModel> stockOutList = aViewSalesManager.AllViewSales(date1,date2);
            SalesGridView.DataSource = stockOutList;
            SalesGridView.DataBind();
        }
        protected void SalesGridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string date1 = usr1.Text;
            string date2 = usr2.Text;


            aViewSalesManager.AllViewSales(date1, date2);
            pageload(date1,date2);
        }

        protected void pdfbutton_Click(object sender, EventArgs e)
        {
            ExportGridToPDF();  
        }
        private void connection()
        {
            constr = ConfigurationManager.ConnectionStrings["StockDB"].ToString();
            con = new SqlConnection(constr);
            con.Open();

        }

     
        private void ExportGridToPDF()
        {

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Vithal_Wadje.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            SalesGridView.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            SalesGridView.AllowPaging = true;
            SalesGridView.DataBind();
        }  
        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }  
  
    }
}