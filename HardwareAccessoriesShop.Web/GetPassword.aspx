<%@  Language="C#" AutoEventWireup="true" CodeFile="GetPassword.aspx.cs" Inherits="GetPassword" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>找回密码</title>
    <link rel="stylesheet" href="layui/css/layui.css" />
    <script src="layui/layui.js" type="text/javascript"></script>
    <style type="text/css">
        body {
            background-color: rgb(93,172,129);
        }

        .rightCss {
            margin: 50px auto;
            padding: 25px;
            width: 350px;
            border-radius: 5px;
            background-color: rgba(255, 255, 255,0.7);
        }

        h2 {
            line-height: 50px;
            text-align: center;
        }
    </style>
</head>

<body style="background-image: url('Images/bg.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">
    <div class="layui-container">
        <div class="layui-row" style="text-align: center">
            <a href="Default.aspx">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/logo.png" Height="83px" /></a>
        </div>
        <hr class="layui-bg-blue" />
        <div class="layui-row" style="text-align: center; padding-top: 10%;">
            <form id="form1" runat="server" class="layui-form">
                <div class="rightCss">
                    <ul>
                        <li>
                            <h2>找回密码</h2>
                        </li>
                        <li>
                            <div class="layui-form-item">
                                <label class="layui-form-label layui-icon layui-icon-username">用户名</label>
                                <div class="layui-input-block">
                                    <asp:TextBox ID="txtUserName" runat="server" CssClass="layui-input" autocomplete="off" placeholder="请输入用户名"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvtxtUserName" ControlToValidate="txtUserName" runat="server" ErrorMessage="用户名不能为空！" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="layui-form-item">
                                <label class="layui-form-label layui-icon layui-icon-email">邮&nbsp;&nbsp; 箱</label>
                                <div class="layui-input-block">
                                    <asp:TextBox ID="txtEmail" runat="server" CssClass="layui-input" autocomplete="off" placeholder="请输入邮箱" TextMode="Email"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvtxtEmail" ControlToValidate="txtEmail" runat="server" ErrorMessage="邮箱不能为空！" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="layui-form-item">
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx">立即前往登录>></asp:HyperLink>
                            </div>
                        </li>
                        <li>
                            <div class="layui-form-item">
                                <br />
                                <asp:Button ID="BtnGetPsd" runat="server" Text="找回密码" CssClass="layui-btn layui-btn-fluid  layui-btn-radius" OnClick="BtnGetPsd_Click" />
                            </div>
                        </li>
                        <li>
                            <div style="margin-left: 110px;">
                                <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                            </div>
                        </li>
                    </ul>
                </div>
            </form>
        </div>
    </div>
</body>
</html>


