<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="Elearning1.cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card {
            display: flex;
            flex-direction: column;
            min-height: 200px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 20px;
            box-shadow: 0 0 8px rgba(0,0,0,0.1);
            background-color: #fff;
        }
        .card-body {
            flex: 1;
            padding: 15px;
        }
        .card-header {
            background-color: #f0f0f0;
            padding: 10px;
            border-bottom: 1px solid #ddd;
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
        }
        .card-text {
            margin-top: 10px;
        }
        .img-fluid {
            max-width: 100%;
            height: auto;
            border-radius: 4px;
        }
        .buttons-container {
            text-align: center;
            margin-top: 20px;
        }
        .btn {
            margin-right: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <asp:DataList ID="DataList1" runat="server" DataKeyField="cart_id" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal">
            <ItemTemplate>
                <div class="card">
                    <h5 class="card-header">Course Name: <%# Eval("course_name") %></h5>
                    <div class="card-body">
                        <h6 class="card-subtitle mb-2 text-muted">Subcourse: <%# Eval("subcourse") %></h6>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("subcourse_img") %>' AlternateText="Subcourse Image" CssClass="img-fluid" />
                        <p class="card-text"><strong>Price:</strong> <%# Eval("price") %></p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>

        <div class="buttons-container">
            <asp:Button ID="Button1" runat="server" Text="Buy" OnClick="Button1_Click" CssClass="btn btn-primary" />
            <asp:Button ID="Button2" runat="server" Text="Return" OnClick="Button2_Click" CssClass="btn btn-secondary" />
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Elearning;Integrated Security=True" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT * FROM [cart] WHERE [suser] = @user_id">
        <SelectParameters>
            <asp:SessionParameter Name="user_id" SessionField="user_id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
