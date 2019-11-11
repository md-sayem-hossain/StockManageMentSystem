using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystemWebAPP.DAL.Gateway;
using StockManagementSystemWebAPP.DAL.Model;

namespace StockManagementSystemWebAPP.BLL
{
    public class CategoryManager
    {
        CategoryGateway Gateway = new CategoryGateway();

        public string Save(Category aCategory)
        {
            if (Gateway.IsNameExist(aCategory.Name))
            {
                return "Alredy exixts";
            }

            int Row = Gateway.SaveCategory(aCategory);
            if (Row > 0)
            {
                return "save success";
            }
            return "failed";
        }


        //public string Update(int id,string name)
        //{


        //    int Row = Gateway.Update(id,name);
        //    if (Row > 0)
        //    {
        //        return "Update success";
        //    }
        //    return "failed";
        //}

        public List<Category> AllCategory()
        {
            return Gateway.GetCategories();
        }

        public string Update(string name,int id)
        {
           
            int Row = Gateway.UpdateCategory(name,id);
            if (Row > 0)
            {
                return "Update success";
            }
            return "Update failed";
        }
    }
}