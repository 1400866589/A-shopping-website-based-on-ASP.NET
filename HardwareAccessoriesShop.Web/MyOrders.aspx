<%@ Page Title="我的订单" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyOrders.aspx.cs" Inherits="MyOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="layui-row" style="text-align:center;font-size:x-large;">我的订单</div>
    <div class="layui-row">
        <asp:GridView ID="gvMyOrders" CssClass="layui-table" style="table-layout:fixed;background-color:rgba(255, 255, 255,0.7)" DatakeyNames="OrderId" runat="server" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" DataSourceID="LinqDataSource1" OnRowCommand="gvMyOrders_RowCommand" EmptyDataText="暂无数据">
            <Columns>
                <asp:BoundField DataField="OrderId" HeaderText="订单号">
                <HeaderStyle Width="80px" />
                </asp:BoundField>
                <asp:BoundField DataField="UserAddress" HeaderText="寄送地址" >
                 <HeaderStyle Width="120px" />
                </asp:BoundField>
                <asp:BoundField DataField="Tel" HeaderText="手机号码">
                <HeaderStyle Width="120px" />
                </asp:BoundField>
                <asp:BoundField DataField="OrderDate" HeaderText="创建时间">
                <HeaderStyle Width="120px" />
                </asp:BoundField>
                <asp:BoundField DataField="Status" HeaderText="订单状态">
                <HeaderStyle Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="CourierNum" HeaderText="快递单号">
                <HeaderStyle Width="120px" />
                </asp:BoundField>
                <asp:CommandField ShowSelectButton="True" SelectText="查看详情">
                     <HeaderStyle Width="60px"/>
                     <ItemStyle ForeColor="#3399FF"  />
                </asp:CommandField>
                <asp:ButtonField CommandName="End" Text="确认收货" >
                     <HeaderStyle Width="60px"/>
                     <ItemStyle ForeColor="#3399FF"  />
                </asp:ButtonField>
                <asp:ButtonField CommandName="Del" Text="删除订单" >
                     <HeaderStyle Width="60px"/>
                     <ItemStyle ForeColor="#3399FF"  />
                </asp:ButtonField>
            </Columns>
            <HeaderStyle BackColor="#A8D7D5"  Width="60px"/>
        </asp:GridView>
    </div>
    <div class="layui-row">
        <asp:Label ID="lblPageCountMsg" runat="server" Font-Size="Medium" ForeColor="#FF5722"></asp:Label>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="HardwareAccessoriesShop.DAL.HardwareAccessoriesShopDataContext" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="Order" Where="UserId == @UserId &amp;&amp; OrderState == @OrderState">
            <WhereParameters>
                <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int32" />
                <asp:Parameter DefaultValue="1" Name="OrderState" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <hr class="layui-bg-blue">
    <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="HardwareAccessoriesShop.DAL.HardwareAccessoriesShopDataContext" EntityTypeName="" TableName="OrderItem" EnableDelete="True" EnableInsert="True" EnableUpdate="True" Where="OrderId == @OrderId">
        <WhereParameters>
            <asp:ControlParameter ControlID="gvMyOrders" DefaultValue="1" Name="OrderId" PropertyName="SelectedValue" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
    <div class="layui-row">
        <asp:GridView ID="gvOrderItems" CssClass="layui-table" DatakeyName="OrderId" Style="table-layout: fixed;background-color:rgba(255, 255, 255,0.7)" runat="server" AutoGenerateColumns="False" AllowPaging="True" DataSourceID="LinqDataSource2">
            <Columns>
                <asp:BoundField DataField="OrderId" HeaderText="订单号">
                    <HeaderStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="ProName" HeaderText="商品名称" />
                <asp:BoundField DataField="ProPrice" HeaderText="商品单价/元">
                    <HeaderStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="ProQty" HeaderText="购买数量">
                    <HeaderStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="TotalPrice" HeaderText="总价/元">
                    <HeaderStyle Width="100px" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle BackColor="#A8D7D5" />
        </asp:GridView>
    </div>
   
</asp:Content>