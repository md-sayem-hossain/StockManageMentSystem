using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystemWebAPP.DAL.Model
{
    public class StockIn
    {
        public int Category_Id { get; set; }
        public int Item_Id { get; set; }
        public int Reorder { get; set; }
        public int Quantity { get; set; }
        public int StockIn_Value { get; set; }
        public DateTime DateTime = DateTime.Today;
        

    }
}