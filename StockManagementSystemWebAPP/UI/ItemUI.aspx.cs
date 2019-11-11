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
            if (Session["user"] == null)
            {
                Response.Redirect("LoginUI.aspx");
            }
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
            int reorder = 0;
            string itemname = itemTextBox.Text;
            int companyId = Convert.ToInt32(CompanyDropDown.SelectedValue);
            int categoryId = Convert.ToInt32(CategoryDropDown.SelectedValue);
            if (reorderTextBox.Text.Equals(""))
            {
                reorder = 0;
            }
            else
            {
                 reorder = Convert.ToInt32(reorderTextBox.Text);
            }
           
            ItemClass aItemClass = new ItemClass();
            if (reorder > 0 && itemname.Length>0)
            {
                
                aItemClass.Item_Name= itemTextBox.Text;
                aItemClass.Category_Id = categoryId;
                aItemClass.Company_Id = companyId;
                aItemClass.Quantity = quantity;
                quantity += aItemClass.Quantity;
                aItemClass.Reorder = reorder;

                messageLabel.Text = aItemManager.Save(aItemClass);
            }
            else
            {
                messageLabel.Text = "Fill All Information";
            }
            
        }
    }
}