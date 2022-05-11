using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HardwareAccessoriesShop.BLL;

public partial class Admin_UserManage : System.Web.UI.Page
{
    UserService userService = new UserService();

    static string keyword = null;    //搜索关键字

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUserId"] != null)
        {
            if (!Page.IsPostBack)
            {
                gvUserManage.DataBind();
                if (gvUserManage.Rows.Count != 0)
                {
                    lblPageCountMsg.Visible = true;
                    lblPageCountMsg.Text = "当前页为第" + (gvUserManage.PageIndex + 1).ToString() + "页，共有" + (gvUserManage.PageCount).ToString() + "页";
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
                gvUserManage.DataSourceID = "LinqDataSourceUserName";
                gvUserManage.DataBind();
            }
            else
            {
                gvUserManage.DataSourceID = "LinqDataSource1";
                gvUserManage.DataBind();
            }
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlType.SelectedValue.Equals("显示全部"))
        {
            gvUserManage.DataSourceID = "LinqDataSource1";
            gvUserManage.DataBind();
        }
        else
        {
            gvUserManage.DataSourceID = "LinqDataSourceType";
            gvUserManage.DataBind();
        }
    }

    protected void gvUserManage_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if ("Del" == e.CommandName && Session["AdminUserId"] != null)//判断为自定义的按钮命令之后,下面获取当前行的信息
        {
            int index = Convert.ToInt32(e.CommandArgument);
            //当前行的第一个元素的值
            int uid = int.Parse(gvUserManage.Rows[index].Cells[0].Text);
            //从数据库中删除该数据
            userService.DeleteUserById(uid);
            Response.Write("<script>alert('删除成功')</script>");
            gvUserManage.DataBind();
        }
    }
}