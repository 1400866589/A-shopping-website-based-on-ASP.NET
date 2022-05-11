<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserInfoCard.ascx.cs" Inherits="UserControl_UserInfoCard" %>


<div class="layui-card" style="height: 280px; background-color:rgba(255, 255, 255,0.7) ">
    <div class="layui-card-header text-center text-hidden">
        <asp:Label ID="lblNickName" runat="server" Text="" style="font-size: x-large"></asp:Label>
    </div>
    <div class="layui-card-body " style="font-size: large;color:black;">
        <asp:Panel ID="plUserInfo" runat="server" >
            <ul class="ulCard">
                <li>用户名：<asp:Label ID="lblLoginName" runat="server" SkinId="TextOrange" Text=""></asp:Label>
                </li>
                <li>账户余额：<asp:Label ID="lblAmount" runat="server" SkinId="TextOrange" Text=""></asp:Label>元
                </li>
                <li>
                    <div class="layui-row text-center" style="margin-top:10px;">
                        <br />
                        <br />
                        <br />
                        <br />
                    <asp:LinkButton ID="LBtnToRecharge" runat="server" Visible="True" style="color:#01AAED;" PostBackUrl="~/Recharge.aspx">前往充值>></asp:LinkButton>
                    </div>
                </li>          
            </ul>
        </asp:Panel>
    </div>
</div>