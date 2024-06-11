<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="BloodDonorPage.LoginPage" %>

<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="Assets/Login.css">

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <form id="form1" runat="server">
        <!-- Login Panel -->
        
        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
        <asp:Panel ID="pnlLogin" runat="server" Visible="true">
            <h4 class="text-center" style="padding-top:100px;color:darkred;font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif">LOGIN PAGE</h4>
            <div class="form-container">
                
                <div class="loginBox">
                    <label for="UserNameTextBox" class="username-label">USERNAME:</label>
                    <asp:TextBox ID="UserNameTextBox" runat="server" CssClass="form-control" placeholder="Enter User Name"></asp:TextBox>
<%--                    <asp:RequiredFieldValidator ID="UserNameRequiredValidator" runat="server" ControlToValidate="UserNameTextBox" ErrorMessage="Username is required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                </div>
                <div class="loginBox">
                    <label for="PasswordTextBox" class="password-label">PASSWORD:</label>
                    <asp:TextBox ID="PasswordTextBox" runat="server" CssClass="form-control" TextMode="Password" Placeholder="Enter password"></asp:TextBox>
<%--                    <asp:RequiredFieldValidator ID="PasswordRequiredValidator" runat="server" ControlToValidate="PasswordTextBox" ErrorMessage="Password is required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                    <br />
                </div>
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />
                <asp:Button ID="Button1" runat="server" Text="Clear" OnClick="btnClear_Click" CssClass="btn btn-secondary" />
            </div>
        </asp:Panel>

        
        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Invalid username or password</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Please check your username and password and try again.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </form>


    <script type="text/javascript">
        function showAlert(message) {
            console.log("Alert message:", message);
            alert(message);
        }
    </script>

    <!-- Bootstrap and jQuery JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-xxx" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
