<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户注册</title>
    <link rel="stylesheet" href="layui/css/layui.css" />
    <script src="layui/layui.js" type="text/javascript"></script>
    <style type="text/css">
        body{
            background-color:rgb(93,172,129);
        } 
        .rightCss{
            margin:50px auto;
            padding:25px;
            width:350px;
            border-radius:5px;
            background-color:rgba(255, 255, 255,0.7);
        }
        h2{
           line-height:50px;
           text-align:center;
        }
    </style>
</head>
<body style="background-image: url('Images/bg.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">
    <div class="layui-container">
        <div class="layui-row" style="text-align: center">
            <a href="Default.aspx"><asp:Image ID="Image1" runat="server" ImageUrl="~/Images/logo.png" Height="83px"/></a>
        </div>
        <hr class="layui-bg-blue">
        <div class="layui-row">
                  <form id="form1" runat="server" class="layui-form">
                    <div class="rightCss">
                        <ul>
                            <li><h2>用户注册</h2></li>
                            <li>
                                <div class="layui-form-item">
                                    <label class="layui-form-label layui-icon layui-icon-username">用户名</label>
                                    <div class="layui-input-block">
                                     <asp:TextBox ID="txtUserName" runat="server" CssClass="layui-input" placeholder="请输入用户名"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rvfUserName" runat="server" ControlToValidate="txtUserName" ErrorMessage="用户名不能为空！" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="layui-form-item">
                                    <label class="layui-form-label layui-icon layui-icon-password">密&nbsp;&nbsp; 码</label>
                                    <div class="layui-input-block">
                                     <asp:TextBox ID="txtPsd" runat="server" CssClass="layui-input" placeholder="请输入密码" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPsd" runat="server"  ControlToValidate="txtPsd" ErrorMessage="密码不能为空！" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">确认密码</label>
                                    <div class="layui-input-block">
                                     <asp:TextBox ID="PsdConfirm" runat="server" CssClass="layui-input" placeholder="请输入确认密码" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvPsdConfirm" runat="server" ControlToValidate="PsdConfirm" ErrorMessage="确认密码不能为空！" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPsd" ControlToValidate="PsdConfirm" ErrorMessage="两次密码不一致！" Display="Dynamic" ForeColor="Red"></asp:CompareValidator>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="layui-form-item">
                                    <label class="layui-form-label layui-icon layui-icon-email">邮&nbsp;&nbsp; 箱</label>
                                    <div class="layui-input-block">
                                     <asp:TextBox ID="TxtEmail" runat="server" CssClass="layui-input" placeholder="请输入邮箱" TextMode="Email"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtEmail" ErrorMessage="邮箱不能为空！" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="layui-form-item">
                                    <label class="layui-form-label layui-icon layui-icon-vercode">验证码</label>
                                    <div class="layui-input-block">
                                     <asp:TextBox ID="TxtRegisterCode" runat="server" CssClass="layui-input" placeholder="请输入验证码" ></asp:TextBox>
                                        <asp:LinkButton ID="BtnSendRegisterCode" runat="server" BorderStyle="Outset" BackColor="White" OnClick="BtnSendRegisterCode_Click">获取验证码</asp:LinkButton>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtRegisterCode" ErrorMessage="验证码不能为空！" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
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
                                    <asp:Button ID="BtnRegister" runat="server" Text="注册" CssClass="layui-btn layui-btn-fluid  layui-btn-radius" OnClick="BtnRegister_Click"/>
                                </div>
                            </li>
                             <li>
                                <div class="layui-form-item">
                                   <input type="reset" title="重置" class="layui-btn layui-btn-fluid  layui-btn-radius"/>
                                </div>
                            </li>
                             <li>
                                <div class="layui-form-item">
                                    <asp:Label ID="lblRegisterMsg" runat="server" Text="" ForeColor="Red" Font-Bold="False" Font-Size="Large"></asp:Label>
                                </div>
                            </li>
                        </ul>
                    </div>
                </form>
        </div>
    </div>
</body>
</html>
