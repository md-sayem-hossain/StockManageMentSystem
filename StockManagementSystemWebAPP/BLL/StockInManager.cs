using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebAPP.DAL.Gateway;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.BLL
{
    public class StockInManager
    {
        StockInGateWay aStockInGateWay = new StockInGateWay();
        public string Save(int previousQuantity,int newQuantity, int id)
        {

            int Row = aStockInGateWay.SaveStock(previousQuantity,newQuantity,id);
            if (Row > 0)
            {
                return "save success";
            }
            return "failed";
        }


    }
}