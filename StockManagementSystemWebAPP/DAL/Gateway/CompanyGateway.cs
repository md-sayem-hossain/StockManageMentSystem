using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.DAL.Gateway
{
    public class CompanyGateway
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["StockDB"].ConnectionString;


        public int SaveCompany(Company aCompany)
        {

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            string query = "INSERT INTO CompanyTB VALUES(@name)";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("name", aCompany.Name);
            int rowAffect = command.ExecuteNonQuery();
            connection.Close();

            return rowAffect;
        }

        public bool IsIsbnExist(string name)
        {
            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT * FROM CompanyTB WHERE CompanyName=@Name";

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

        public List<Company> GetCompaniess()
        {
            SqlConnection connection = new SqlConnection(connectionString);

            string query = "SELECT * FROM CompanyTB";
            connection.Open();

            SqlCommand command = new SqlCommand(query, connection);


            SqlDataReader reader = command.ExecuteReader();


            List<Company> CompanyList = new List<Company>();

            while (reader.Read())
            {
                Company aCompany = new Company();
                aCompany.Name = reader["CompanyName"].ToString();
                aCompany.Id = (int)reader["Id"];

                CompanyList.Add(aCompany);
            }

            reader.Close();
            connection.Close();

            return CompanyList;
        }
    }
}