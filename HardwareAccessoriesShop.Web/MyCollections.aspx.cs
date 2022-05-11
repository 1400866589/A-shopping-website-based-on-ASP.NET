using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HardwareAccessoriesShop.BLL;

public partial class MyCollections : System.Web.UI.Page
{
    CollectionsInfo CollInfo = new CollectionsInfo();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)
        {
            gvCollections.DataBind();
            if (gvCollections.Rows.Count != 0)
            {
                BtnClearAllCollections.Visible = true;
                lblPageCountMsg.Visible = true;
                lblPageCountMsg.Text = "当前页为第" + (gvCollections.PageIndex + 1).ToString() + "页，共有" + (gvCollections.PageCount).ToString() + "页";
            }
            else
            {
                BtnClearAllCollections.Visible = false;
                lblPageCountMsg.Visible = false;
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }

    }

    protected void BtnClearAllCollections_Click(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)
        {
            int uid = int.Parse(Session["UserId"].ToString());
            CollInfo.ClearCollectionsByUserId(uid);
            Response.Write("<script>window.location.href='MyCollections.aspx'</script>");
        }
        else
        {
            Response.Redirect("Login.aspx");
        }

    }

    protected void gvCollections_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        Response.Write("<script>alert('删除成功')</script>");
        Response.Write("<script>window.location.href='MyCollections.aspx'</script>");
    }

}