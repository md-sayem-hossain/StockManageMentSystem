using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.DAL.Gateway
{
    
    public class ItemGateway
    {

        private string connectionString = WebConfigurationManager.ConnectionStrings["StockDB"].ConnectionString;


        public bool IsItemExist(string itemName)
        {

            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT * FROM ItemTB WHERE Item_Name=@Name";

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            command.Parameters.AddWithValue("Name", itemName);

            SqlDataReader reader = command.ExecuteReader();

            bool hasRow = false;
            if (reader.HasRows)
            {
                hasRow = true;
            }

            reader.Close();
            connection.Close();
            return hasRow;

        }

        public int SaveItem(ItemClass aItemClass)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            string query = "INSERT INTO ItemTB VALUES('" + aItemClass.Item_Name + "','" + aItemClass.Reorder + "','" + aItemClass.Quantity + "','" + aItemClass.Category_Id + "','" + aItemClass.Company_Id + "')";
            SqlCommand command = new SqlCommand(query, connection);


            int rowAffect = command.ExecuteNonQuery();
            connection.Close();

            return rowAffect;
        }






        public List<ItemClass> GetItems()
        {
            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT * FROM ItemTB";
            connection.Open();

            SqlCommand command = new SqlCommand(query, connection);


            SqlDataReader reader = command.ExecuteReader();


            List<ItemClass> ItemList = new List<ItemClass>();

            while (reader.Read())
            {
                ItemClass aItemClass= new ItemClass();
                aItemClass.Item_Id = (int) reader["Item_Id"];
                aItemClass.Reorder = (int) reader["Reorder"];
                aItemClass.Company_Id = (int) reader["Company_Id"];
                aItemClass.Category_Id = (int) reader["Category_Id"];
                aItemClass.Quantity = (int) reader["Quantity"];
                aItemClass.Item_Name =  reader["Item_Name"].ToString();

                ItemList.Add(aItemClass);

            }


            reader.Close();
            connection.Close();

            return ItemList;
        }


    }
}