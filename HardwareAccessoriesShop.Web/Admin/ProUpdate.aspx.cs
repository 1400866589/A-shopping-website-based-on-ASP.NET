using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HardwareAccessoriesShop.BLL;
public partial class Admin_ProUpdate : System.Web.UI.Page
{
    ProductService ProService = new ProductService();
    CategoryService categoryService = new CategoryService();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminUserId"] != null)
        {
            if (!Page.IsPostBack)
            {
                int bid = int.Parse(Request.QueryString["Acc_Id"].ToString());
                var acc = ProService.GetAccInfoByAccId(bid);
                if (acc != null)
                {
                    ddlCategoryId.SelectedValue = acc.CategoryId.ToString();
                    txtAccName.Text = acc.AccName;
                    txtProducer.Text = acc.Producer;
                    txtManufacturer.Text = acc.Manufacturer;
                    txtBatch.Text = acc.Batch;
                    txtDescn.Text = acc.AccDescn;
                    txtListPrice.Text = acc.ListPrice.ToString();
                    txtQty.Text = acc.Quantity.ToString();
                    if (acc.AccImage.Length != 0)
                    {
                        accImg.ImageUrl = acc.AccImage;
                    }
                    else
                    {
                        accImg.ImageUrl = "~/Images/null.png";
                    }
                }
            }
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }

    }

    protected void BtnUpdataProduct_Click(object sender, EventArgs e)
    {
        if (Session["AdminUserId"] != null)
        {
            if (Page.IsValid)
            {
                int accId = int.Parse(Request.QueryString["Acc_Id"].ToString());
                int categoryId = int.Parse(ddlCategoryId.SelectedValue);
                string accName = txtAccName.Text;
                string producer = txtProducer.Text;
                string manufacturer = txtManufacturer.Text;
                string batch = txtBatch.Text;
                string descn = txtDescn.Text;
                decimal listPrice = decimal.Parse(txtListPrice.Text);
                int qty = int.Parse(txtQty.Text);
                if (listPrice >= 0 && qty >= 0)
                {
                    ProService.UpdateAccInfoById(accId, categoryId, accName, producer, manufacturer, batch, descn, listPrice, qty);
                    Response.Write("<script>alert('修改成功！')</script>");
                    Response.Write("<script>window.location.href='ProManage.aspx'</script>");
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

    //上传图片-----待完善
    protected void BtnUploadImg_Click(object sender, EventArgs e)
    {
        if (Session["AdminUserId"] != null)
        {
            int accId = int.Parse(Request.QueryString["Acc_Id"].ToString());
            string accImage = ProService.GetAccInfoByAccId(accId).AccImage;
            string newFileExt = Path.GetExtension(AccImgUpload.PostedFile.FileName);   //获得上传文件扩展名
            if (AccImgUpload.PostedFile.ContentLength < 204800)
            {
                switch (newFileExt)
                {
                    case ".gif":
                    case ".jpg":
                    case ".png":
                        break;
                    default:
                        lblUploadMsg.Text = "文件扩展名必须为jpg、png或gif！";
                        return;
                }

                if (accImage.Length != 0)
                {

                    string oldFilePath = Server.MapPath("~/") + accImage.Substring(2);
                    string newFilePath = Server.MapPath("~/") + accImage.Substring(2);
                    //删除原有图片
                    File.Delete(oldFilePath);
                    //上传文件
                    AccImgUpload.PostedFile.SaveAs(newFilePath);
                    Response.Buffer = true;   //清空页面缓存
                    Response.Write("<script>alert('上传成功！')</script>");
                    Response.Write("<script>window.location.href='ProUpdate.aspx?Acc_Id=" + accId + "'</script>");
                }
                else
                {
                    string newFileName = DateTime.Now.ToString("yyyyMMddHHffss") + newFileExt;
                    string newPath = Server.MapPath("~/") + "AccImgs//" + newFileName;
                    accImage = "~/AccImgs/" + newFileName;
                    ProService.UpdateAccImageById(accId, accImage);
                    AccImgUpload.PostedFile.SaveAs(newPath);
                    Response.Write("<script>alert('上传成功！')</script>");
                    Response.Write("<script>window.location.href='ProUpdate.aspx?Acc_Id=" + accId + "'</script>");
                }
            }
            else
            {
                lblUploadMsg.Text = "文件大小不能超过200KB";
            }
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}