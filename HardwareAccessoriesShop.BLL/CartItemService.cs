using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HardwareAccessoriesShop.DAL;

namespace HardwareAccessoriesShop.BLL
{
    public class CartItemService
    {
        HardwareAccessoriesShopDataContext db = new HardwareAccessoriesShopDataContext();

        //判断用户购物车是否存在该商品
        public bool IsCartItemExist(int accid, int uid)
        {
            CartItem cart = (from r in db.CartItem
                             where r.AccId == accid && r.UserId == uid 
                             select r).FirstOrDefault();
            if (cart != null)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        //判断用户购物车是否有商品超出库存
        public string IsBeyond(int uid)
        {
            string accname;
            Accessories acc = (from v in db.Accessories
                             join r in db.CartItem on v.AccId equals r.AccId
                             where r.UserId == uid && v.AccState == 1 && r.ProQty > v.Quantity
                             select v).FirstOrDefault();
            if (acc != null)
            {
                accname = acc.AccName;
                return accname;
            }
            else
            { 
                return null;
            }
        }

        //添加商品到购物车
        public void InsertIntoCartItem(int uid, int accid, string accName, decimal lPrice, int qty)
        {
            CartItem cartItem = new CartItem
            {
                UserId = uid,
                AccId = accid,
                ProName = accName,
                ProPrice = lPrice,
                ProQty = qty
            };
            db.CartItem.InsertOnSubmit(cartItem);
            db.SubmitChanges();

        }

        //根据用户id获取相应的购物车商品
        public List<CartItem> GetCartItemsByUserId(int uid)
        {
            return (from r in db.CartItem
                    join v in db.Accessories on r.AccId equals v.AccId
                    where r.UserId == uid && v.AccState == 1
                    select r).ToList();

        }

        //根据用户id清空相应的购物车数据
        public void ClearCartItemByUserId(int id)
        {
            var cartItems = from r in db.CartItem
                            where r.UserId == id
                            select r;
            db.CartItem.DeleteAllOnSubmit(cartItems);
            db.SubmitChanges();
        }

        //获取用户购物车数量
        public int GetTotalCartNum(int uid)
        {
            
              var cartItems = from r in db.CartItem
                              join v in db.Accessories on r.AccId equals v.AccId
                              where r.UserId == uid && v.AccState == 1
                              select r;
             return cartItems.Count();
        }

        //删除用户购物车单个商品
        public void DeleteCartItemByCartItemId(int accid, int uid)
        {
            CartItem cartItem = (from r in db.CartItem
                                 where r.AccId == accid && r.UserId == uid
                                 select r).FirstOrDefault();
            db.CartItem.DeleteOnSubmit(cartItem);
            db.SubmitChanges();
        }

        //修改用户购物车单个商品
        public void ChangeCartItemByCartItemId(int accid, int uid,int updataqty)
        {
            CartItem cartItem = (from r in db.CartItem
                                 where r.AccId == accid && r.UserId == uid
                                 select r).FirstOrDefault();
            cartItem.ProQty = updataqty;
            db.SubmitChanges();
        }
    }
}
