using System;
using System.Collections.Generic;
using System.Linq;
using HardwareAccessoriesShop.DAL;

namespace HardwareAccessoriesShop.BLL
{
    public class CommentInfo
    {
        HardwareAccessoriesShopDataContext db = new HardwareAccessoriesShopDataContext();

        //根据商品id获取该商品评论信息，根据最新时间排序（降序）
        public List<Comment> GetCommentsByAccId(int accid)
        {
            return (from r in db.Comment
                    where r.AccId == accid && r.CommentState == 1
                    orderby r.ComDateTime descending
                    select r).ToList();
        }

        //根据用户id获取该用户的所有评论信息
        public List<Comment> GetCommentsByUserId(int uid)
        {
            return (from r in db.Comment
                    where r.UserId == uid && r.CommentState == 1
                    orderby r.ComDateTime descending
                    select r).ToList();
        }

        //向评论信息表添加评论信息
        public void InsertComments(int accId, int userId, string txtContent)
        {
            Comment comment = new Comment
            {
                AccId = accId,
                UserId = userId,
                TextContent = txtContent,
                ComDateTime = DateTime.Now.ToLocalTime(),
                CommentState = 1
        };
            db.Comment.InsertOnSubmit(comment);
            db.SubmitChanges();
        }

        //删除评论
        public void DeleteCommentById(int cid)
        {
            Comment comment = (from r in db.Comment
                               where r.CommentId == cid
                               select r).First();
            comment.CommentState = 0;
            db.SubmitChanges();
        }
    }
}