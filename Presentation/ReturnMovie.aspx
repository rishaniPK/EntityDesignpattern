<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ReturnMovie.aspx.cs" Inherits="EntityDesignPattern.Presentation.ReturnMovie" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
             
            <div class="col-md-12" style="margin-left: auto; margin-right: auto; text-align: center;">
                <hr class="new" />
                <h1>Return Rental Movie Details</h1>
            </div>
        </div>
        <hr />
        <br />
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <form>
                    <div class="form-group">
                        <asp:DropDownList ID="ddl_RentID" Style="margin-left: auto; margin-right: auto; text-align: center;" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddl_Rent_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </div>
                    <br />
                    <div class="form-group">
                        <asp:TextBox ID="txt_CustomerName" Style="float: left; text-align: center;" CssClass="form-control" placeholder="Customer Name" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="reqCustomerName" runat="server" ControlToValidate="txt_CustomerName" ErrorMessage="Enter Customer Name" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txt_movieTitle" Style="float: right; text-align: center;" CssClass="form-control" placeholder="Movie Name" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="regmoviname" runat="server" ControlToValidate="txt_movieTitle" ErrorMessage="Enter Movie ID" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <br />
                    <br />

                    <div class="form-group">
                        <asp:TextBox ID="txtIssueDate"  Style="float: left; text-align: center;" CssClass="form-control" placeholder="Movie Issue Date" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="regIssueDate" runat="server" ControlToValidate="txtIssueDate" ErrorMessage="Enter Movie Issue Date" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtReturnDate" Style="float: right; text-align: center;" CssClass="form-control" placeholder="Movie Return Date" Enabled="false" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="regReturnDate" runat="server" ControlToValidate="txtReturnDate" ErrorMessage="Enter Movie Return Date" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <br />
                    <br />

                    <div class="form-group">
                        <asp:TextBox ID="txtTotalRent" Style="margin-left: auto; margin-right: auto; text-align: center;" CssClass="form-control" Enabled="false" placeholder="Total Rent" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="regTotalRent" runat="server" ControlToValidate="txtTotalRent" ErrorMessage="Enter Total Rent" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <hr />
                    <div class="form-group">
                           <asp:Button ID="btnReturn" Style="margin-left: 45%; margin-right: 45%; text-align: center;" runat="server" class="btn btn-danger" OnClick="Return_btn_Click" ValidationGroup="Update" Text="Return" />
                        <asp:ValidationSummary ID="regReturn" runat="server" ShowSummary="false" ShowMessageBox="true" HeaderText="Please enter valid value in below fields" ValidationGroup="Update" />
                    </div>
                </form>
                 <hr />
                <asp:Label ID ="MessageReturn" runat ="server"></asp:Label>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>
</asp:Content>