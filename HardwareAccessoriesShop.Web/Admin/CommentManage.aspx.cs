using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Linq.SqlClient;

using HardwareAccessoriesShop.BLL;
using System.Collections;

public partial class Admin_CommentManage : System.Web.UI.Page
{
    CommentInfo commentInfo = new CommentInfo();
    static string keyword = null;  //搜索关键字

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUserId"] != null)
        {
            if (!Page.IsPostBack)
            {
                gvComment.DataBind();
                if (gvComment.Rows.Count != 0)
                {
                    lblPageCountMsg.Visible = true;
                    lblPageCountMsg.Text = "当前页为第" + (gvComment.PageIndex + 1).ToString() + "页，共有" + (gvComment.PageCount).ToString() + "页";
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
                keyword = txtSearchKey.Text;
                gvComment.DataSourceID = "LinqDataSourceTextContent";
                gvComment.DataBind();
            }
            else
            {
                gvComment.DataSourceID = "LinqDataSource1";
                gvComment.DataBind();
            }
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void gvComment_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if ("Del" == e.CommandName && Session["AdminUserId"] != null)//判断为自定义的按钮命令之后,下面获取当前行的信息
        {
            int index = Convert.ToInt32(e.CommandArgument);
            //当前行的第一个元素的值
            int cid = int.Parse(gvComment.Rows[index].Cells[0].Text);
            //从数据库中删除该数据
            commentInfo.DeleteCommentById(cid);
            Response.Write("<script>alert('删除成功')</script>");
            gvComment.DataBind();
        }
    }

}