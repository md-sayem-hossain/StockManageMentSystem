using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemWebAPP.BLL;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.UI
{
    public partial class StockOutUI : System.Web.UI.Page
    {
        private Dictionary<int, string> dictionary;
        private SqlConnection connection =
            new SqlConnection(ConfigurationManager.ConnectionStrings["StockDB"].ConnectionString);

        private SqlCommand command;
        private SqlDataAdapter dataAdapter;
        //private OleDbCommand com, com1;
        private DataSet dataSet = new DataSet();
        private string query;
        private CategoryManager aCategoryManager = new CategoryManager();
        private StockOutManager aStockOutManager = new StockOutManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            dictionary = new Dictionary<int, string>();

            if (!IsPostBack)
            {
                GetCompany();
                ItemDropDownList.Items.Insert(0, " No Item Available ");

            }

        }


        public void GridViewData()
        {

            if (ViewState["StockOutTB"] != null)
            {
                List<StockOUT> stockOutList = (List<StockOUT>)ViewState["StockOutTB"];
                StockoutGridView.DataSource = stockOutList;
                StockoutGridView.DataBind();


                StockoutGridView.Visible = true;
              

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
                CompanyDropDownList.Items.Insert(0, new ListItem(" Choose Company ", "0"));
                CompanyDropDownList.SelectedIndex = 0;
            }
        }


        protected void Category_SelectedIndexChanged(object sender, EventArgs e)
        {
            dataSet.Clear();
            string get_CompanyName, CompanyName;
            CompanyName = CompanyDropDownList.SelectedItem.Text;
            get_CompanyName = CompanyDropDownList.SelectedValue;

            if (get_CompanyName != "0")
            {
                query = "Select Item_Id, Item_Name from ItemTB where Company_Id='" + get_CompanyName + "'";
                dataAdapter = new SqlDataAdapter(query, connection);
                dataAdapter.Fill(dataSet);
                if (dataSet.Tables[0].Rows.Count >= 0)
                {
                    ItemDropDownList.DataSource = dataSet;
                    ItemDropDownList.DataTextField = "Item_Name";
                    ItemDropDownList.DataValueField = "Item_Id";
                    ItemDropDownList.DataBind();
                    ItemDropDownList.Items.Insert(0, new ListItem("Choose " + CompanyName, "0"));
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
            int stockOutQuantity = Convert.ToInt32(StockInTextBox.Text);
            int availableQuantity = Convert.ToInt32(AvailabelQuantityTextBox.Text);

            if (stockOutQuantity > availableQuantity)
            {
                messagelable.Visible = true;
                messagelable.Text = "Not Enough Quantity";
            }
            else if (stockOutQuantity == 0)
            {
                messagelable.Visible = true;
                messagelable.Text = "Quantity cannot be 0";
            }
            else
            {
                
                StockOUT aStockOut = new StockOUT();
                aStockOut.Item_Id = Convert.ToInt32(ItemDropDownList.SelectedValue);
                aStockOut.Company_Id = Convert.ToInt32(CompanyDropDownList.SelectedValue);
                aStockOut.Item_Name = ItemDropDownList.SelectedItem.ToString();
                aStockOut.Company_Name = CompanyDropDownList.SelectedItem.ToString();

                aStockOut.AvailableQuantity = availableQuantity - stockOutQuantity;
                aStockOut.StockOut_Value = stockOutQuantity;

                

                if (ViewState["StockOutTB"] != null)
                {
                    int flag = 0;
                    List<StockOUT> stockOutList = (List<StockOUT>)ViewState["StockOutTB"];
                    foreach (StockOUT stock in stockOutList)
                    {
                        if (stock.Item_Id == aStockOut.Item_Id)
                        {
                            stock.AvailableQuantity = aStockOut.AvailableQuantity;
                            stock.StockOut_Value += aStockOut.StockOut_Value;
                            flag = 1;
                            break;
                        }
                    }
                    if (flag == 0)
                    {
                        stockOutList.Add(aStockOut);

                        ViewState["StockOutTB"] = stockOutList;
                    }

                    GridViewData();
                    


                }
                else
                {
                   
                    List<StockOUT> stockOutList = new List<StockOUT>();

                    stockOutList.Add(aStockOut);

                    ViewState["StockOutTB"] = stockOutList;
                    GridViewData();
                }
                AvailabelQuantityTextBox.Text = aStockOut.AvailableQuantity.ToString();
            }
        }



    protected void ItemDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string get_CompanyName = ItemDropDownList.SelectedItem.Value;
            connection.Open();

            query = "Select Item_Reorder, Item_Quantity from ItemTB where Item_Id='" + get_CompanyName + "'";
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




      
        protected void SellButton_Click1(object sender, EventArgs e)
        {
            List<StockOUT> stockOutList = (List<StockOUT>)ViewState["StockOutTB"];
            string result = aStockOutManager.SellItem(stockOutList, "Sell");
            messagelable.Visible = true;
            messagelable.Text = result;
            CompanyDropDownList.SelectedIndex = -1;
            ItemDropDownList.Enabled = true;
            ItemDropDownList.Items.Clear();
            dictionary.Add(-1, "Select Item");
            ItemDropDownList.DataSource = dictionary;
            ItemDropDownList.DataTextField = "Value";
            ItemDropDownList.DataValueField = "Key";
            ItemDropDownList.DataBind();
            ViewState["StockOutTB"] = null;
        }

        protected void DamageButton_Click1(object sender, EventArgs e)
        {
            List<StockOUT> stockOutList = (List<StockOUT>)ViewState["StockOutTB"];
            string result = aStockOutManager.SellItem(stockOutList, "Damage");
            messagelable.Visible = true;
            messagelable.Text = result;
            CompanyDropDownList.SelectedIndex = -1;
            ItemDropDownList.Enabled = true;
            ItemDropDownList.Items.Clear();
            dictionary.Add(-1, "Select Item");
            ItemDropDownList.DataSource = dictionary;
            ItemDropDownList.DataTextField = "Value";
            ItemDropDownList.DataValueField = "Key";
            ItemDropDownList.DataBind();
            ViewState["StockOutTB"] = null;
        }

        protected void LostButton_Click(object sender, EventArgs e)
        {
            List<StockOUT> stockOutList = (List<StockOUT>)ViewState["StockOutTB"];
            string result = aStockOutManager.SellItem(stockOutList, "Lost");
            messagelable.Visible = true;
            messagelable.Text = result;
            CompanyDropDownList.SelectedIndex = -1;
            ItemDropDownList.Enabled = true;
            ItemDropDownList.Items.Clear();
            dictionary.Add(-1, "Select Item");
            ItemDropDownList.DataSource = dictionary;
            ItemDropDownList.DataTextField = "Value";
            ItemDropDownList.DataValueField = "Key";
            ItemDropDownList.DataBind();
            ViewState["StockOutTB"] = null;
        }

       

    }
}