using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebAPP.DAL.Gateway;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.BLL
{
    public class ViewSalesManager
    {
        ViewSalesGateWay aViewSalesGateWay = new ViewSalesGateWay();

        public List<ViewSalesModel> AllViewSales(string date1, string date2)
        {
            return aViewSalesGateWay.GetAllSales(date1, date2);
        }


    }
}