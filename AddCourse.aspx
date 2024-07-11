<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AddCourse.aspx.cs" Inherits="Elearning1.AddCourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h2 class="my-4">Add Course</h2>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Course Name"></asp:Label>
                    <asp:TextBox ID="txtCourseName" runat="server" CssClass="form-control" placeholder="Enter course name"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Subcourse Name"></asp:Label>
                    <asp:TextBox ID="txtSubcourseName" runat="server" CssClass="form-control" placeholder="Enter subcourse name"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Subcourse Image"></asp:Label>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Price"></asp:Label>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" placeholder="Enter price"></asp:TextBox>
                </div>
                <asp:Button ID="Button1" runat="server" Text="Add" CssClass="btn btn-primary btn-block" OnClick="Button1_Click" />
            </div>
        </div>
    </div>

</asp:Content>
