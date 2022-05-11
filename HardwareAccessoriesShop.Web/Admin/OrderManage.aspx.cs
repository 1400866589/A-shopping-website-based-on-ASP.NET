using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using HardwareAccessoriesShop.BLL;

public partial class Admin_OrderManage : System.Web.UI.Page
{
    OrderService orderService = new OrderService();

    static string Keyword = null;    //搜索关键字

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUserId"] != null)
        {
            if (!Page.IsPostBack)
            {
                gvOrders.DataBind();
                if (gvOrders.Rows.Count != 0)
                {
                    lblPageCountMsg.Visible = true;
                    lblPageCountMsg.Text = "当前页为第" + (gvOrders.PageIndex + 1).ToString() + "页，共有" + (gvOrders.PageCount).ToString() + "页";
                }
                else
                {
                    lblPageCountMsg.Visible = false;
                }
            }
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        if (Session["AdminUserId"] != null)
        {
            if (txtSearchKey.Text.Length != 0)
            {
                Keyword = txtSearchKey.Text;
                gvOrders.DataSourceID = "LinqDataSourceOrderId";
                gvOrders.DataBind();
            }
            else
            {
                gvOrders.DataSourceID = "LinqDataSource1";
                gvOrders.DataBind();
            }
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void ddlOrderStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlOrderStatus.SelectedValue.Equals("所有订单"))
        {
            gvOrders.DataSourceID = "LinqDataSource1";
            gvOrders.DataBind();
        }
        else
        {
            gvOrders.DataSourceID = "LinqDataSourceType";
            gvOrders.DataBind();
        }
    }

    protected void gvOrders_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if ("Del" == e.CommandName && Session["AdminUserId"] != null)//判断为自定义的按钮命令之后,下面获取当前行的信息
        {
            int index = Convert.ToInt32(e.CommandArgument);
            //当前行的第一个元素的值
            int oid = int.Parse(gvOrders.Rows[index].Cells[0].Text);
            //从数据库中删除该数据
            orderService.DeleteOrderById(oid);
            Response.Write("<script>alert('删除成功')</script>");
            gvOrders.DataBind();
        }
    }

    protected void gvOrders_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int oid = int.Parse(gvOrders.Rows[e.RowIndex].Cells[0].Text);
        string status = orderService.GetStatusById(oid);
        //判断订单状态
        if (status == "已收货")
        {
            e.Cancel = true;
            Response.Write("<script>alert('不可修改此订单')</script>");
        }
    }
}