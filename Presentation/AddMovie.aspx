<%@ Page Title="Add Movie"  Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="AddMovie.aspx.cs" Inherits="EntityDesignPattern.Presentation.AddMovie" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="Container-fluid">
        <div class="row">
            <div class="col-md-12" style="margin-left: auto; margin-right: auto; text-align: center;">
                <br />
                 <hr class="new" />
                <h1>Add Movie Details</h1>
            </div>
        </div>
        <div class="row">
            
                <div class="col-md-4"></div>
                <div class="col-md-4">
                
                    <div class="form-group">
                            <asp:TextBox ID="txt_title" Style="text-align: center;" CssClass="form-control" placeholder="Movie Name" runat="server" Width="99%"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="insert" ID="regtitle" runat="server" ControlToValidate="txt_title" ErrorMessage="Enter Movie Name" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                        </div>
                       <div class="form-group">
                            <asp:TextBox ID="txt_year" Style="text-align: center;" CssClass="form-control" placeholder="Year" runat="server" Width="99%"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="insert" ID="regyear" runat="server" ControlToValidate="txt_year" ErrorMessage="Enter Year" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                        </div>
                    <div class="form-group">
                            <asp:TextBox ID="txt_Gener" Style="text-align: center;" CssClass="form-control" placeholder="Gener" runat="server" Width="99%"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="insert" ID="regGener" runat="server" ControlToValidate="txt_Gener" ErrorMessage="Enter Gener" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                        </div>
                    <div class="form-group">
                            <asp:TextBox ID="txt_RentPerDay" Style="text-align: center;" CssClass="form-control" placeholder="Rent Per Day" runat="server" Width="99%"></asp:TextBox>
                            <asp:RequiredFieldValidator ValidationGroup="insert" ID="RegRentPerDay" runat="server" ControlToValidate="txt_RentPerDay" ErrorMessage="Enter Rent Per Day" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                        <div class="form-group">
                        <asp:Button ID="btn_Submit" runat="server" class="btn btn-danger" Text="Submit" OnClick="btn_Submit_Click" ValidationGroup="insert" />
                        <asp:ValidationSummary ID="valsum" runat="server" ShowSummary="false" ShowMessageBox="true" HeaderText="Please enter valid value in below fields" ValidationGroup="insert"/>
                    </div>
                <div class="col-md-4"></div>
            </div>
        </div>
    
</asp:Content>