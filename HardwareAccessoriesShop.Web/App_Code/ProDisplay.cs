using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// ProDisplay 的摘要说明
/// </summary>
public class ProDisplay
{

    public static string GetProInfoCard(int accId, string accName, string accPrice, string accPath)
    {
        if (accPath.Length == 0)
        {
            accPath = "~/Images/null.png";
        }
        string str = "<div class='layui-col-lg3'>" +
                     "<div class='layui-card text-center'>" +
                     "<div class='layui-card-header text-hidden'>" +
                     "<a href='ProDetails.aspx?Acc_Id=" + accId + "'>" + accName + "</a></div>" +
                     "<div class='layui-card-body'><a href='ProDetails.aspx?Acc_Id=" + accId + "'>" +
                     "<img src='" + accPath.Substring(2) + "' width='150px' height='150px'/></a>" +
                     "<div style='color: red; font-size:medium; '>¥" + accPrice + "</div></div></div></div>"; 
        return str;
    }
}