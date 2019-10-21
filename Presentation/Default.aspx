<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EntityDesignPattern._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="Container-fluid">
        <div class="row">
            <div class="col-md-12" style="margin-left: auto; margin-right: auto; text-align: center;">
                <br />
                <hr class="new" />
                <h1>Details Of Customer</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="GVD_Customer" runat="server" BackColor="White" BorderColor="White" BorderWidth="5px" CellPadding="5" Width="939px" AllowPaging="True" AutoGenerateColumns="False" PageSize="5" CellSpacing="5" HorizontalAlign="Center" OnSelectedIndexChanged="GVD_Customer_SelectedIndexChanged" EnableSortingAndPagingCallbacks="True" Height="16px" ForeColor="Black">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                        <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                        <asp:BoundField DataField="Address" HeaderText="Address" />
                        <asp:BoundField DataField="Phone" HeaderText="Contact Number" />
                    </Columns>
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
            </div>
        </div>
    </div>
    <hr class="new">

    <div class="Container-fluid">
        <div class="row">
            <div class="col-md-6" style="margin-left: auto; margin-right: auto; text-align: center;">
                <h1>Details Of Movie</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="GVD_Movies" runat="server" BackColor="White" BorderColor="White" BorderWidth="5px" AllowPaging="True" CellPadding="5" Width="939px" GridLines="Vertical" AutoGenerateColumns="False" PageSize="5" CellSpacing="5" HorizontalAlign="Center" OnSelectedIndexChanged="GVD_Movies_SelectedIndexChanged" EnableSortingAndPagingCallbacks="True" Height="16px" ForeColor="Black">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="MovieID" HeaderText="Movie ID" />
                        <asp:BoundField DataField="Title" HeaderText="Movie Name" />
                        <asp:BoundField DataField="Year" HeaderText="Year" />
                        <asp:BoundField DataField="Gener" HeaderText="Gener" />
                        <asp:BoundField DataField="RentPerDay" HeaderText="Rent Per Day" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
            </div>
        </div>
    </div>
    <hr class="new">
    <div class="Container-fluid">
        <div class="row">
            <div class="col-md-6" style="margin-left: auto; margin-right: auto; text-align: center;">
                <h1>Details Of Movie Rent</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="GVD_MovieRent" runat="server" BackColor="White" BorderColor="White" BorderWidth="5px" AllowPaging="True" CellPadding="5" Width="939px" GridLines="Vertical" AutoGenerateColumns="False" PageSize="5" CellSpacing="5" HorizontalAlign="Center" OnSelectedIndexChanged="GVD_Movies_SelectedIndexChanged" EnableSortingAndPagingCallbacks="True" Height="16px" ForeColor="Black">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="RentID" HeaderText="Rent ID" />
                        <asp:BoundField DataField="MovieID" HeaderText="Movie ID" />
                        <asp:BoundField DataField="CustomerID" HeaderText="Customer ID" />
                        <asp:BoundField DataField="IssuseDate" HeaderText="Issuse Date" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
            </div>
        </div>
    </div>
    <hr class="new">
    <div class="Container-fluid">
        <div class="row">
            <div class="col-md-6" style="margin-left: auto; margin-right: auto; text-align: center;">
                <h1>Details Of Returned Movie</h1>
            </div>
        </div>
        <asp:GridView ID="GVD_ReturnedMovie" runat="server" BackColor="White" BorderColor="White" BorderWidth="5px" AllowPaging="True" CellPadding="5" Width="939px" GridLines="Vertical" AutoGenerateColumns="False" PageSize="5" CellSpacing="5" HorizontalAlign="Center" EnableSortingAndPagingCallbacks="True" Height="16px" ForeColor="Black">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="ReturnID" HeaderText="Retun ID" />
                <asp:BoundField DataField="MovieTitle" HeaderText="Movie Title" />
                <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" />
                <asp:BoundField DataField="IssueDate" HeaderText="Issuse Date" />
                <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" />
                <asp:BoundField DataField="TotalRent" HeaderText="Total Rent" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
    </div>

    <hr class="new">

</asp:Content>
