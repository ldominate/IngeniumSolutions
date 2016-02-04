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
                    <telerik:RadDataPagerButtonField FieldType="FirstPrev" FirstButtonText="First" PrevButtonText="Prev" />
                    <telerik:RadDataPagerButtonField FieldType="Numeric" PageButtonCount="1" />
                    <telerik:RadDataPagerButtonField FieldType="NextLast" NextButtonText="Next" LastButtonText="Last" />
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

    <div>
        <asp:Label runat="server" ID="Label2" AssociatedControlID="LabelRadListView1SelectedValue" Text="RadListView1.SelectedValue: " />
        <asp:Label runat="server" ID="LabelRadListView1SelectedValue" />
    </div>
</asp:Content>
