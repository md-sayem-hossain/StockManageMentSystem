using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystemWebAPP.DAL.Model
{
    public class ItemClass
    {
        public int Item_Id { get; set; }
        public string Item_Name { get; set; }
        public int Reorder { get; set; }
        public int  Quantity { get; set; }
        public int Company_Id { get; set; }
        public int  Category_Id { get; set; }


    }
}