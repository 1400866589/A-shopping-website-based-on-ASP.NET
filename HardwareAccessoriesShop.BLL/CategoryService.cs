using System.Linq;
using HardwareAccessoriesShop.DAL;

namespace HardwareAccessoriesShop.BLL
{
    public class CategoryService
    {
        HardwareAccessoriesShopDataContext db = new HardwareAccessoriesShopDataContext();

        //添加分类信息  先判断分类名是否存在
        public bool NewCategory(string categoryName)
        {
            Category result = (from r in db.Category
                               where r.CategoryName == categoryName
                               select r).FirstOrDefault();
            if (result == null)
            {
                Category category = new Category
                {
                    CategoryName = categoryName,
                    CategoryState = 1
                };
                db.Category.InsertOnSubmit(category);
                db.SubmitChanges();
                return true;
            }
            else
            {
                return false;
            }
        }

        //删除分类信息
        public void DeleteCategoryById(int cid)
        {
            Category category = (from r in db.Category
                                 where r.CategoryId == cid
                                 select r).First();
            category.CategoryState = 0;
            db.SubmitChanges();
        }

        //根据分类id获得分类名称，返回值为分类名
        public string GetCategoryNameById(int cid)
        {
            return (from r in db.Category
                    where r.CategoryId == cid
                    select r).First().CategoryName;
        }
    }
}