using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemWebAPP.BLL;
using StockManagementSystemWebAPP.DAL.Gateway;
using StockManagementSystemWebAPP.DAL.Model;

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
    }
}