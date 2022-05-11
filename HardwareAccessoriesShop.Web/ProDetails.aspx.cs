using System;
using System.Web.UI;
using HardwareAccessoriesShop.BLL;

public partial class ProDetails : System.Web.UI.Page
{
    ProductService ProService = new ProductService();
    CommentInfo commentInfo = new CommentInfo();
    UserService UService = new UserService();
    CartItemService cartService = new CartItemService();
    CollectionsInfo collInfo = new CollectionsInfo();
    CategoryService categoryService = new CategoryService();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Request.QueryString["Acc_Id"] != null)
            {
                int accid = int.Parse(Request.QueryString["Acc_Id"].ToString());
                if (ProService.GetAccState(accid) == true)
                {
                    ProDetailsInit(accid);
                    CommentDisplayInit(accid);
                    if (Session["UserId"] != null)
                    {
                        Session["praiseCount"] = 0;
                        TxtComment.Visible = true;
                        BtnComment.Visible = true;
                    }
                    else
                    {
                        TxtComment.Visible = false;
                        BtnComment.Visible = false;
                        lblErrorMsg.Text = "当前未登录，无法评价！";
                    }
                }
                else
                {
                    Response.Write("<script>alert('商品已下架')</script>");
                    Response.Write("<script>window.location.href='MyCollections.aspx'</script>");
                }
            }
        }
    }

    //商品详情初始化
    public void ProDetailsInit(int accId)
    {
        var acc = ProService.GetAccInfoByAccId(accId);
        if (acc != null)
        {
            if (acc.AccImage.Length == 0)
            {
                imgAcc.ImageUrl = "~/Images/null.png";
            }
            else
            {
                imgAcc.ImageUrl = acc.AccImage;
            }
            lblAccName.Text = acc.AccName;
            lblProducer.Text = acc.Producer;
            lblManufacturer.Text = acc.Manufacturer;
            lblBatch.Text = acc.Batch;
            lblCategoryName.Text = categoryService.GetCategoryNameById(acc.CategoryId);
            txtAccDescn.Text = acc.AccDescn;
            lblQuantity.Text = acc.Quantity.ToString();
            lblListPrice.Text = acc.ListPrice.ToString();
            Page.Title = acc.AccName;
        }
    }

    //评论区初始化
    public void CommentDisplayInit(int accId)
    {
        string str = "";
        var comments = commentInfo.GetCommentsByAccId(accId);
        if (comments.Count != 0)
        {
            foreach (var com in comments)
            {
                str += "<div class='layui-card' style='margin-right:10px;'>" +
                    "<div class='layui-card-header' style='color:#FF5722;'>" +
                        "<label>" + UService.GetUserInfoById(com.UserId).UserName +
                        "</label><label style = 'float: right;'>" + com.ComDateTime +
                        "</label>" + "</div><div class='layui-card-body' style='color: black;'>" +
                        com.TextContent + "</div></div>";
                CommentDisplay.InnerHtml = str;
            }
        }
        else
        {
            CommentDisplay.InnerHtml = "<label style='font-size:larger;'>暂无评论！</label>";
        }
    }


    //添加商品到购物车
    protected void BtnAddToCard_Click(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)
        {
            int accid = int.Parse(Request.QueryString["Acc_Id"].ToString());
            int uid = int.Parse(Session["UserId"].ToString());
            int qty = int.Parse(txtPurchaseQty.Text);
            //先判断购物车是否存在该商品，若不存在，则添加；存在，则提示已添加
            if (qty > 0 )
            {
                if (!cartService.IsCartItemExist(accid, uid))
                {
                    var acc = ProService.GetAccInfoByAccId(accid);
                    if (qty <= acc.Quantity)
                    {
                        cartService.InsertIntoCartItem(uid, accid, acc.AccName, decimal.Parse(acc.ListPrice.ToString()), qty);
                        Response.Write("<script> alert('添加成功！')</script>");
                        Response.Write("<script>window.location.href='ProDetails.aspx?Acc_Id=" + accid + "'</script>");
                    }
                    else
                    {
                        lblAddCartMsg.Text = "库存不足！";
                    }
                }
                else
                {
                    lblAddCartMsg.Text = "你已经添加过该商品了！";
                }
            }
            else
            {
                lblAddCartMsg.Text = "购买数量必须大于0！";
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }


    //评论提交
    protected void BtnComment_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["Acc_Id"] != null)
        {
            if (TxtComment.Text.Length != 0)
            {
                int accid = int.Parse(Request.QueryString["Acc_Id"].ToString());
                int uid = int.Parse(Session["UserId"].ToString());
                commentInfo.InsertComments(accid, uid, TxtComment.Text);
                CommentDisplayInit(accid);
                lblErrorMsg.Text = "发表成功！";
                TxtComment.Text = "";
            }
            else
            {
                lblErrorMsg.Text = "请输入评价！";
            }
        }
    }

    //点赞
    protected void BtnPraise_Click(object sender, EventArgs e)
    {
        int accid = int.Parse(Request.QueryString["Acc_Id"].ToString());
        if (Session["UserId"] != null)
        {
            int count = int.Parse(Session["praiseCount"].ToString());
            if (count != 0)
            {
                lblTipMsg.Text = "请勿重复点赞！";
            }
            else
            {
                count++;
                Session["praiseCount"] = 1;
                ProService.UpdataPraiseQty(accid, 1);
                lblTipMsg.Text = "谢谢点赞！";
            }
        }
        else
        {
            lblTipMsg.Text = "请登陆后点赞！";
        }
    }

    //收藏
    protected void BtnAddToCollections_Click(object sender, EventArgs e)
    {
        int accid = int.Parse(Request.QueryString["Acc_Id"].ToString());
        if (Session["UserId"] != null)
        {
            int uid = int.Parse(Session["UserId"].ToString());
            if (!collInfo.IsAccInCollections(accid, uid))
            {
                var acc = ProService.GetAccInfoByAccId(accid);
                collInfo.AddToCollections(accid, uid, acc.AccName, decimal.Parse(acc.ListPrice.ToString()));
                lblTipMsg.Text = "收藏成功！";
            }
            else
            {
                lblTipMsg.Text = "你已收藏该商品！";
            }
        }
        else
        {
            lblTipMsg.Text = "请登陆后收藏！";
        }
    }
}