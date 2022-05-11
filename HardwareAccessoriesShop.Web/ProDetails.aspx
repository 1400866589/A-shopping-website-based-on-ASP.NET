<%@ Page Title="商品详情" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProDetails.aspx.cs" Inherits="ProDetails" %>

<%@ Register Src="~/UserControl/UserInfoCard.ascx" TagPrefix="uc1" TagName="UserInfoCard" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="layui-row layui-col-space10">

        <div class="layui-col-lg8">
            <div class="layui-row layui-col-space10">
                <!--商品图片-->
                <div class="layui-col-lg5">
                    <div class="layui-row">
                        <asp:Image ID="imgAcc" runat="server" ImageAlign="AbsMiddle" Width="310px" /></div>
                    <div class="layui-row text-center" style="margin-top: 10px;">
                        <div class="layui-col-lg4">
                            <asp:LinkButton ID="BtnAddToCollections" runat="server" OnClick="BtnAddToCollections_Click"><i class="layui-icon layui-icon-star"></i>收藏</asp:LinkButton>
                        </div>
                        <div class="layui-col-lg4 layui-col-lg-offset4">
                            <asp:LinkButton ID="BtnPraise" runat="server" OnClick="BtnPraise_Click"><i class="layui-icon layui-icon-praise"></i>赞一下</asp:LinkButton>
                        </div>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="layui-row text-center">
                                <asp:Label ID="lblTipMsg" runat="server" ForeColor="Red"></asp:Label></div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="BtnAddToCollections" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="BtnPraise" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>
                <!--商品详情-->
                <div class="layui-col-lg7">
                    <div class="layui-row">
                        <div class="layui-card bg-lightblue" style="color: black;">
                            <div class="layui-card-header text-center" style="font-size: 25px;">商品详情</div>
                            <div class="layui-card-body">
                                商品名：<asp:Label ID="lblAccName" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="layui-card-body">
                                生产地：<asp:Label ID="lblProducer" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="layui-card-body">
                                生产厂家：<asp:Label ID="lblManufacturer" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="layui-card-body">
                                批次号：<asp:Label ID="lblBatch" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="layui-card-body">
                                类别：<asp:Label ID="lblCategoryName" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="layui-card-body">
                                规格：<br />
                                <asp:TextBox ID="txtAccDescn" runat="server" ReadOnly="true" Width="400px" Text="" Height="65px" TextMode="MultiLine" BackColor="#CCCCCC"></asp:TextBox>
                            </div>
                            <div class="layui-card-body">
                                库存：<asp:Label ID="lblQuantity" runat="server" Text=""></asp:Label>&nbsp;&nbsp;件
                           
                            </div>
                            <div class="layui-card-body">
                                售价：<asp:Label ID="lblListPrice" runat="server" Text=""></asp:Label>&nbsp;&nbsp;元
                           
                            </div>
                        </div>
                    </div>
                    <div class="layui-row text-center" style="margin-top: 10px;">
                        <div class="layui-col-lg6" style="margin-top: 10px;">
                            购买数量：<asp:TextBox ID="txtPurchaseQty" runat="server" Text="1" TextMode="Number" Width="45px"></asp:TextBox>
                        </div>
                        <div class="layui-col-lg6">
                            <asp:Button ID="BtnAddToCard" runat="server" Text="添加购物车" CssClass="layui-btn layui-btn-fluid layui-btn-danger" OnClick="BtnAddToCard_Click" />
                        </div>
                    </div>
                    <div class="layui-row">
                        <asp:Label ID="lblAddCartMsg" runat="server" Text="" ForeColor="Red" Font-Size="Large"></asp:Label></div>
                </div>
            </div>
        </div>
        <!--用户卡片-->
        <div class="layui-col-lg4">
            <uc1:UserInfoCard runat="server" ID="UserInfoCard" />
        </div>
    </div>
    <hr class="layui-bg-blue">
    <div class="layui-row layui-bg-white text-center" style="font-size: 25px;">热门评论</div>
    <hr class="layui-bg-blue">
    <div class="layui-row layui-col-space10">
        <!--评论展示区 局部刷新-->
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="layui-col-lg8">
                    <div id="CommentDisplay" runat="server"></div>
                </div>
                <!--评论提交区-->
                <div class="layui-col-lg4">
                    <div class="layui-row">
                        <asp:TextBox ID="TxtComment" runat="server" TextMode="MultiLine" placeholder="请输入评价！" CssClass="layui-textarea"></asp:TextBox>
                    </div>
                    <div class="layui-row" style="text-align: right; margin-top: 5px;">
                        <asp:Label ID="lblErrorMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                        <asp:LinkButton ID="BtnComment" runat="server" CssClass="layui-btn" OnClick="BtnComment_Click"><i class="layui-icon layui-icon-release"></i>发表评论</asp:LinkButton>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="BtnComment" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
    </div>
</asp:Content>

