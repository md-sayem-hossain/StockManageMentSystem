using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Hosting;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.DAL.Gateway
{



    public class SumurryGateway
    {

        private string connectionString = WebConfigurationManager.ConnectionStrings["StockDB"].ConnectionString;



        public List<SumurryModel> GetSumurry(SumurryModel aSumurryModel)
        {
            string category = aSumurryModel.CategoryName;
            string company = aSumurryModel.CompanyName;
            string query="";

            if (category==null && company==null)
            {
                query = "";
            }
            else if (category!=null && company!=null)
            {
                query = "SELECT  CompanyName ,CategoryName,Item_Name,Item_Quantity,Item_Reorder from ADDItemTB," +
                        "CompanyTB,CategoryTB where ADDItemTB.Category_Id=CategoryTB.Id and " +
                        "CategoryTB.CategoryName='" + category + "' and ADDItemTB.Company_id=CompanyTB.Id and " +
                        " CompanyTB.CompanyName='" + company + "' and ADDItemTB.Category_Id=CategoryTB.Id";

            }
            else if (category!=null && company==null)
            {
                query = "SELECT  CompanyName ,CategoryName,Item_Name,Item_Quantity,Item_Reorder from " +
                        "ADDItemTB,CompanyTB,CategoryTB where ADDItemTB.Category_Id=CategoryTB.Id and " +
                        "CategoryTB.CategoryName='" + category + "' and ADDItemTB.Company_Id=CompanyTB.Id";

            }
            else if (category==null && company!=null)
            {
                query = "SELECT  CompanyName ,CategoryName,Item_Name,Item_Quantity,Item_Reorder from ADDItemTB,CompanyTB,CategoryTB where ADDItemTB.Company_Id=CompanyTB.Id and CompanyTB.CompanyName='" + company + "' and ADDItemTB.Category_Id=CategoryTB.Id";
            }


            SqlConnection connection = new SqlConnection(connectionString);


            connection.Open();

            SqlCommand command = new SqlCommand(query, connection);


            SqlDataReader reader = command.ExecuteReader();

            int id = 1;
            List<SumurryModel> SumurryModel = new List<SumurryModel>();

         
            while (reader.Read())
            {
                aSumurryModel.Id = id;
                aSumurryModel = new SumurryModel();
                aSumurryModel.CategoryName = reader["CategoryName"].ToString();
                aSumurryModel.CompanyName = reader["CompanyName"].ToString();
                aSumurryModel.AvailableQuanatity = (int) reader["Item_Quantity"];
                aSumurryModel.ReorderLabel = (int) reader["Item_Reorder"];
                aSumurryModel.item = reader["Item_Name"].ToString();
                SumurryModel.Add(aSumurryModel);
                id++;
            }

            reader.Close();
            connection.Close();

            return SumurryModel;
        }
    }
}