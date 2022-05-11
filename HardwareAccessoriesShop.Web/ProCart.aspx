<%@ Page Title="我的购物车" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProCart.aspx.cs" Inherits="ProCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="layui-row" style="text-align:center;font-size:x-large;">我的购物车</div>
    <asp:Label ID="lblNullMsg" runat="server" Text="" Font-Size="Larger"></asp:Label>
    <div class="layui-row">
        <asp:GridView ID="gvShopCart" CssClass="layui-table" style="table-layout:fixed;background-color:rgba(255, 255, 255,0.7)" runat="server" AutoGenerateColumns="False" DataKeyNames="CartItemId" AllowPaging="True" OnRowDeleted="gvShopCart_RowDeleted" OnRowUpdated="gvShopCart_RowUpdated" OnRowUpdating="gvShopCart_RowUpdating" OnRowEditing="gvShopCart_RowEditing" OnRowCancelingEdit="gvShopCart_RowCancelingEdit" OnRowDeleting="gvShopCart_RowDeleting" EmptyDataText="暂无数据">
            <Columns>
                <asp:BoundField DataField="AccId" HeaderText="商品编号" ReadOnly="True">
                    <HeaderStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="ProName" HeaderText="商品名称" ReadOnly="True" />
                <asp:BoundField DataField="ProPrice" HeaderText="商品单价/元" ReadOnly="True">
                    <HeaderStyle Width="100px" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="购买数量/件" ControlStyle-Width="50px">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtUpdataQty" runat="server" TextMode="Number" Text='<%# Bind("ProQty") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProQty") %>'></asp:Label>
                    </ItemTemplate>
                    <ControlStyle Width="50px"></ControlStyle>
                    <HeaderStyle Width="100px" />
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="True">
                    <HeaderStyle Width="100px" />
                </asp:CommandField>
                <asp:CommandField ShowDeleteButton="True">
                    <HeaderStyle Width="100px" />
                </asp:CommandField>
            </Columns>
            <HeaderStyle BackColor="#A8D7D5" />
        </asp:GridView>
        <asp:LinqDataSource ID="LinqCartItem" runat="server" ContextTypeName="HardwareAccessoriesShop.DAL.HardwareAccessoriesShopDataContext" TableName="CartItem" EnableDelete="True" EnableUpdate="True">
        </asp:LinqDataSource>
    </div>
    <div class="layui-row"><asp:Label ID="lblPageCountMsg" runat="server" Font-Size="Medium" ForeColor="#FF5722"></asp:Label></div>
    <hr class="layui-bg-blue">
    <div class="layui-row" style="font-size:large;">
        <div class="layui-col-lg4" style="padding-top:10px;">
            合计：<asp:Label ID="lblTotalPrice" runat="server"></asp:Label>&nbsp;&nbsp;元
        </div>
        <div class="layui-col-lg2">
            <asp:Button ID="BtnAddToOrder" runat="server" Text="立即购买" CssClass="layui-btn layui-btn-danger layui-btn-fluid" OnClick="BtnAddToOrder_Click"/>
        </div>
        <div class="layui-col-lg2 layui-col-lg-offset1">
            <asp:Button ID="BtnClearAll" runat="server" Text="清空购物车" CssClass="layui-btn layui-btn-danger layui-btn-fluid" OnClick="BtnClearAll_Click"/>
        </div>
    </div>
    <div class="layui-row">
        <asp:Label ID="lblBuyMsg" runat="server" Text="" Font-Size="X-Large" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>

