using System;
using System.Web.UI;
using HardwareAccessoriesShop.BLL;

public partial class Register : System.Web.UI.Page
{
    static string code = null;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //向用户邮箱发送验证码
    protected void BtnSendRegisterCode_Click(object sender, EventArgs e)
    {
        if (TxtEmail.Text.Length != 0)
        {
            string email = TxtEmail.Text.ToString().Trim();
            EmailSender emailSender = new EmailSender();
            code = emailSender.RegisterCodeSend(email);
            lblRegisterMsg.Text = "验证码已发至邮箱，请及时查看！";
        }
        else
        {
            lblRegisterMsg.Text = "请输入邮箱后点击！";
        }

    }

    protected void BtnRegister_Click(object sender, EventArgs e)
    {
        UserService UService = new UserService();
        if (Page.IsValid)
        {
            if (UService.IsNameExist(txtUserName.Text.ToString()))
            {
                lblRegisterMsg.Text = "用户名已存在！";
            }
            else
            {
                //用EmailSender的方法返回的验证码字符串code
                if (TxtRegisterCode.Text.ToString().Equals(code))
                {
                    code = null;
                    Session.Clear();
                    UService.Insert(txtUserName.Text, txtPsd.Text, TxtEmail.Text);
                    Response.Write("<script>alert('注册成功！') </script>");
                    Response.Write("<script>window.location.href='Login.aspx'</script>");
                }
                else
                {
                    lblRegisterMsg.Text = "验证码不正确！";
                }
            }
        }
    }
}