<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BloodDonorPage._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="Assets/Donors.css">
    <link rel="stylesheet" type="text/css" href="Assets/Registration.css">
    <link rel="stylesheet" type="text/css" href="Assets/Default.css">
    <body>
        <div>
            <asp:Panel ID="btnAddAndDownload" runat="server" Visible="true">
                <div class="btnAddAndDownload">
                    <asp:Button ID="btnAddDonor" runat="server" Text="Donate Blood" OnClick="btnAddDonor_Click" CssClass="customButton" />
                    <asp:Button ID="btnDownload" runat="server" Text="Download List" OnClick="btnDownload_Click" CssClass="customButton" />
                </div>
            </asp:Panel>
        </div>
        <br />

        <asp:Panel CssClass="panel-container panelContent panelHeader" ID="pnlGetDonors" runat="server" Visible="true">
            <div>
            </div>
            <center>
                <h3 style="font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif; color: darkred">BLOOD DONORS DETAILS</h3>
            </center>

            <div style="border: groove; background-color: cornsilk">
                <asp:GridView ID="grd" runat="server" AutoGenerateColumns="false" OnRowCommand="grd_RowCommand" GridLines="None"></asp:GridView>
            </div>

            <ajaxToolkit:ModalPopupExtender ID="popupDelete" runat="server" BackgroundCssClass="modalBackground" PopupControlID="panelPopUpId" CancelControlID="cancelpopup" TargetControlID="linkButton"></ajaxToolkit:ModalPopupExtender>
            <asp:Panel ID="panelPopUpId" runat="server" CssClass="modelPopup">
                <h1>Do you want to delete?</h1>
                <asp:Button ID="yespopup" runat="server" Text="yes" OnClick="yespopup_Click" />
                <asp:Button ID="cancelpopup" runat="server" Text="cancel" OnClick="cancelpopup_Click" />
            </asp:Panel>
            <asp:LinkButton runat="server" ID="linkButton"></asp:LinkButton>
        </asp:Panel>

        <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>



        <%--  <div style="border: groove; background-color: cornsilk">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowCommand="grd_RowCommand"
        AllowPaging="true" OnPageIndexChanged="GridView1_PageIndexChanged1">
    </asp:GridView>
</div>--%>



        <asp:Panel ID="panelAddNewDonor" runat="server" Visible="false">
            <div class="heading">
                <center>
                    <h2>REGISTRATION FORM</h2>
                </center>
            </div>
            <br />
            <div class="registerPage">
                <center>
                    <br />
                    <table>
                        <tr>
                            <td class="label">First Name:
                            </td>
                            <td>
                                <asp:TextBox ID="firstname" runat="server" AutoComplete="off" PlaceHolder="Enter First Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="firstnameRequiredValidator" runat="server" ControlToValidate="firstname"
                                    ErrorMessage="First name is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                                <asp:RegularExpressionValidator ID="firstnameValidator" runat="server" ControlToValidate="firstname"
                                    ErrorMessage="Firstname should contain only characters" ValidationExpression="^[a-zA-Z]+$"
                                    ForeColor="Red"></asp:RegularExpressionValidator>
                            </td>

                        </tr>
                        <tr>
                            <td class="label">Last Name:
                            </td>
                            <td>
                                <asp:TextBox ID="lastname" runat="server" AutoComplete="off" PlaceHolder="Enter Last Name"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="lastnameRequiredValidator" runat="server" ControlToValidate="lastname"
                                    ErrorMessage="Last name is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                                <asp:RegularExpressionValidator ID="lastnameValidator" runat="server" ControlToValidate="lastname"
                                    ErrorMessage="Lastname should contain only characters" ValidationExpression="^[a-zA-Z]+$"
                                    ForeColor="Red"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">Blood Group:
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownBloodGroup" runat="server" Width="280px">
                                    <asp:ListItem Text="Select Blood Group" Value=""></asp:ListItem>
                                    <asp:ListItem Text="A+"></asp:ListItem>
                                    <asp:ListItem Text="A-"></asp:ListItem>
                                    <asp:ListItem Text="B+"></asp:ListItem>
                                    <asp:ListItem Text="B-"></asp:ListItem>
                                    <asp:ListItem Text="AB+"></asp:ListItem>
                                    <asp:ListItem Text="AB-"></asp:ListItem>
                                    <asp:ListItem Text="O+"></asp:ListItem>
                                    <asp:ListItem Text="O-"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="DropDownBloodGroupValidator" runat="server" ControlToValidate="DropDownBloodGroup"
                                    ErrorMessage="Blood group is required" ForeColor="Red" InitialValue=""></asp:RequiredFieldValidator>

                                <%--                                <asp:RequiredFieldValidator ID="DropDownBloodGroupValidator" runat="server" ControlToValidate="DropDownBloodGroup" ErrorMessage="Blood Group is required" Display="None"></asp:RequiredFieldValidator>--%>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">Age:
                            </td>
                            <td>
                                <asp:TextBox ID="age" runat="server" AutoComplete="off" MaxLength="2" PlaceHolder="Enter Age"></asp:TextBox>
                                <asp:RangeValidator ID="ageRangeValidator" runat="server" ControlToValidate="age" ErrorMessage="Age must be between 18 and 60" Type="Integer" MinimumValue="18" MaximumValue="60" ForeColor="Red" CssClass="error-message"></asp:RangeValidator>
                                <asp:RequiredFieldValidator ID="ageValidator" runat="server" ControlToValidate="age" ForeColor="Red" ErrorMessage="Age is required" CssClass="error-message"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">Date of Birth:</td>
                            <td>
                                <asp:TextBox ID="DoB" runat="server" PlaceHolder="YYYY/MM/DD" Style="background-color: #f0f0f0; border: 1px solid #ccc;" />
                                <ajaxToolkit:CalendarExtender ID="DoB1" runat="server"
                                    TargetControlID="DoB"
                                    Format="yyyy/MM/dd"
                                    PopupButtonID="EntryDateImage"></ajaxToolkit:CalendarExtender>

                                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="DoB" OnServerValidate="CustomValidator1_ServerValidate1" ErrorMessage="Age must be at least 18 years" ForeColor="Red" Display="Dynamic"></asp:CustomValidator>

                                <asp:RequiredFieldValidator ID="DoBValidator" runat="server" ControlToValidate="DoB" ForeColor="Red" ErrorMessage="Date of birth is required" Display="Dynamic" Visible="true"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="DateValidator" runat="server" ForeColor="Red"
                                    ControlToValidate="DoB"
                                    ErrorMessage="Please enter a valid date in the format yyyy/MM/dd"
                                    ValidationExpression="^\d{4}/(0[1-9]|1[0-2])/(0[1-9]|[12][0-9]|3[01])$"
                                    Display="Dynamic"
                                    SetFocusOnError="true">
                                </asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">Email Id:
                            </td>
                            <td>
                                <asp:TextBox ID="email" runat="server" AutoComplete="off" PlaceHolder="abc@gmail.com"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="EmailValidator" runat="server"
                                    ControlToValidate="email"
                                    ErrorMessage="Please enter a valid email address."
                                    ValidationExpression="^[a-zA-Z][\w\.-]*@[\w\.-]+\.[a-zA-Z]+$"
                                    Display="Dynamic"
                                    ForeColor="Red">
                                </asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">Contact Number:
                            </td>
                            <td>
                                <asp:TextBox ID="txtContactNumber" runat="server" MaxLength="10" Placeholder="Enter 10 digit number"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="txtContactNumberValidator" runat="server" ControlToValidate="txtContactNumber"
                                    ErrorMessage="Contact number is required" ForeColor="Red"></asp:RequiredFieldValidator>
                                <ajaxToolkit:FilteredTextBoxExtender ID="ftbeContactNumber" runat="server"
                                    TargetControlID="txtContactNumber"
                                    FilterType="Numbers" />
                                <asp:RegularExpressionValidator ID="revContactNumber" runat="server"
                                    ControlToValidate="txtContactNumber"
                                    ErrorMessage="Please enter a valid phone number with 10 digits."
                                    ForeColor="Red"
                                    ValidationExpression="^\d{10}$"
                                    Display="Dynamic">
                                </asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">Address:
                            </td>
                            <td>
                                <asp:TextBox ID="address" runat="server" AutoComplete="off" PlaceHolder="Enter Address"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">Gender:
                            </td>
                            <td>
                                <asp:RadioButtonList ID="gender" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                                    <asp:ListItem Text="Male" Value="M" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Female" Value="F"></asp:ListItem>
                                    <asp:ListItem Text="Others" Value="O"></asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td class="label">Entry Date:
                            </td>
                            <td>
                                <asp:TextBox ID="EntryDateTextBox" runat="server" AutoPostBack="true" ReadOnly="true"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td class="label">Country:
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownCountry" runat="server" Width="280px" AutoPostBack="true" OnSelectedIndexChanged="DropDownCountry_SelectedIndexChanged"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="DropDownCountryValidator" runat="server" ControlToValidate="DropDownCountry" InitialValue="-1" ErrorMessage="Please select a country" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>

                            </td>
                        </tr>
                        <tr>
                            <td class="label">State:
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownState" runat="server" Width="280px"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="DropDownStateValidator" runat="server" ControlToValidate="DropDownState" InitialValue="-1" ErrorMessage="Please select a state" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="customButton" />
                                <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CausesValidation="false" CssClass="customButton" />
                                <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click1" CausesValidation="false" CssClass="customButton" />
                            </td>
                        </tr>
                    </table>
                </center>
                <br />
            </div>
        </asp:Panel>
    </body>
</asp:Content>
