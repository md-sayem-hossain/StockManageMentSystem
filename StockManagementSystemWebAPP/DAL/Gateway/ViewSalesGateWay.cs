using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.DAL.Gateway
{
    public class ViewSalesGateWay
    {

        
        private string connectionString = WebConfigurationManager.ConnectionStrings["StockDB"].ConnectionString;



        public List<ViewSalesModel> GetAllSales(string date1, string date2)
        {
           
           

          
               string   query = "SELECT  Item_Name,StockOut_Quantity from ItemTB,StockOutTB where StockOutTB.Date between '"+date1+"' and '"+date2+"' and ItemTB.Item_Id=StockOutTB.Item_Id";


            SqlConnection connection = new SqlConnection(connectionString);


            connection.Open();

            SqlCommand command = new SqlCommand(query, connection);


            SqlDataReader reader = command.ExecuteReader();


            List<ViewSalesModel> aViewSale = new List<ViewSalesModel>();
            int i = 1;

            ViewSalesModel aViewSalesModel=null;

            while (reader.Read())
            {
                aViewSalesModel = new ViewSalesModel();

                aViewSalesModel.Sale_Quantity = (int)reader["StockOut_Quantity"];
               
                aViewSalesModel.Item_Name = reader["Item_Name"].ToString();
                aViewSalesModel.Id = i;
                aViewSale.Add(aViewSalesModel);
                i++;
            }

            reader.Close();
            connection.Close();

            return aViewSale;
        }
    }


    
}