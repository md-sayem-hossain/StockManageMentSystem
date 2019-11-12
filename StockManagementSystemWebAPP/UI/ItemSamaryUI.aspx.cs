using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using StockManagementSystemWebAPP.BLL;
using StockManagementSystemWebAPP.DAL.Gateway;
using StockManagementSystemWebAPP.DAL.Model;
using ListItem = System.Web.UI.WebControls.ListItem;

namespace StockManagementSystemWebAPP.UI
{
    public partial class ItemSamaryUI : System.Web.UI.Page
    {



        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["StockDB"].ConnectionString);
        SqlCommand command;
        SqlDataAdapter dataAdapter;
        //private OleDbCommand com, com1;
        DataSet dataSet = new DataSet();
        string query;
        CategoryManager aCategoryManager = new CategoryManager();
        CompanyManager aCompanyManager = new CompanyManager();

       SumurryManager aSumurryManager = new SumurryManager();






        protected void Page_Load(object sender, EventArgs e)
       {
           if (Session["user"] == null)
           {
               Response.Redirect("LoginUI.aspx");
           }

            if (!IsPostBack)
            {
                GetCompany();
                GetCategory();
            }
                
            
        }

       
        private void GetCompany()
        {
            dataSet.Clear();
            query = "Select * from CompanyTB";
            dataAdapter = new SqlDataAdapter(query, connection);

            dataAdapter.Fill(dataSet);
            if (dataSet.Tables[0].Rows.Count > 0)
            {
                CompanyDropDownList.DataSource = dataSet;
                CompanyDropDownList.DataTextField = "CompanyName";
                CompanyDropDownList.DataValueField = "Id";
                CompanyDropDownList.DataBind();
                CompanyDropDownList.Items.Insert(0, new ListItem("Choose Company Name", "0"));
                CompanyDropDownList.SelectedIndex = 0;
            }
        }
        private void GetCategory()
        {
            dataSet.Clear();
            
            query = "Select * from CategoryTB";
            dataAdapter = new SqlDataAdapter(query, connection);

            dataAdapter.Fill(dataSet);
            if (dataSet.Tables[0].Rows.Count > 0)
            {
                categoryDropDown.DataSource = dataSet;
                categoryDropDown.DataTextField = "CategoryName";
                categoryDropDown.DataValueField = "Id";
                categoryDropDown.DataBind();
                categoryDropDown.Items.Insert(0, new ListItem("Choose Category Name", "0"));
                categoryDropDown.SelectedIndex = 0;
            }
        }

        private void PageLoadPreview(SumurryModel aSumurryModel)
        {
            List<SumurryModel> sumurryList = aSumurryManager.AllSumurry(aSumurryModel);
            sumurryGridView.DataSource = sumurryList;
            sumurryGridView.DataBind();
            // show();
        }

        protected void SearchButton_Click(object sender, EventArgs e)
        {
            string CategoryName = categoryDropDown.SelectedItem.Text;
            string CompanyName = CompanyDropDownList.SelectedItem.Text;

            if (CompanyName.Equals("Choose Company Name"))
            {
                CompanyName = null;
            }
            else if (CategoryName.Equals("Choose Category Name"))
            {
                CategoryName = null;
            }
            SumurryModel aModel = new SumurryModel();
            aModel.CategoryName = CategoryName;
            aModel.CompanyName = CompanyName;

            PageLoadPreview(aModel);
            categoryDropDown.SelectedIndex = 0;
            CompanyDropDownList.SelectedIndex = 0;

        }
        protected void pdfbutton_Click(object sender, EventArgs e)
        {
            ExportGridToPDF();
        }
      


        private void ExportGridToPDF()
        {

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=Vithal_Wadje.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            sumurryGridView.RenderControl(hw);
            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            pdfDoc.Open();
            htmlparser.Parse(sr);
            pdfDoc.Close();
            Response.Write(pdfDoc);
            Response.End();
            sumurryGridView.AllowPaging = true;
            sumurryGridView.DataBind();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //required to avoid the runtime error "  
            //Control 'GridView1' of type 'GridView' must be placed inside a form tag with runat=server."  
        }  
    }
}