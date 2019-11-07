using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemWebAPP.BLL;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.UI
{
    public partial class ItemUI : System.Web.UI.Page
    {
        CategoryManager aCategoryManager = new CategoryManager();
        CompanyManager aCompanyManager = new CompanyManager();
        ItemManager aItemManager = new ItemManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<Category> aList = aCategoryManager.AllCategory();
                CategoryDropDown.DataSource = aList;
                CategoryDropDown.DataValueField = "Id";
                CategoryDropDown.DataTextField = "Name";
                CategoryDropDown.DataBind();

                
                List<Company> aCompanies = aCompanyManager.AllCompanies();
                CompanyDropDown.DataSource = aCompanies;
                CompanyDropDown.DataValueField = "Id";
                CompanyDropDown.DataTextField = "Name";
                CompanyDropDown.DataBind();
            }
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            int quantity = 0;
            ItemClass aItemClass = new ItemClass();
            aItemClass.Item_Name = itemTextBox.Text;
            aItemClass.Category_Id = Convert.ToInt32(CategoryDropDown.SelectedValue);
            aItemClass.Company_Id = Convert.ToInt32(CompanyDropDown.SelectedValue);
            aItemClass.Quantity = quantity;
            quantity += aItemClass.Quantity;


            aItemClass.Reorder = Convert.ToInt32(reorderTextBox.Text);

           messageLabel.Text=aItemManager.Save(aItemClass);
        }
    }
}