using System;
using HardwareAccessoriesShop.BLL;

public partial class Recharge : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //初始化，自动将用户名填充到账户名文本框
        if (Session["UserId"] != null && Session["UserName"] != null)
        {
            txtUserName.Text = Session["UserName"].ToString();
        }
    }

    //余额充值业务
    protected void BtnRecharge_Click(object sender, EventArgs e)
    {
        UserService UService = new UserService();
        if (Session["UserId"] != null && Session["UserName"] != null)
        {
            int uid = int.Parse(Session["UserId"].ToString());
            //非空验证，反馈到PayMsg标签处
            if (txtUserName.Text.Length != 0 && txtAmount.Text.Length != 0 && txtPayPsd.Text.Length != 0)
            {
                if (0 < int.Parse(txtAmount.Text.ToString()) && int.Parse(txtAmount.Text.ToString()) <= 1000)
                {
                    if (UService.CheckPayPassword(uid, txtPayPsd.Text.Trim()))
                    {
                        UService.AmountRecharge(uid, decimal.Parse(txtAmount.Text.ToString()));
                        Response.Write("<script>alert('充值成功！') </script>");
                        Response.Write("<script>window.location.href='Recharge.aspx'</script>");

                    }
                    else
                    {
                        lblPayMsg.Text = "支付密码错误！请重试！";
                    }
                }
                else
                {
                    lblPayMsg.Text = "请输入正确金额！";
                }
            }
            else
            {
                lblPayMsg.Text = "请输入内容！";
            }
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }
}