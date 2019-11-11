using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.EnterpriseServices.Internal;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystemWebAPP.BLL;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.UI
{
    public partial class CompanyUI : System.Web.UI.Page
    {
        private CategoryManager categoryManager = new CategoryManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("LoginUI.aspx");
            }
            PageLoadPreview();
            UpdateButton.Visible = false;
            SaveButton.Visible = true;
            idlabel.Visible = false;
        }

        private void PageLoadPreview()
        {
            List<Category> BookList = categoryManager.AllCategory();
            categoryGridview.DataSource = BookList;
            categoryGridview.DataBind();
            // show();
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {

            string name = categoryTextBox.Text;
            Category aCategory = new Category();
            if (name.Length > 1)
            {
                aCategory.Name = name;
                messagelabel.Text = categoryManager.Save(aCategory);
                PageLoadPreview();

            }
            else
            {
                messagelabel.Text = "Category Cannot Be Empty";
            }

        }

        protected void categoryGridview_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            GridViewRow row = e.Row;

            if (row.RowType == DataControlRowType.DataRow)
            {
                LinkButton _dblClickButton = row.FindControl("lnkBtnDblClk") as LinkButton;

                string _jsDoubleClick = ClientScript.GetPostBackClientHyperlink(_dblClickButton, "");

                e.Row.Attributes.Add("ondblclick", _jsDoubleClick);

            }
        }
        Category aCategory = new Category();
       
        protected void categoryGridview_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string name = "";
            int id;
            GridViewRow row = (GridViewRow)((Control)e.CommandSource).NamingContainer;
            
            switch (e.CommandName)
            {

                case "clk": //"clk" is command name of linkButton Row click event handler

                    categoryGridview.SelectedIndex = row.RowIndex;

                    break;

                case "dblClk"://"dblClk" is command name of linkButton Row Double click event handler.

                    row.BackColor = System.Drawing.Color.Pink;
                    categoryTextBox.Text = categoryGridview.Rows[row.RowIndex].Cells[1].Text;
                    name = categoryGridview.Rows[row.RowIndex].Cells[1].Text;
                    id = Convert.ToInt32(categoryGridview.Rows[row.RowIndex].Cells[0].Text);
                    idlabel.Text = id.ToString();
                    //SaveButton.Text = "Update";
                    UpdateButton.Visible = true;
                    SaveButton.Visible = false;
                    break;
                    
                    //aCategory.Name = name;
                    //aCategory.Id = id;
                    //UpdateButton_Click(aCategory, e);

            }
        }
        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            string name = categoryTextBox.Text;
            int id = Convert.ToInt32(idlabel.Text);
            if (name.Length > 1)
            {
                messagelabel.Text = categoryManager.Update(name, id);
                PageLoadPreview();

            }
            else
            {
                messagelabel.Text = "Category Cannot Be Empty";
                categoryTextBox.Text = "";
            }

        }
       
        //public void update(a)
        //{
            
        //}
    }
}
