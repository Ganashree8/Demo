<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="BloodDonorPage.Logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <ajaxToolkit:ModalPopupExtender ID="logout" runat="server" BackgroundCssClass="modalBackground" PopupControlID="panelPopUpId" CancelControlID="cancelpopup" TargetControlID="linkButton"></ajaxToolkit:ModalPopupExtender>
    <asp:Panel ID="panelPopUpId" runat="server" CssClass="modelPopup">
        <h1>Do you want to logout?</h1>
        <asp:Button ID="yespopup" runat="server" Text="yes" OnClick="yespopup_Click" />
        <asp:Button ID="cancelpopup" runat="server" Text="cancel" OnClick="cancelpopup_Click" />
    </asp:Panel>
    <asp:LinkButton runat="server" ID="linkButton"></asp:LinkButton>

</asp:Content>
   



