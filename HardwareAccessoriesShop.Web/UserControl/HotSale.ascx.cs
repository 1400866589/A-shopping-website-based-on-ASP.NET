using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HardwareAccessoriesShop.BLL;

public partial class UserControl_HotSale : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ProductService ProService = new ProductService();
        var accessories = ProService.GetAccessoriesByDescend();
        int count = 0;
        string str = "<div class='layui-card'>";
        foreach (var accessory in accessories)
        {
            count++;
            str += "<div class='layui-card-body' style='font-size: large; padding-left: 10px;'>"
                   + "<a href='ProDetails.aspx?Acc_Id=" + accessory.AccId + "'>" + accessory.AccName + "</a>"
                   + "<span style='float:right;color:red;'>¥" + accessory.ListPrice.ToString() + "</span></div>";
            if (count == 10)
            {
                break;
            }
        }
        HotSale.InnerHtml = str + "</div>";
    }
}