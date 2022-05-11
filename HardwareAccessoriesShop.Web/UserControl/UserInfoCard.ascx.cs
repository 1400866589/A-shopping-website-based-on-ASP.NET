using System;
using HardwareAccessoriesShop.BLL;

public partial class UserControl_UserInfoCard : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserService us = new UserService();
        if (Session["UserId"] != null && Session["UserName"] != null)
        {
            int uid = int.Parse(Session["UserId"].ToString());
            var user = us.GetUserInfoById(uid);
            lblNickName.Text =Session["UserName"].ToString() + "，欢迎您！";
            plUserInfo.Visible = true;
            lblLoginName.Text = Session["UserName"].ToString();
            lblAmount.Text = user.Amount.ToString();
        }
        else
        {
            lblNickName.Text = "登录解锁更多功能！";
            plUserInfo.Visible = false;
        }
    }
}