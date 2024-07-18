<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="All.aspx.cs" Inherits="Elearning1.test1" %>
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


    <asp:DataList ID="DataList1" runat="server" DataKeyField="course_id" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
    <ItemTemplate>
        <div class="card mb-3" style="max-width: 540px;">
            <h5 class="card-header">Course Name : <%# Eval("course_name") %></h5>
            <div class="card-body">
                <h6 class="card-subtitle mb-2 text-muted">Subcourse : <%# Eval("subcourse") %></h6>
                
                <%-- Displaying the subcourse image --%>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("subcourse_img") %>' AlternateText="Subcourse Image" CssClass="img-fluid" />
                <p class="card-text"><strong>Video Number:</strong> <%# Eval("price") %></p>

                <asp:Button ID="Button1" runat="server" Text="Add To Cart" CommandName="addtocart" CommandArgument='<%# Eval("course_id")%>'/>
                <asp:Button ID="Button2" runat="server" Text="Enroll/Buy"  />


            </div>
           </div>
    </ItemTemplate>
</asp:DataList>

                    




    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Elearning;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [courses]"></asp:SqlDataSource>




</asp:Content>
