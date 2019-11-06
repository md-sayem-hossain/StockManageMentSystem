using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
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
        CategoryManager categoryManager = new CategoryManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            PageLoadPreview();
            SaveButton.Text = "Save";

        }

        private void PageLoadPreview()
        {
            List<Category> BookList = categoryManager.AllCategory();
            //categoryGridview.DataSource = BookList;
            categoryGridview.DataBind(); 
           // show();
        }
        
        protected void SaveButton_Click(object sender, EventArgs e)
        {
            int number = 1;
            ButtonClick(number);
        }

        public void ButtonClick(int number)
        {
            if (number == 1)
            {
                string name = categoryTextBox.Text;
                Category aCategory = new Category();
                aCategory.Name = name;

                categoryManager.Save(aCategory);
                
            }
            else if (number == 2)
            {
                GridViewRow gr = categoryGridview.SelectedRow;
                categoryTextBox.Text = gr.Cells[2].Text;
                string name = categoryTextBox.Text;
                string id = (gr.Cells[1]).Text;
                SaveButton.Text = "Update";

                messagelabel.Text = categoryManager.Update(Convert.ToInt32(id), name);
            }
            PageLoadPreview();
        }

        protected void categoryGridview_SelectedIndexChanged(object sender, EventArgs e)
        {
            int number = 2;
            ButtonClick(number);
        }











        //protected void categoryGridview_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //    GridViewRow gr = categoryGridview.SelectedRow;
        //    categoryTextBox.Text = gr.Cells[2].Text;
        //    int id = Convert.ToInt32(gr.Cells[1]);
        //    SaveButton.Text = "Update";

        //    messagelabel.Text = categoryManager.Update(id,categoryTextBox.Text);
        //}

       

        //protected void categoryGridview_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
        //{
        //    if (e.Row.RowType == DataControlRowType.DataRow)
        //    {
        //        e.Row.Attributes["ondblclick"] = Page.ClientScript.GetPostBackClientHyperlink(categoryGridview, "Edit$" + e.Row.RowIndex);
        //        e.Row.Attributes["style"] = "cursor:pointer";
        //    }
        //}







        //private void show()
        //{
        //    {
        //        SqlConnection con = new SqlConnection("Server=DESKTOP-82FAJJ5;Database=StockDB;Integrated Security=True;");
        //        string strSQL = "Select * from CategoryTB";
        //        SqlDataAdapter dt = new SqlDataAdapter(strSQL, con);
        //        DataSet ds = new DataSet();
        //        dt.Fill(ds, "CategoryTB");
        //        con.Close();
        //        categoryGridview.DataSource = ds;
        //        categoryGridview.DataBind();
        //    }
        //}

        //protected void categoryGridview_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    categoryGridview.EditIndex = e.NewEditIndex;
        //    this.DataBind();
        //    categoryGridview.Rows[e.NewEditIndex].Attributes.Remove("ondblclick");
        //    categoryGridview.Columns[2].Visible = true;
        //}
        //protected void OnUpdate(object sender, EventArgs e)
        //{
        //    GridViewRow row = (sender as LinkButton).NamingContainer as GridViewRow;
        //    string name = (row.Cells[0].Controls[0] as TextBox).Text;
        //    string country = (row.Cells[1].Controls[0] as TextBox).Text;
        //    DataTable dt = ViewState["dt"] as DataTable;
        //    dt.Rows[row.RowIndex]["Name"] = name;
        //    dt.Rows[row.RowIndex]["Country"] = country;
        //    ViewState["dt"] = dt;
        //    categoryGridview.EditIndex = -1;
        //    this.DataBind();
        //}
    }
}