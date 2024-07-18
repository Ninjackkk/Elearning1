<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Allcourses.aspx.cs" Inherits="Elearning1.Test" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card 
        {
            display: flex;
            flex-direction: column;
            min-height: 200px;
           
        }
        .card-body
        {
            flex: 1;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="video_id" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal">
        <ItemTemplate>
            <div class="card mb-3" style="max-width: 540px;">
                <h5 class="card-header">Course Name : <%# Eval("course_name") %></h5>
                <div class="card-body">
                    <h6 class="card-subtitle mb-2 text-muted">Subcourse : <%# Eval("subcourse") %></h6>
                    <div class="ratio ratio-16x9">
                        <iframe width="100%" height="100%" src='https://www.youtube.com/embed/<%# Eval("video_src") %>' title='<%# Eval("video_name") %>' frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                    <p class="card-text mt-3"><%# Eval("video_desc") %></p>
                    <p class="card-text"><strong>Video Number:</strong> <%# Eval("video_num") %></p>

                    <a href="cart.aspx" class="btn btn-primary">Enroll</a>
                    <asp:Button ID="Button1" runat="server" Text="Add To Cart"/>
<%--                   <a href="preview.aspx" class="btn btn-primary"</a>--%>

                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>

                       

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Elearning;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [videos]"></asp:SqlDataSource>
</asp:Content>
