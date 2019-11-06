using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebAPP.DAL.Gateway;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.BLL
{
    public class StockOutManager
    {
        StockOutGateway aStockOutGateway = new StockOutGateway();
        public string SellItem(List<StockOUT> stockout, string action)
        {
            int result = aStockOutGateway.SellItem(stockout, action);
            if (result > 0)
                return "Item Added as " + action + " Successful";
            else
            {
                return "Problems found in" + result + "Rows";
            }
        }
    }
}