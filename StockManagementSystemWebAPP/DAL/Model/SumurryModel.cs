using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystemWebAPP.DAL.Model
{
    public class SumurryModel
    {
        public string CategoryName { get; set; }
        public string CompanyName { get; set; }
        public string item { get; set; }
        public int AvailableQuanatity { get; set; }
        public int ReorderLabel { get; set; }
        public int Id { get; set; }
    }
}