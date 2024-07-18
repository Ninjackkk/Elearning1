<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="order.aspx.cs" Inherits="Elearning1.order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .gridview-container {
            margin-top: 20px;
        }
        .gridview-container .gridview-header {
            background-color: #f0f0f0;
            border: 1px solid #ddd;
            padding: 10px;
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
        }
        .gridview-container .gridview-body {
            border: 1px solid #ddd;
            border-top: none;
            border-radius: 4px;
            overflow: hidden;
        }
        .gridview-container .gridview-footer {
            border: 1px solid #ddd;
            border-top: none;
            border-bottom-left-radius: 4px;
            border-bottom-right-radius: 4px;
            padding: 10px;
            background-color: #f9f9f9;
            text-align: right;
        }
        .buttons-container {
            margin-top: 20px;
            text-align: center;
        }
        .btn {
            margin-right: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container gridview-container">
        <div class="gridview-header">
            <h3>Your Cart</h3>
        </div>

        <div class="gridview-body">
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:TemplateField HeaderText="Subcourse Image">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("subcourse_img") %>' AlternateText="Subcourse Image" CssClass="img-fluid" Width="100" />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Course Name">
            <ItemTemplate>
                <asp:Literal ID="LiteralCourseName" runat="server" Text='<%# Eval("course_name") %>'></asp:Literal>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Subcourse">
            <ItemTemplate>
                <asp:Literal ID="LiteralSubcourse" runat="server" Text='<%# Eval("subcourse") %>'></asp:Literal>
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Price">
            <ItemTemplate>
                <asp:Literal ID="LiteralPrice" runat="server" Text='<%# Eval("price") %>'></asp:Literal>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
        </div>

        <div class="gridview-footer">
            <asp:Label ID="LabelTotal" runat="server" Text="Total:"></asp:Label>
        </div>

        <div class="buttons-container">
            <asp:Button ID="Button1" runat="server" Text="Checkout" OnClick="Button1_Click" CssClass="btn btn-primary" />
            <asp:Button ID="Button2" runat="server" Text="Return To Cart" OnClick="Button2_Click" CssClass="btn btn-secondary" />
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Elearning;Integrated Security=True" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT [course_name], [subcourse], [subcourse_img], [price], [suser] FROM [cart] WHERE [suser] = @user_id">
        <SelectParameters>
            <asp:SessionParameter Name="user_id" SessionField="user_id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
