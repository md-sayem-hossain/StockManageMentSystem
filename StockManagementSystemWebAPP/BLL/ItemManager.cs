using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebAPP.DAL.Gateway;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.BLL
{
    public class ItemManager
    {

       ItemGateway Gateway = new ItemGateway();

        public string Save(ItemClass aItemClass)
        {
            if (Gateway.IsItemExist(aItemClass.Item_Name))
            {
                return "Item Already exixts";
            }
           

            int Row = Gateway.SaveItem(aItemClass);
            if (Row > 0)
            {
                return "save success";
            }
            return "Item Save failed";
        }
        public List<ItemClass> Allitems()
        {
            return Gateway.GetItems();
        } 


    }
}