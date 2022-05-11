using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

using HardwareAccessoriesShop.BLL;

public partial class Admin_NewProduct : System.Web.UI.Page
{
    ProductService ProService = new ProductService();
    private string UploadPath;

    protected void Page_Load(object sender, EventArgs e)
    {
        //默认将文件保存到网站根目录下AccImgs文件夹中
        UploadPath = Path.Combine(Server.MapPath("~/"), "AccImgs\\");
        //  lblUploadMsg.Text = UploadPath;
    }

    protected void BtnAddProduct_Click(object sender, EventArgs e)
    {
        if (Session["AdminUserId"] != null)
        {
            if (Page.IsValid)
            {
                int categoryId = int.Parse(ddlCategoryId.SelectedValue);
                string accname = txtAccName.Text;
                string producer = txtProducer.Text;
                string manufacturer = txtManufacturer.Text;
                string batch = txtBatch.Text;
                string accImg = "";
                string descn = txtDescn.Text;
                decimal listPrice = decimal.Parse(txtListPrice.Text);
                int qty = int.Parse(txtQty.Text);
                if (listPrice >= 0 && qty >= 0)
                {
                    accImg = UploadImage();  //返回上传后的图片相对路径
                    if (accImg != "error")
                    {
                        int bid = ProService.AddToAccessories(categoryId, accname, producer, manufacturer, batch, accImg, descn, listPrice, qty);
                        Response.Write("<script>alert('添加成功！')</script>");
                        Response.Write("<script>window.location.href='ProUpdate.aspx?Acc_Id=" + bid + "'</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('检查是否存在非法输入！')</script>");
                }
            }
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
    }

    public string UploadImage()
    {
        //上传图片
        if (AccImgUpload.PostedFile.FileName != "")
        {
            string fileName = AccImgUpload.PostedFile.FileName;   //获取上传文件名称
            string fileExt = Path.GetExtension(fileName);   //获取上传文件扩展名
            if (AccImgUpload.PostedFile.ContentLength < 204800)
            {
                switch (fileExt)
                {
                    case ".gif":
                    case ".jpg":
                    case ".png":
                        break;
                    default:
                        lblUploadMsg.Text = "文件扩展名必须为jpg、png或gif！";
                        return "error";
                }
                string ResetName = DateTime.Now.ToString("yyyyMMddHHffss") + fileExt;  //重命名文件
                string fullPath = Path.Combine(UploadPath, ResetName);
                AccImgUpload.PostedFile.SaveAs(fullPath);
                lblUploadMsg.Text = "文件上传成功！";
                return "~/AccImgs/" + ResetName;
            }
            else
            {
                lblUploadMsg.Text = "文件大小不能超过200KB";
                return "error";
            }

        }
        else
        {
            return "";
        }
    }

}