<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="MovieRent.aspx.cs" Inherits="EntityDesignPattern.Presentation.MovieRent_Class" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12" style="margin-left: auto; margin-right: auto; text-align: center;">
                <h1>Issue Movie Details</h1>
            </div>
        </div>
        <hr />
        <br />
        
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <form>
                    <div class="form-group">
                        <asp:DropDownList ID="ddl_Customer" Style="float: left;" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddl_Customer_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:DropDownList ID="ddl_Movie" Style="float: right;" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddl_Movie_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </div>
                    <br />
                    <br />
                    <div class="form-group">
                        <asp:TextBox ID="txt_FirstName" Style="float: left; text-align: center;" CssClass="form-control" placeholder="Customer First Name" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="reqFirstName" runat="server" ControlToValidate="txt_FirstName" ErrorMessage="Enter First Name" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txt_movieName" Style="float: right; text-align: center;" CssClass="form-control" placeholder="Movie Name" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="regMovie" runat="server" ControlToValidate="txt_movieName" ErrorMessage="Enter Bike Model" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <br />
                    <br />

                    <div class="form-group">
                        <asp:TextBox ID="txtIssueDate" TextMode="Date" Style="margin-left: auto; margin-right: auto; text-align: center;" CssClass="form-control" placeholder="Movie Issue Date" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="regIssueDate" runat="server" ControlToValidate="txtIssueDate" ErrorMessage="Enter Movie Issue Date" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <br />
                    <br />
                    <hr />
                    <div class="form-group">
                        <asp:Button ID="btnIssue"  Style="margin-left: 45%; margin-right: 45%; text-align: center;" runat="server" class="btn btn-danger" OnClick="Issue_btn_Click" ValidationGroup="Update" Text="Issue" />
                        <asp:ValidationSummary ID="regIssue" runat="server" ShowSummary="false" ShowMessageBox="true" HeaderText="Please enter valid value in below fields" ValidationGroup="Update" />
                     </div>
                </form>
                <hr />
                <asp:Label ID ="MessageIssue" runat ="server"></asp:Label>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>
</asp:Content>