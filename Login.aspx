<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Elearning1.Login" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        .card-custom {
            border: 1px solid #ced4da; 
            border-radius: 10px; 
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card mt-5 card-custom"> 
                        <div class="card-body">
                            <h5 class="card-title">Login</h5>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Username</label>
                                <asp:TextBox ID="TextBox1" CssClass="form-control" placeholder="Enter email" runat="server"></asp:TextBox>
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <asp:TextBox ID="TextBox2" CssClass="form-control" placeholder="Enter password" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                            <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Sign In" OnClick="Button1_Click" />
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#registrationModal">
                                New Registration
                            </button>
                            <asp:Button ID="Button3" CssClass="btn btn-primary" runat="server" Text="Reset Password" OnClick="Button3_Click" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="registrationModal" tabindex="-1" role="dialog" aria-labelledby="registrationModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content card-custom"> 
                    <div class="modal-header">
                        <h5 class="modal-title" id="registrationModalLabel">Register</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="txtName">Name</label>
                            <asp:TextBox ID="txtName" CssClass="form-control" placeholder="Enter your name" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtEmail">Email address</label>
                            <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Enter email" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtPassword">Password</label>
                            <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Enter password" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="txtPhone">Phone number</label>
                            <asp:TextBox ID="txtPhone" CssClass="form-control" placeholder="Enter phone number" runat="server"></asp:TextBox>
                        </div>
                        <asp:Button ID="Button2" runat="server" Text="Register" OnClick="Button2_Click" />
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </form>
</body>
</html>
