<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ProManage.aspx.cs" Inherits="Admin_ProManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div class="layui-row">
        <div class="layui-card">
            <div class="layui-card-header" style="text-align:center;font-size:large;">商品管理</div>
        </div>
        <div class="layui-card">
            <div class="layui-card-header layui-form" style="padding: 15px 10px;">
                <div class="layui-row">
                    <div class="layui-col-xs2" style="line-height: initial;">
                        <a href="NewProduct.aspx" class="layui-btn layui-btn-fluid">
                            <i class="layui-icon layui-icon-add-circle"></i>添加商品
                        </a>
                    </div>
                    <div class="layui-col-xs2 layui-col-xs-offset4">
                        <asp:DropDownList ID="ddlType" runat="server" Width="100px">
                            <asp:ListItem Value="" Selected="True">选择搜索方式</asp:ListItem>
                            <asp:ListItem Value="AccName">商品名称</asp:ListItem>
                            <asp:ListItem Value="Producer">生产地</asp:ListItem>
                            <asp:ListItem Value="Manufacturer">生产厂家</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="layui-col-xs2" style="margin: 0px 10px;">
                        <asp:TextBox ID="txtSearchKey" runat="server" CssClass="layui-input" placeholder="请输入关键字"></asp:TextBox>
                    </div>
                    <div class="layui-col-xs1" style="line-height: initial;">
                        <asp:LinkButton ID="BtnSearch" runat="server" CssClass="layui-btn" OnClick="BtnSearch_Click">搜索</asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="layui-card-body">
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="HardwareAccessoriesShop.DAL.HardwareAccessoriesShopDataContext" EntityTypeName="" TableName="Accessories" Where="AccState == @AccState" EnableUpdate="True">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="1" Name="AccState" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <asp:LinqDataSource ID="LinqDataSourceAccName" runat="server" ContextTypeName="HardwareAccessoriesShop.DAL.HardwareAccessoriesShopDataContext" EntityTypeName="" TableName="Accessories" Where="AccState == @AccState &amp;&amp; AccName.Contains(@AccName)">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="1" Name="AccState" Type="Int32" />
                        <asp:ControlParameter ControlID="txtSearchKey" Name="AccName" PropertyName="Text" Type="String" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <asp:LinqDataSource ID="LinqDataSourceProducer" runat="server" ContextTypeName="HardwareAccessoriesShop.DAL.HardwareAccessoriesShopDataContext" EntityTypeName="" TableName="Accessories" Where="AccState == @AccState &amp;&amp; Producer.Contains(@Producer)">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="1" Name="AccState" Type="Int32" />
                        <asp:ControlParameter ControlID="txtSearchKey" Name="Producer" PropertyName="Text" Type="String" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <asp:LinqDataSource ID="LinqDataSourceManufacturer" runat="server" ContextTypeName="HardwareAccessoriesShop.DAL.HardwareAccessoriesShopDataContext" EntityTypeName="" TableName="Accessories" Where="AccState == @AccState &amp;&amp; Manufacturer.Contains(@Manufacturer)">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="1" Name="AccState" Type="Int32" />
                        <asp:ControlParameter ControlID="txtSearchKey" Name="Manufacturer" PropertyName="Text" Type="String" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <asp:Label ID="lblPageCountMsg" runat="server"></asp:Label><br />
                <asp:GridView ID="gvAccsInfo" runat="server" CssClass="layui-table" lay-size="sm" style="table-layout: fixed;" AutoGenerateColumns="False" DataKeyNames="AccId" AllowPaging="True" OnRowCommand="gvAccsInfo_RowCommand" PagerStyle-HorizontalAlign="Center" PagerStyle-ForeColor="Red" DataSourceID="LinqDataSource1" AllowSorting="True" EmptyDataText="暂无数据">
                    <Columns>
                        <asp:BoundField DataField="AccId" HeaderText="编号" >
                        <HeaderStyle Width="30px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AccName" HeaderText="商品名称" />
                        <asp:BoundField DataField="Producer" HeaderText="生产地" />
                        <asp:BoundField DataField="Manufacturer" HeaderText="生产厂家" />
                        <asp:BoundField DataField="Batch" HeaderText="批次号" />
                        <asp:BoundField DataField="AccDate" HeaderText="修改时间"/>
                        <asp:BoundField DataField="ListPrice" HeaderText="单价/元" >
                        <HeaderStyle Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Quantity" HeaderText="库存/件" >
                        <HeaderStyle Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PraiseQty" HeaderText="点赞量" >
                        <HeaderStyle Width="50px" />
                        </asp:BoundField>
                        <asp:HyperLinkField Text="修改" DataNavigateUrlFields="AccId" DataNavigateUrlFormatString="~/Admin/ProUpdate.aspx?Acc_Id={0}" ItemStyle-ForeColor="#3399FF">
                        <HeaderStyle Width="30px" />
                        <ItemStyle ForeColor="#3399FF" />
                        </asp:HyperLinkField>
                        <asp:ButtonField CommandName="Del" Text="删除" >
                        <HeaderStyle Width="100px"/>
                        <ItemStyle ForeColor="#3399FF" />
                        </asp:ButtonField>
                    </Columns>
                    <HeaderStyle BackColor="Silver" />
                    <PagerStyle HorizontalAlign="Center" ForeColor="Red"></PagerStyle>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

