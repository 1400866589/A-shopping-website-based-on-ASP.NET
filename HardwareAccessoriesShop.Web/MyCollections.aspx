<%@ Page Title="我的收藏" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyCollections.aspx.cs" Inherits="MyCollections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="layui-row" style="text-align:center;font-size:x-large;">我的收藏</div>
    <asp:Label ID="lblNullMsg" runat="server" Text="" Font-Size="Larger"></asp:Label>
    <div class="layui-row">
        <asp:GridView ID="gvCollections" CssClass="layui-table" style="table-layout:fixed;background-color:rgba(255, 255, 255,0.7)" runat="server" AutoGenerateColumns="False" DataKeyNames="CollectionId" AllowPaging="True" OnRowDeleted="gvCollections_RowDeleted" DataSourceID="LinqCollections" EmptyDataText="暂无数据">
            <Columns>
                <asp:BoundField DataField="AccId" HeaderText="商品编号" ReadOnly="True" >
                <HeaderStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="AccName" HeaderText="商品名称" ReadOnly="True" />
                <asp:BoundField DataField="ListPrice" HeaderText="商品单价/元" ReadOnly="True" >
                <HeaderStyle Width="100px" />
                </asp:BoundField>
                <asp:HyperLinkField Text="查看" DataNavigateUrlFields="AccId" DataNavigateUrlFormatString="~/ProDetails.aspx?Acc_Id={0}" >
                <HeaderStyle Width="100px" />
                </asp:HyperLinkField>
                <asp:CommandField ShowDeleteButton="True" >
                    <ItemStyle ForeColor="#3399FF"  />
                <HeaderStyle Width="100px" />
                </asp:CommandField>
            </Columns>
            <HeaderStyle BackColor="#A8D7D5" />
        </asp:GridView>
        <asp:LinqDataSource ID="LinqCollections" runat="server" ContextTypeName="HardwareAccessoriesShop.DAL.HardwareAccessoriesShopDataContext" EnableDelete="True" EntityTypeName="" TableName="Collections" Where="UserId == @UserId">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="" Name="UserId" SessionField="UserId" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <div class="layui-row"><asp:Label ID="lblPageCountMsg" runat="server" Font-Size="Medium" ForeColor="#FF5722"></asp:Label></div>
    <hr class="layui-bg-blue">
    <div class="layui-row" style="font-size:large;">
        <div class="layui-col-lg2 layui-col-lg-offset10">
            <asp:Button ID="BtnClearAllCollections" runat="server" Text="清空收藏夹" CssClass="layui-btn layui-btn-danger layui-btn-fluid" OnClick="BtnClearAllCollections_Click"/>
        </div>
    </div>
</asp:Content>

