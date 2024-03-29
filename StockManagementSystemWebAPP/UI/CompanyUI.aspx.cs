﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemWebAPP.BLL;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.UI
{
    public partial class CompanyUI1 : System.Web.UI.Page
    {
        CompanyManager manager  = new CompanyManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("LoginUI.aspx");
            }
            PageLoadPreview();

        }
        private void PageLoadPreview()
        {
            List<Company> BookList = manager.AllCompanies();
            companyGridview.DataSource = BookList;
            companyGridview.DataBind();
        }

      

        protected void SaveCompany_Click(object sender, EventArgs e)
        {
            string name = companyTextBox.Text;
            Company aCompany = new Company();
            if (name.Length > 1)
            {
                aCompany.Name = name;

             messageLabel.Text=manager.Save(aCompany);
            PageLoadPreview();
            }
            else
            {
                messageLabel.Text = "Enter Company Name";
            }
            
        }
    }
}