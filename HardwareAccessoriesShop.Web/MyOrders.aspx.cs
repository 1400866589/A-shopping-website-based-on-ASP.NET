using System;
using System.Web.UI.WebControls;
using HardwareAccessoriesShop.BLL;

public partial class MyOrders : System.Web.UI.Page
{
    OrderService OrderSvi = new OrderService();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)
        {
            gvMyOrders.DataBind();
            if (gvMyOrders.Rows.Count != 0)
            {
                lblPageCountMsg.Visible = true;
                lblPageCountMsg.Text = "当前页为第" + (gvMyOrders.PageIndex + 1).ToString() + "页，共有" + (gvMyOrders.PageCount).ToString() + "页";
            }
            else
            {
                lblPageCountMsg.Visible = false;
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void gvMyOrders_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if ("End" == e.CommandName && Session["UserId"] != null)//判断为自定义的按钮命令之后,下面获取当前行的信息
        {
            int index = Convert.ToInt32(e.CommandArgument);
            //当前行的第一个元素的值
            int cid = int.Parse(gvMyOrders.Rows[index].Cells[0].Text);
            string status = OrderSvi.GetStatusById(cid);
            //判断订单状态
            if (status == "已收货")
            {
                Response.Write("<script>alert('请勿重复收货')</script>");
            }
            else if (status == "未发货")
            {
                Response.Write("<script>alert('商品还未发货')</script>");
            }
            else
            {
                OrderSvi.ChangeOrderStatus(cid);
                Response.Write("<script>alert('收货成功')</script>");
                gvMyOrders.DataBind();
            }
        }
        else if ("Del" == e.CommandName && Session["UserId"] != null)//判断为自定义的按钮命令之后,下面获取当前行的信息
        {
            int index = Convert.ToInt32(e.CommandArgument);
            //当前行的第一个元素的值
            int cid = int.Parse(gvMyOrders.Rows[index].Cells[0].Text);
            string status = OrderSvi.GetStatusById(cid);
            //判断订单状态
            if (status == "已发货")
            {
                OrderSvi.DeleteOrderById(cid);
                Response.Write("<script>alert('删除成功')</script>");
                gvMyOrders.DataBind();
            }
            else
            {
                Response.Write("<script>alert('不可删除此订单')</script>");
            }
        }
    }
}