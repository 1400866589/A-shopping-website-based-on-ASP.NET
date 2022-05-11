using System.Linq;
using HardwareAccessoriesShop.DAL;

namespace HardwareAccessoriesShop.BLL
{
    public class CollectionsInfo
    {
        HardwareAccessoriesShopDataContext db = new HardwareAccessoriesShopDataContext();

        //将商品添加到用户收藏
        public void AddToCollections(int accid, int uid, string accName, decimal lPrice)
        {
            Collections collection = new Collections
            {
                AccId = accid,
                UserId = uid,
                AccName = accName,
                ListPrice = lPrice
            };
            db.Collections.InsertOnSubmit(collection);
            db.SubmitChanges();
        }

        //查询用户是否已经收藏该商品
        public bool IsAccInCollections(int bid, int uid)
        {
            Collections collection = (from r in db.Collections
                                      where r.AccId == bid && r.UserId == uid
                                      select r).FirstOrDefault();
            if (collection != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //清空用户收藏夹
        public void ClearCollectionsByUserId(int uid)
        {
            var result = from r in db.Collections
                         where r.UserId == uid
                         select r;
            db.Collections.DeleteAllOnSubmit(result);
            db.SubmitChanges();
        }
    }
}