<%@ Page Title="我的评价" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyComments.aspx.cs" Inherits="MyComments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="layui-row" style="text-align:center;font-size:x-large;">我的评论</div>
    <asp:Label ID="lblNullMsg" runat="server" Text="" Font-Size="Larger"></asp:Label>
    <div class="layui-row">
        <asp:GridView ID="gvComments" CssClass="layui-table" style="table-layout:fixed;background-color:rgba(255, 255, 255,0.7)"  runat="server" AutoGenerateColumns="False" DataKeyNames="CommentId" AllowPaging="True" OnRowCommand="gvComments_RowCommand" DataSourceID="LinqComments" EmptyDataText="暂无数据" >
            <Columns>
                <asp:BoundField DataField="CommentId" HeaderText="评论ID">
                     <HeaderStyle Width="60px" />
                </asp:BoundField>
                <asp:BoundField DataField="TextContent" HeaderText="评论内容"/>
                <asp:BoundField DataField="ComDateTime" HeaderText="评论时间">
                <HeaderStyle Width="150px" />
                </asp:BoundField>
                <asp:ButtonField CommandName="Del" Text="删除" >
                <HeaderStyle Width="100px"/>
                <ItemStyle ForeColor="#3399FF"  />
                </asp:ButtonField>
            </Columns>
            <HeaderStyle BackColor="#A8D7D5" />
        </asp:GridView>
        <asp:LinqDataSource ID="LinqComments" runat="server" ContextTypeName="HardwareAccessoriesShop.DAL.HardwareAccessoriesShopDataContext" EnableDelete="True" EntityTypeName="" TableName="Comment" OrderBy="ComDateTime desc" Where="CommentState == @CommentState &amp;&amp; UserId == @UserId">
            <WhereParameters>
                <asp:Parameter DefaultValue="1" Name="CommentState" Type="Int32" />
                <asp:SessionParameter Name="UserId" SessionField="UserId" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <div class="layui-row"><asp:Label ID="lblPageCountMsg" runat="server" Font-Size="Medium" ForeColor="#FF5722"></asp:Label></div>
    <hr class="layui-bg-blue">
</asp:Content>

