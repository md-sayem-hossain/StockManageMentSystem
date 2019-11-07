using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebAPP.DAL.Gateway;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.BLL
{
    public class SumurryManager
    {
        SumurryGateway aSumurryGateway = new SumurryGateway();
        public List<SumurryModel> AllSumurry(SumurryModel aSumurryModel)
        {
            return aSumurryGateway.GetSumurry(aSumurryModel);
        }
    }
}