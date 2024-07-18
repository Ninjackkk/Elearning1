<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="categories.aspx.cs" Inherits="Elearning1.test" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .filter-section {
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            border-radius: 5px;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            text-align: center; 
        }
        .filter-section h4 {
            margin-top: 0;
            margin-bottom: 10px;
        }
        .filter-section .form-group {
            margin-bottom: 10px;
        }
        .card {
            display: flex;
            flex-direction: column;
            height: 100%;
            border: 1px solid #ced4da;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .card-body {
            flex: 1;
            padding: 15px;
        }
        .btn-filter {
            border-radius: 20px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="filter-section">
    <h4>Filter Videos</h4>
    <div class="form-group">
        <label for="DropDownList1">Select Course:</label>
        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="course_name" DataValueField="course_name"></asp:DropDownList>
    </div>
    <div class="form-group">
        <label for="DropDownList2">Select Subcourse:</label>
        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" DataSourceID="SqlDataSource3" DataTextField="subcourse" DataValueField="subcourse"></asp:DropDownList>
    </div>
    <asp:Button ID="Button1" runat="server" Text="Filter" OnClick="Button1_Click" CssClass="btn btn-primary btn-filter" />
</div>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="course_id"  RepeatColumns="4" RepeatDirection="Horizontal">
        <ItemTemplate>
            <div class="card">
                <h5 class="card-header">Course Name : <%# Eval("course_name") %></h5>
                <div class="card-body">
                    <h6 class="card-subtitle mb-2 text-muted">Subcourse Name :<%# Eval("subcourse") %></h6>
                    <%--<div class="ratio ratio-16x9">
                        <iframe width="100%" height="100%" src='https://www.youtube.com/embed/<%# Eval("video_src") %>' title='<%# Eval("video_name") %>' frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>--%>
                    <div class="video-thumbnail">
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("subcourse_img") %>' AlternateText="Subcourse Image" CssClass="img-fluid" />
                    </div>
                    Price : <p class="card-text mt-3"><%# Eval("price") %></p>
<%--                    <p class="card-text"><strong>Video Number:</strong> <%# Eval("video_num") %></p>--%>
                    <a href="order.aspx" class="btn btn-primary">Enroll</a>
                    <a href="cart.aspx" class="btn btn-primary">Add To Cart</a>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Elearning;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT distinct [course_name] FROM [courses]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Elearning;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT distinct [subcourse] FROM [courses]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Elearning;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [courses]"></asp:SqlDataSource>
</asp:Content>
