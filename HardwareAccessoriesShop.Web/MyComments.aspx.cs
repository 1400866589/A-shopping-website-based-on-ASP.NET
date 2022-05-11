using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HardwareAccessoriesShop.BLL;

public partial class MyComments : System.Web.UI.Page
{
    CommentInfo ComInfo = new CommentInfo();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)
        {
            gvComments.DataBind();
            if (gvComments.Rows.Count != 0)
            {
                lblPageCountMsg.Visible = true;
                lblPageCountMsg.Text = "当前页为第" + (gvComments.PageIndex + 1).ToString() + "页，共有" + (gvComments.PageCount).ToString() + "页";
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

    protected void gvComments_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if ("Del" == e.CommandName && Session["UserId"] != null)//判断为自定义的按钮命令之后,下面获取当前行的信息
        {
            int index = Convert.ToInt32(e.CommandArgument);
            //当前行的第一个元素的值
            int cid = int.Parse(gvComments.Rows[index].Cells[0].Text);
            //从数据库中删除该数据
            ComInfo.DeleteCommentById(cid);
            Response.Write("<script>alert('删除成功')</script>");
            Response.Write("<script>window.location.href='MyComments.aspx'</script>");
        }
    }
}