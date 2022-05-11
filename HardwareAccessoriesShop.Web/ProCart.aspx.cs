using System;
using System.Web.UI;
using System.Web.UI.WebControls;

using HardwareAccessoriesShop.BLL;

public partial class ProCart : System.Web.UI.Page
{
    CartItemService cartService = new CartItemService();
    ProductService ProSvi = new ProductService();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)
        {
            if (!Page.IsPostBack)
            {              
                ProCartDataBind();
            }

        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    //根据用户购物车商品计算总价
    public decimal TotalPrice(int uid)
    {
        decimal totalPrice = 0;
        var cartItems = cartService.GetCartItemsByUserId(uid);
        if (cartItems.Count != 0)
        {
            foreach (var cart in cartItems)
            {
                totalPrice += decimal.Parse((cart.ProPrice * cart.ProQty).ToString());
            }
        }
        return totalPrice;
    }

    //自定义绑定数据
    public void ProCartDataBind()
    {
        int uid = int.Parse(Session["UserId"].ToString());
        gvShopCart.DataSource = cartService.GetCartItemsByUserId(uid);
        gvShopCart.DataBind();
        lblTotalPrice.Text = TotalPrice(uid).ToString();
        if (gvShopCart.Rows.Count != 0)
        {
            BtnClearAll.OnClientClick = "return confirm('确定要清空购物车吗？');";
            lblPageCountMsg.Visible = true;
            lblPageCountMsg.Text = "当前页为第" + (gvShopCart.PageIndex + 1).ToString() + "页，共有" + (gvShopCart.PageCount).ToString() + "页";
        }
        else
        {
            BtnAddToOrder.Visible = false;
            BtnClearAll.Visible = false;
            lblPageCountMsg.Visible = false;
        }
    }

    //将购物车添加到订单
    protected void BtnAddToOrder_Click(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)
        {
            int uid = int.Parse(Session["UserId"].ToString());
            if (cartService.IsBeyond(uid) != null)
            {
                string accname = cartService.IsBeyond(uid);
                Response.Write("<script>alert('商品:" + accname + ",库存不足！')</script>");
            }
            else
            {
                Response.Redirect("AddToOrder.aspx?TotalPrice=" + TotalPrice(int.Parse(Session["UserId"].ToString())));
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    //清空购物车
    protected void BtnClearAll_Click(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)
        {
            int uid = int.Parse(Session["UserId"].ToString());
            cartService.ClearCartItemByUserId(uid);
            Response.Write("<script>window.location.href='ProCart.aspx'</script>");
        }
        else
        {
            Response.Redirect("Login.aspx");
        }

    }

    protected void gvShopCart_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        Response.Write("<script>window.location.href='ProCart.aspx'</script>");
        ProCartDataBind();
    }

    protected void gvShopCart_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        Response.Write("<script>window.location.href='ProCart.aspx'</script>");
        ProCartDataBind();
    }

    protected void gvShopCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //获取编辑行
        GridViewRow row = gvShopCart.Rows[e.RowIndex];
        //获取编辑数据id
        int cid = int.Parse(row.Cells[0].Text);
        int uid = int.Parse(Session["UserId"].ToString());
        //从数据库中删除该数据
        cartService.DeleteCartItemByCartItemId(cid, uid);
        Response.Write("<script>alert('删除成功')</script>");
        ProCartDataBind();
    }

    protected void gvShopCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        TextBox txtBox = (TextBox)gvShopCart.Rows[e.RowIndex].FindControl("txtUpdataQty");
        int bid = int.Parse(gvShopCart.Rows[e.RowIndex].Cells[0].Text);
        int pQty = ProSvi.GetAccInfoByAccId(bid).Quantity;
        int uid = int.Parse(Session["UserId"].ToString());
        if (int.Parse(txtBox.Text) <= 0)
        {
            e.Cancel = true;
            Response.Write("<script>alert('购买数量必须要大于0！')</script>");
        }
        else if (int.Parse(txtBox.Text) > pQty)
        {
            e.Cancel = true;
            Response.Write("<script>alert('当前商品库存仅剩" + pQty + "件！')</script>");
        }
        else
        {
            cartService.ChangeCartItemByCartItemId(bid, uid, int.Parse(txtBox.Text));
            gvShopCart.EditIndex = -1;
            ProCartDataBind();
        }
    }

    protected void gvShopCart_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvShopCart.EditIndex = e.NewEditIndex;
        ProCartDataBind();
    }

    protected void gvShopCart_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvShopCart.EditIndex = -1;
        ProCartDataBind();
    }
}