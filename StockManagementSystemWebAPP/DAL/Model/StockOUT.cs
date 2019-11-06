using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystemWebAPP.DAL.Model
{
    [Serializable]
    public class StockOUT
    {

        public int Company_Id { get; set; }
        public string Company_Name { get; set; }
        public int Item_Id { get; set; }
        public string Item_Name { get; set; }
        public int StockOut_Id { get; set; }
        public int StockOut_Value { get; set; }
        public string Action_Name { get; set; }
        public int AvailableQuantity { get; set; }
    }
}