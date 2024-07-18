<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddVideo.aspx.cs" Inherits="Elearning1.AddVideo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h2 class="my-4">Add Video</h2>
                <div class="form-group">
                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" 
                        DataSourceID="SqlDataSource1" 
                        DataTextField="course_name" 
                        DataValueField="course_name">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control" 
                        DataSourceID="SqlDataSource2" 
                        DataTextField="subcourse" 
                        DataValueField="subcourse">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Video Name"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Video Description"></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Video Image"></asp:Label>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                </div>

                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Video Source"></asp:Label>
                    <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" Text="Video Number"></asp:Label>
                    <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"></asp:TextBox>
                </div>


                <asp:Button ID="Button1" runat="server" Text="Add" CssClass="btn btn-primary btn-block" OnClick="Button1_Click" />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Elearning;Integrated Security=True" 
                    ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT Distinct [subcourse] FROM [courses]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Elearning;Integrated Security=True" 
                    ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT Distinct [course_name] FROM [courses]">
                </asp:SqlDataSource>
            </div>
        </div>
    </div>

</asp:Content>
