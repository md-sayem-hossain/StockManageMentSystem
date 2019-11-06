using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebAPP.DAL.Gateway;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.BLL
{
    public class CompanyManager
    {
        CompanyGateway Gateway = new CompanyGateway();

        public string Save(Company aCompany)
        {
            if (Gateway.IsIsbnExist(aCompany.Name))
            {
                return "Alredy exixts";
            }

            int Row = Gateway.SaveCompany(aCompany);
            if (Row > 0)
            {
                return "save success";
            }
            return "failed";
        }
       

        public List<Company> AllCompanies()
        {
            return Gateway.GetCompaniess();
        } 

    }
}