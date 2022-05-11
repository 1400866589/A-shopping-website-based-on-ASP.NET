<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="CategoryManage.aspx.cs" Inherits="Admin_CategoryManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="layui-card">
        <div class="layui-card-header" style="text-align: center; font-size: large;">分类管理</div>
    </div>
    <div class="layui-card">
        <div class="layui-card-header layui-form" style="padding: 15px 10px;">
            <div class="layui-row">
                <div class="layui-col-lg2">
                    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="HardwareAccessoriesShop.DAL.HardwareAccessoriesShopDataContext" EnableUpdate="True" EntityTypeName="" TableName="Category" Where="CategoryState == @CategoryState">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="1" Name="CategoryState" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="HardwareAccessoriesShop.DAL.HardwareAccessoriesShopDataContext" EnableUpdate="True" EntityTypeName="" TableName="Category" Where="CategoryState == @CategoryState &amp;&amp; CategoryName.Contains(@CategoryName)">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="1" Name="CategoryState" Type="Int32" />
                            <asp:ControlParameter ControlID="txtSearchKey" Name="CategoryName" PropertyName="Text" Type="String" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                    <asp:TextBox ID="txtAddCategoryName" runat="server" CssClass="layui-input" placeholder="新建分类名称"></asp:TextBox>
                </div>
                <div class="layui-col-lg2" style="line-height: initial; margin-left: 10px;">
                    <asp:LinkButton ID="BtnAddCategory" runat="server" CssClass="layui-btn layui-btn-fluid" OnClick="BtnAddCategory_Click">
                             <i class="layui-icon layui-icon-add-circle"></i>添加分类
                         </asp:LinkButton>
                </div>
                <div class="layui-col-lg2 layui-col-lg-offset3">
                    <asp:TextBox ID="txtSearchKey" runat="server" CssClass="layui-input" placeholder="搜索分类"></asp:TextBox>
                </div>
                <div class="layui-col-lg1" style="line-height: initial; margin-left: 10px;">
                    <asp:LinkButton ID="BtnSearch" runat="server" CssClass="layui-btn" OnClick="BtnSearch_Click">搜索</asp:LinkButton>
                </div>
            </div>
        </div>
         <div class="layui-card-body layui-form" font-size: large;">
             <asp:Label ID="lblPageCountMsg" runat="server"></asp:Label><br />
            <asp:GridView ID="gvCategory" runat="server" CssClass="layui-table" Style="table-layout: fixed;" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="CategoryId" OnRowCommand="gvCategory_RowCommand" DataSourceID="LinqDataSource1" EmptyDataText="暂无数据">
                <Columns>
                    <asp:BoundField DataField="CategoryId" HeaderText="分类ID" ReadOnly="True">
                        <HeaderStyle Width="100px" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="分类名称">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNewCategoryName" runat="server" CssClass="layui-input" Text='<%# Bind("CategoryName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCategoryName" runat="server" Text='<%# Bind("CategoryName") %>'></asp:Label>
                        </ItemTemplate>
                        <ControlStyle Width="200px" />
                    </asp:TemplateField>
                    <asp:CommandField EditText="编辑" ShowEditButton="True">
                        <HeaderStyle Width="100px" />
                        <ItemStyle ForeColor="#3399FF"  />
                    </asp:CommandField>
                    <asp:ButtonField CommandName="Del" Text="删除">
                        <HeaderStyle Width="100px" />
                        <ItemStyle ForeColor="#3399FF"  />
                    </asp:ButtonField>
                </Columns>
                <HeaderStyle BackColor="Silver" />
                <PagerStyle HorizontalAlign="Center" />
            </asp:GridView>
         </div>
    </div>
</asp:Content>