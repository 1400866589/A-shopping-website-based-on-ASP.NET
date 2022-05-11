<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="CommentManage.aspx.cs" Inherits="Admin_CommentManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="layui-card">
        <div class="layui-card-header" style="text-align: center; font-size: large;">评论管理</div>
    </div>
    <div class="layui-card">
        <div class="layui-card-header layui-form" style="padding: 15px 10px;">
                <div class="layui-row">
                    <div class="layui-col-lg2 layui-col-lg-offset5">
                        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="HardwareAccessoriesShop.DAL.HardwareAccessoriesShopDataContext" EntityTypeName="" TableName="Comment" Where="CommentState == @CommentState">
                            <WhereParameters>
                                <asp:Parameter DefaultValue="1" Name="CommentState" Type="Int32" />
                            </WhereParameters>
                        </asp:LinqDataSource>
                        <asp:LinqDataSource ID="LinqDataSourceTextContent" runat="server" ContextTypeName="HardwareAccessoriesShop.DAL.HardwareAccessoriesShopDataContext" EntityTypeName="" TableName="Comment" Where="CommentState == @CommentState &amp;&amp; TextContent.Contains(@TextContent)">
                            <WhereParameters>
                                <asp:Parameter DefaultValue="1" Name="CommentState" Type="Int32" />
                                <asp:ControlParameter ControlID="txtSearchKey" Name="TextContent" PropertyName="Text" Type="String" />
                            </WhereParameters>
                        </asp:LinqDataSource>
                    </div>
                    <div class="layui-col-lg2">
                        <asp:TextBox ID="txtSearchKey" runat="server" CssClass="layui-input" placeholder="搜索评论内容"></asp:TextBox>
                    </div>
                    <div class="layui-col-lg1" style="line-height: initial;margin-left:10px;">
                        <asp:LinkButton ID="BtnSearch" runat="server" CssClass="layui-btn" OnClick="BtnSearch_Click">搜索</asp:LinkButton>
                    </div>
                </div>
            </div>
         <div class="layui-card-body layui-form" font-size: large;">
             <asp:Label ID="lblPageCountMsg" runat="server"></asp:Label><br />
             <asp:GridView ID="gvComment" runat="server" CssClass="layui-table" style="table-layout: fixed;" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="CommentId" OnRowCommand="gvComment_RowCommand" DataSourceID="LinqDataSource1" EmptyDataText="暂无数据">
                 <Columns>
                     <asp:BoundField DataField="CommentId" HeaderText="评论ID">
                     <HeaderStyle Width="60px" />
                     </asp:BoundField>
                     <asp:BoundField DataField="TextContent" HeaderText="评论内容"/>
                     <asp:BoundField DataField="ComDateTime" HeaderText="评论时间">
                     <HeaderStyle Width="125px" />
                     </asp:BoundField>
                     <asp:ButtonField CommandName="Del" Text="删除" >
                     <HeaderStyle Width="100px"/>
                     <ItemStyle ForeColor="#3399FF" />
                     </asp:ButtonField>
                 </Columns>
                 <HeaderStyle BackColor="Silver" />
                 <PagerStyle HorizontalAlign="Center" />
             </asp:GridView>
         </div>
    </div>
</asp:Content>

