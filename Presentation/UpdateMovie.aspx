<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="UpdateMovie.aspx.cs" Inherits="EntityDesignPattern.Presentation.UpdateMovie" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
             
            <div class="col-md-12" style="margin-left: auto; margin-right: auto; text-align: center;">
                <hr class="new" />
                <h1>Update or Delete Movie Details</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4">
                <form>
                    <div class="form-group">
                        <asp:DropDownList ID="ddl_Movie" Style="text-align: center;" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddl_Movie_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                          
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txt_title" Style="text-align: center;" CssClass="form-control" placeholder="Movie Name" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="reqTitle" runat="server" ControlToValidate="txt_title" ErrorMessage="Enter Movie Name" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                     <div class="form-group">
                        <asp:TextBox ID="txt_year" Style="text-align: center;" CssClass="form-control" placeholder="year" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="regyear" runat="server" ControlToValidate="txt_year" ErrorMessage="Enter year" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txt_Gener" Style="text-align: center;" CssClass="form-control" placeholder="Gener" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="reqGener" runat="server" ControlToValidate="txt_year" ErrorMessage="Enter Gener" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                   
                    <div class="form-group">
                        <asp:TextBox ID="txt_RentPerDay" Style="text-align: center;" CssClass="form-control" placeholder="Rent Per Day" runat="server" ></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Update" ID="regPhone" runat="server" ControlToValidate="txt_RentPerDay" ErrorMessage="Enter Rent" SetFocusOnError="true" Display="None"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnUpdate" Style="float: left;" runat="server" class="btn btn-danger" OnClick="Update_btn_Click" ValidationGroup="Update" Text="Update" />
                        <asp:ValidationSummary ID="regUpdate" runat="server" ShowSummary="false" ShowMessageBox="true" HeaderText="Please enter valid value in below fields" ValidationGroup="Update" OnDataBinding="ddl_Movie_SelectedIndexChanged" />
                        <asp:Button ID="btnDelete" Style="float: right;" runat="server" class="btn btn-danger" OnClick="Delete_btn_Click" ValidationGroup="Update" Text="Delete" />
                        <asp:ValidationSummary ID="regDelete" runat="server" ShowSummary="false" ShowMessageBox="true" HeaderText="Please enter valid value in below fields" ValidationGroup="Update" />
                    </div>
                    </form>
            </div>
            </div>
    
        </asp:Content>