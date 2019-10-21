<%@ Page Title="AddCustomer" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="EntityDesignPattern.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12" style="margin-left: auto; margin-right: auto; text-align: center;">
                <br />
                <hr class="new" />
                <h1>Add Customer Details</h1>
            </div>
        </div>
        <div class="row">
            
                <div class="col-md-4"></div>
                <div class="col-md-4">
                
                    <div class="form-group">
                            <asp:TextBox ID="txt_FirstName" Style="text-align: center;" CssClass="form-control" placeholder="First Name" runat="server" Width="99%"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="insert" ID="regFirstName" runat="server" ControlToValidate="txt_FirstName" ErrorMessage="Enter First Name" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                        <asp:TextBox ID="txt_LastName" Style="text-align: center;" Cssclass="form-control" placeholder="Last Name" runat="server" Width="99%"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="insert" ID="regLastName" runat="server" ControlToValidate="txt_LastName" ErrorMessage="Enter Last Name" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txt_Address" Style="text-align: center;" Cssclass="form-control" placeholder="Address" runat="server" Width="99%"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="insert" ID="regAddress" runat="server" ControlToValidate="txt_Address" ErrorMessage="Enter Address" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txt_Phone" Style="text-align: center;" Cssclass="form-control" placeholder="Phone" runat="server" Width="99%"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="insert" ID="regPhone" runat="server" ControlToValidate="txt_Phone" ErrorMessage="Enter Phone" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btn_Submit" runat="server" class="btn btn-danger" Text="Submit" OnClick="btn_Submit_Click" ValidationGroup="insert" />
                        <asp:ValidationSummary ID="valsum" runat="server" ShowSummary="false" ShowMessageBox="true" HeaderText="Please enter valid value in below fields" ValidationGroup="insert"/>
                    </div>
                    </div>
             
                <div class="col-md-4"></div>
            </div>
        </div>

</asp:Content>
