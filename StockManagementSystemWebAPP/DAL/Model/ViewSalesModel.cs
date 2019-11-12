using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystemWebAPP.DAL.Model
{
    public class ViewSalesModel
    {
        public int Id { get; set; }
        public string Item_Name { get; set; }
        public int Sale_Quantity { get; set; }
        public int SLNO { get; set; }
    }
}