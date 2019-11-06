using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.DAL.Gateway
{
    public class StockInGateWay
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["StockDB"].ConnectionString;


        public int SaveStock(int previousQuantity,int newQuantity,int id)
        {


            newQuantity += previousQuantity;
       
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            string query = "Update ItemTB  set Item_Quantity='"+newQuantity+"' where Item_Id= '"+id+"'";
            SqlCommand command = new SqlCommand(query, connection);


            int rowAffect = command.ExecuteNonQuery();
            connection.Close();

            return rowAffect;
        }

       

        public List<Category> GetCategories()
        {
            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT * FROM CategoryTB";
            connection.Open();

            SqlCommand command = new SqlCommand(query, connection);


            SqlDataReader reader = command.ExecuteReader();


            List<Category> CategoryList = new List<Category>();

            while (reader.Read())
            {
                Category aCategory = new Category();
                aCategory.Name = reader["CategoryName"].ToString();
                aCategory.Id = (int)reader["Id"];

                CategoryList.Add(aCategory);
            }

            reader.Close();
            connection.Close();

            return CategoryList;
        }
    }
}