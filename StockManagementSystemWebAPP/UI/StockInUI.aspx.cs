using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemWebAPP.BLL;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.UI
{
    public partial class StockInUI : System.Web.UI.Page
    {
        SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["StockDB"].ConnectionString);
        SqlCommand command;
        SqlDataAdapter dataAdapter;
        //private OleDbCommand com, com1;
        DataSet dataSet = new DataSet();
        string query;
        CategoryManager aCategoryManager = new CategoryManager();
        CompanyManager aCompanyManager = new CompanyManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("LoginUI.aspx");
            }
            if (!IsPostBack)
            {
                GetCompany();
                ItemDropDownList.Items.Insert(0, " No Item Available ");
            }
        }

        private void GetCompany()
        {
            query = "Select * from CompanyTB";
            dataAdapter = new SqlDataAdapter(query, connection);

            dataAdapter.Fill(dataSet);
            if (dataSet.Tables[0].Rows.Count > 0)
            {
                CompanyDropDownList.DataSource = dataSet;
                CompanyDropDownList.DataTextField = "CompanyName";
                CompanyDropDownList.DataValueField = "Id";
                CompanyDropDownList.DataBind();
                CompanyDropDownList.Items.Insert(0, new ListItem(" Choose Companyname ", "0"));
                CompanyDropDownList.SelectedIndex = 0;
            }
        }

       

        protected void Company_SelectedIndexChanged(object sender, EventArgs e)
       {
            dataSet.Clear();
            string get_CompanyID, CompanyName;
            CompanyName = CompanyDropDownList.SelectedItem.Text;
            get_CompanyID = CompanyDropDownList.SelectedValue;
 
            if (get_CompanyID != "0")
            {
                query = "Select Item_Id, Item_Name from ADDItemTB where Company_Id='" + get_CompanyID+ "'";
                dataAdapter = new SqlDataAdapter(query, connection);
                dataAdapter.Fill(dataSet);
                if (dataSet.Tables[0].Rows.Count >= 0)
                {
                    ItemDropDownList.DataSource = dataSet;
                    ItemDropDownList.DataTextField = "Item_Name";
                    ItemDropDownList.DataValueField = "Item_Id";
                    ItemDropDownList.DataBind();
                    ItemDropDownList.Items.Insert(0, new ListItem("Choose " + CompanyName , "0"));
                    ItemDropDownList.SelectedIndex = 0;
                }
            }
            else
            {
                ItemDropDownList.Items.Insert(0, " No Item Available ");
                ItemDropDownList.DataBind();    
                dataSet.Clear();
            }
           
         
       }
        protected void SaveButton_Click(object sender, EventArgs e)
        {
            int id = 0;
            
            id =  Convert.ToInt32(ItemDropDownList.SelectedItem.Value);
           
            int prequantity = Convert.ToInt32(AvailabelQuantityTextBox.Text);
            int newquantity = Convert.ToInt32(StockInTextBox.Text);

           
                StockInManager manager = new StockInManager();
                string display = manager.Save(prequantity, newquantity, id);

                messageLabel.Text = display;

            
    }


      

        protected void ItemDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
           string get_ItemId = ItemDropDownList.SelectedItem.Value;
           connection.Open();

           query = "Select Item_Reorder, Item_Quantity from ADDItemTB where Item_Id='" + get_ItemId + "'";
           command = new SqlCommand(query, connection);

           DataTable dt = new DataTable();
           SqlDataAdapter da = new SqlDataAdapter(command);
           da.Fill(dt);


           foreach (DataRow dr in dt.Rows)
           {

               reorderLabelTextxBox.Text = dr["Item_Reorder"].ToString();
               AvailabelQuantityTextBox.Text = dr["Item_Quantity"].ToString();

           }
           connection.Close();


        }

        protected void reorderLabelTextxBox_TextChanged(object sender, EventArgs e)
        {

        }

      
    }
}
