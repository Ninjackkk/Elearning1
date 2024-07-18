<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="Elearning1.test2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h3>Order Summary</h3>
                <hr />
                <asp:Panel ID="Panel1" runat="server">
                    <div>
                        <p><strong>Order ID:</strong> <asp:Label ID="lblOrderId" runat="server" Text=""></asp:Label></p>
                        <p><strong>Total Amount:</strong> <asp:Label ID="lblTotalAmount" runat="server" Text=""></asp:Label></p>
                    </div>
                </asp:Panel>
            </div>
            <div class="col-md-6">
                <h3>Actions</h3>
                <hr />
                <asp:Button ID="Button1" runat="server" Text="Pay Now" CssClass="btn btn-warning" OnClick="Button1_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button2" runat="server" Text="Download Invoice" CssClass="btn btn-secondary" OnClick="Button2_Click" />
            </div>
        </div>
    </div>
</asp:Content>
