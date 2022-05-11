<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="NewProduct.aspx.cs" Inherits="Admin_NewProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="layui-card">
        <div class="layui-card-header" style="text-align: center; font-size: large;">添加商品</div>
    </div>
    <div class="layui-card">
        <div class="layui-card-body layui-form">
            <div class="layui-row">
                <div class="layui-col-lg8 layui-col-lg-offset4">
                    <div class="layui-form-item">
                        <label class="layui-form-label">商品分类</label>
                        <div class="layui-input-inline">
                            <asp:DropDownList ID="ddlCategoryId" runat="server" DataSourceID="LinqDataSource1" DataTextField="CategoryName" DataValueField="CategoryId"></asp:DropDownList>
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="HardwareAccessoriesShop.DAL.HardwareAccessoriesShopDataContext" EntityTypeName="" TableName="Category" Select="new (CategoryId, CategoryName)" Where="CategoryState == @CategoryState">
                                <WhereParameters>
                                    <asp:Parameter DefaultValue="1" Name="CategoryState" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">商品名称</label>
                        <div class="layui-input-inline">
                            <asp:TextBox ID="txtAccName" runat="server" CssClass="layui-input" autocomplete="off" placeholder="请输入商品名称"></asp:TextBox>
                        </div>
                        <div class="layui-form-mid layui-word-aux" style="color: red;">
                            <asp:RequiredFieldValidator ID="rfvtxtAccName" ControlToValidate="txtAccName" runat="server">*必填项！</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">生产地</label>
                        <div class="layui-input-inline">
                            <asp:TextBox ID="txtProducer" runat="server" CssClass="layui-input" autocomplete="off" placeholder="请输入生产地"></asp:TextBox>
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <asp:RequiredFieldValidator ID="rfvtxtProducer" ControlToValidate="txtProducer" runat="server">*必填项！</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">生产厂家</label>
                        <div class="layui-input-inline">
                            <asp:TextBox ID="txtManufacturer" runat="server" CssClass="layui-input" autocomplete="off" placeholder="请输入生产厂家"></asp:TextBox>
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <asp:RequiredFieldValidator ID="rfvtxtManufacturer" ControlToValidate="txtManufacturer" runat="server">*必填项！</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">批次号</label>
                        <div class="layui-input-inline">
                            <asp:TextBox ID="txtBatch" runat="server" CssClass="layui-input" autocomplete="off" placeholder="请输入批次号"></asp:TextBox>
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <asp:RequiredFieldValidator ID="rfvtxtBatch" ControlToValidate="txtBatch" runat="server">*必填项！</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">上传图片</label>
                        <div class="layui-input-inline" style="margin-top: 5px;">
                            <asp:FileUpload ID="AccImgUpload" runat="server" Width="180px" />
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <asp:Label ID="lblUploadMsg" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">商品规格</label>
                        <div class="layui-input-inline">
                            <asp:TextBox ID="txtDescn" runat="server" CssClass="layui-input" TextMode="MultiLine" autocomplete="off" placeholder="请输入商品规格"></asp:TextBox>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">单价</label>
                        <div class="layui-input-inline">
                            <asp:TextBox ID="txtListPrice" runat="server" CssClass="layui-input" autocomplete="off"  placeholder="请输入单价"></asp:TextBox>
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <asp:RequiredFieldValidator ID="rfvtxtListPrice" ControlToValidate="txtListPrice" runat="server">*必填项！货币格式：0.00</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">库存</label>
                        <div class="layui-input-inline">
                            <asp:TextBox ID="txtQty" runat="server" CssClass="layui-input" TextMode="Number">0</asp:TextBox>
                        </div>
                        <div class="layui-form-mid layui-word-aux">
                            <asp:RequiredFieldValidator ID="rfvtxtQty" ControlToValidate="txtQty" runat="server" Display="Dynamic">*必填项！大于或等于0</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div style="margin-left: 110px;">
                            <asp:Button ID="BtnAddProduct" runat="server" Text="添加" CssClass="layui-btn" Width="190px" OnClick="BtnAddProduct_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

