<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ViewUsers.aspx.cs" Inherits="Elearning1.ViewUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card {
            margin-bottom: 20px; 
        }

        .card-deck {
            margin-right: -15px; 
            margin-left: -15px; 
        }

        .gridview {
            border: 1px solid #ccc; 
            border-collapse: collapse; 
            width: 100%;
            margin-top: 20px;
        }

        .gridview th, .gridview td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }

        .gridview th {
            background-color: #5D7B9D; 
            color: white;
            font-weight: bold;
        }

        .gridview tr:nth-child(even) {
            background-color: #f2f2f2; 
        }

        .gridview tr:hover {
            background-color: #E2DED6; 
        }

        .gridview .command-column {
            width: 100px; 
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="user_id" DataSourceID="SqlDataSource1" CssClass="gridview">
                    <Columns>
                        <asp:BoundField DataField="user_id" HeaderText="User ID" InsertVisible="False" ReadOnly="True" SortExpression="user_id" />
                        <asp:BoundField DataField="user_name" HeaderText="User Name" SortExpression="user_name" />
                        <asp:BoundField DataField="user_email" HeaderText="Email" SortExpression="user_email" />
                        <asp:BoundField DataField="user_pass" HeaderText="Password" SortExpression="user_pass" />
                        <asp:BoundField DataField="user_phone" HeaderText="Phone" SortExpression="user_phone" />
                        <asp:BoundField DataField="user_role" HeaderText="Role" SortExpression="user_role" />

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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=Elearning;Integrated Security=True"
        DeleteCommand="DELETE FROM [users] WHERE [user_id] = @original_user_id AND (([user_name] = @original_user_name) OR ([user_name] IS NULL AND @original_user_name IS NULL)) AND (([user_email] = @original_user_email) OR ([user_email] IS NULL AND @original_user_email IS NULL)) AND (([user_pass] = @original_user_pass) OR ([user_pass] IS NULL AND @original_user_pass IS NULL)) AND (([user_phone] = @original_user_phone) OR ([user_phone] IS NULL AND @original_user_phone IS NULL)) AND (([user_role] = @original_user_role) OR ([user_role] IS NULL AND @original_user_role IS NULL))"
        InsertCommand="INSERT INTO [users] ([user_name], [user_email], [user_pass], [user_phone], [user_role]) VALUES (@user_name, @user_email, @user_pass, @user_phone, @user_role)" OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [users]"
        UpdateCommand="UPDATE [users] SET [user_name] = @user_name, [user_email] = @user_email, [user_pass] = @user_pass, [user_phone] = @user_phone, [user_role] = @user_role WHERE [user_id] = @original_user_id AND (([user_name] = @original_user_name) OR ([user_name] IS NULL AND @original_user_name IS NULL)) AND (([user_email] = @original_user_email) OR ([user_email] IS NULL AND @original_user_email IS NULL)) AND (([user_pass] = @original_user_pass) OR ([user_pass] IS NULL AND @original_user_pass IS NULL)) AND (([user_phone] = @original_user_phone) OR ([user_phone] IS NULL AND @original_user_phone IS NULL)) AND (([user_role] = @original_user_role) OR ([user_role] IS NULL AND @original_user_role IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_user_id" Type="Int32" />
            <asp:Parameter Name="original_user_name" Type="String" />
            <asp:Parameter Name="original_user_email" Type="String" />
            <asp:Parameter Name="original_user_pass" Type="String" />
            <asp:Parameter Name="original_user_phone" Type="Int64" />
            <asp:Parameter Name="original_user_role" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="user_name" Type="String" />
            <asp:Parameter Name="user_email" Type="String" />
            <asp:Parameter Name="user_pass" Type="String" />
            <asp:Parameter Name="user_phone" Type="Int64" />
            <asp:Parameter Name="user_role" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="user_name" Type="String" />
            <asp:Parameter Name="user_email" Type="String" />
            <asp:Parameter Name="user_pass" Type="String" />
            <asp:Parameter Name="user_phone" Type="Int64" />
            <asp:Parameter Name="user_role" Type="String" />
            <asp:Parameter Name="original_user_id" Type="Int32" />
            <asp:Parameter Name="original_user_name" Type="String" />
            <asp:Parameter Name="original_user_email" Type="String" />
            <asp:Parameter Name="original_user_pass" Type="String" />
            <asp:Parameter Name="original_user_phone" Type="Int64" />
            <asp:Parameter Name="original_user_role" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>
