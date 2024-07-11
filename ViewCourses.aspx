<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewCourses.aspx.cs" Inherits="Elearning1.ViewCourses" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Custom styles */
        .card {
            margin-bottom: 20px; /* Adjust margin between cards */
        }

        .card-deck {
            margin-right: -15px; /* Adjust to counteract Bootstrap's default padding */
            margin-left: -15px; /* Adjust to counteract Bootstrap's default padding */
        }

        /* GridView styles */
        .gridview {
            border: 1px solid #ccc; /* Add border */
            border-collapse: collapse; /* Collapse border spacing */
            width: 100%;
            margin-top: 20px;
        }

        .gridview th, .gridview td {
            border: 1px solid #ccc; /* Add border to cells */
            padding: 8px; /* Padding inside cells */
            text-align: left;
        }

        .gridview th {
            background-color: #5D7B9D; /* Header background color */
            color: white; /* Header text color */
            font-weight: bold; /* Header font weight */
        }

        .gridview tr:nth-child(even) {
            background-color: #f2f2f2; /* Alternating row background color */
        }

        .gridview tr:hover {
            background-color: #E2DED6; /* Hover row background color */
        }

        .gridview .command-column {
            width: 100px; /* Width of command column */
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="course_id" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" CssClass="gridview">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="course_id" HeaderText="Course ID" InsertVisible="False" ReadOnly="True" SortExpression="course_id" />
                        <asp:BoundField DataField="course_name" HeaderText="Course Name" SortExpression="course_name" />
                        <asp:BoundField DataField="subcourse" HeaderText="Subcourse" SortExpression="subcourse" />
                        <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />

                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" HeaderText="Actions" ItemStyle-CssClass="command-column" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Elearning;Integrated Security=True"
        DeleteCommand="DELETE FROM [courses] WHERE [course_id] = @original_course_id AND (([course_name] = @original_course_name) OR ([course_name] IS NULL AND @original_course_name IS NULL)) AND (([subcourse] = @original_subcourse) OR ([subcourse] IS NULL AND @original_subcourse IS NULL)) AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL))"
        InsertCommand="INSERT INTO [courses] ([course_name], [subcourse], [price]) VALUES (@course_name, @subcourse, @price)" OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [courses]"
        UpdateCommand="UPDATE [courses] SET [course_name] = @course_name, [subcourse] = @subcourse, [price] = @price WHERE [course_id] = @original_course_id AND (([course_name] = @original_course_name) OR ([course_name] IS NULL AND @original_course_name IS NULL)) AND (([subcourse] = @original_subcourse) OR ([subcourse] IS NULL AND @original_subcourse IS NULL)) AND (([price] = @original_price) OR ([price] IS NULL AND @original_price IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_course_id" Type="Int32" />
            <asp:Parameter Name="original_course_name" Type="String" />
            <asp:Parameter Name="original_subcourse" Type="String" />
            <asp:Parameter Name="original_price" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="course_name" Type="String" />
            <asp:Parameter Name="subcourse" Type="String" />
            <asp:Parameter Name="price" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="course_name" Type="String" />
            <asp:Parameter Name="subcourse" Type="String" />
            <asp:Parameter Name="price" Type="Decimal" />
            <asp:Parameter Name="original_course_id" Type="Int32" />
            <asp:Parameter Name="original_course_name" Type="String" />
            <asp:Parameter Name="original_subcourse" Type="String" />
            <asp:Parameter Name="original_price" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
