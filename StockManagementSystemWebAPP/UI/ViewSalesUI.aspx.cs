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
    public partial class ViewSalesUI : System.Web.UI.Page
    {
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
    }
}