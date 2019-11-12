using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.DAL.Gateway
{
    public class StockOutGateway
    {
        private string connectionString = WebConfigurationManager.ConnectionStrings["StockDB"].ConnectionString;

        public int SellItem(List<StockOUT> stock, string action)
        {
            int cont = 0, check = 0;
            SqlConnection connection = new SqlConnection(connectionString);
            foreach (StockOUT stockOut in stock)
            {

                string date = DateTime.Now.ToString("yyyy-MM-dd");

                string query = "INSERT INTO StockOutTB VALUES(" + stockOut.Company_Id + "," + stockOut.Item_Id + "," + stockOut.StockOut_Value + ",'" + date + "','" + action + "')";
                string update = "UPDATE ADDItemTB SET Item_Quantity=" + stockOut.AvailableQuantity + "WHERE Item_Id=" + stockOut.Item_Id;

                SqlCommand command = new SqlCommand(query, connection);
                SqlCommand updateCommand = new SqlCommand(update, connection);
                connection.Open();
                int result = command.ExecuteNonQuery();
                int result2 = updateCommand.ExecuteNonQuery();

                connection.Close();


                if (result > 0 && result2 > 0)
                    cont++;

                check++;
            }

            if (cont == check)
                return 1;
            else
            {
                return check - cont;
            }

        }
    }
    
}