using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

using HardwareAccessoriesShop.BLL;

public partial class Admin_ProManage : System.Web.UI.Page
{
    ProductService ProService = new ProductService();
    static string keyword = null;
    static string type = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUserId"] != null)
        {
            if (!Page.IsPostBack)
            {
                gvAccsInfo.DataBind();
                if (gvAccsInfo.Rows.Count != 0)
                {
                    lblPageCountMsg.Visible = true;
                    lblPageCountMsg.Text = "当前页为第" + (gvAccsInfo.PageIndex + 1).ToString() + "页，共有" + (gvAccsInfo.PageCount).ToString() + "页";
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

    //按方式搜索
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        if (Session["AdminUserId"] != null)
        {
            if (txtSearchKey.Text.Length != 0 && ddlType.SelectedValue.Length != 0)
            {
                keyword = txtSearchKey.Text;
                type = ddlType.SelectedValue;
                switch (type)
                {
                    case "AccName":
                        gvAccsInfo.DataSourceID = "LinqDataSourceAccName";
                        gvAccsInfo.DataBind();
                        break;
                    case "Producer":
                        gvAccsInfo.DataSourceID = "LinqDataSourceProducer";
                        gvAccsInfo.DataBind();
                        break;
                    case "Manufacturer":
                        gvAccsInfo.DataSourceID = "LinqDataSourceManufacturer";
                        gvAccsInfo.DataBind();
                        break;
                    default:
                        gvAccsInfo.DataSourceID = "LinqDataSource1";
                        gvAccsInfo.DataBind();
                        break;
                }
            }
            else
            {
                gvAccsInfo.DataSourceID = "LinqDataSource1";
                gvAccsInfo.DataBind();
            }
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    protected void gvAccsInfo_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if ("Del" == e.CommandName && Session["AdminUserId"] != null)//判断为自定义的按钮命令之后,下面获取当前行的信息
        {
            int index = Convert.ToInt32(e.CommandArgument);
            //当前行的第一个元素的值
            int bid = int.Parse(gvAccsInfo.Rows[index].Cells[0].Text);
            //从数据库中删除该数据
            ProService.DeleteAccById(bid);
            Response.Write("<script>alert('删除成功')</script>");
            gvAccsInfo.DataBind();
        }
    }
}