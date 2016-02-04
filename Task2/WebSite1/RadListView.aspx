<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RadListView.aspx.cs" Inherits="RadListView" %>

<%@ Import Namespace="Telerik.Web.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <telerik:RadListView runat="server" ID="RadListView1" PageSize="3" AllowPaging="true" OnNeedDataSource="RadListView1_OnNeedDataSource" ItemPlaceholderID="PlaceHolderListContainer"
        DataKeyNames="Id" OnSelectedIndexChanged="RadListView1_OnSelectedIndexChanged">
        <LayoutTemplate>
            <asp:PlaceHolder ID="PlaceHolderListContainer" runat="server"></asp:PlaceHolder>
            <telerik:RadDataPager ID="RadDataPagerUserList" runat="server" PagedControlID="RadListView1"
                PageSize="5" Width="200px">
                <Fields>
                    <telerik:RadDataPagerButtonField FieldType="FirstPrev" />
                    <telerik:RadDataPagerButtonField FieldType="Numeric" PageButtonCount="1" />
                    <telerik:RadDataPagerButtonField FieldType="NextLast" />
                </Fields>
            </telerik:RadDataPager>
        </LayoutTemplate>
        <ItemTemplate>
            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select">
                <asp:Label runat="server" ID="Label1" Text='<%#Eval("Id")%>' />
            </asp:LinkButton>
        </ItemTemplate>
        <SelectedItemTemplate>
            <span style="font-weight: bold;">
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select">
                    <asp:Label runat="server" ID="Label1" Text='<%#Eval("Id")%>' />
                </asp:LinkButton>
            </span>
        </SelectedItemTemplate>
    </telerik:RadListView>


    <telerik:RadGrid runat="server" ID="RadGrid1" PageSize="10" AllowPaging="true" OnNeedDataSource="RadGrid1_OnNeedDataSource">
        <PagerStyle AlwaysVisible="true" Mode="NextPrev" />
    </telerik:RadGrid>
</asp:Content>
