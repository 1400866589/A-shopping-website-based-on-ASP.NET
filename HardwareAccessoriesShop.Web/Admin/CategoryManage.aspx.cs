using System;
using System.Web.UI.WebControls;

using HardwareAccessoriesShop.BLL;

public partial class Admin_CategoryManage : System.Web.UI.Page
{
    CategoryService categoryService = new CategoryService();
    static string keyword = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUserId"] != null)
        {
            gvCategory.DataBind();
            if (gvCategory.Rows.Count != 0)
            {
                lblPageCountMsg.Visible = true;
                lblPageCountMsg.Text = "当前页为第" + (gvCategory.PageIndex + 1).ToString() + "页，共有" + (gvCategory.PageCount).ToString() + "页";
            }
            else
            {
                lblPageCountMsg.Visible = false;
            }
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
           
    }
 
    protected void BtnAddCategory_Click(object sender, EventArgs e)
    {
        if (Session["AdminUserId"] != null)
        {
            if (txtAddCategoryName.Text.Length != 0)
            {
                if (categoryService.NewCategory(txtAddCategoryName.Text))
                {
                    Response.Write("<script>alert('添加成功')</script>");
                    txtAddCategoryName.Text = "";
                    gvCategory.DataBind();
                }
                else
                {
                    txtAddCategoryName.Text = "";
                    Response.Write("<script>alert('已存在该分类名！')</script>");
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
                gvCategory.DataSourceID = "LinqDataSource2";
                gvCategory.DataBind();
            }
            else
            {
                gvCategory.DataSourceID = "LinqDataSource1";
                gvCategory.DataBind();
            }
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }

    }

    protected void gvCategory_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if ("Del" == e.CommandName && Session["AdminUserId"] != null)//判断为自定义的按钮命令之后,下面获取当前行的信息
        {
            int index = Convert.ToInt32(e.CommandArgument);
            //当前行的第一个元素的值
            int cid = int.Parse(gvCategory.Rows[index].Cells[0].Text);
            //从数据库中删除该数据
            categoryService.DeleteCategoryById(cid);
            Response.Write("<script>alert('删除成功')</script>");
            gvCategory.DataBind();
        }
    }
}