<%@ Page Title="余额充值" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Recharge.aspx.cs" Inherits="Recharge" %>

<%@ Register Src="~/UserControl/UserInfoCard.ascx" TagPrefix="uc1" TagName="UserInfoCard" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="layui-row layui-col-space10">
        <div class="layui-col-lg4 layui-col-lg-offset2">
            <!--余额充值-->
            <div class="layui-card bg-lightblue" style="color:white;">
                <div class="layui-card-header text-center" style="font-size: 25px;">余额充值</div>
                <div class="layui-card-body">
                    <ul>
                        <li>
                            <div class="layui-form-item">
                                <label class="layui-form-label">用户名</label>
                                <div class="layui-input-block">
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="layui-input" ReadOnly="true" BackColor="#CCCCCC"></asp:TextBox>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="layui-form-item">
                                <label class="layui-form-label">充值金额</label>
                                <div class="layui-input-block">
                                    <asp:TextBox ID="txtAmount" runat="server" CssClass="layui-input" placeholder="每次只可充值1000元！" ></asp:TextBox>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="layui-form-item">
                                <label class="layui-form-label">支付密码</label>
                                <div class="layui-input-block">
                                    <asp:TextBox ID="txtPayPsd" runat="server" CssClass="layui-input" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                        </li>
                        <li>
                            <asp:Label ID="lblPayMsg" runat="server" ForeColor="Red" Font-Size="Large"></asp:Label>
                        </li>
                    </ul>
                </div>
            </div>
            <div>
                <asp:Button ID="BtnRecharge" runat="server" Text="立即充值" CssClass="layui-btn layui-btn-danger layui-btn-fluid" OnClick="BtnRecharge_Click"/>
            </div>
        </div>
        <div class="layui-col-lg4 layui-col-lg-offset2">
            <uc1:UserInfoCard runat="server" ID="UserInfoCard" />
        </div>
    </div>
</asp:Content>

