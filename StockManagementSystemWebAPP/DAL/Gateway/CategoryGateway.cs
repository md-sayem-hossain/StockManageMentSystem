using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.DAL.Gateway
{

   
    public class CategoryGateway
    {

        private string connectionString = WebConfigurationManager.ConnectionStrings["StockDB"].ConnectionString;


        public int SaveCategory(Category aCategory)
        {
            
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            string query = "INSERT INTO CategoryTB VALUES('"+aCategory.Name+"')";
            SqlCommand command = new SqlCommand(query,connection);
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();

            return rowAffect;
        }

        public bool IsNameExist(string name)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT * FROM CategoryTB WHERE CategoryName=@Name";

            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            command.Parameters.AddWithValue("Name", name);

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


        //public int Update(int id, string name)
        //{
        //    SqlConnection connection = new SqlConnection(connectionString);
        //    connection.Open();
        //    string query = "UPDATE CategoryTB SET CategoryTB.CategoryName = @newname where Category.Id = '" + id + "'";
        //    SqlCommand command = new SqlCommand(query, connection);
        //    command.Parameters.AddWithValue("newname", name);
        //    int rowAffect = command.ExecuteNonQuery();
        //    connection.Close();

        //    return rowAffect;
        //}

        public int UpdateCategory(string name, int id)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            string query = "UPDATE CategoryTB SET CategoryTB.CategoryName = @newname where CategoryTB.Id = @id ";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("newname", name);
            command.Parameters.AddWithValue("id", id);

            int rowAffect = command.ExecuteNonQuery();
            connection.Close();

            return rowAffect;
        }
    }
}