using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HardwareAccessoriesShop.BLL;

public partial class Default : System.Web.UI.Page
{
    ProductService ProService = new ProductService();

    protected void Page_Load(object sender, EventArgs e)
    {
        ProDisplayInit();
    }

    //商品搜索
    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        string str = "";
        if (TxtSearchInfo.Text.Length != 0)
        {
            string keyword = TxtSearchInfo.Text.ToString().Trim();
            var sAccessories = ProService.GetAccessoriesByAccName(keyword);
            if (sAccessories.Count != 0)
            {
                foreach (var acc in sAccessories)
                {
                    str += ProDisplay.GetProInfoCard(acc.AccId, acc.AccName, acc.ListPrice.ToString(), acc.AccImage);
                }
                divProDisplay.InnerHtml = str;
            }
            else
            {
                divProDisplay.InnerHtml = "<label style='font-size:larger;'>暂无相关商品！</label>";
            }
        }
        else
        {
            divProDisplay.InnerHtml = "<label style='font-size:larger;'>请输入搜索关键字！</label>";
        }
    }

    //商品展示初始化,即先展示全部商品
    public void ProDisplayInit()
    {
        string str = "";
        var allaccessories = ProService.GetAllAccessories();
        foreach (var acc in allaccessories)
        {
            str += ProDisplay.GetProInfoCard(acc.AccId, acc.AccName, acc.ListPrice.ToString(), acc.AccImage);
        }
        divProDisplay.InnerHtml = str;
    }

    //根据分类id展示相应商品
    public void ProDisplayByCategoryId(int cid)
    {
        string str = "";
        var allaccessories = ProService.GetAccessoriesByCategoryId(cid);
        foreach (var acc in allaccessories)
        {
            str += ProDisplay.GetProInfoCard(acc.AccId, acc.AccName, acc.ListPrice.ToString(), acc.AccImage);
        }
        divProDisplay.InnerHtml = str;
    }

    /*  以下是商品分类展示   */
    //显示全部商品
    protected void BtnDisplayAll_Click(object sender, EventArgs e)
    {
        ProDisplayInit();
    }
    //家具配件
    protected void BtnCategoryId_1_Click(object sender, EventArgs e)
    {
        ProDisplayByCategoryId(1);
    }
    //服装配件
    protected void BtnCategoryId_2_Click(object sender, EventArgs e)
    {
        ProDisplayByCategoryId(2);
    }
    //门窗配件
    protected void BtnCategoryId_3_Click(object sender, EventArgs e)
    {
        ProDisplayByCategoryId(3);
    }
    //通用配件
    protected void BtnCategoryId_4_Click(object sender, EventArgs e)
    {
        ProDisplayByCategoryId(4);
    }
    //五金工具
    protected void BtnCategoryId_5_Click(object sender, EventArgs e)
    {
        ProDisplayByCategoryId(5);
    }
}
